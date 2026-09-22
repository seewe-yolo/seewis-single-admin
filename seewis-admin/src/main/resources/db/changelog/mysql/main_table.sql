-- liquibase formatted sql

-- changeset seewis:1
-- comment 初始化主模块表结构

create table sys_social
(
    id                 bigint           not null        comment '主键',
    user_id            bigint           not null        comment '用户ID',
    auth_id            varchar(255)     not null        comment '平台+平台唯一id',
    source             varchar(255)     not null        comment '用户来源',
    open_id            varchar(255)     default null    comment '平台编号唯一id',
    user_name          varchar(30)      not null        comment '登录账号',
    nick_name          varchar(30)      default ''      comment '用户昵称',
    email              varchar(255)     default ''      comment '用户邮箱',
    avatar             varchar(500)     default ''      comment '头像地址',
    access_token       varchar(2000)     not null       comment '用户的授权令牌',
    expire_in          int              default null    comment '用户的授权令牌的有效期，部分平台可能没有',
    refresh_token      varchar(255)     default null    comment '刷新令牌，部分平台可能没有',
    access_code        varchar(2000)     default null   comment '平台的授权信息，部分平台可能没有',
    union_id           varchar(255)     default null    comment '用户的 unionid',
    scope              varchar(255)     default null    comment '授予的权限，部分平台可能没有',
    token_type         varchar(255)     default null    comment '个别平台的授权信息，部分平台可能没有',
    id_token           varchar(2000)    default null    comment 'id token，部分平台可能没有',
    mac_algorithm      varchar(255)     default null    comment '小米平台用户的附带属性，部分平台可能没有',
    mac_key            varchar(255)     default null    comment '小米平台用户的附带属性，部分平台可能没有',
    code               varchar(255)     default null    comment '用户的授权code，部分平台可能没有',
    oauth_token        varchar(255)     default null    comment 'Twitter平台用户的附带属性，部分平台可能没有',
    oauth_token_secret varchar(255)     default null    comment 'Twitter平台用户的附带属性，部分平台可能没有',
    create_dept        bigint(20)                       comment '创建部门',
    create_by          bigint(20)                       comment '创建者',
    create_time        datetime                         comment '创建时间',
    update_by          bigint(20)                       comment '更新者',
    update_time        datetime                         comment '更新时间',
    del_flag           char(1)          default '0'     comment '删除标志（0代表存在 1代表删除）',
    PRIMARY KEY (id)
) engine=innodb comment = '社会化关系表';

create table sys_dept (
    dept_id           bigint(20)      not null                   comment '部门id',
    parent_id         bigint(20)      default 0                  comment '父部门id',
    ancestors         varchar(500)    default ''                 comment '祖级列表',
    dept_name         varchar(30)     default ''                 comment '部门名称',
    dept_category     varchar(100)    default null               comment '部门类别编码',
    order_num         int(4)          default 0                  comment '显示顺序',
    leader            bigint(20)      default null               comment '负责人',
    phone             varchar(11)     default null               comment '联系电话',
    email             varchar(50)     default null               comment '邮箱',
    status            char(1)         default '0'                comment '部门状态（0正常 1停用）',
    del_flag          char(1)         default '0'                comment '删除标志（0代表存在 1代表删除）',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    primary key (dept_id)
) engine=innodb comment = '部门表';

create table sys_user (
    user_id           bigint(20)      not null                   comment '用户ID',
    dept_id           bigint(20)      default null               comment '部门ID',
    user_name         varchar(30)     not null                   comment '用户账号',
    nick_name         varchar(30)     not null                   comment '用户昵称',
    user_type         varchar(10)     default 'sys_user'         comment '用户类型（sys_user系统用户）',
    email             varchar(50)     default ''                 comment '用户邮箱',
    phonenumber       varchar(11)     default ''                 comment '手机号码',
    sex               char(1)         default '0'                comment '用户性别（0男 1女 2未知）',
    avatar            bigint(20)                                 comment '头像地址',
    password          varchar(100)    default ''                 comment '密码',
    status            char(1)         default '0'                comment '账号状态（0正常 1停用）',
    del_flag          char(1)         default '0'                comment '删除标志（0代表存在 1代表删除）',
    login_ip          varchar(128)    default ''                 comment '最后登录IP',
    login_date        datetime                                   comment '最后登录时间',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    remark            varchar(500)    default null               comment '备注',
    primary key (user_id)
) engine=innodb comment = '用户信息表';

create table sys_post
(
    post_id       bigint(20)      not null                   comment '岗位ID',
    dept_id       bigint(20)      not null                   comment '部门id',
    post_code     varchar(64)     not null                   comment '岗位编码',
    post_category varchar(100)    default null               comment '岗位类别编码',
    post_name     varchar(50)     not null                   comment '岗位名称',
    post_sort     int(4)          not null                   comment '显示顺序',
    status        char(1)         not null                   comment '状态（0正常 1停用）',
    create_dept   bigint(20)      default null               comment '创建部门',
    create_by     bigint(20)      default null               comment '创建者',
    create_time   datetime                                   comment '创建时间',
    update_by     bigint(20)      default null               comment '更新者',
    update_time   datetime                                   comment '更新时间',
    remark        varchar(500)    default null               comment '备注',
    primary key (post_id)
) engine=innodb comment = '岗位信息表';

create table sys_role (
    role_id              bigint(20)      not null                   comment '角色ID',
    role_name            varchar(30)     not null                   comment '角色名称',
    role_key             varchar(100)    not null                   comment '角色权限字符串',
    role_sort            int(4)          not null                   comment '显示顺序',
    data_scope           char(1)         default '1'                comment '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限 5：仅本人数据权限 6：部门及以下或本人数据权限）',
    menu_check_strictly  tinyint(1)      default 1                  comment '菜单树选择项是否关联显示',
    dept_check_strictly  tinyint(1)      default 1                  comment '部门树选择项是否关联显示',
    status               char(1)         not null                   comment '角色状态（0正常 1停用）',
    del_flag             char(1)         default '0'                comment '删除标志（0代表存在 1代表删除）',
    create_dept          bigint(20)      default null               comment '创建部门',
    create_by            bigint(20)      default null               comment '创建者',
    create_time          datetime                                   comment '创建时间',
    update_by            bigint(20)      default null               comment '更新者',
    update_time          datetime                                   comment '更新时间',
    remark               varchar(500)    default null               comment '备注',
    primary key (role_id)
) engine=innodb comment = '角色信息表';

create table sys_menu (
    menu_id           bigint(20)      not null                   comment '菜单ID',
    menu_name         varchar(50)     not null                   comment '菜单名称',
    parent_id         bigint(20)      default 0                  comment '父菜单ID',
    order_num         int(4)          default 0                  comment '显示顺序',
    path              varchar(200)    default ''                 comment '路由地址',
    component         varchar(255)    default null               comment '组件路径',
    query_param       varchar(255)    default null               comment '路由参数',
    is_frame          int(1)          default 1                  comment '是否为外链（0是 1否）',
    is_cache          int(1)          default 0                  comment '是否缓存（0缓存 1不缓存）',
    menu_type         char(1)         default ''                 comment '菜单类型（M目录 C菜单 F按钮）',
    visible           char(1)         default 0                  comment '显示状态（0显示 1隐藏）',
    status            char(1)         default 0                  comment '菜单状态（0正常 1停用）',
    perms             varchar(100)    default null               comment '权限标识',
    icon              varchar(100)    default '#'                comment '菜单图标',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    remark            varchar(500)    default ''                 comment '备注',
    primary key (menu_id)
) engine=innodb comment = '菜单权限表';

create table sys_user_role (
    user_id   bigint(20) not null comment '用户ID',
    role_id   bigint(20) not null comment '角色ID',
    primary key(user_id, role_id)
) engine=innodb comment = '用户和角色关联表';

create table sys_role_menu (
    role_id   bigint(20) not null comment '角色ID',
    menu_id   bigint(20) not null comment '菜单ID',
    primary key(role_id, menu_id)
) engine=innodb comment = '角色和菜单关联表';

create table sys_role_dept (
    role_id   bigint(20) not null comment '角色ID',
    dept_id   bigint(20) not null comment '部门ID',
    primary key(role_id, dept_id)
) engine=innodb comment = '角色和部门关联表';

create table sys_user_post
(
    user_id   bigint(20) not null comment '用户ID',
    post_id   bigint(20) not null comment '岗位ID',
    primary key (user_id, post_id)
) engine=innodb comment = '用户与岗位关联表';

create table sys_oper_log (
    oper_id           bigint(20)      not null                   comment '日志主键',
    title             varchar(50)     default ''                 comment '模块标题',
    business_type     int(2)          default 0                  comment '业务类型（0其它 1新增 2修改 3删除）',
    method            varchar(100)    default ''                 comment '方法名称',
    request_method    varchar(10)     default ''                 comment '请求方式',
    operator_type     int(1)          default 0                  comment '操作类别（0其它 1后台用户 2手机端用户）',
    oper_name         varchar(50)     default ''                 comment '操作人员',
    dept_name         varchar(50)     default ''                 comment '部门名称',
    oper_url          varchar(255)    default ''                 comment '请求URL',
    oper_ip           varchar(128)    default ''                 comment '主机地址',
    oper_location     varchar(255)    default ''                 comment '操作地点',
    oper_param        varchar(4000)   default ''                 comment '请求参数',
    json_result       varchar(4000)   default ''                 comment '返回参数',
    status            int(1)          default 0                  comment '操作状态（0正常 1异常）',
    error_msg         varchar(4000)   default ''                 comment '错误消息',
    oper_time         datetime                                   comment '操作时间',
    cost_time         bigint(20)      default 0                  comment '消耗时间',
    primary key (oper_id),
    key idx_sys_oper_log_bt (business_type),
    key idx_sys_oper_log_s  (status),
    key idx_sys_oper_log_ot (oper_time)
) engine=innodb comment = '操作日志记录';

create table sys_dict_type
(
    dict_id          bigint(20)      not null                   comment '字典主键',
    dict_name        varchar(100)    default ''                 comment '字典名称',
    dict_type        varchar(100)    default ''                 comment '字典类型',
    create_dept      bigint(20)      default null               comment '创建部门',
    create_by        bigint(20)      default null               comment '创建者',
    create_time      datetime                                   comment '创建时间',
    update_by        bigint(20)      default null               comment '更新者',
    update_time      datetime                                   comment '更新时间',
    remark           varchar(500)    default null               comment '备注',
    primary key (dict_id),
    unique (dict_type)
) engine=innodb comment = '字典类型表';

create table sys_dict_data
(
    dict_code        bigint(20)      not null                   comment '字典编码',
    dict_sort        int(4)          default 0                  comment '字典排序',
    dict_label       varchar(100)    default ''                 comment '字典标签',
    dict_value       varchar(100)    default ''                 comment '字典键值',
    dict_type        varchar(100)    default ''                 comment '字典类型',
    css_class        varchar(100)    default null               comment '样式属性（其他样式扩展）',
    list_class       varchar(100)    default null               comment '表格回显样式',
    is_default       char(1)         default 'N'                comment '是否默认（Y是 N否）',
    create_dept      bigint(20)      default null               comment '创建部门',
    create_by        bigint(20)      default null               comment '创建者',
    create_time      datetime                                   comment '创建时间',
    update_by        bigint(20)      default null               comment '更新者',
    update_time      datetime                                   comment '更新时间',
    remark           varchar(500)    default null               comment '备注',
    primary key (dict_code)
) engine=innodb comment = '字典数据表';

create table sys_config (
    config_id         bigint(20)      not null                   comment '参数主键',
    config_name       varchar(100)    default ''                 comment '参数名称',
    config_key        varchar(100)    default ''                 comment '参数键名',
    config_value      varchar(500)    default ''                 comment '参数键值',
    config_type       char(1)         default 'N'                comment '系统内置（Y是 N否）',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    remark            varchar(500)    default null               comment '备注',
    primary key (config_id)
) engine=innodb comment = '参数配置表';

create table sys_logininfor (
    info_id        bigint(20)     not null                  comment '访问ID',
    user_name      varchar(50)    default ''                comment '用户账号',
    client_key     varchar(32)    default ''                comment '客户端',
    device_type    varchar(32)    default ''                comment '设备类型',
    ipaddr         varchar(128)   default ''                comment '登录IP地址',
    login_location varchar(255)   default ''                comment '登录地点',
    browser        varchar(50)    default ''                comment '浏览器类型',
    os             varchar(50)    default ''                comment '操作系统',
    status         char(1)        default '0'               comment '登录状态（0成功 1失败）',
    msg            varchar(255)   default ''                comment '提示消息',
    login_time     datetime                                 comment '访问时间',
    primary key (info_id),
    key idx_sys_logininfor_s  (status),
    key idx_sys_logininfor_lt (login_time)
) engine=innodb comment = '系统访问记录';

create table sys_notice (
    notice_id         bigint(20)      not null                   comment '公告ID',
    notice_title      varchar(50)     not null                   comment '公告标题',
    notice_type       char(1)         not null                   comment '公告类型（1通知 2公告）',
    notice_content    longblob        default null               comment '公告内容',
    status            char(1)         default '0'                comment '公告状态（0正常 1关闭）',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    remark            varchar(255)    default null               comment '备注',
    primary key (notice_id)
) engine=innodb comment = '通知公告表';

create table gen_table (
    table_id          bigint(20)      not null                   comment '编号',
    data_name         varchar(200)    default ''                 comment '数据源名称',
    table_name        varchar(200)    default ''                 comment '表名称',
    table_comment     varchar(500)    default ''                 comment '表描述',
    sub_table_name    varchar(64)     default null               comment '关联子表的表名',
    sub_table_fk_name varchar(64)     default null               comment '子表关联的外键名',
    class_name        varchar(100)    default ''                 comment '实体类名称',
    tpl_category      varchar(200)    default 'crud'             comment '使用的模板（crud单表操作 tree树表操作）',
    package_name      varchar(100)                               comment '生成包路径',
    module_name       varchar(30)                                comment '生成模块名',
    business_name     varchar(30)                                comment '生成业务名',
    function_name     varchar(50)                                comment '生成功能名',
    function_author   varchar(50)                                comment '生成功能作者',
    gen_type          char(1)         default '0'                comment '生成代码方式（0zip压缩包 1自定义路径）',
    gen_path          varchar(200)    default '/'                comment '生成路径（不填默认项目路径）',
    options           varchar(1000)                              comment '其它生成选项',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    remark            varchar(500)    default null               comment '备注',
    primary key (table_id)
) engine=innodb comment = '代码生成业务表';

create table gen_table_column (
    column_id         bigint(20)      not null                   comment '编号',
    table_id          bigint(20)                                 comment '归属表编号',
    column_name       varchar(200)                               comment '列名称',
    column_comment    varchar(500)                               comment '列描述',
    column_type       varchar(100)                               comment '列类型',
    java_type         varchar(500)                               comment 'JAVA类型',
    java_field        varchar(200)                               comment 'JAVA字段名',
    is_pk             char(1)                                    comment '是否主键（1是）',
    is_increment      char(1)                                    comment '是否自增（1是）',
    is_required       char(1)                                    comment '是否必填（1是）',
    is_insert         char(1)                                    comment '是否为插入字段（1是）',
    is_edit           char(1)                                    comment '是否编辑字段（1是）',
    is_list           char(1)                                    comment '是否列表字段（1是）',
    is_query          char(1)                                    comment '是否查询字段（1是）',
    query_type        varchar(200)    default 'EQ'               comment '查询方式（等于、不等于、大于、小于、范围）',
    html_type         varchar(200)                               comment '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    dict_type         varchar(200)    default ''                 comment '字典类型',
    sort              int                                        comment '排序',
    create_dept       bigint(20)      default null               comment '创建部门',
    create_by         bigint(20)      default null               comment '创建者',
    create_time       datetime                                   comment '创建时间',
    update_by         bigint(20)      default null               comment '更新者',
    update_time       datetime                                   comment '更新时间',
    primary key (column_id)
) engine=innodb comment = '代码生成业务表字段';

create table sys_oss (
    oss_id          bigint(20)   not null                   comment '对象存储主键',
    file_name       varchar(255) not null default ''        comment '文件名',
    original_name   varchar(255) not null default ''        comment '原名',
    file_suffix     varchar(10)  not null default ''        comment '文件后缀名',
    url             varchar(500) not null                   comment 'URL地址',
    ext1            text                  default null      comment '扩展字段',
    create_dept     bigint(20)            default null      comment '创建部门',
    create_time     datetime              default null      comment '创建时间',
    create_by       bigint(20)            default null      comment '上传人',
    update_time     datetime              default null      comment '更新时间',
    update_by       bigint(20)            default null      comment '更新人',
    service         varchar(20)  not null default 'minio'   comment '服务商',
    primary key (oss_id)
) engine=innodb comment ='OSS对象存储表';

create table sys_oss_config (
    oss_config_id   bigint(20)    not null                  comment '主键',
    config_key      varchar(20)   not null  default ''      comment '配置key',
    access_key      varchar(255)            default ''      comment 'accessKey',
    secret_key      varchar(255)            default ''      comment '秘钥',
    bucket_name     varchar(255)            default ''      comment '桶名称',
    prefix          varchar(255)            default ''      comment '前缀',
    endpoint        varchar(255)            default ''      comment '访问站点',
    domain          varchar(255)            default ''      comment '自定义域名',
    is_https        char(1)                 default 'N'     comment '是否https（Y=是,N=否）',
    region          varchar(255)            default ''      comment '域',
    access_policy   char(1)       not null  default '1'     comment '桶权限类型(0=private 1=public 2=custom)',
    status          char(1)                 default '1'     comment '是否默认（0=是,1=否）',
    ext1            varchar(255)            default ''      comment '扩展字段',
    create_dept     bigint(20)              default null    comment '创建部门',
    create_by       bigint(20)              default null    comment '创建者',
    create_time     datetime                default null    comment '创建时间',
    update_by       bigint(20)              default null    comment '更新者',
    update_time     datetime                default null    comment '更新时间',
    remark          varchar(500)            default null    comment '备注',
    primary key (oss_config_id)
) engine=innodb comment='对象存储配置表';

create table sys_client (
    id                  bigint(20)    not null            comment 'id',
    client_id           varchar(64)   default null        comment '客户端id',
    client_key          varchar(32)   default null        comment '客户端key',
    client_secret       varchar(255)  default null        comment '客户端秘钥',
    grant_type          varchar(255)  default null        comment '授权类型',
    device_type         varchar(32)   default null        comment '设备类型',
    active_timeout      int(11)       default 1800        comment 'token活跃超时时间',
    timeout             int(11)       default 604800      comment 'token固定超时',
    status              char(1)       default '0'         comment '状态（0正常 1停用）',
    del_flag            char(1)       default '0'         comment '删除标志（0代表存在 1代表删除）',
    create_dept         bigint(20)    default null        comment '创建部门',
    create_by           bigint(20)    default null        comment '创建者',
    create_time         datetime      default null        comment '创建时间',
    update_by           bigint(20)    default null        comment '更新者',
    update_time         datetime      default null        comment '更新时间',
    primary key (id)
) engine=innodb comment='系统授权表';

CREATE TABLE test_demo
(
    id          bigint(0)    NOT NULL COMMENT '主键',
    dept_id     bigint(0)    NULL DEFAULT NULL COMMENT '部门id',
    user_id     bigint(0)    NULL DEFAULT NULL COMMENT '用户id',
    order_num   int(0)       NULL DEFAULT 0 COMMENT '排序号',
    test_key    varchar(255) NULL DEFAULT NULL COMMENT 'key键',
    value       varchar(255) NULL DEFAULT NULL COMMENT '值',
    version     int(0)       NULL DEFAULT 0 COMMENT '版本',
    create_dept bigint(0)    NULL DEFAULT NULL COMMENT '创建部门',
    create_time datetime(0)  NULL DEFAULT NULL COMMENT '创建时间',
    create_by   bigint(0)    NULL DEFAULT NULL COMMENT '创建人',
    update_time datetime(0)  NULL DEFAULT NULL COMMENT '更新时间',
    update_by   bigint(0)    NULL DEFAULT NULL COMMENT '更新人',
    del_flag    int(0)       NULL DEFAULT 0 COMMENT '删除标志',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '测试单表';

CREATE TABLE test_tree
(
    id          bigint(0)    NOT NULL COMMENT '主键',
    parent_id   bigint(0)    NULL DEFAULT 0 COMMENT '父id',
    dept_id     bigint(0)    NULL DEFAULT NULL COMMENT '部门id',
    user_id     bigint(0)    NULL DEFAULT NULL COMMENT '用户id',
    tree_name   varchar(255) NULL DEFAULT NULL COMMENT '值',
    version     int(0)       NULL DEFAULT 0 COMMENT '版本',
    create_dept bigint(0)    NULL DEFAULT NULL COMMENT '创建部门',
    create_time datetime(0)  NULL DEFAULT NULL COMMENT '创建时间',
    create_by   bigint(0)    NULL DEFAULT NULL COMMENT '创建人',
    update_time datetime(0)  NULL DEFAULT NULL COMMENT '更新时间',
    update_by   bigint(0)    NULL DEFAULT NULL COMMENT '更新人',
    del_flag    int(0)       NULL DEFAULT 0 COMMENT '删除标志',
    PRIMARY KEY (id) USING BTREE
) ENGINE = InnoDB COMMENT = '测试树表';
