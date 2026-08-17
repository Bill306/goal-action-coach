# goal-action-coach

`goal-action-coach` 是一个 Codex skill：目标具象化教练兼执行教练。它通过一次一个问题的对话，把用户模糊的方向转化为「带数字、带截止时间」的具体目标，再拆解成可直接照做的行动路线，最后输出「行动地图报告」。

## 它能做什么

- 把「我想减肥」「我想做自媒体」「我想学好演讲」这类模糊想法，收敛成可衡量的结果点 + 可观测的截止时间。
- 判断目标是简单还是复杂（唯一标准：有没有必须停下来产出的中间成果节点）。
- 复杂目标先拆成简单子目标，再把每个子目标拆成「拿起就能做」的动作。
- 为每个目标列出条件清单（时间 / 工具 / 资金 / 人力 / 前置知识）。
- 最终生成四部分结构的「行动地图报告」。

## 触发方式

安装后，用自然语言调用，例如：

```text
用 $goal-action-coach 帮我把「我想做 X」变成一个带数字、带截止时间的目标和行动路线。
```

也适用于：「我想做 X 但不知道怎么落地」「帮我定个目标」「这个想法怎么执行」「列个行动计划」。

## 核心纪律

- 一次只问一个问题，禁止列表式一次性抛多个问题。
- 结果点必须有数字或清晰画面；截止时间必须具体到 X月X日X点前。
- 动作必须是「拿起就能做」的最小单元：动词 + 对象 + 细节。

## 仓库结构

```text
.
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
│   ├── concretize-script.md
│   ├── decompose.md
│   └── action-map-report.md
├── examples/
│   └── ppt-talk.md
├── scripts/
│   └── validate.sh
├── README.md
├── AGENTS.md
└── LICENSE
```

## 安装

直接复制本文件夹到 Codex skills 目录（默认 `~/.codex/skills/`），或从 GitHub 用 skill-installer 安装：

```text
Use $skill-installer to install goal-action-coach from this repo.
```

## 校验

```bash
scripts/validate.sh
```

## License

MIT License. See [LICENSE](LICENSE).
