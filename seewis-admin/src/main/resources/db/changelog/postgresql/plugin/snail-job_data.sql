-- liquibase formatted sql

-- changeset seewis:1
-- comment 初始化 SnailJob 数据

INSERT INTO sj_namespace VALUES (1, 'Development', 'dev', '', 0, now(), now());

INSERT INTO sj_namespace VALUES (2, 'Production', 'prod', '', 0, now(), now());

INSERT INTO sj_group_config VALUES (1, 'dev', 'ruoyi_group', '', 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT', 1, 1, 0, 1, 1,  now(), now());

INSERT INTO sj_group_config VALUES (2, 'prod', 'ruoyi_group', '', 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT', 1, 1, 0, 1, 1,  now(), now());

INSERT INTO sj_system_user (username, password, role)
VALUES ('admin', '465c194afb65670f38322df087f0a9bb225cc257e43eb4ac5a0c98ef5b3173ac', 2);

INSERT INTO sj_job VALUES (1, 'dev', 'demo-job', 'ruoyi_group', 'demo-job', null, 1, 1710344035622, 1, 1, 4, 1, 'testJobExecutor', 2, '60', 1, 60, 3, 1, 1, 116, 0, '', 1, '', '', '', 0, now(), now());
