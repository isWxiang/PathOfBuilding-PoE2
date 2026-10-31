# Path of Building PoE2 0.23.1 — 多语言预发布版 1

Windows 便携版，包含 English、简体中文、繁體中文、日本語和 한국어 资源。

## 下载与运行

1. 下载附件 `PathOfBuilding-PoE2-v0.23.1-multilingual.1-windows-portable.zip`。
2. 完整解压到有写入权限的文件夹，双击 `Path of Building-PoE2.exe`。
3. 在 Options／选项中选择语言并保存。

无需安装 Git、Python、Node.js 或编译器。不要下载 GitHub 自动生成的 Source code 压缩包作为玩家安装包。

## 本次内容

- 集成英文、简体中文、繁体中文、日语和韩语界面与游戏数据显示资源。
- 包含运行库、中文预生成图集、CJK 字体、字体生成工具及相关许可证。
- 解压目录同时保存构筑和设置；升级前请备份 `Builds` 文件夹与 `Settings.xml`。
- 更新检查固定到本次发布，避免上游文件覆盖多语言内容；获取新版请下载新的完整 ZIP。

## 预发布说明

首个本地运行包使用版本号 `v0.23.1-multilingual.1`；实际源码在本仓库 `feature/multilingual-release` 分支构建，已合入多语言功能分支，包含其所基于的上游 dev 改动。这不是上游官方发行版。

日语和韩语正文为机器译文，未人工校对或窗口视觉验收。缺少的译文或未知自定义内容仍可能显示英文。

`SHA256SUMS.txt` 提供 ZIP 与 `manifest.xml` 的 SHA-256 校验值。`manifest.xml` 是应用完整性检查清单，玩家无需单独下载。

---

Windows portable prerelease with English, Simplified Chinese, Traditional Chinese,
Japanese and Korean resources.
Extract the complete portable ZIP and run `Path of Building-PoE2.exe`; choose a
language in Options and save. Builds and settings stay in the extracted folder.
Back up `Builds` and `Settings.xml` before upgrading. The update source is pinned
to this release; download a new complete ZIP for future versions. Japanese and
Korean text is machine translated and has not been manually reviewed. This fork is based on upstream dev and is
not an official upstream release.
