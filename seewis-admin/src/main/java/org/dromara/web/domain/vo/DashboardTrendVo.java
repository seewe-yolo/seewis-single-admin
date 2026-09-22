package org.dromara.web.domain.vo;

import lombok.Data;

/**
 * 仪表盘趋势数据。
 */
@Data
public class DashboardTrendVo {

    private String date;

    private long userCount;

    private long noticeCount;

    private long operationCount;
}
