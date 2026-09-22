package org.dromara.web.domain.vo;

import lombok.Data;

import java.util.List;

/**
 * 管理端仪表盘数据。
 */
@Data
public class DashboardVo {

    private long userCount;

    private long deptCount;

    private long noticeCount;

    private long operationCount;

    private List<DashboardTrendVo> trends;

    private List<DashboardDistributionVo> userStatus;
}
