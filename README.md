## **仓库维护说明<font color="red">（重要）</font>**
1. [RuoYi-Vue-Plus](https://gitee.com/dromara/RuoYi-Vue-Plus) 6.X 分支转正之后，本项目的无租户分支将继续维护一段时间，时间未定（因为 6.X 分支已经基本确定会移除多租户）
2. 如果后续对无工作流分支的呼声高，无工作流分支则会继续维护，届时本仓库将会以继续维护无工作流分支为主

## 使用声明
1. 该仓库是 [RuoYi-Vue-Plus](https://gitee.com/dromara/RuoYi-Vue-Plus) 的无租户分支（删除了租户相关代码，非关闭租户形式） 
2. 原项目支持关闭多租户，如有多租户的需求，请使用原项目 [RuoYi-Vue-Plus](https://gitee.com/dromara/RuoYi-Vue-Plus)
3. 不保证稳定性，生产使用请谨慎
4. 定期同步原项目Bug修复和新功能
5. 本项目不接受PR，PR请到原项目提 [RuoYi-Vue-Plus](https://gitee.com/dromara/RuoYi-Vue-Plus)
6. 本项目使用 Liquibase 管理数据库建表、初始化数据和增量变更，脚本位于 `seewis-admin/src/main/resources/db/changelog`，不再维护旧版 `script/sql` 初始化脚本

## 分支说明
- `5.X`分支
> 该分支对应 [RuoYi-Vue-Plus 5.X](https://gitee.com/dromara/RuoYi-Vue-Plus/tree/5.X/) 分支，**移除**了`多租户`相关代码
- `unworkflow`分支
> 该分支对应 [RuoYi-Vue-Plus dev](https://gitee.com/dromara/RuoYi-Vue-Plus/tree/5.X/) 分支，**移除**了`多租户`和`工作流`相关代码

## 部署使用文档
> 部署使用流程与原项目一致，具体可查看 [RuoYi-Vue-Plus](https://gitee.com/dromara/RuoYi-Vue-Plus) 和 [plus-doc](https://plus-doc.dromara.org)
