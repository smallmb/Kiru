# 本地源码评估
## 1. 事实基线
路径 D:\wty\ZPlay；pubspec.yaml 版本 1.6.26+3063，Dart ^3.11.5；.git/config 的 origin 指向 https://github.com/tzero86/ZPlay.git。
用户报告原始应用已启动；本次不据此宣称所有平台已构建通过。
已读取 main.dart、app_shell.dart、watch_screen.dart、stream_service.dart 的部分内容及关键目录列表；尚未通读完整调用链。
## 2. 模块定位与复用
| 业务 | 当前代码入口 | 处理 |
|---|---|---|
| 启动 | lib/main.dart | 保留首帧初始化/延迟服务机制，检查更新与外部连接 |
| 全局导航 | lib/shell/app_shell.dart、shell_rail.dart | 保留 IndexedStack、ShellSlot 和多形态导航 |
| 内容浏览 | lib/pages/browse/ | 继续定位分类切换组件，不直接新增重复路由 |
| 首页 | lib/pages/home/home_page.dart、lib/widgets/home/ | 复用继续观看和 Hero |
| 搜索/详情 | lib/pages/search/、lib/pages/details/details_page.dart | 复用模型与详情逻辑 |
| 播放源展示 | lib/pages/player/watch_screen.dart | 3472 行；先测试再拆分状态、UI 与会话 |
| 视频播放 | lib/pages/player/player_screen.dart | 先定位控制、会话、错误恢复，保留内核 |
| 源服务 | lib/services/stream/stream_service.dart | 612 行；多类外部适配直接导入，后续引入 registry |
| 源检测与排序 | stream/best_source_finder.dart、stream_health_checker.dart、stream_bitrate_resolver.dart | 复用，核查误判与网络开销 |
| 插件 | lib/services/addon/、cloudstream/ | 复用协议；审计扩展权限与来源 |
| 播放引擎 | lib/services/player/engine/{video_engine,engine_selector,exo_player_engine}.dart | 保留，核查实际覆盖与回退 |
| 画质 | assets/shaders/anime4k/、assets/shaders/fsr/、services/player/player_settings.dart | 保留现有能力，测试 GPU 与资源开销 |
| 数据 | lib/models/、services/storage/、continue_watching/、my_list/、profiles/ | 复用 JSON/偏好设置，评估数据迁移 |
| 主题与平台 | services/theme/、layout/、window/ | 保留设计 token 与 TV 焦点规则 |
| 国际化 | lib/l10n/app_en.arb、app_ar.arb、generated/ | 增加 zh 资源并运行生成，禁止硬编码 |
| 测试 | test/、test/integration/ | 保留并扩展来源、TV、播放器、续播回归 |
## 3. 关键风险
- media_kit 依赖显式 ref 与 dependency_overrides 混用；override 部分未指定 ref。先核对 pubspec.lock 中 resolved-ref，记录已可用 SDK 和平台编译工具，再考虑锁定；不随意 pub upgrade。
- TorrServer 依赖修复 fork；原生二进制供应链、许可证、下载可用性须独立审查；不自动启用来源不明的网络扩展。
- StreamService 有静态 HTTP client、活动订阅与全局 session 取消；潜在跨页面干扰必须用测试验证，而非认定为已发生故障。
- WatchScreen 文件过长且持有 UI 与网络状态；按职责逐步提取，不整文件重写。
- main.dart 已执行 Windows 历史状态迁移，品牌变更可能改变数据根目录；必须做老配置/收藏/进度迁移与回滚测试。
- 安全存储依赖存在；pubspec 注释提到部分环境回退至 preferences，需检查敏感值是否明文落盘。
- 上游自动更新服务必须在品牌发布前独立配置或禁用，防止下载原版更新覆盖修改版。
- 内置第三方源与外部插件不能假设具备版权许可或可靠性；逐项授权与权限审计，默认仅启用经过审核的来源。
## 4. M0 待补证据
记录 git HEAD/status、Flutter/Dart 版本、flutter doctor -v、原启动命令/目标、pubspec.lock 的 Git resolved-ref、flutter analyze 与现有测试基线；检查 LICENSE、原生平台依赖和网络初始化。输出可复现构建指令与已知失败清单。
