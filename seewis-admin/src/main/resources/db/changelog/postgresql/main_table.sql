-- liquibase formatted sql

-- changeset seewis:1
-- comment 初始化主模块表结构

create table sys_social
(
    id                 int8             not null,
    user_id            int8             not null,
    auth_id            varchar(255)     not null,
    source             varchar(255)     not null,
    open_id            varchar(255)     default null::varchar,
    user_name          varchar(30)      not null,
    nick_name          varchar(30)      default ''::varchar,
    email              varchar(255)     default ''::varchar,
    avatar             varchar(500)     default ''::varchar,
    access_token       varchar(2000)    not null,
    expire_in          int8             default null,
    refresh_token      varchar(2000)    default null::varchar,
    access_code        varchar(255)     default null::varchar,
    union_id           varchar(255)     default null::varchar,
    scope              varchar(255)     default null::varchar,
    token_type         varchar(255)     default null::varchar,
    id_token           varchar(2000)    default null::varchar,
    mac_algorithm      varchar(255)     default null::varchar,
    mac_key            varchar(255)     default null::varchar,
    code               varchar(255)     default null::varchar,
    oauth_token        varchar(255)     default null::varchar,
    oauth_token_secret varchar(255)     default null::varchar,
    create_dept        int8,
    create_by          int8,
    create_time        timestamp,
    update_by          int8,
    update_time        timestamp,
    del_flag           char             default '0'::bpchar,
    constraint "pk_sys_social" primary key (id)
);

comment on table   sys_social                   is '社会化关系表';

comment on column  sys_social.id                is '主键';

comment on column  sys_social.user_id           is '用户ID';

comment on column  sys_social.auth_id           is '平台+平台唯一id';

comment on column  sys_social.source            is '用户来源';

comment on column  sys_social.open_id           is '平台编号唯一id';

comment on column  sys_social.user_name         is '登录账号';

comment on column  sys_social.nick_name         is '用户昵称';

comment on column  sys_social.email             is '用户邮箱';

comment on column  sys_social.avatar            is '头像地址';

comment on column  sys_social.access_token      is '用户的授权令牌';

comment on column  sys_social.expire_in         is '用户的授权令牌的有效期，部分平台可能没有';

comment on column  sys_social.refresh_token     is '刷新令牌，部分平台可能没有';

comment on column  sys_social.access_code       is '平台的授权信息，部分平台可能没有';

comment on column  sys_social.union_id          is '用户的 unionid';

comment on column  sys_social.scope             is '授予的权限，部分平台可能没有';

comment on column  sys_social.token_type        is '个别平台的授权信息，部分平台可能没有';

comment on column  sys_social.id_token          is 'id token，部分平台可能没有';

comment on column  sys_social.mac_algorithm     is '小米平台用户的附带属性，部分平台可能没有';

comment on column  sys_social.mac_key           is '小米平台用户的附带属性，部分平台可能没有';

comment on column  sys_social.code              is '用户的授权code，部分平台可能没有';

comment on column  sys_social.oauth_token       is 'Twitter平台用户的附带属性，部分平台可能没有';

comment on column  sys_social.oauth_token_secret is 'Twitter平台用户的附带属性，部分平台可能没有';

comment on column  sys_social.create_dept       is '创建部门';

comment on column  sys_social.create_by         is '创建者';

comment on column  sys_social.create_time       is '创建时间';

comment on column  sys_social.update_by         is '更新者';

comment on column  sys_social.update_time       is '更新时间';

comment on column  sys_social.del_flag          is '删除标志（0代表存在 1代表删除）';

create table if not exists sys_dept
(
    dept_id     int8,
    parent_id   int8        default 0,
    ancestors   varchar(500)default ''::varchar,
    dept_name   varchar(30) default ''::varchar,
    dept_category varchar(100) default null::varchar,
    order_num   int4        default 0,
    leader      int8        default null,
    phone       varchar(11) default null::varchar,
    email       varchar(50) default null::varchar,
    status      char        default '0'::bpchar,
    del_flag    char        default '0'::bpchar,
    create_dept int8,
    create_by   int8,
    create_time timestamp,
    update_by   int8,
    update_time timestamp,
    constraint "sys_dept_pk" primary key (dept_id)
);

comment on table sys_dept               is '部门表';

comment on column sys_dept.dept_id      is '部门ID';

comment on column sys_dept.parent_id    is '父部门ID';

comment on column sys_dept.ancestors    is '祖级列表';

comment on column sys_dept.dept_name    is '部门名称';

comment on column sys_dept.dept_category    is '部门类别编码';

comment on column sys_dept.order_num    is '显示顺序';

comment on column sys_dept.leader       is '负责人';

comment on column sys_dept.phone        is '联系电话';

comment on column sys_dept.email        is '邮箱';

comment on column sys_dept.status       is '部门状态（0正常 1停用）';

comment on column sys_dept.del_flag     is '删除标志（0代表存在 1代表删除）';

comment on column sys_dept.create_dept  is '创建部门';

comment on column sys_dept.create_by    is '创建者';

comment on column sys_dept.create_time  is '创建时间';

comment on column sys_dept.update_by    is '更新者';

comment on column sys_dept.update_time  is '更新时间';

create table if not exists sys_user
(
    user_id     int8,
    dept_id     int8,
    user_name   varchar(30)  not null,
    nick_name   varchar(30)  not null,
    user_type   varchar(10)  default 'sys_user'::varchar,
    email       varchar(50)  default ''::varchar,
    phonenumber varchar(11)  default ''::varchar,
    sex         char         default '0'::bpchar,
    avatar      int8,
    password    varchar(100) default ''::varchar,
    status      char         default '0'::bpchar,
    del_flag    char         default '0'::bpchar,
    login_ip    varchar(128) default ''::varchar,
    login_date  timestamp,
    create_dept int8,
    create_by   int8,
    create_time timestamp,
    update_by   int8,
    update_time timestamp,
    remark      varchar(500) default null::varchar,
    constraint "sys_user_pk" primary key (user_id)
);

comment on table sys_user               is '用户信息表';

comment on column sys_user.user_id      is '用户ID';

comment on column sys_user.dept_id      is '部门ID';

comment on column sys_user.user_name    is '用户账号';

comment on column sys_user.nick_name    is '用户昵称';

comment on column sys_user.user_type    is '用户类型（sys_user系统用户）';

comment on column sys_user.email        is '用户邮箱';

comment on column sys_user.phonenumber  is '手机号码';

comment on column sys_user.sex          is '用户性别（0男 1女 2未知）';

comment on column sys_user.avatar       is '头像地址';

comment on column sys_user.password     is '密码';

comment on column sys_user.status       is '账号状态（0正常 1停用）';

comment on column sys_user.del_flag     is '删除标志（0代表存在 1代表删除）';

comment on column sys_user.login_ip     is '最后登陆IP';

comment on column sys_user.login_date   is '最后登陆时间';

comment on column sys_user.create_dept  is '创建部门';

comment on column sys_user.create_by    is '创建者';

comment on column sys_user.create_time  is '创建时间';

comment on column sys_user.update_by    is '更新者';

comment on column sys_user.update_time  is '更新时间';

comment on column sys_user.remark       is '备注';

create table if not exists sys_post
(
    post_id     int8,
    dept_id     int8,
    post_code   varchar(64) not null,
    post_category   varchar(100) default null,
    post_name   varchar(50) not null,
    post_sort   int4        not null,
    status      char        not null,
    create_dept int8,
    create_by   int8,
    create_time timestamp,
    update_by   int8,
    update_time timestamp,
    remark      varchar(500) default null::varchar,
    constraint "sys_post_pk" primary key (post_id)
);

comment on table sys_post               is '岗位信息表';

comment on column sys_post.post_id      is '岗位ID';

comment on column sys_post.dept_id      is '部门id';

comment on column sys_post.post_code    is '岗位编码';

comment on column sys_post.post_category is '岗位类别编码';

comment on column sys_post.post_name    is '岗位名称';

comment on column sys_post.post_sort    is '显示顺序';

comment on column sys_post.status       is '状态（0正常 1停用）';

comment on column sys_post.create_dept  is '创建部门';

comment on column sys_post.create_by    is '创建者';

comment on column sys_post.create_time  is '创建时间';

comment on column sys_post.update_by    is '更新者';

comment on column sys_post.update_time  is '更新时间';

comment on column sys_post.remark       is '备注';

create table if not exists sys_role
(
    role_id             int8,
    role_name           varchar(30)  not null,
    role_key            varchar(100) not null,
    role_sort           int4         not null,
    data_scope          char         default '1'::bpchar,
    menu_check_strictly bool         default true,
    dept_check_strictly bool         default true,
    status              char         not null,
    del_flag            char         default '0'::bpchar,
    create_dept         int8,
    create_by           int8,
    create_time         timestamp,
    update_by           int8,
    update_time         timestamp,
    remark              varchar(500) default null::varchar,
    constraint "sys_role_pk" primary key (role_id)
);

comment on table sys_role                       is '角色信息表';

comment on column sys_role.role_id              is '角色ID';

comment on column sys_role.role_name            is '角色名称';

comment on column sys_role.role_key             is '角色权限字符串';

comment on column sys_role.role_sort            is '显示顺序';

comment on column sys_role.data_scope           is '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限 5：仅本人数据权限 6：部门及以下或本人数据权限）';

comment on column sys_role.menu_check_strictly  is '菜单树选择项是否关联显示';

comment on column sys_role.dept_check_strictly  is '部门树选择项是否关联显示';

comment on column sys_role.status               is '角色状态（0正常 1停用）';

comment on column sys_role.del_flag             is '删除标志（0代表存在 1代表删除）';

comment on column sys_role.create_dept          is '创建部门';

comment on column sys_role.create_by            is '创建者';

comment on column sys_role.create_time          is '创建时间';

comment on column sys_role.update_by            is '更新者';

comment on column sys_role.update_time          is '更新时间';

comment on column sys_role.remark               is '备注';

create table if not exists sys_menu
(
    menu_id     int8,
    menu_name   varchar(50) not null,
    parent_id   int8         default 0,
    order_num   int4         default 0,
    path        varchar(200) default ''::varchar,
    component   varchar(255) default null::varchar,
    query_param varchar(255) default null::varchar,
    is_frame    char         default '1'::bpchar,
    is_cache    char         default '0'::bpchar,
    menu_type   char         default ''::bpchar,
    visible     char         default '0'::bpchar,
    status      char         default '0'::bpchar,
    perms       varchar(100) default null::varchar,
    icon        varchar(100) default '#'::varchar,
    create_dept int8,
    create_by   int8,
    create_time timestamp,
    update_by   int8,
    update_time timestamp,
    remark      varchar(500) default ''::varchar,
    constraint "sys_menu_pk" primary key (menu_id)
);

comment on table sys_menu               is '菜单权限表';

comment on column sys_menu.menu_id      is '菜单ID';

comment on column sys_menu.menu_name    is '菜单名称';

comment on column sys_menu.parent_id    is '父菜单ID';

comment on column sys_menu.order_num    is '显示顺序';

comment on column sys_menu.path         is '路由地址';

comment on column sys_menu.component    is '组件路径';

comment on column sys_menu.query_param  is '路由参数';

comment on column sys_menu.is_frame     is '是否为外链（0是 1否）';

comment on column sys_menu.is_cache     is '是否缓存（0缓存 1不缓存）';

comment on column sys_menu.menu_type    is '菜单类型（M目录 C菜单 F按钮）';

comment on column sys_menu.visible      is '显示状态（0显示 1隐藏）';

comment on column sys_menu.status       is '菜单状态（0正常 1停用）';

comment on column sys_menu.perms        is '权限标识';

comment on column sys_menu.icon         is '菜单图标';

comment on column sys_menu.create_dept  is '创建部门';

comment on column sys_menu.create_by    is '创建者';

comment on column sys_menu.create_time  is '创建时间';

comment on column sys_menu.update_by    is '更新者';

comment on column sys_menu.update_time  is '更新时间';

comment on column sys_menu.remark       is '备注';

create table if not exists sys_user_role
(
    user_id int8 not null,
    role_id int8 not null,
    constraint sys_user_role_pk primary key (user_id, role_id)
);

comment on table sys_user_role              is '用户和角色关联表';

comment on column sys_user_role.user_id     is '用户ID';

comment on column sys_user_role.role_id     is '角色ID';

create table if not exists sys_role_menu
(
    role_id int8 not null,
    menu_id int8 not null,
    constraint sys_role_menu_pk primary key (role_id, menu_id)
);

comment on table sys_role_menu              is '角色和菜单关联表';

comment on column sys_role_menu.role_id     is '角色ID';

comment on column sys_role_menu.menu_id     is '菜单ID';

create table if not exists sys_role_dept
(
    role_id int8 not null,
    dept_id int8 not null,
    constraint sys_role_dept_pk primary key (role_id, dept_id)
);

comment on table sys_role_dept              is '角色和部门关联表';

comment on column sys_role_dept.role_id     is '角色ID';

comment on column sys_role_dept.dept_id     is '部门ID';

create table if not exists sys_user_post
(
    user_id int8 not null,
    post_id int8 not null,
    constraint sys_user_post_pk primary key (user_id, post_id)
);

comment on table sys_user_post              is '用户与岗位关联表';

comment on column sys_user_post.user_id     is '用户ID';

comment on column sys_user_post.post_id     is '岗位ID';

create table if not exists sys_oper_log
(
    oper_id        int8,
    title          varchar(50)   default ''::varchar,
    business_type  int4          default 0,
    method         varchar(100)  default ''::varchar,
    request_method varchar(10)   default ''::varchar,
    operator_type  int4          default 0,
    oper_name      varchar(50)   default ''::varchar,
    dept_name      varchar(50)   default ''::varchar,
    oper_url       varchar(255)  default ''::varchar,
    oper_ip        varchar(128)  default ''::varchar,
    oper_location  varchar(255)  default ''::varchar,
    oper_param     varchar(4000) default ''::varchar,
    json_result    varchar(4000) default ''::varchar,
    status         int4          default 0,
    error_msg      varchar(4000) default ''::varchar,
    oper_time      timestamp,
    cost_time      int8          default 0,
    constraint sys_oper_log_pk primary key (oper_id)
);

create index idx_sys_oper_log_bt ON sys_oper_log (business_type);

create index idx_sys_oper_log_s ON sys_oper_log (status);

create index idx_sys_oper_log_ot ON sys_oper_log (oper_time);

comment on table sys_oper_log                   is '操作日志记录';

comment on column sys_oper_log.oper_id          is '日志主键';

comment on column sys_oper_log.title            is '模块标题';

comment on column sys_oper_log.business_type    is '业务类型（0其它 1新增 2修改 3删除）';

comment on column sys_oper_log.method           is '方法名称';

comment on column sys_oper_log.request_method   is '请求方式';

comment on column sys_oper_log.operator_type    is '操作类别（0其它 1后台用户 2手机端用户）';

comment on column sys_oper_log.oper_name        is '操作人员';

comment on column sys_oper_log.dept_name        is '部门名称';

comment on column sys_oper_log.oper_url         is '请求URL';

comment on column sys_oper_log.oper_ip          is '主机地址';

comment on column sys_oper_log.oper_location    is '操作地点';

comment on column sys_oper_log.oper_param       is '请求参数';

comment on column sys_oper_log.json_result      is '返回参数';

comment on column sys_oper_log.status           is '操作状态（0正常 1异常）';

comment on column sys_oper_log.error_msg        is '错误消息';

comment on column sys_oper_log.oper_time        is '操作时间';

comment on column sys_oper_log.cost_time        is '消耗时间';

create table if not exists sys_dict_type
(
    dict_id     int8,
    dict_name   varchar(100) default ''::varchar,
    dict_type   varchar(100) default ''::varchar,
    create_dept int8,
    create_by   int8,
    create_time timestamp,
    update_by   int8,
    update_time timestamp,
    remark      varchar(500) default null::varchar,
    constraint sys_dict_type_pk primary key (dict_id)
);

create unique index sys_dict_type_index1 ON sys_dict_type (dict_type);

comment on table sys_dict_type                  is '字典类型表';

comment on column sys_dict_type.dict_id         is '字典主键';

comment on column sys_dict_type.dict_name       is '字典名称';

comment on column sys_dict_type.dict_type       is '字典类型';

comment on column sys_dict_type.create_dept     is '创建部门';

comment on column sys_dict_type.create_by       is '创建者';

comment on column sys_dict_type.create_time     is '创建时间';

comment on column sys_dict_type.update_by       is '更新者';

comment on column sys_dict_type.update_time     is '更新时间';

comment on column sys_dict_type.remark          is '备注';

create table if not exists sys_dict_data
(
    dict_code   int8,
    dict_sort   int4         default 0,
    dict_label  varchar(100) default ''::varchar,
    dict_value  varchar(100) default ''::varchar,
    dict_type   varchar(100) default ''::varchar,
    css_class   varchar(100) default null::varchar,
    list_class  varchar(100) default null::varchar,
    is_default  char         default 'N'::bpchar,
    create_dept int8,
    create_by   int8,
    create_time timestamp,
    update_by   int8,
    update_time timestamp,
    remark      varchar(500) default null::varchar,
    constraint sys_dict_data_pk primary key (dict_code)
);

comment on table sys_dict_data                  is '字典数据表';

comment on column sys_dict_data.dict_code       is '字典编码';

comment on column sys_dict_data.dict_sort       is '字典排序';

comment on column sys_dict_data.dict_label      is '字典标签';

comment on column sys_dict_data.dict_value      is '字典键值';

comment on column sys_dict_data.dict_type       is '字典类型';

comment on column sys_dict_data.css_class       is '样式属性（其他样式扩展）';

comment on column sys_dict_data.list_class      is '表格回显样式';

comment on column sys_dict_data.is_default      is '是否默认（Y是 N否）';

comment on column sys_dict_data.create_dept     is '创建部门';

comment on column sys_dict_data.create_by       is '创建者';

comment on column sys_dict_data.create_time     is '创建时间';

comment on column sys_dict_data.update_by       is '更新者';

comment on column sys_dict_data.update_time     is '更新时间';

comment on column sys_dict_data.remark          is '备注';

create table if not exists sys_config
(
    config_id    int8,
    config_name  varchar(100) default ''::varchar,
    config_key   varchar(100) default ''::varchar,
    config_value varchar(500) default ''::varchar,
    config_type  char         default 'N'::bpchar,
    create_dept  int8,
    create_by    int8,
    create_time  timestamp,
    update_by    int8,
    update_time  timestamp,
    remark       varchar(500) default null::varchar,
    constraint sys_config_pk primary key (config_id)
);

comment on table sys_config                 is '参数配置表';

comment on column sys_config.config_id      is '参数主键';

comment on column sys_config.config_name    is '参数名称';

comment on column sys_config.config_key     is '参数键名';

comment on column sys_config.config_value   is '参数键值';

comment on column sys_config.config_type    is '系统内置（Y是 N否）';

comment on column sys_config.create_dept    is '创建部门';

comment on column sys_config.create_by      is '创建者';

comment on column sys_config.create_time    is '创建时间';

comment on column sys_config.update_by      is '更新者';

comment on column sys_config.update_time    is '更新时间';

comment on column sys_config.remark         is '备注';

create table if not exists sys_logininfor
(
    info_id        int8,
    user_name      varchar(50)  default ''::varchar,
    client_key     varchar(32)  default ''::varchar,
    device_type    varchar(32)  default ''::varchar,
    ipaddr         varchar(128) default ''::varchar,
    login_location varchar(255) default ''::varchar,
    browser        varchar(50)  default ''::varchar,
    os             varchar(50)  default ''::varchar,
    status         char         default '0'::bpchar,
    msg            varchar(255) default ''::varchar,
    login_time     timestamp,
    constraint sys_logininfor_pk primary key (info_id)
);

create index idx_sys_logininfor_s ON sys_logininfor (status);

create index idx_sys_logininfor_lt ON sys_logininfor (login_time);

comment on table sys_logininfor                 is '系统访问记录';

comment on column sys_logininfor.info_id        is '访问ID';

comment on column sys_logininfor.user_name      is '用户账号';

comment on column sys_logininfor.client_key     is '客户端';

comment on column sys_logininfor.device_type    is '设备类型';

comment on column sys_logininfor.ipaddr         is '登录IP地址';

comment on column sys_logininfor.login_location is '登录地点';

comment on column sys_logininfor.browser        is '浏览器类型';

comment on column sys_logininfor.os             is '操作系统';

comment on column sys_logininfor.status         is '登录状态（0成功 1失败）';

comment on column sys_logininfor.msg            is '提示消息';

comment on column sys_logininfor.login_time     is '访问时间';

create table if not exists sys_notice
(
    notice_id      int8,
    notice_title   varchar(50)  not null,
    notice_type    char         not null,
    notice_content text,
    status         char         default '0'::bpchar,
    create_dept    int8,
    create_by      int8,
    create_time    timestamp,
    update_by      int8,
    update_time    timestamp,
    remark         varchar(255) default null::varchar,
    constraint sys_notice_pk primary key (notice_id)
);

comment on table sys_notice                 is '通知公告表';

comment on column sys_notice.notice_id      is '公告ID';

comment on column sys_notice.notice_title   is '公告标题';

comment on column sys_notice.notice_type    is '公告类型（1通知 2公告）';

comment on column sys_notice.notice_content is '公告内容';

comment on column sys_notice.status         is '公告状态（0正常 1关闭）';

comment on column sys_notice.create_dept    is '创建部门';

comment on column sys_notice.create_by      is '创建者';

comment on column sys_notice.create_time    is '创建时间';

comment on column sys_notice.update_by      is '更新者';

comment on column sys_notice.update_time    is '更新时间';

comment on column sys_notice.remark         is '备注';

create table if not exists gen_table
(
    table_id          int8,
    data_name         varchar(200)  default ''::varchar,
    table_name        varchar(200)  default ''::varchar,
    table_comment     varchar(500)  default ''::varchar,
    sub_table_name    varchar(64)   default ''::varchar,
    sub_table_fk_name varchar(64)   default ''::varchar,
    class_name        varchar(100)  default ''::varchar,
    tpl_category      varchar(200)  default 'crud'::varchar,
    package_name      varchar(100)  default null::varchar,
    module_name       varchar(30)   default null::varchar,
    business_name     varchar(30)   default null::varchar,
    function_name     varchar(50)   default null::varchar,
    function_author   varchar(50)   default null::varchar,
    gen_type          char          default '0'::bpchar not null,
    gen_path          varchar(200)  default '/'::varchar,
    options           varchar(1000) default null::varchar,
    create_dept       int8,
    create_by         int8,
    create_time       timestamp,
    update_by         int8,
    update_time       timestamp,
    remark            varchar(500)  default null::varchar,
    constraint gen_table_pk primary key (table_id)
);

comment on table gen_table is '代码生成业务表';

comment on column gen_table.table_id is '编号';

comment on column gen_table.data_name is '数据源名称';

comment on column gen_table.table_name is '表名称';

comment on column gen_table.table_comment is '表描述';

comment on column gen_table.sub_table_name is '关联子表的表名';

comment on column gen_table.sub_table_fk_name is '子表关联的外键名';

comment on column gen_table.class_name is '实体类名称';

comment on column gen_table.tpl_category is '使用的模板（CRUD单表操作 TREE树表操作）';

comment on column gen_table.package_name is '生成包路径';

comment on column gen_table.module_name is '生成模块名';

comment on column gen_table.business_name is '生成业务名';

comment on column gen_table.function_name is '生成功能名';

comment on column gen_table.function_author is '生成功能作者';

comment on column gen_table.gen_type is '生成代码方式（0zip压缩包 1自定义路径）';

comment on column gen_table.gen_path is '生成路径（不填默认项目路径）';

comment on column gen_table.options is '其它生成选项';

comment on column gen_table.create_dept is '创建部门';

comment on column gen_table.create_by is '创建者';

comment on column gen_table.create_time is '创建时间';

comment on column gen_table.update_by is '更新者';

comment on column gen_table.update_time is '更新时间';

comment on column gen_table.remark is '备注';

create table if not exists gen_table_column
(
    column_id      int8,
    table_id       int8,
    column_name    varchar(200) default null::varchar,
    column_comment varchar(500) default null::varchar,
    column_type    varchar(100) default null::varchar,
    java_type      varchar(500) default null::varchar,
    java_field     varchar(200) default null::varchar,
    is_pk          char         default null::bpchar,
    is_increment   char         default null::bpchar,
    is_required    char         default null::bpchar,
    is_insert      char         default null::bpchar,
    is_edit        char         default null::bpchar,
    is_list        char         default null::bpchar,
    is_query       char         default null::bpchar,
    query_type     varchar(200) default 'EQ'::varchar,
    html_type      varchar(200) default null::varchar,
    dict_type      varchar(200) default ''::varchar,
    sort           int4,
    create_dept    int8,
    create_by      int8,
    create_time    timestamp,
    update_by      int8,
    update_time    timestamp,
    constraint gen_table_column_pk primary key (column_id)
);

comment on table gen_table_column is '代码生成业务表字段';

comment on column gen_table_column.column_id is '编号';

comment on column gen_table_column.table_id is '归属表编号';

comment on column gen_table_column.column_name is '列名称';

comment on column gen_table_column.column_comment is '列描述';

comment on column gen_table_column.column_type is '列类型';

comment on column gen_table_column.java_type is 'JAVA类型';

comment on column gen_table_column.java_field is 'JAVA字段名';

comment on column gen_table_column.is_pk is '是否主键（1是）';

comment on column gen_table_column.is_increment is '是否自增（1是）';

comment on column gen_table_column.is_required is '是否必填（1是）';

comment on column gen_table_column.is_insert is '是否为插入字段（1是）';

comment on column gen_table_column.is_edit is '是否编辑字段（1是）';

comment on column gen_table_column.is_list is '是否列表字段（1是）';

comment on column gen_table_column.is_query is '是否查询字段（1是）';

comment on column gen_table_column.query_type is '查询方式（等于、不等于、大于、小于、范围）';

comment on column gen_table_column.html_type is '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）';

comment on column gen_table_column.dict_type is '字典类型';

comment on column gen_table_column.sort is '排序';

comment on column gen_table_column.create_dept is '创建部门';

comment on column gen_table_column.create_by is '创建者';

comment on column gen_table_column.create_time is '创建时间';

comment on column gen_table_column.update_by is '更新者';

comment on column gen_table_column.update_time is '更新时间';

create table if not exists sys_oss
(
    oss_id        int8,
    file_name     varchar(255) default ''::varchar not null,
    original_name varchar(255) default ''::varchar not null,
    file_suffix   varchar(10)  default ''::varchar not null,
    url           varchar(500) default ''::varchar not null,
    ext1          varchar(500) default ''::varchar,
    create_dept   int8,
    create_by     int8,
    create_time   timestamp,
    update_by     int8,
    update_time   timestamp,
    service       varchar(20)  default 'minio'::varchar,
    constraint sys_oss_pk primary key (oss_id)
);

comment on table sys_oss                    is 'OSS对象存储表';

comment on column sys_oss.oss_id            is '对象存储主键';

comment on column sys_oss.file_name         is '文件名';

comment on column sys_oss.original_name     is '原名';

comment on column sys_oss.file_suffix       is '文件后缀名';

comment on column sys_oss.url               is 'URL地址';

comment on column sys_oss.ext1              is '扩展字段';

comment on column sys_oss.create_by         is '上传人';

comment on column sys_oss.create_dept       is '创建部门';

comment on column sys_oss.create_time       is '创建时间';

comment on column sys_oss.update_by         is '更新者';

comment on column sys_oss.update_time       is '更新时间';

comment on column sys_oss.service           is '服务商';

create table if not exists sys_oss_config
(
    oss_config_id int8,
    config_key    varchar(20)  default ''::varchar not null,
    access_key    varchar(255) default ''::varchar,
    secret_key    varchar(255) default ''::varchar,
    bucket_name   varchar(255) default ''::varchar,
    prefix        varchar(255) default ''::varchar,
    endpoint      varchar(255) default ''::varchar,
    domain        varchar(255) default ''::varchar,
    is_https      char         default 'N'::bpchar,
    region        varchar(255) default ''::varchar,
    access_policy char(1)      default '1'::bpchar not null,
    status        char         default '1'::bpchar,
    ext1          varchar(255) default ''::varchar,
    create_dept   int8,
    create_by     int8,
    create_time   timestamp,
    update_by     int8,
    update_time   timestamp,
    remark        varchar(500) default ''::varchar,
    constraint sys_oss_config_pk primary key (oss_config_id)
);

comment on table sys_oss_config                 is '对象存储配置表';

comment on column sys_oss_config.oss_config_id  is '主键';

comment on column sys_oss_config.config_key     is '配置key';

comment on column sys_oss_config.access_key     is 'accessKey';

comment on column sys_oss_config.secret_key     is '秘钥';

comment on column sys_oss_config.bucket_name    is '桶名称';

comment on column sys_oss_config.prefix         is '前缀';

comment on column sys_oss_config.endpoint       is '访问站点';

comment on column sys_oss_config.domain         is '自定义域名';

comment on column sys_oss_config.is_https       is '是否https（Y=是,N=否）';

comment on column sys_oss_config.region         is '域';

comment on column sys_oss_config.access_policy  is '桶权限类型(0=private 1=public 2=custom)';

comment on column sys_oss_config.status         is '是否默认（0=是,1=否）';

comment on column sys_oss_config.ext1           is '扩展字段';

comment on column sys_oss_config.create_dept    is '创建部门';

comment on column sys_oss_config.create_by      is '创建者';

comment on column sys_oss_config.create_time    is '创建时间';

comment on column sys_oss_config.update_by      is '更新者';

comment on column sys_oss_config.update_time    is '更新时间';

comment on column sys_oss_config.remark         is '备注';

create table sys_client (
    id                  int8,
    client_id           varchar(64)   default ''::varchar,
    client_key          varchar(32)   default ''::varchar,
    client_secret       varchar(255)  default ''::varchar,
    grant_type          varchar(255)  default ''::varchar,
    device_type         varchar(32)   default ''::varchar,
    active_timeout      int4          default 1800,
    timeout             int4          default 604800,
    status              char(1)       default '0'::bpchar,
    del_flag            char(1)       default '0'::bpchar,
    create_dept         int8,
    create_by           int8,
    create_time         timestamp,
    update_by           int8,
    update_time         timestamp,
    constraint sys_client_pk primary key (id)
);

comment on table sys_client                         is '系统授权表';

comment on column sys_client.id                     is '主键';

comment on column sys_client.client_id              is '客户端id';

comment on column sys_client.client_key             is '客户端key';

comment on column sys_client.client_secret          is '客户端秘钥';

comment on column sys_client.grant_type             is '授权类型';

comment on column sys_client.device_type            is '设备类型';

comment on column sys_client.active_timeout         is 'token活跃超时时间';

comment on column sys_client.timeout                is 'token固定超时';

comment on column sys_client.status                 is '状态（0正常 1停用）';

comment on column sys_client.del_flag               is '删除标志（0代表存在 1代表删除）';

comment on column sys_client.create_dept            is '创建部门';

comment on column sys_client.create_by              is '创建者';

comment on column sys_client.create_time            is '创建时间';

comment on column sys_client.update_by              is '更新者';

comment on column sys_client.update_time            is '更新时间';

create table if not exists test_demo
(
    id          int8,
    dept_id     int8,
    user_id     int8,
    order_num   int4            default 0,
    test_key    varchar(255),
    value       varchar(255),
    version     int4            default 0,
    create_dept int8,
    create_time timestamp,
    create_by   int8,
    update_time timestamp,
    update_by   int8,
    del_flag    int4            default 0
);

comment on table test_demo is '测试单表';

comment on column test_demo.id is '主键';

comment on column test_demo.dept_id is '部门id';

comment on column test_demo.user_id is '用户id';

comment on column test_demo.order_num is '排序号';

comment on column test_demo.test_key is 'key键';

comment on column test_demo.value is '值';

comment on column test_demo.version is '版本';

comment on column test_demo.create_dept  is '创建部门';

comment on column test_demo.create_time is '创建时间';

comment on column test_demo.create_by is '创建人';

comment on column test_demo.update_time is '更新时间';

comment on column test_demo.update_by is '更新人';

comment on column test_demo.del_flag is '删除标志';

create table if not exists test_tree
(
    id          int8,
    parent_id   int8            default 0,
    dept_id     int8,
    user_id     int8,
    tree_name   varchar(255),
    version     int4            default 0,
    create_dept int8,
    create_time timestamp,
    create_by   int8,
    update_time timestamp,
    update_by   int8,
    del_flag    integer         default 0
);

comment on table test_tree is '测试树表';

comment on column test_tree.id is '主键';

comment on column test_tree.parent_id is '父id';

comment on column test_tree.dept_id is '部门id';

comment on column test_tree.user_id is '用户id';

comment on column test_tree.tree_name is '值';

comment on column test_tree.version is '版本';

comment on column test_tree.create_dept  is '创建部门';

comment on column test_tree.create_time is '创建时间';

comment on column test_tree.create_by is '创建人';

comment on column test_tree.update_time is '更新时间';

comment on column test_tree.update_by is '更新人';

comment on column test_tree.del_flag is '删除标志';

create or replace function cast_varchar_to_timestamp(varchar) returns timestamptz as $$
select to_timestamp($1, 'yyyy-mm-dd hh24:mi:ss');
$$ language sql strict ;

create cast (varchar as timestamptz) with function cast_varchar_to_timestamp as IMPLICIT;
