# AI 单词闯关 iPadOS

这是一个 SwiftUI iPadOS 工程源代码包。由于当前环境为 Windows，无法运行 Xcode 或签名生成 `.ipa`；请在 macOS 的 Xcode 15+ 中创建 **iPadOS App / SwiftUI / Swift** 项目，然后将 `AIWordChallenge` 文件夹中的三个 Swift 文件和 `wordbank.json` 拖入工程，勾选 Copy items，并设置 Deployment Target 为 iPadOS 16.0。

功能已包含：

- 从 bundled `wordbank.json` 读取题库，按每关 20 题生成关卡
- 关卡解锁、随机题目、答题不重复、错题集
- 积分规则与本地 `UserDefaults` 持久化
- 所有操作按钮触发系统按键音
- 点击单词或发音按钮使用 `AVSpeechSynthesizer` 播放美式英语
- iPad 横竖屏自适应的 SwiftUI 布局

`wordbank.json` 是由原 Android 工程随附的 Word 文档整理结果导入的离线题库。若需严格在运行时读取外部 `.doc`，应在 macOS 端先将 Word 文档转换为 JSON/纯文本后替换该资源；iOS 不提供直接解析旧式 `.doc` 的系统 API。
