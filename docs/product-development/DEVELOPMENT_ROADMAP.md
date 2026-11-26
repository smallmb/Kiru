# 开发路线图与任务清单
状态说明：TODO 未实施；BASELINE 用户确认已启动但待复核；PASS 须提供验证证据。当前仅完成规划文档和部分只读审计。
## 里程碑及准入
| 里程碑 | 目标 | 依赖 | 退出条件 |
|---|---|---|---|
| M0 | 基线与可复现环境 | 无 | 记录 SDK/Git/依赖/启动指令、测试基线、风险 |
| M1 | 中文及应用基础 | M0 | UI/导航保持原功能，中文可切换，更新安全 |
| M2 | 影视与播放源闭环 | M1 | 发现→详情→合法源→播放，异常可恢复 |
| M3 | 播放器与个人影音 | M2 | 4K/字幕/音轨/续播经实际平台验证 |
| M4 | 私人媒体库 | M3 | 本地离线、索引、授权服务器接入 |
| M5 | 多平台与发布 | M3；M4 按范围 | Windows/Android 构建、迁移、签名与许可 |
| M6 | 扩展功能 | M5 | 按价值逐项评审，不预设交付 |
## 执行任务（按顺序）
| ID | 任务 | 位置/产出 | 验收 | 状态 |
|---|---|---|---|---|
| M0-01 | 原版运行基线 | SDK、启动命令、平台、HEAD、status | 用户已启动；待记录复现 | BASELINE |
| M0-02 | 依赖与授权审计 | pubspec.yaml/lock、LICENSE、原生依赖 | 风险清单与固定版本策略 | TODO |
| M0-03 | 调用链及测试基线 | Shell/Browse/WatchScreen/StreamService/PlayerScreen | 调用图、现有失败测试清单 | TODO |
| M0-04 | 独立开发分支与回滚点 | Git；不提交用户已有改动 | 工作区明确、可回退 | TODO |
| M1-01 | 简体中文 | lib/l10n、locale_settings | ARB 生成、布局及语言切换 | TODO |
| M1-02 | 主题与 UI 规范 | services/theme、shared 复用组件 | 视觉基准获确认，深浅模式 | TODO |
| M1-03 | 品牌与独立更新 | assets/branding、平台 manifest、updater | 品牌确定后实施，数据迁移测试 | TODO |
| M1-04 | 导航回归 | shell、browse | 分类、搜索、滚动和 TV 焦点保留 | TODO |
| M2-01 | 影视详情及身份映射 | browse/search/details/models | 同名、季集、动漫特殊集验证 | TODO |
| M2-02 | 来源展示状态拆分 | watch_screen + features/sources | UI 行为保持、取消/部分结果测试 | TODO |
| M2-03 | 来源注册与权限 | StreamService、AddonManager、adapters | 合法测试源可独立注册/启停 | TODO |
| M2-04 | 筛选与排序 | 源模型、健康检测、UI | 未知值准确，故障隔离 | TODO |
| M3-01 | 播放会话与错误恢复 | player_screen、engine、player_settings | 退出释放、重试有界、切源续播 | TODO |
| M3-02 | 4K/增强/音轨/字幕 | engine、shaders、player UI | 测试矩阵有实测数据 | TODO |
| M3-03 | 历史与收藏 | continue_watching/my_list/storage | 重启、续播、升级无丢失 | TODO |
| M4-01 | 本地文件及索引 | library、文件选择、元数据适配 | 离线播放、增量/权限处理 | TODO |
| M4-02 | 私人媒体服务 | adapters/media_servers | WebDAV/Jellyfin 首选；SMB 单独评估 | TODO |
| M5-01 | Windows 安装/发布 | installer/windows、workflow | 安装卸载/升级/签名/许可 | TODO |
| M5-02 | Android/TV | android、平台布局 | 触控、焦点、真机播放 | TODO |
| M5-03 | Apple/Linux 等评估 | 对应平台工程 | 以实际环境和签名能力决定 | TODO |
## 开发节奏
每个任务独立提交，先写变更范围与验收用例，再修改代码；执行相关测试、分析、构建/手测，记录结果。失败则修复或回滚，不跨越里程碑堆叠功能。排期按实际工作量和验证环境估算；不承诺固定周数。Windows 首轮优先是暂定策略。
## 当前下一步
M0-01～03：补充已运行环境与源码调用链证据；不重新安装依赖。之后 M1-01 中文化和 M1-04 导航回归；品牌名称与视觉样式确认前不进行全局重命名。其后依次进入 M2 与 M3。
