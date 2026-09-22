package org.dromara.web.domain.vo;

import lombok.Data;

/**
 * 仪表盘趋势查询结果。
 */
@Data
public class DashboardTrendRow {

    private String date;

    private Long userCount;

    private Long noticeCount;

    private Long operationCount;
}
