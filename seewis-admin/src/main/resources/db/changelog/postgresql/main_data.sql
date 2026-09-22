-- liquibase formatted sql

-- changeset seewis:1
-- comment 初始化主模块数据

insert into sys_dept values(100, 0,   '0',          'XXX科技',   null,0, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, now(), null, null);

insert into sys_dept values(101, 100, '0,100',      '深圳总公司', null,1, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, now(), null, null);

insert into sys_dept values(102, 100, '0,100',      '长沙分公司', null,2, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, now(), null, null);

insert into sys_dept values(103, 101, '0,100,101',  '研发部门',   null,1, 1, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, now(), null, null);

insert into sys_dept values(104, 101, '0,100,101',  '市场部门',   null,2, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, now(), null, null);

insert into sys_dept values(105, 101, '0,100,101',  '测试部门',   null,3, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, now(), null, null);

insert into sys_dept values(106, 101, '0,100,101',  '财务部门',   null,4, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, now(), null, null);

insert into sys_dept values(107, 101, '0,100,101',  '运维部门',   null,5, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, now(), null, null);

insert into sys_dept values(108, 102, '0,100,102',  '市场部门',   null,1, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, now(), null, null);

insert into sys_dept values(109, 102, '0,100,102',  '财务部门',   null,2, null, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, now(), null, null);

insert into sys_user values(1, 103, 'admin', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', null, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', now(), 103, 1, now(), null, null, '管理员');

insert into sys_user VALUES(3, 108, 'test', '本部门及以下 密码666666', 'sys_user', '', '', '0', null, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '0', '127.0.0.1', now(), 103, 1, now(), 3, now(), NULL);

insert into sys_user VALUES(4, 102, 'test1', '仅本人 密码666666', 'sys_user', '', '', '0', null, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '0', '127.0.0.1', now(), 103, 1, now(), 4, now(), NULL);

insert into sys_post values(1, 103, 'ceo',  null, '董事长',    1, '0', 103, 1, now(), null, null, '');

insert into sys_post values(2, 100, 'se',   null, '项目经理',  2, '0', 103, 1, now(), null, null, '');

insert into sys_post values(3, 100, 'hr',   null, '人力资源',  3, '0', 103, 1, now(), null, null, '');

insert into sys_post values(4, 100, 'user', null, '普通员工',  4, '0', 103, 1, now(), null, null, '');

insert into sys_role values('1', '超级管理员',  'superadmin',  1, '1', 't', 't', '0', '0', 103, 1, now(), null, null, '超级管理员');

insert into sys_role values('3', '本部门及以下', 'test1', 3, '4', 't', 't', '0', '0', 103, 1, now(), NULL, NULL, '');

insert into sys_role values('4', '仅本人', 'test2', 4, '5', 't', 't', '0', '0', 103, 1, now(), NULL, NULL, '');

insert into sys_menu values('1', '系统管理', '0', '1', 'system',           null, '', '1', '0', 'M', '0', '0', '', 'system',   103, 1, now(), null, null, '系统管理目录');

insert into sys_menu values('2', '系统监控', '0', '3', 'monitor',          null, '', '1', '0', 'M', '0', '0', '', 'monitor',  103, 1, now(), null, null, '系统监控目录');

insert into sys_menu values('3', '系统工具', '0', '4', 'tool',             null, '', '1', '0', 'M', '0', '0', '', 'tool',     103, 1, now(), null, null, '系统工具目录');

insert into sys_menu values('4', 'PLUS官网', '0', '5', 'https://gitee.com/dromara/RuoYi-Vue-Plus', null, '', '0', '0', 'M', '0', '0', '', 'guide',    103, 1, now(), null, null, 'RuoYi-Vue-Plus官网地址');

insert into sys_menu VALUES('5', '测试菜单', '0', '5', 'demo',             null, '', '1', '0', 'M', '0', '0', null, 'star',       103, 1, now(), null, null, '测试菜单');

insert into sys_menu values('100',  '用户管理',     '1',   '1', 'user',             'system/user/index',            '', '1', '0', 'C', '0', '0', 'system:user:list',            'user',          103, 1, now(), null, null, '用户管理菜单');

insert into sys_menu values('101',  '角色管理',     '1',   '2', 'role',             'system/role/index',            '', '1', '0', 'C', '0', '0', 'system:role:list',            'peoples',       103, 1, now(), null, null, '角色管理菜单');

insert into sys_menu values('102',  '菜单管理',     '1',   '3', 'menu',             'system/menu/index',            '', '1', '0', 'C', '0', '0', 'system:menu:list',            'tree-table',    103, 1, now(), null, null, '菜单管理菜单');

insert into sys_menu values('103',  '部门管理',     '1',   '4', 'dept',             'system/dept/index',            '', '1', '0', 'C', '0', '0', 'system:dept:list',            'tree',          103, 1, now(), null, null, '部门管理菜单');

insert into sys_menu values('104',  '岗位管理',     '1',   '5', 'post',             'system/post/index',            '', '1', '0', 'C', '0', '0', 'system:post:list',            'post',          103, 1, now(), null, null, '岗位管理菜单');

insert into sys_menu values('105',  '字典管理',     '1',   '6', 'dict',             'system/dict/index',            '', '1', '0', 'C', '0', '0', 'system:dict:list',            'dict',          103, 1, now(), null, null, '字典管理菜单');

insert into sys_menu values('106',  '参数设置',     '1',   '7', 'config',           'system/config/index',          '', '1', '0', 'C', '0', '0', 'system:config:list',          'edit',          103, 1, now(), null, null, '参数设置菜单');

insert into sys_menu values('107',  '通知公告',     '1',   '8', 'notice',           'system/notice/index',          '', '1', '0', 'C', '0', '0', 'system:notice:list',          'message',       103, 1, now(), null, null, '通知公告菜单');

insert into sys_menu values('108',  '日志管理',     '1',   '9', 'log',              '',                             '', '1', '0', 'M', '0', '0', '',                            'log',           103, 1, now(), null, null, '日志管理菜单');

insert into sys_menu values('109',  '在线用户',     '2',   '1', 'online',           'monitor/online/index',         '', '1', '0', 'C', '0', '0', 'monitor:online:list',         'online',        103, 1, now(), null, null, '在线用户菜单');

insert into sys_menu values('113',  '缓存监控',     '2',   '5', 'cache',            'monitor/cache/index',          '', '1', '0', 'C', '0', '0', 'monitor:cache:list',          'redis',         103, 1, now(), null, null, '缓存监控菜单');

insert into sys_menu values('115',  '代码生成',     '3',   '2', 'gen',              'tool/gen/index',               '', '1', '0', 'C', '0', '0', 'tool:gen:list',               'code',          103, 1, now(), null, null, '代码生成菜单');

insert into sys_menu values('123',  '客户端管理',   '1',   '11', 'client',           'system/client/index',          '', '1', '0', 'C', '0', '0', 'system:client:list',          'international', 103, 1, now(), null, null, '客户端管理菜单');

insert into sys_menu values('116', '修改生成配置',  '3',   '2', 'gen-edit/index/:tableId', 'tool/gen/editTable', '', '1', '1', 'C', '1', '0', 'tool:gen:edit',           '#',               103, 1, now(), null, null, '/tool/gen');

insert into sys_menu values('130', '分配用户',     '1',   '2', 'role-auth/user/:roleId', 'system/role/authUser', '', '1', '1', 'C', '1', '0', 'system:role:edit',      '#',               103, 1, now(), null, null, '/system/role');

insert into sys_menu values('131', '分配角色',     '1',   '1', 'user-auth/role/:userId', 'system/user/authRole', '', '1', '1', 'C', '1', '0', 'system:user:edit',      '#',               103, 1, now(), null, null, '/system/user');

insert into sys_menu values('132', '字典数据',     '1',   '6', 'dict-data/index/:dictId', 'system/dict/data', '', '1', '1', 'C', '1', '0', 'system:dict:list',         '#',               103, 1, now(), null, null, '/system/dict');

insert into sys_menu values('133', '文件配置管理',  '1',   '10', 'oss-config/index',              'system/oss/config', '', '1', '1', 'C', '1', '0', 'system:ossConfig:list',  '#',                103, 1, now(), null, null, '/system/oss');

insert into sys_menu values('117',  'Admin监控',   '2',   '5',  'Admin',            'monitor/admin/index',         '', '1', '0', 'C', '0', '0', 'monitor:admin:list',          'dashboard',     103, 1, now(), null, null, 'Admin监控菜单');

insert into sys_menu values('118',  '文件管理',     '1',   '10', 'oss',              'system/oss/index',            '', '1', '0', 'C', '0', '0', 'system:oss:list',             'upload',        103, 1, now(), null, null, '文件管理菜单');

insert into sys_menu values('120',  '任务调度中心',  '2',   '6',  'snailjob',     'monitor/snailjob/index',    '', '1', '0', 'C', '0', '0', 'monitor:snailjob:list',          'job',           103, 1, now(), null, null, 'SnailJob控制台菜单');

insert into sys_menu values('500',  '操作日志', '108', '1', 'operlog',    'monitor/operlog/index',    '', '1', '0', 'C', '0', '0', 'monitor:operlog:list',    'form',          103, 1, now(), null, null, '操作日志菜单');

insert into sys_menu values('501',  '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor',    103, 1, now(), null, null, '登录日志菜单');

insert into sys_menu values('1001', '用户查询', '100', '1',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:query',          '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1002', '用户新增', '100', '2',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:add',            '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1003', '用户修改', '100', '3',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit',           '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1004', '用户删除', '100', '4',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1005', '用户导出', '100', '5',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:export',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1006', '用户导入', '100', '6',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:import',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1007', '重置密码', '100', '7',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd',       '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1008', '角色查询', '101', '1',  '', '', '', '1', '0', 'F', '0', '0', 'system:role:query',          '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1009', '角色新增', '101', '2',  '', '', '', '1', '0', 'F', '0', '0', 'system:role:add',            '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1010', '角色修改', '101', '3',  '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit',           '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1011', '角色删除', '101', '4',  '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1012', '角色导出', '101', '5',  '', '', '', '1', '0', 'F', '0', '0', 'system:role:export',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1013', '菜单查询', '102', '1',  '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query',          '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1014', '菜单新增', '102', '2',  '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add',            '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1015', '菜单修改', '102', '3',  '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit',           '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1016', '菜单删除', '102', '4',  '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1017', '部门查询', '103', '1',  '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query',          '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1018', '部门新增', '103', '2',  '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add',            '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1019', '部门修改', '103', '3',  '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit',           '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1020', '部门删除', '103', '4',  '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1021', '岗位查询', '104', '1',  '', '', '', '1', '0', 'F', '0', '0', 'system:post:query',          '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1022', '岗位新增', '104', '2',  '', '', '', '1', '0', 'F', '0', '0', 'system:post:add',            '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1023', '岗位修改', '104', '3',  '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit',           '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1024', '岗位删除', '104', '4',  '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1025', '岗位导出', '104', '5',  '', '', '', '1', '0', 'F', '0', '0', 'system:post:export',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1026', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query',          '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1027', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add',            '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1028', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit',           '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1029', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1030', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1031', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query',        '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1032', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add',          '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1033', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1034', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove',       '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1035', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export',       '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1036', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query',        '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1037', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add',          '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1038', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1039', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove',       '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1040', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query',      '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1041', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove',     '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1042', '日志导出', '500', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export',     '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1043', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query',   '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1044', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove',  '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1045', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export',  '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1050', '账户解锁', '501', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock',  '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query',       '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1055', '生成查询', '115', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query',             '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1056', '生成修改', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit',              '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1057', '生成删除', '115', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove',            '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1058', '导入代码', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import',            '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1059', '预览代码', '115', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview',           '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1060', '生成代码', '115', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code',              '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1600', '文件查询', '118', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:query',        '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1601', '文件上传', '118', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:upload',       '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1602', '文件下载', '118', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:download',     '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1603', '文件删除', '118', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:remove',       '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1620', '配置列表', '118', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:ossConfig:list',   '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1621', '配置添加', '118', '6', '#', '', '', '1', '0', 'F', '0', '0', 'system:ossConfig:add',    '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1622', '配置编辑', '118', '6', '#', '', '', '1', '0', 'F', '0', '0', 'system:ossConfig:edit',   '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1623', '配置删除', '118', '6', '#', '', '', '1', '0', 'F', '0', '0', 'system:ossConfig:remove', '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1061', '客户端管理查询', '123', '1',  '#', '', '', '1', '0', 'F', '0', '0', 'system:client:query',        '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1062', '客户端管理新增', '123', '2',  '#', '', '', '1', '0', 'F', '0', '0', 'system:client:add',          '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1063', '客户端管理修改', '123', '3',  '#', '', '', '1', '0', 'F', '0', '0', 'system:client:edit',         '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1064', '客户端管理删除', '123', '4',  '#', '', '', '1', '0', 'F', '0', '0', 'system:client:remove',       '#', 103, 1, now(), null, null, '');

insert into sys_menu values('1065', '客户端管理导出', '123', '5',  '#', '', '', '1', '0', 'F', '0', '0', 'system:client:export',       '#', 103, 1, now(), null, null, '');

INSERT INTO sys_menu VALUES('1500', '测试单表',     '5',   '1', 'demo', 'demo/demo/index', '',  '1', '0', 'C', '0', '0', 'demo:demo:list', '#', 103, 1, now(), NULL, NULL, '测试单表菜单');

INSERT INTO sys_menu VALUES('1501', '测试单表查询', '1500', '1', '#', '', '',  '1', '0', 'F', '0', '0', 'demo:demo:query',                  '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES('1502', '测试单表新增', '1500', '2', '#', '', '',  '1', '0', 'F', '0', '0', 'demo:demo:add',                    '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES('1503', '测试单表修改', '1500', '3', '#', '', '',  '1', '0', 'F', '0', '0', 'demo:demo:edit',                   '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES('1504', '测试单表删除', '1500', '4', '#', '', '',  '1', '0', 'F', '0', '0', 'demo:demo:remove',                 '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES('1505', '测试单表导出', '1500', '5', '#', '', '',  '1', '0', 'F', '0', '0', 'demo:demo:export',                 '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES('1506', '测试树表',     '5',   '1', 'tree', 'demo/tree/index', '',  '1', '0', 'C', '0', '0', 'demo:tree:list', '#', 103, 1, now(), NULL, NULL, '测试树表菜单');

INSERT INTO sys_menu VALUES('1507', '测试树表查询', '1506', '1', '#', '', '',  '1', '0', 'F', '0', '0', 'demo:tree:query',                  '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES('1508', '测试树表新增', '1506', '2', '#', '', '',  '1', '0', 'F', '0', '0', 'demo:tree:add',                    '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES('1509', '测试树表修改', '1506', '3', '#', '', '',  '1', '0', 'F', '0', '0', 'demo:tree:edit',                   '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES('1510', '测试树表删除', '1506', '4', '#', '', '',  '1', '0', 'F', '0', '0', 'demo:tree:remove',                 '#', 103, 1, now(), NULL, NULL, '');

INSERT INTO sys_menu VALUES('1511', '测试树表导出', '1506', '5', '#', '', '',  '1', '0', 'F', '0', '0', 'demo:tree:export',                 '#', 103, 1, now(), NULL, NULL, '');

insert into sys_user_role values ('1', '1');

insert into sys_user_role values ('3', '3');

insert into sys_user_role values ('4', '4');

insert into sys_role_menu values ('3', '1');

insert into sys_role_menu values ('3', '5');

insert into sys_role_menu values ('3', '100');

insert into sys_role_menu values ('3', '101');

insert into sys_role_menu values ('3', '102');

insert into sys_role_menu values ('3', '103');

insert into sys_role_menu values ('3', '104');

insert into sys_role_menu values ('3', '105');

insert into sys_role_menu values ('3', '106');

insert into sys_role_menu values ('3', '107');

insert into sys_role_menu values ('3', '108');

insert into sys_role_menu values ('3', '118');

insert into sys_role_menu values ('3', '123');

insert into sys_role_menu values ('3', '500');

insert into sys_role_menu values ('3', '501');

insert into sys_role_menu values ('3', '1001');

insert into sys_role_menu values ('3', '1002');

insert into sys_role_menu values ('3', '1003');

insert into sys_role_menu values ('3', '1004');

insert into sys_role_menu values ('3', '1005');

insert into sys_role_menu values ('3', '1006');

insert into sys_role_menu values ('3', '1007');

insert into sys_role_menu values ('3', '1008');

insert into sys_role_menu values ('3', '1009');

insert into sys_role_menu values ('3', '1010');

insert into sys_role_menu values ('3', '1011');

insert into sys_role_menu values ('3', '1012');

insert into sys_role_menu values ('3', '1013');

insert into sys_role_menu values ('3', '1014');

insert into sys_role_menu values ('3', '1015');

insert into sys_role_menu values ('3', '1016');

insert into sys_role_menu values ('3', '1017');

insert into sys_role_menu values ('3', '1018');

insert into sys_role_menu values ('3', '1019');

insert into sys_role_menu values ('3', '1020');

insert into sys_role_menu values ('3', '1021');

insert into sys_role_menu values ('3', '1022');

insert into sys_role_menu values ('3', '1023');

insert into sys_role_menu values ('3', '1024');

insert into sys_role_menu values ('3', '1025');

insert into sys_role_menu values ('3', '1026');

insert into sys_role_menu values ('3', '1027');

insert into sys_role_menu values ('3', '1028');

insert into sys_role_menu values ('3', '1029');

insert into sys_role_menu values ('3', '1030');

insert into sys_role_menu values ('3', '1031');

insert into sys_role_menu values ('3', '1032');

insert into sys_role_menu values ('3', '1033');

insert into sys_role_menu values ('3', '1034');

insert into sys_role_menu values ('3', '1035');

insert into sys_role_menu values ('3', '1036');

insert into sys_role_menu values ('3', '1037');

insert into sys_role_menu values ('3', '1038');

insert into sys_role_menu values ('3', '1039');

insert into sys_role_menu values ('3', '1040');

insert into sys_role_menu values ('3', '1041');

insert into sys_role_menu values ('3', '1042');

insert into sys_role_menu values ('3', '1043');

insert into sys_role_menu values ('3', '1044');

insert into sys_role_menu values ('3', '1045');

insert into sys_role_menu values ('3', '1050');

insert into sys_role_menu values ('3', '1061');

insert into sys_role_menu values ('3', '1062');

insert into sys_role_menu values ('3', '1063');

insert into sys_role_menu values ('3', '1064');

insert into sys_role_menu values ('3', '1065');

insert into sys_role_menu values ('3', '1500');

insert into sys_role_menu values ('3', '1501');

insert into sys_role_menu values ('3', '1502');

insert into sys_role_menu values ('3', '1503');

insert into sys_role_menu values ('3', '1504');

insert into sys_role_menu values ('3', '1505');

insert into sys_role_menu values ('3', '1506');

insert into sys_role_menu values ('3', '1507');

insert into sys_role_menu values ('3', '1508');

insert into sys_role_menu values ('3', '1509');

insert into sys_role_menu values ('3', '1510');

insert into sys_role_menu values ('3', '1511');

insert into sys_role_menu values ('3', '1600');

insert into sys_role_menu values ('3', '1601');

insert into sys_role_menu values ('3', '1602');

insert into sys_role_menu values ('3', '1603');

insert into sys_role_menu values ('3', '1620');

insert into sys_role_menu values ('3', '1621');

insert into sys_role_menu values ('3', '1622');

insert into sys_role_menu values ('3', '1623');

insert into sys_role_menu values ('3', '11616');

insert into sys_role_menu values ('3', '11618');

insert into sys_role_menu values ('3', '11619');

insert into sys_role_menu values ('3', '11622');

insert into sys_role_menu values ('3', '11623');

insert into sys_role_menu values ('3', '11629');

insert into sys_role_menu values ('3', '11632');

insert into sys_role_menu values ('3', '11633');

insert into sys_role_menu values ('3', '11638');

insert into sys_role_menu values ('3', '11639');

insert into sys_role_menu values ('3', '11640');

insert into sys_role_menu values ('3', '11641');

insert into sys_role_menu values ('3', '11642');

insert into sys_role_menu values ('3', '11643');

insert into sys_role_menu values ('4', '5');

insert into sys_role_menu values ('4', '1500');

insert into sys_role_menu values ('4', '1501');

insert into sys_role_menu values ('4', '1502');

insert into sys_role_menu values ('4', '1503');

insert into sys_role_menu values ('4', '1504');

insert into sys_role_menu values ('4', '1505');

insert into sys_role_menu values ('4', '1506');

insert into sys_role_menu values ('4', '1507');

insert into sys_role_menu values ('4', '1508');

insert into sys_role_menu values ('4', '1509');

insert into sys_role_menu values ('4', '1510');

insert into sys_role_menu values ('4', '1511');

insert into sys_user_post values ('1', '1');

insert into sys_dict_type values(1, '用户性别', 'sys_user_sex',        103, 1, now(), null, null, '用户性别列表');

insert into sys_dict_type values(2, '菜单状态', 'sys_show_hide',       103, 1, now(), null, null, '菜单状态列表');

insert into sys_dict_type values(3, '系统开关', 'sys_normal_disable',  103, 1, now(), null, null, '系统开关列表');

insert into sys_dict_type values(6, '系统是否', 'sys_yes_no',          103, 1, now(), null, null, '系统是否列表');

insert into sys_dict_type values(7, '通知类型', 'sys_notice_type',     103, 1, now(), null, null, '通知类型列表');

insert into sys_dict_type values(8, '通知状态', 'sys_notice_status',   103, 1, now(), null, null, '通知状态列表');

insert into sys_dict_type values(9, '操作类型', 'sys_oper_type',       103, 1, now(), null, null, '操作类型列表');

insert into sys_dict_type values(10, '系统状态', 'sys_common_status',  103, 1, now(), null, null, '登录状态列表');

insert into sys_dict_type values(11, '授权类型', 'sys_grant_type',     103, 1, now(), null, null, '认证授权类型');

insert into sys_dict_type values(12, '设备类型', 'sys_device_type',    103, 1, now(), null, null, '客户端设备类型');

insert into sys_dict_data values(1, 1,  '男',       '0',       'sys_user_sex',        '',   '',        'Y', 103, 1, now(), null, null, '性别男');

insert into sys_dict_data values(2, 2,  '女',       '1',       'sys_user_sex',        '',   '',        'N', 103, 1, now(), null, null, '性别女');

insert into sys_dict_data values(3, 3,  '未知',     '2',       'sys_user_sex',        '',   '',        'N', 103, 1, now(), null, null, '性别未知');

insert into sys_dict_data values(4, 1,  '显示',     '0',       'sys_show_hide',       '',   'primary', 'Y', 103, 1, now(), null, null, '显示菜单');

insert into sys_dict_data values(5, 2,  '隐藏',     '1',       'sys_show_hide',       '',   'danger',  'N', 103, 1, now(), null, null, '隐藏菜单');

insert into sys_dict_data values(6, 1,  '正常',     '0',       'sys_normal_disable',  '',   'primary', 'Y', 103, 1, now(), null, null, '正常状态');

insert into sys_dict_data values(7, 2,  '停用',     '1',       'sys_normal_disable',  '',   'danger',  'N', 103, 1, now(), null, null, '停用状态');

insert into sys_dict_data values(12, 1,  '是',       'Y',       'sys_yes_no',          '',   'primary', 'Y', 103, 1, now(), null, null, '系统默认是');

insert into sys_dict_data values(13, 2,  '否',       'N',       'sys_yes_no',          '',   'danger',  'N', 103, 1, now(), null, null, '系统默认否');

insert into sys_dict_data values(14, 1,  '通知',     '1',       'sys_notice_type',     '',   'warning', 'Y', 103, 1, now(), null, null, '通知');

insert into sys_dict_data values(15, 2,  '公告',     '2',       'sys_notice_type',     '',   'success', 'N', 103, 1, now(), null, null, '公告');

insert into sys_dict_data values(16, 1,  '正常',     '0',       'sys_notice_status',   '',   'primary', 'Y', 103, 1, now(), null, null, '正常状态');

insert into sys_dict_data values(17, 2,  '关闭',     '1',       'sys_notice_status',   '',   'danger',  'N', 103, 1, now(), null, null, '关闭状态');

insert into sys_dict_data values(29, 99, '其他',     '0',       'sys_oper_type',       '',   'info',    'N', 103, 1, now(), null, null, '其他操作');

insert into sys_dict_data values(18, 1,  '新增',     '1',       'sys_oper_type',       '',   'info',    'N', 103, 1, now(), null, null, '新增操作');

insert into sys_dict_data values(19, 2,  '修改',     '2',       'sys_oper_type',       '',   'info',    'N', 103, 1, now(), null, null, '修改操作');

insert into sys_dict_data values(20, 3,  '删除',     '3',       'sys_oper_type',       '',   'danger',  'N', 103, 1, now(), null, null, '删除操作');

insert into sys_dict_data values(21, 4,  '授权',     '4',       'sys_oper_type',       '',   'primary', 'N', 103, 1, now(), null, null, '授权操作');

insert into sys_dict_data values(22, 5,  '导出',     '5',       'sys_oper_type',       '',   'warning', 'N', 103, 1, now(), null, null, '导出操作');

insert into sys_dict_data values(23, 6,  '导入',     '6',       'sys_oper_type',       '',   'warning', 'N', 103, 1, now(), null, null, '导入操作');

insert into sys_dict_data values(24, 7,  '强退',     '7',       'sys_oper_type',       '',   'danger',  'N', 103, 1, now(), null, null, '强退操作');

insert into sys_dict_data values(25, 8,  '生成代码', '8',       'sys_oper_type',       '',   'warning', 'N', 103, 1, now(), null, null, '生成操作');

insert into sys_dict_data values(26, 9,  '清空数据', '9',       'sys_oper_type',       '',   'danger',  'N', 103, 1, now(), null, null, '清空操作');

insert into sys_dict_data values(27, 1,  '成功',     '0',       'sys_common_status',   '',   'primary', 'N', 103, 1, now(), null, null, '正常状态');

insert into sys_dict_data values(28, 2,  '失败',     '1',       'sys_common_status',   '',   'danger',  'N', 103, 1, now(), null, null, '停用状态');

insert into sys_dict_data values(30, 0,  '密码认证', 'password',   'sys_grant_type',   '',   'default', 'N', 103, 1, now(), null, null, '密码认证');

insert into sys_dict_data values(31, 0,  '短信认证', 'sms',        'sys_grant_type',   '',   'default', 'N', 103, 1, now(), null, null, '短信认证');

insert into sys_dict_data values(32, 0,  '邮件认证', 'email',      'sys_grant_type',   '',   'default', 'N', 103, 1, now(), null, null, '邮件认证');

insert into sys_dict_data values(33, 0,  '小程序认证', 'xcx',      'sys_grant_type',   '',   'default', 'N', 103, 1, now(), null, null, '小程序认证');

insert into sys_dict_data values(34, 0,  '三方登录认证', 'social', 'sys_grant_type',   '',   'default', 'N', 103, 1, now(), null, null, '三方登录认证');

insert into sys_dict_data values(35, 0,  'PC', 'pc',              'sys_device_type',   '',   'default', 'N', 103, 1, now(), null, null, 'PC');

insert into sys_dict_data values(36, 0,  '安卓', 'android',       'sys_device_type',   '',   'default', 'N', 103, 1, now(), null, null, '安卓');

insert into sys_dict_data values(37, 0,  'iOS', 'ios',            'sys_device_type',   '',   'default', 'N', 103, 1, now(), null, null, 'iOS');

insert into sys_dict_data values(38, 0,  '小程序', 'xcx',         'sys_device_type',   '',   'default', 'N', 103, 1, now(), null, null, '小程序');

insert into sys_config values(1, '主框架页-默认皮肤样式名称',     'sys.index.skinName',            'skin-blue',     'Y', 103, 1, now(), null, null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow' );

insert into sys_config values(2, '用户管理-账号初始密码',         'sys.user.initPassword',         '123456',        'Y', 103, 1, now(), null, null, '初始化密码 123456' );

insert into sys_config values(3, '主框架页-侧边栏主题',           'sys.index.sideTheme',           'theme-dark',    'Y', 103, 1, now(), null, null, '深色主题theme-dark，浅色主题theme-light' );

insert into sys_config values(5, '账号自助-是否开启用户注册功能',   'sys.account.registerUser',      'false',         'Y', 103, 1, now(), null, null, '是否开启注册用户功能（true开启，false关闭）');

insert into sys_config values(11, 'OSS预览列表资源开关',          'sys.oss.previewListResource',   'true',          'Y', 103, 1, now(), null, null, 'true:开启, false:关闭');

insert into sys_notice values('1', '温馨提醒：2018-07-01 新版本发布啦', '2', '新版本内容', '0', 103, 1, now(), null, null, '管理员');

insert into sys_notice values('2', '维护通知：2018-07-01 系统凌晨维护', '1', '维护内容',   '0', 103, 1, now(), null, null, '管理员');

insert into sys_oss_config values (1, 'minio',  'ruoyi',            'ruoyi123',        'ruoyi',             '', '127.0.0.1:9000',                      '','N', '',            '1', '0', '', 103, 1, now(), 1, now(), null);

insert into sys_oss_config values (2, 'qiniu',  'XXXXXXXXXXXXXXX',  'XXXXXXXXXXXXXXX', 'ruoyi',             '', 's3-cn-north-1.qiniucs.com',           '','N', '',            '1', '1', '', 103, 1, now(), 1, now(), null);

insert into sys_oss_config values (3, 'aliyun', 'XXXXXXXXXXXXXXX',  'XXXXXXXXXXXXXXX', 'ruoyi',             '', 'oss-cn-beijing.aliyuncs.com',         '','N', '',            '1', '1', '', 103, 1, now(), 1, now(), null);

insert into sys_oss_config values (4, 'qcloud', 'XXXXXXXXXXXXXXX',  'XXXXXXXXXXXXXXX', 'ruoyi-1240000000',  '', 'cos.ap-beijing.myqcloud.com',         '','N', 'ap-beijing',  '1', '1', '', 103, 1, now(), 1, now(), null);

insert into sys_oss_config values (5, 'image',  'ruoyi',            'ruoyi123',        'ruoyi',             'image', '127.0.0.1:9000',                 '','N', '',            '1', '1', '', 103, 1, now(), 1, now(), NULL);

insert into sys_client values (1, 'e5cd7e4891bf95d1d19206ce24a7b32e', 'pc', 'pc123', 'password,social', 'pc', 1800, 604800, 0, 0, 103, 1, now(), 1, now());

insert into sys_client values (2, '428a8310cd442757ae699df5d894f051', 'app', 'app123', 'password,sms,social', 'android', 1800, 604800, 0, 0, 103, 1, now(), 1, now());

INSERT INTO test_demo VALUES (1, 102, 4, 1, '测试数据权限', '测试', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_demo VALUES (2, 102, 3, 2, '子节点1', '111', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_demo VALUES (3, 102, 3, 3, '子节点2', '222', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_demo VALUES (4, 108, 4, 4, '测试数据', 'demo', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_demo VALUES (5, 108, 3, 13, '子节点11', '1111', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_demo VALUES (6, 108, 3, 12, '子节点22', '2222', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_demo VALUES (7, 108, 3, 11, '子节点33', '3333', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_demo VALUES (8, 108, 3, 10, '子节点44', '4444', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_demo VALUES (9, 108, 3, 9, '子节点55', '5555', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_demo VALUES (10, 108, 3, 8, '子节点66', '6666', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_demo VALUES (11, 108, 3, 7, '子节点77', '7777', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_demo VALUES (12, 108, 3, 6, '子节点88', '8888', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_demo VALUES (13, 108, 3, 5, '子节点99', '9999', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (1, 0, 102, 4, '测试数据权限', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (2, 1, 102, 3, '子节点1', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (3, 2, 102, 3, '子节点2', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (4, 0, 108, 4, '测试树1', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (5, 4, 108, 3, '子节点11', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (6, 4, 108, 3, '子节点22', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (7, 4, 108, 3, '子节点33', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (8, 5, 108, 3, '子节点44', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (9, 6, 108, 3, '子节点55', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (10, 7, 108, 3, '子节点66', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (11, 7, 108, 3, '子节点77', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (12, 10, 108, 3, '子节点88', 0, 103, now(), 1, NULL, NULL, 0);

INSERT INTO test_tree VALUES (13, 10, 108, 3, '子节点99', 0, 103, now(), 1, NULL, NULL, 0);


-- changeset seewis:2
-- comment 管理端前端适配
-- 将字典列表样式从 danger 适配为 error。
UPDATE sys_dict_data SET list_class = 'error' WHERE list_class = 'danger';

-- 系统字典适配多语言。
UPDATE sys_dict_data SET dict_label = 'dict.sys_user_sex.male', dict_type = 'sys_user_sex' WHERE dict_code = 1;
UPDATE sys_dict_data SET dict_label = 'dict.sys_user_sex.female', dict_type = 'sys_user_sex' WHERE dict_code = 2;
UPDATE sys_dict_data SET dict_label = 'dict.sys_user_sex.unknown', dict_type = 'sys_user_sex' WHERE dict_code = 3;
UPDATE sys_dict_data SET dict_label = 'dict.sys_show_hide.show', dict_type = 'sys_show_hide' WHERE dict_code = 4;
UPDATE sys_dict_data SET dict_label = 'dict.sys_show_hide.hide', dict_type = 'sys_show_hide' WHERE dict_code = 5;
UPDATE sys_dict_data SET dict_label = 'dict.sys_normal_disable.normal', dict_type = 'sys_normal_disable' WHERE dict_code = 6;
UPDATE sys_dict_data SET dict_label = 'dict.sys_normal_disable.disable', dict_type = 'sys_normal_disable' WHERE dict_code = 7;
UPDATE sys_dict_data SET dict_label = 'dict.sys_yes_no.yes', dict_type = 'sys_yes_no' WHERE dict_code = 12;
UPDATE sys_dict_data SET dict_label = 'dict.sys_yes_no.no', dict_type = 'sys_yes_no' WHERE dict_code = 13;
UPDATE sys_dict_data SET dict_label = 'dict.sys_notice_type.notice', dict_type = 'sys_notice_type' WHERE dict_code = 14;
UPDATE sys_dict_data SET dict_label = 'dict.sys_notice_type.announcement', dict_type = 'sys_notice_type' WHERE dict_code = 15;
UPDATE sys_dict_data SET dict_label = 'dict.sys_notice_status.normal', dict_type = 'sys_notice_status' WHERE dict_code = 16;
UPDATE sys_dict_data SET dict_label = 'dict.sys_notice_status.close', dict_type = 'sys_notice_status' WHERE dict_code = 17;
UPDATE sys_dict_data SET dict_label = 'dict.sys_oper_type.insert', dict_type = 'sys_oper_type' WHERE dict_code = 18;
UPDATE sys_dict_data SET dict_label = 'dict.sys_oper_type.update', dict_type = 'sys_oper_type' WHERE dict_code = 19;
UPDATE sys_dict_data SET dict_label = 'dict.sys_oper_type.delete', dict_type = 'sys_oper_type' WHERE dict_code = 20;
UPDATE sys_dict_data SET dict_label = 'dict.sys_oper_type.grant', dict_type = 'sys_oper_type' WHERE dict_code = 21;
UPDATE sys_dict_data SET dict_label = 'dict.sys_oper_type.export', dict_type = 'sys_oper_type' WHERE dict_code = 22;
UPDATE sys_dict_data SET dict_label = 'dict.sys_oper_type.import', dict_type = 'sys_oper_type' WHERE dict_code = 23;
UPDATE sys_dict_data SET dict_label = 'dict.sys_oper_type.force', dict_type = 'sys_oper_type' WHERE dict_code = 24;
UPDATE sys_dict_data SET dict_label = 'dict.sys_oper_type.gencode', dict_type = 'sys_oper_type' WHERE dict_code = 25;
UPDATE sys_dict_data SET dict_label = 'dict.sys_oper_type.clean', dict_type = 'sys_oper_type' WHERE dict_code = 26;
UPDATE sys_dict_data SET dict_label = 'dict.sys_common_status.success', dict_type = 'sys_common_status' WHERE dict_code = 27;
UPDATE sys_dict_data SET dict_label = 'dict.sys_common_status.fail', dict_type = 'sys_common_status' WHERE dict_code = 28;
UPDATE sys_dict_data SET dict_label = 'dict.sys_oper_type.other', dict_type = 'sys_oper_type' WHERE dict_code = 29;
UPDATE sys_dict_data SET dict_label = 'dict.sys_grant_type.password', dict_type = 'sys_grant_type' WHERE dict_code = 30;
UPDATE sys_dict_data SET dict_label = 'dict.sys_grant_type.sms', dict_type = 'sys_grant_type' WHERE dict_code = 31;
UPDATE sys_dict_data SET dict_label = 'dict.sys_grant_type.email', dict_type = 'sys_grant_type' WHERE dict_code = 32;
UPDATE sys_dict_data SET dict_label = 'dict.sys_grant_type.miniapp', dict_type = 'sys_grant_type' WHERE dict_code = 33;
UPDATE sys_dict_data SET dict_label = 'dict.sys_grant_type.social', dict_type = 'sys_grant_type' WHERE dict_code = 34;
UPDATE sys_dict_data SET dict_label = 'dict.sys_device_type.pc', dict_type = 'sys_device_type' WHERE dict_code = 35;
UPDATE sys_dict_data SET dict_label = 'dict.sys_device_type.android', dict_type = 'sys_device_type' WHERE dict_code = 36;
UPDATE sys_dict_data SET dict_label = 'dict.sys_device_type.ios', dict_type = 'sys_device_type' WHERE dict_code = 37;
UPDATE sys_dict_data SET dict_label = 'dict.sys_device_type.miniapp', dict_type = 'sys_device_type' WHERE dict_code = 38;

-- 管理端菜单、图标、组件及前端可用状态适配。
UPDATE sys_menu SET component = 'Layout', icon = 'carbon:cloud-service-management', menu_name = 'route.system' WHERE menu_id = 1;
UPDATE sys_menu SET component = 'Layout', icon = 'stash:dashboard', menu_name = 'route.monitor' WHERE menu_id = 2;
UPDATE sys_menu SET component = 'Layout', icon = 'tabler:tools', menu_name = 'route.tool' WHERE menu_id = 3;
UPDATE sys_menu SET component = 'Layout', icon = 'material-symbols:kid-star-outline', menu_name = 'route.demo' WHERE menu_id = 5;
UPDATE sys_menu SET component = 'Layout', icon = 'tabler:logs', menu_name = 'menu.system_log' WHERE menu_id = 108;
UPDATE sys_menu SET icon = 'ic:round-manage-accounts', menu_name = 'route.system_user' WHERE menu_id = 100;
UPDATE sys_menu SET icon = 'carbon:user-role', menu_name = 'route.system_role' WHERE menu_id = 101;
UPDATE sys_menu SET icon = 'material-symbols:route', menu_name = 'route.system_menu' WHERE menu_id = 102;
UPDATE sys_menu SET icon = 'mingcute:department-line', menu_name = 'route.system_dept' WHERE menu_id = 103;
UPDATE sys_menu SET icon = 'hugeicons:permanent-job', menu_name = 'route.system_post' WHERE menu_id = 104;
UPDATE sys_menu SET icon = 'qlementine-icons:dictionary-16', menu_name = 'route.system_dict' WHERE menu_id = 105;
UPDATE sys_menu SET icon = 'carbon:parameter', menu_name = 'route.system_config' WHERE menu_id = 106;
UPDATE sys_menu SET icon = 'solar:chat-line-outline', menu_name = 'route.system_notice' WHERE menu_id = 107;
UPDATE sys_menu SET icon = 'majesticons:status-online-line', menu_name = 'route.monitor_online' WHERE menu_id = 109;
UPDATE sys_menu SET icon = 'simple-icons:redis', menu_name = 'route.monitor_cache' WHERE menu_id = 113;
UPDATE sys_menu SET icon = 'material-symbols:code-blocks-outline', menu_name = 'route.tool_gen' WHERE menu_id = 115;
UPDATE sys_menu SET icon = 'material-symbols:attach-file', menu_name = 'route.system_oss' WHERE menu_id = 118;
UPDATE sys_menu SET icon = 'tabler:device-imac-cog', menu_name = 'route.system_client' WHERE menu_id = 123;
UPDATE sys_menu SET icon = 'carbon:operations-record', menu_name = 'route.monitor_operlog' WHERE menu_id = 500;
UPDATE sys_menu SET icon = 'tabler:login-2', menu_name = 'route.monitor_logininfor' WHERE menu_id = 501;
UPDATE sys_menu SET icon = 'gg:debug', menu_name = 'route.demo_demo' WHERE menu_id = 1500;
UPDATE sys_menu SET icon = 'gg:debug', menu_name = 'route.demo_tree' WHERE menu_id = 1506;
UPDATE sys_menu SET path = 'oss/config', component = 'system/oss-config/index', icon = 'hugeicons:configuration-01', menu_name = 'route.system_oss-config' WHERE menu_id = 133;
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (9, 'route.about', 0, 99, 'about', 'about/index', '', 1, 1, 'C', '0', '0', '', 'fluent:book-information-24-regular', 103, 1, now(), null, null, '关于页面') ON CONFLICT (menu_id) DO UPDATE SET update_time = now();
UPDATE sys_menu SET component = 'FrameView', query_param = '{"url":"https://ruoyi.xlsea.cn/admin/"}', is_frame = 2, icon = 'bx:bxl-spring-boot', menu_name = 'menu.monitor_admin' WHERE menu_id = 117;
UPDATE sys_menu SET component = 'FrameView', query_param = '{"url":"https://preview.snailjob.opensnail.com/"}', is_frame = 2, icon = 'gridicons:scheduled', menu_name = 'menu.monitor_snail-job' WHERE menu_id = 120;
UPDATE sys_menu SET menu_name = 'RuoYi-Vue-Plus', order_num = 100, path = 'https://gitee.com/dromara/RuoYi-Vue-Plus', component = 'FrameView', icon = 'local-icon-gitee', remark = 'RuoYi-Vue-Plus 仓库地址' WHERE menu_id = 4;
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (7, 'Soybean Admin', 0, 100, 'https://github.com/soybeanjs', 'FrameView', '', 0, 0, 'M', '0', '0', '', 'mdi:github', 103, 1, now(), null, null, 'Soybean Admin 仓库地址') ON CONFLICT (menu_id) DO UPDATE SET update_time = now();
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query_param, is_frame, is_cache, menu_type, visible, status, perms, icon, create_dept, create_by, create_time, update_by, update_time, remark) VALUES (8, 'RuoYi-Plus-Soybean', 0, 100, 'https://gitee.com/xlsea/ruoyi-plus-soybean', 'FrameView', '', 0, 0, 'M', '0', '0', '', 'local-icon-gitee', 103, 1, now(), null, null, 'RuoYi-Plus-Soybean 仓库地址') ON CONFLICT (menu_id) DO UPDATE SET update_time = now();
UPDATE sys_menu SET status = '1' WHERE menu_id IN ('116', '130', '131', '132');
