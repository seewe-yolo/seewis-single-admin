CREATE TABLE flow_instance_biz_ext (
                                       id             BIGINT         NOT NULL PRIMARY KEY,
                                       tenant_id      VARCHAR(20)    DEFAULT '000000',
                                       create_dept    BIGINT,
                                       create_by      BIGINT,
                                       create_time    DATETIME,
                                       update_by      BIGINT,
                                       update_time    DATETIME,
                                       business_code  VARCHAR(255),
                                       business_title VARCHAR(1000),
                                       del_flag       CHAR(1)        DEFAULT '0',
                                       instance_id    BIGINT,
                                       business_id    VARCHAR(255)
);

EXEC sp_addextendedproperty
    @name = N'MS_Description',
    @value = '流程实例业务扩展表',
    @level0type = N'SCHEMA',
    @level0name = 'dbo',
    @level1type = N'TABLE',
    @level1name = 'flow_instance_biz_ext';

EXEC sp_addextendedproperty @name = N'MS_Description', @value = 'ID', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'flow_instance_biz_ext', @level2type = N'COLUMN', @level2name = 'id';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = '租户编号', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'flow_instance_biz_ext', @level2type = N'COLUMN', @level2name = 'tenant_id';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = '创建部门', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'flow_instance_biz_ext', @level2type = N'COLUMN', @level2name = 'create_dept';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = '创建者', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'flow_instance_biz_ext', @level2type = N'COLUMN', @level2name = 'create_by';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = '创建时间', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'flow_instance_biz_ext', @level2type = N'COLUMN', @level2name = 'create_time';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = '更新者', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'flow_instance_biz_ext', @level2type = N'COLUMN', @level2name = 'update_by';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = '更新时间', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'flow_instance_biz_ext', @level2type = N'COLUMN', @level2name = 'update_time';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = '业务编码', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'flow_instance_biz_ext', @level2type = N'COLUMN', @level2name = 'business_code';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = '业务标题', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'flow_instance_biz_ext', @level2type = N'COLUMN', @level2name = 'business_title';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = '删除标志（0代表存在 1代表删除）', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'flow_instance_biz_ext', @level2type = N'COLUMN', @level2name = 'del_flag';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = '流程实例Id', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'flow_instance_biz_ext', @level2type = N'COLUMN', @level2name = 'instance_id';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = '业务Id', @level0type = N'SCHEMA', @level0name = 'dbo', @level1type = N'TABLE', @level1name = 'flow_instance_biz_ext', @level2type = N'COLUMN', @level2name = 'business_id';
