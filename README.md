# 姓名卡片生成器

这是一个完全本地运行的网页工具，不会上传姓名或图片。

## 使用方法

1. 双击 `start.command`（不要直接打开 `index.html`）。
2. 浏览器会自动打开生成器。
3. 在下半区编辑姓名、编号或更多图层。
4. 点击 `Download PNG`，导出 2362 × 2362 PNG。

`start.command` 会启动本地服务，并优先在 Chrome 打开 `http://localhost:4173`。直接通过 `file://` 打开 `index.html` 时，Chrome 的安全限制会阻止 Canvas 图片导出。

生成时以下半部分为唯一源图：背景、姓名、描边、阴影和编号会作为整体复制，再旋转 180°生成上半部分。

如果 macOS 首次阻止脚本运行，可在终端进入本目录后执行：

```bash
./start.command
```

## 字体

- 中文姓名：ZCOOL KuaiLe（站酷快乐体），高概率匹配。
- 数字：Anton Regular，最接近原图的粗窄无衬线数字。

除原图匹配字体外，字体菜单还提供常用系统字体。点击 `Load system fonts` 后，Chrome / Edge 会在本地页面请求一次权限，以列出本机所有已安装的字体；也可以通过 `Upload custom font` 使用单独的字体文件。字体清单和姓名数据都只在本机浏览器中处理。

## 批量导出

1. 展开 `Batch export`，导入 CSV、TSV、XLS 或 XLSX 文件。
2. 第一行会视为表头，工具会自动匹配姓名、编号列；不准确时在下拉菜单中手动选择。
3. 点击 `Download ZIP`，每条记录都会生成一张完整的 2362 × 2362 PNG，合并成一个 ZIP 下载。

建议将编号列在 Excel 中设置为“文本”或使用显示格式，例如 `07`。导入会读取单元格显示内容，因此会保留这类前导零。

## 文件说明

- `index.html`：页面结构。
- `styles.css`：界面样式与字体声明。
- `app.js`：Canvas 绘制、图层编辑、国际化、表格导入与 PNG / ZIP 导出。
- `assets/template-clean.png`：清除原姓名及编号后的底图。
- `vendor`：离线表格读取和 ZIP 打包依赖（SheetJS 与 JSZip）。
