-- liquibase formatted sql

-- changeset seewis:1
-- comment 初始化工作流模块数据

INSERT INTO flow_category VALUES (100, '000000', 0, '0', 'OA审批', 0, '0', 103, 1, now(), NULL, NULL);

INSERT INTO flow_category VALUES (101, '000000', 100, '0,100', '假勤管理', 0, '0', 103, 1, now(), NULL, NULL);

INSERT INTO flow_category VALUES (102, '000000', 100, '0,100', '人事管理', 1, '0', 103, 1, now(), NULL, NULL);

INSERT INTO flow_category VALUES (103, '000000', 101, '0,100,101', '请假', 0, '0', 103, 1, now(), NULL, NULL);

INSERT INTO flow_category VALUES (104, '000000', 101, '0,100,101', '出差', 1, '0', 103, 1, now(), NULL, NULL);

INSERT INTO flow_category VALUES (105, '000000', 101, '0,100,101', '加班', 2, '0', 103, 1, now(), NULL, NULL);

INSERT INTO flow_category VALUES (106, '000000', 101, '0,100,101', '换班', 3, '0', 103, 1, now(), NULL, NULL);

INSERT INTO flow_category VALUES (107, '000000', 101, '0,100,101', '外出', 4, '0', 103, 1, now(), NULL, NULL);

INSERT INTO flow_category VALUES (108, '000000', 102, '0,100,102', '转正', 1, '0', 103, 1, now(), NULL, NULL);

INSERT INTO flow_category VALUES (109, '000000', 102, '0,100,102', '离职', 2, '0', 103, 1, now(), NULL, NULL);

INSERT INTO flow_spel VALUES (1, 'spelRuleComponent', 'selectDeptLeaderById', 'initiatorDeptId', '#{@spelRuleComponent.selectDeptLeaderById(#initiatorDeptId)}', '根据部门id获取部门负责人', '0', '0', 103, 1, now(), 1, now());

INSERT INTO flow_spel VALUES (2, NULL, NULL, 'initiator', '${initiator}', '流程发起人', '0', '0', 103, 1, now(), 1, now());

INSERT INTO sys_menu VALUES ('11616', '工作流', '0', '6', 'workflow', '', '', '1', '0', 'M', '0', '0', '', 'workflow', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11618', '我的任务', '0', '7', 'task', '', '', '1', '0', 'M', '0', '0', '', 'my-task', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11619', '我的待办', '11618', '2', 'taskWaiting', 'workflow/task/taskWaiting', '', '1', '1', 'C', '0', '0', '', 'waiting', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11632', '我的已办', '11618', '3', 'taskFinish', 'workflow/task/taskFinish', '', '1', '1', 'C', '0', '0', '', 'finish', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11633', '我的抄送', '11618', '4', 'taskCopy', 'workflow/task/taskCopy/index', '', '1', '1', 'C', '0', '0', '', 'my-copy', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11620', '流程定义', '11616', '3', 'processDefinition', 'workflow/processDefinition/index', '', '1', '1', 'C', '0', '0', 'workflow:definition:list', 'process-definition', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11621', '流程实例', '11630', '1', 'processInstance', 'workflow/processInstance/index', '', '1', '1', 'C', '0', '0', 'workflow:instance:list', 'tree-table', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11622', '流程分类', '11616', '1', 'category', 'workflow/category/index', '', '1', '0', 'C', '0', '0', 'workflow:category:list', 'category', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11629', '我发起的', '11618', '1', 'myDocument', 'workflow/task/myDocument', '', '1', '1', 'C', '0', '0', 'workflow:instance:currentList', 'guide', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11630', '流程监控', '11616', '4', 'processMonitor', '', '', '1', '0', 'M', '0', '0', '', 'monitor', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11631', '待办任务', '11630', '2', 'allTaskWaiting', 'workflow/task/allTaskWaiting', '', '1', '1', 'C', '0', '0', 'workflow:task:list', 'waiting', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11660', '待办任务修改', '11631', '1', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:task:edit', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11700', '流程设计', '11616', '5', 'design', 'workflow/design/index', '', '1', '1', 'C', '1', '0', 'workflow:leave:edit', '#', 103, 1, now(), NULL, NULL, '/workflow/processDefinition');

INSERT INTO sys_menu VALUES ('11701', '请假申请', '11616', '6', 'leave', 'workflow/leave/index', '', '1', '1', 'C', '1', '0', 'workflow:leave:edit', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11623', '流程分类查询', '11622', '1', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:category:query', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11624', '流程分类新增', '11622', '2', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:category:add', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11625', '流程分类修改', '11622', '3', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:category:edit', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11626', '流程分类删除', '11622', '4', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:category:remove', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11627', '流程分类导出', '11622', '5', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:category:export', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11653', '流程实例查询', '11621', '1', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:instance:query', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11654', '流程变量查询', '11621', '2', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:instance:variableQuery', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11655', '流程变量修改', '11621', '3', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:instance:variable', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11656', '流程实例激活/挂起', '11621', '4', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:instance:active', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11657', '流程实例删除', '11621', '5', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:instance:remove', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11658', '流程实例作废', '11621', '6', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:instance:invalid', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11659', '流程实例撤销', '11621', '7', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:instance:cancel', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11644', '流程定义查询', '11620', '1', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:definition:query', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11645', '流程定义新增', '11620', '2', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:definition:add', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11646', '流程定义修改', '11620', '3', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:definition:edit', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11647', '流程定义删除', '11620', '4', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:definition:remove', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11648', '流程定义导出', '11620', '5', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:definition:export', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11649', '流程定义导入', '11620', '6', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:definition:import', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11650', '流程定义发布/取消发布', '11620', '7', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:definition:publish', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11651', '流程定义复制', '11620', '8', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:definition:copy', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11652', '流程定义激活/挂起', '11620', '9', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:definition:active', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11801', '流程表达式', '11616', 2, 'spel', 'workflow/spel/index', '', 1, 0, 'C', '0', '0', 'workflow:spel:list', 'input', 103, 1, now(), 1, now(), '流程达式定义菜单');

INSERT INTO sys_menu VALUES ('11802', '流程spel表达式定义查询', '11801', 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:query', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11803', '流程spel表达式定义新增', '11801', 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:add', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11804', '流程spel表达式定义修改', '11801', 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:edit', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11805', '流程spel表达式定义删除', '11801', 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:remove', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11806', '流程spel表达式定义导出', '11801', 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:export', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11638', '请假申请', '5', '1', 'leave', 'workflow/leave/index', '', '1', '0', 'C', '0', '0', 'workflow:leave:list', '#', 103, 1, now(), NULL, NULL, '请假申请菜单');

INSERT INTO sys_menu VALUES ('11639', '请假申请查询', '11638', '1', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:leave:query', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11640', '请假申请新增', '11638', '2', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:leave:add', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11641', '请假申请修改', '11638', '3', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:leave:edit', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11642', '请假申请删除', '11638', '4', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:leave:remove', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES ('11643', '请假申请导出', '11638', '5', '#', '', '', '1', '0', 'F', '0', '0', 'workflow:leave:export', '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_dict_type VALUES (13, '业务状态', 'wf_business_status', 103, 1, now(), NULL, NULL, '业务状态列表');

INSERT INTO sys_dict_type VALUES (14, '表单类型', 'wf_form_type', 103, 1, now(), NULL, NULL, '表单类型列表');

INSERT INTO sys_dict_type VALUES (15, '任务状态', 'wf_task_status', 103, 1, now(), NULL, NULL, '任务状态');

INSERT INTO sys_dict_data VALUES (39, 1, '已撤销', 'cancel', 'wf_business_status', '', 'danger', 'N', 103, 1, now(), NULL, NULL, '已撤销');

INSERT INTO sys_dict_data VALUES (40, 2, '草稿', 'draft', 'wf_business_status', '', 'info', 'N', 103, 1, now(), NULL, NULL, '草稿');

INSERT INTO sys_dict_data VALUES (41, 3, '待审核', 'waiting', 'wf_business_status', '', 'primary', 'N', 103, 1, now(), NULL, NULL, '待审核');

INSERT INTO sys_dict_data VALUES (42, 4, '已完成', 'finish', 'wf_business_status', '', 'success', 'N', 103, 1, now(), NULL, NULL, '已完成');

INSERT INTO sys_dict_data VALUES (43, 5, '已作废', 'invalid', 'wf_business_status', '', 'danger', 'N', 103, 1, now(), NULL, NULL, '已作废');

INSERT INTO sys_dict_data VALUES (44, 6, '已退回', 'back', 'wf_business_status', '', 'danger', 'N', 103, 1, now(), NULL, NULL, '已退回');

INSERT INTO sys_dict_data VALUES (45, 7, '已终止', 'termination', 'wf_business_status', '', 'danger', 'N', 103, 1, now(), NULL, NULL, '已终止');

INSERT INTO sys_dict_data VALUES (46, 1, '自定义表单', 'static', 'wf_form_type', '', 'success', 'N', 103, 1, now(), NULL, NULL, '自定义表单');

INSERT INTO sys_dict_data VALUES (47, 2, '动态表单', 'dynamic', 'wf_form_type', '', 'primary', 'N', 103, 1, now(), NULL, NULL, '动态表单');

INSERT INTO sys_dict_data VALUES (48, 1, '撤销', 'cancel', 'wf_task_status', '', 'danger', 'N', 103, 1, now(), NULL, NULL, '撤销');

INSERT INTO sys_dict_data VALUES (49, 2, '通过', 'pass', 'wf_task_status', '', 'success', 'N', 103, 1, now(), NULL, NULL, '通过');

INSERT INTO sys_dict_data VALUES (50, 3, '待审核', 'waiting', 'wf_task_status', '', 'primary', 'N', 103, 1, now(), NULL, NULL, '待审核');

INSERT INTO sys_dict_data VALUES (51, 4, '作废', 'invalid', 'wf_task_status', '', 'danger', 'N', 103, 1, now(), NULL, NULL, '作废');

INSERT INTO sys_dict_data VALUES (52, 5, '退回', 'back', 'wf_task_status', '', 'danger', 'N', 103, 1, now(), NULL, NULL, '退回');

INSERT INTO sys_dict_data VALUES (53, 6, '终止', 'termination', 'wf_task_status', '', 'danger', 'N', 103, 1, now(), NULL, NULL, '终止');

INSERT INTO sys_dict_data VALUES (54, 7, '转办', 'transfer', 'wf_task_status', '', 'primary', 'N', 103, 1, now(), NULL, NULL, '转办');

INSERT INTO sys_dict_data VALUES (55, 8, '委托', 'depute', 'wf_task_status', '', 'primary', 'N', 103, 1, now(), NULL, NULL, '委托');

INSERT INTO sys_dict_data VALUES (56, 9, '抄送', 'copy', 'wf_task_status', '', 'primary', 'N', 103, 1, now(), NULL, NULL, '抄送');

INSERT INTO sys_dict_data VALUES (57, 10, '加签', 'sign', 'wf_task_status', '', 'primary', 'N', 103, 1, now(), NULL, NULL, '加签');

INSERT INTO sys_dict_data VALUES (58, 11, '减签', 'sign_off', 'wf_task_status', '', 'danger', 'N', 103, 1, now(), NULL, NULL, '减签');

INSERT INTO sys_dict_data VALUES (59, 11, '超时', 'timeout', 'wf_task_status', '', 'danger', 'N', 103, 1, now(), NULL, NULL, '超时');


-- changeset seewis:2
-- comment 管理端前端适配
-- 将 workflow 字典列表样式从 danger 适配为 error。
UPDATE sys_dict_data SET list_class = 'error' WHERE list_class = 'danger';

-- 工作流字典适配多语言。
UPDATE sys_dict_data SET dict_label = 'dict.wf_business_status.revoked', dict_type = 'wf_business_status' WHERE dict_code = 39;
UPDATE sys_dict_data SET dict_label = 'dict.wf_business_status.draft', dict_type = 'wf_business_status' WHERE dict_code = 40;
UPDATE sys_dict_data SET dict_label = 'dict.wf_business_status.pending', dict_type = 'wf_business_status' WHERE dict_code = 41;
UPDATE sys_dict_data SET dict_label = 'dict.wf_business_status.completed', dict_type = 'wf_business_status' WHERE dict_code = 42;
UPDATE sys_dict_data SET dict_label = 'dict.wf_business_status.cancelled', dict_type = 'wf_business_status' WHERE dict_code = 43;
UPDATE sys_dict_data SET dict_label = 'dict.wf_business_status.returned', dict_type = 'wf_business_status' WHERE dict_code = 44;
UPDATE sys_dict_data SET dict_label = 'dict.wf_business_status.terminated', dict_type = 'wf_business_status' WHERE dict_code = 45;
UPDATE sys_dict_data SET dict_label = 'dict.wf_form_type.custom_form', dict_type = 'wf_form_type' WHERE dict_code = 46;
UPDATE sys_dict_data SET dict_label = 'dict.wf_form_type.dynamic_form', dict_type = 'wf_form_type' WHERE dict_code = 47;
UPDATE sys_dict_data SET dict_label = 'dict.wf_task_status.revoke', dict_type = 'wf_task_status' WHERE dict_code = 48;
UPDATE sys_dict_data SET dict_label = 'dict.wf_task_status.pass', dict_type = 'wf_task_status' WHERE dict_code = 49;
UPDATE sys_dict_data SET dict_label = 'dict.wf_task_status.pending_review', dict_type = 'wf_task_status' WHERE dict_code = 50;
UPDATE sys_dict_data SET dict_label = 'dict.wf_task_status.cancel', dict_type = 'wf_task_status' WHERE dict_code = 51;
UPDATE sys_dict_data SET dict_label = 'dict.wf_task_status.return', dict_type = 'wf_task_status' WHERE dict_code = 52;
UPDATE sys_dict_data SET dict_label = 'dict.wf_task_status.terminate', dict_type = 'wf_task_status' WHERE dict_code = 53;
UPDATE sys_dict_data SET dict_label = 'dict.wf_task_status.transfer', dict_type = 'wf_task_status' WHERE dict_code = 54;
UPDATE sys_dict_data SET dict_label = 'dict.wf_task_status.delegate', dict_type = 'wf_task_status' WHERE dict_code = 55;
UPDATE sys_dict_data SET dict_label = 'dict.wf_task_status.copy', dict_type = 'wf_task_status' WHERE dict_code = 56;
UPDATE sys_dict_data SET dict_label = 'dict.wf_task_status.add_sign', dict_type = 'wf_task_status' WHERE dict_code = 57;
UPDATE sys_dict_data SET dict_label = 'dict.wf_task_status.minus_sign', dict_type = 'wf_task_status' WHERE dict_code = 58;
UPDATE sys_dict_data SET dict_label = 'dict.wf_task_status.timeout', dict_type = 'wf_task_status' WHERE dict_code = 59;

-- 禁用当前管理端不使用的工作流页面。
UPDATE sys_menu SET status = '1' WHERE menu_id IN ('11616', '11618', '11638', '11700', '11701');

-- changeset seewis:3
-- comment 调整工作流顶级菜单顺序
UPDATE sys_menu SET order_num = 24 WHERE menu_id = 11616;
UPDATE sys_menu SET order_num = 25 WHERE menu_id = 11618;

-- changeset seewis:4
-- comment 开放工作流相关菜单
UPDATE sys_menu SET status = '0', visible = '0' WHERE menu_id IN ('11616', '11618', '11638', '11700', '11701');

-- changeset seewis:5
-- comment 补齐工作流菜单图标
UPDATE sys_menu
SET icon = CASE menu_id
    WHEN 11616 THEN 'local-icon-workflow'
    WHEN 11618 THEN 'local-icon-my-task'
    WHEN 11619 THEN 'local-icon-waiting'
    WHEN 11632 THEN 'local-icon-finish'
    WHEN 11633 THEN 'local-icon-my-copy'
    WHEN 11620 THEN 'local-icon-process-definition'
    WHEN 11621 THEN 'local-icon-tree-table'
    WHEN 11622 THEN 'local-icon-category'
    WHEN 11801 THEN 'local-icon-input'
    WHEN 11629 THEN 'local-icon-guide'
    WHEN 11630 THEN 'local-icon-monitor'
    WHEN 11631 THEN 'local-icon-waiting'
    WHEN 11638 THEN 'local-icon-form'
    WHEN 11700 THEN 'local-icon-edit'
    WHEN 11701 THEN 'local-icon-edit'
END
WHERE menu_id IN (11616, 11618, 11619, 11632, 11633, 11620, 11621, 11622, 11801, 11629, 11630, 11631, 11638, 11700, 11701);

-- changeset seewis:6
-- comment 适配管理端工作流菜单组件路径
UPDATE sys_menu SET path = 'taskCopy', component = 'workflow/task/taskCopy/index' WHERE menu_id = 11633;
UPDATE sys_menu SET path = 'design', component = 'workflow/design/index' WHERE menu_id = 11700;
UPDATE sys_menu SET path = 'leave', component = 'workflow/leave/index' WHERE menu_id = 11701;
