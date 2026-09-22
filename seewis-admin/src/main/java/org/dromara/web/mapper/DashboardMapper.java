package org.dromara.web.mapper;

import org.apache.ibatis.annotations.Param;
import org.dromara.web.domain.vo.DashboardDistributionRow;
import org.dromara.web.domain.vo.DashboardTrendRow;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 仪表盘聚合查询。
 */
public interface DashboardMapper {

    List<DashboardTrendRow> selectTrend(@Param("startTime") LocalDateTime startTime,
                                        @Param("endTime") LocalDateTime endTime);

    List<DashboardDistributionRow> selectUserStatusDistribution();
}
