package org.dromara.web.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.dromara.system.domain.SysDept;
import org.dromara.system.domain.SysNotice;
import org.dromara.system.domain.SysOperLog;
import org.dromara.system.domain.SysUser;
import org.dromara.system.mapper.SysDeptMapper;
import org.dromara.system.mapper.SysNoticeMapper;
import org.dromara.system.mapper.SysOperLogMapper;
import org.dromara.system.mapper.SysUserMapper;
import org.dromara.web.domain.vo.DashboardDistributionRow;
import org.dromara.web.domain.vo.DashboardDistributionVo;
import org.dromara.web.domain.vo.DashboardTrendRow;
import org.dromara.web.domain.vo.DashboardTrendVo;
import org.dromara.web.domain.vo.DashboardVo;
import org.dromara.web.mapper.DashboardMapper;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 管理端仪表盘服务。
 */
@Service
@RequiredArgsConstructor
public class DashboardService {

    private final SysUserMapper sysUserMapper;
    private final SysDeptMapper sysDeptMapper;
    private final SysNoticeMapper sysNoticeMapper;
    private final SysOperLogMapper sysOperLogMapper;
    private final DashboardMapper dashboardMapper;

    public DashboardVo getOverview(int requestedDays) {
        int days = Math.min(Math.max(requestedDays, 1), 30);
        LocalDate endDate = LocalDate.now().plusDays(1);
        LocalDate startDate = endDate.minusDays(days);
        LocalDateTime startTime = startDate.atStartOfDay();
        LocalDateTime endTime = endDate.atStartOfDay();

        DashboardVo dashboard = new DashboardVo();
        dashboard.setUserCount(sysUserMapper.selectCount(new LambdaQueryWrapper<SysUser>()
            .eq(SysUser::getStatus, "0")));
        dashboard.setDeptCount(sysDeptMapper.selectCount(new LambdaQueryWrapper<SysDept>()
            .eq(SysDept::getStatus, "0")));
        dashboard.setNoticeCount(sysNoticeMapper.selectCount(new LambdaQueryWrapper<SysNotice>()
            .eq(SysNotice::getStatus, "0")));
        dashboard.setOperationCount(sysOperLogMapper.selectCount(Wrappers.emptyWrapper()));
        dashboard.setTrends(buildTrends(startDate, days, dashboardMapper.selectTrend(startTime, endTime)));
        dashboard.setUserStatus(buildUserStatus(dashboardMapper.selectUserStatusDistribution()));
        return dashboard;
    }

    private List<DashboardTrendVo> buildTrends(LocalDate startDate, int days, List<DashboardTrendRow> rows) {
        Map<String, DashboardTrendVo> trendMap = new LinkedHashMap<>();
        for (int i = 0; i < days; i++) {
            DashboardTrendVo trend = new DashboardTrendVo();
            trend.setDate(startDate.plusDays(i).toString());
            trendMap.put(trend.getDate(), trend);
        }

        for (DashboardTrendRow row : rows) {
            DashboardTrendVo trend = trendMap.get(row.getDate());
            if (trend == null) {
                continue;
            }
            trend.setUserCount(nullToZero(row.getUserCount()));
            trend.setNoticeCount(nullToZero(row.getNoticeCount()));
            trend.setOperationCount(nullToZero(row.getOperationCount()));
        }
        return new ArrayList<>(trendMap.values());
    }

    private List<DashboardDistributionVo> buildUserStatus(List<DashboardDistributionRow> rows) {
        return rows.stream().map(row -> {
            DashboardDistributionVo item = new DashboardDistributionVo();
            item.setCode(row.getCode());
            item.setCount(nullToZero(row.getCount()));
            return item;
        }).toList();
    }

    private long nullToZero(Long value) {
        return value == null ? 0 : value;
    }
}
