# 动漫元数据源模块化（第一阶段）

## 设计
参考本机 Kazumi 的 Bangumi 请求与模型适配机制；Kiru 不复制其播放规则系统。AnimeMetadataProvider 定义首页、搜索、详情等统一接口，AnimeMetadataService 调度 AniList/Bangumi，BangumiMetadataProvider 归一化官方 API。AnimeSourceSettings 保存源、回退、镜像与代理。BangumiClient 处理 5 分钟/100 条缓存、相同请求合并、超时、可选 HTTPS 镜像失败回退官方、显式 HTTP 代理/环境代理/Windows 注册表代理。

## 使用
设置 > 内容 > 动漫数据源。默认保留 AniList；切换 Bangumi 后首页与搜索刷新。关闭回退可避免不支持条件自动改用 AniList，但部分筛选无法提供结果。镜像默认留空，仅填写获得授权的可信 HTTPS 服务；不默认使用 Kazumi 镜像。代理留空时优先环境代理，其次 Windows 系统代理。连接测试使用保存后的配置。

## 边界
现有 AnimeMedia/收藏/播放记录以 AniList ID 为主键；Bangumi 目录仅显示离线索引反向映射唯一的条目，未映射条目不伪造 ID。Bangumi 中文片名/简介/封面/标签/评分优先，AniList 补充角色、关联及原始标题；分集标题只映射正整数常规集，排除冲突与特别篇。新增源需要实现接口并登记配置/路由；不是运行时加载任意插件。现有播放源、规则仓库、图片镜像、每日放送不在本轮改动范围。尚未完成独立 Bangumi 身份迁移和实际视频播放验收。

## 验证
Windows 系统代理开启；直接请求官方接口超时，使用系统代理 HTTP 200。新版 Dart 客户端实测 Bangumi 400602 详情、中文搜索 6 个映射结果、热门 20 个映射结果、28 集中文标题、234 字符简介。29 项定向测试通过（含 opt-in 联网测试）。联网测试默认跳过，可运行 flutter test --no-pub --dart-define=KIRU_LIVE_BANGUMI=true test/l10n/bangumi_live_probe_test.dart。其余测试覆盖持久化、镜像回退、缓存、源路由、身份合并、分集冲突及既有页面。
