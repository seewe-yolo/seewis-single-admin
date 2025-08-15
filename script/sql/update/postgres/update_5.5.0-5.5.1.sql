CREATE TABLE flow_instance_biz_ext (
   id             BIGINT        PRIMARY KEY,
   tenant_id      VARCHAR(20)   DEFAULT '000000',
   create_dept    BIGINT,
   create_by      BIGINT,
   create_time    TIMESTAMP,
   update_by      BIGINT,
   update_time    TIMESTAMP,
   business_code  VARCHAR(255),
   business_title VARCHAR(1000),
   del_flag       CHAR(1)       DEFAULT '0',
   instance_id    BIGINT,
   business_id    VARCHAR(255)
);

COMMENT ON TABLE flow_instance_biz_ext IS '流程实例业务扩展表';
COMMENT ON COLUMN flow_instance_biz_ext.id  IS 'ID';
COMMENT ON COLUMN flow_instance_biz_ext.tenant_id  IS '租户编号';
COMMENT ON COLUMN flow_instance_biz_ext.create_dept  IS '创建部门';
COMMENT ON COLUMN flow_instance_biz_ext.create_by  IS '创建者';
COMMENT ON COLUMN flow_instance_biz_ext.create_time  IS '创建时间';
COMMENT ON COLUMN flow_instance_biz_ext.update_by  IS '更新者';
COMMENT ON COLUMN flow_instance_biz_ext.update_time  IS '更新时间';
COMMENT ON COLUMN flow_instance_biz_ext.business_code  IS '业务编码';
COMMENT ON COLUMN flow_instance_biz_ext.business_title  IS '业务标题';
COMMENT ON COLUMN flow_instance_biz_ext.del_flag  IS '删除标志（0代表存在 1代表删除）';
COMMENT ON COLUMN flow_instance_biz_ext.instance_id  IS '流程实例Id';
COMMENT ON COLUMN flow_instance_biz_ext.business_id  IS '业务Id';
