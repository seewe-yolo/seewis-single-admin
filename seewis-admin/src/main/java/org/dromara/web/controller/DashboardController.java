package org.dromara.web.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import lombok.RequiredArgsConstructor;
import org.dromara.common.core.domain.R;
import org.dromara.web.domain.vo.DashboardVo;
import org.dromara.web.service.DashboardService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 管理端仪表盘接口。
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/dashboard")
public class DashboardController {

    private final DashboardService dashboardService;

    @SaCheckLogin
    @GetMapping("/summary")
    public R<DashboardVo> summary() {
        return R.ok(dashboardService.getOverview(7));
    }

    @SaCheckLogin
    @GetMapping("/analysis")
    public R<DashboardVo> analysis(@RequestParam(defaultValue = "7") int days) {
        return R.ok(dashboardService.getOverview(days));
    }
}
