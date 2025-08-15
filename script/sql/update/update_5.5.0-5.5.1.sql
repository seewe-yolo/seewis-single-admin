create table flow_instance_biz_ext
(
    id             bigint                       not null comment 'ID'
        primary key,
    tenant_id      varchar(20) default '000000' null comment '租户编号',
    create_dept    bigint                       null comment '创建部门',
    create_by      bigint                       null comment '创建者',
    create_time    datetime                     null comment '创建时间',
    update_by      bigint                       null comment '更新者',
    update_time    datetime                     null comment '更新时间',
    business_code  varchar(255)                 null comment '业务编码',
    business_title varchar(1000)                null comment '业务标题',
    del_flag       char        default '0'      null comment '删除标志（0代表存在 1代表删除）',
    instance_id    bigint                       null comment '流程实例Id',
    business_id    varchar(255)                 null comment '业务Id'
)
    comment '流程实例业务扩展表';
