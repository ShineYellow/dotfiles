input_methods = {
	abc = { prefix = { "ALT" }, key = "J", message = "ABC" },
	-- chinese  = { prefix = {"Option"}, key = "K", message="拼音"}
	chinese = { prefix = { "ALT" }, key = "K", message = "拼音" },
}

-- 应用切换快捷键配置
applications = {
	-- CMD z is reserved for revoke change
	-- CMD + X C V is reserved for clipboard
	-- S is reserved for save
	-- D is reserved for iterm2 split
	-- A is reserved for select all
	-- J K is reserved for input methods
	-- P is reserved for vscode command list
	-- {prefix = {"Option"}, key = "Q", message="QQ", bundleId="com.tencent.qq"},
	-- osascript -e 'id of app "Application Name"'
	{ prefix = { "SHIFT", "ALT" }, key = "Z", message = "zotero", bundleId = "org.zotero.zotero" },
	{ prefix = {}, key = "F2", message = "things3", bundleId = "com.culturedcode.ThingsMac" },
	-- {prefix = {"CMD"}, key = ".", message="WeChat", bundleId="com.tencent.xinWeChat"},
	{ prefix = { "CMD" }, key = "-", message = "Finder", bundleId = "com.apple.finder" },
	-- {prefix = {"CMD"}, key = "D", message="Calendar", bundleId="com.apple.iCal"},
	{ prefix = { "CMD" }, key = "N", message = "onenote", bundleId = "com.microsoft.onenote.mac" },
	-- {prefix = {"CMD"}, key = "N", message="next-chat", bundleId="com.yida.chatgpt.next.web"},
	-- { prefix = { "Ctrl", "SHIFT", "ALT" }, key = "N", message = "next-chat", bundleId = "com.yida.chatgpt.next.web" },
	-- { prefix = { "CMD", "Ctrl" }, key = "N", message = "notion", bundleId = "notion.id" },
	{ prefix = { "CMD" }, key = "L", message = "Lark", bundleId = "com.larksuite.larkApp" },
	{ prefix = { "CMD", "SHIFT" }, key = "L", message = "slack", bundleId = "com.tinyspeck.slackmacgap" },
	-- {prefix = {"CMD"}, key = "T", message="iTerm2", bundleId="com.googlecode.iterm2"},
	{ prefix = { "CMD" }, key = "M", message = "email", bundleId = "com.apple.mail" },
	{ prefix = { "CMD" }, key = "O", message = "openlens", bundleId = "com.electron.open-lens" },
	{ prefix = { "CMD", "SHIFT" }, key = "O", message = "OpenVPN", bundleId = "org.openvpn.client.app" },
	-- {prefix = {"CMD"}, key = "I", message="Noi", bundleId="com.electron.noi"},
	{ prefix = { "CMD" }, key = "I", message = "Cherry", bundleId = "com.kangfenmao.CherryStudio" },
	-- {prefix = {"CMD", "SHIFT"}, key = "I", message="Gemini", bundleId="com.google.Chrome.app.kfocjihoigpdahhkeclpkpcoofjdicen"},
	-- {prefix = {"CMD", "ALT" ,"SHIFT"}, key = "I", message="Perplexity", bundleId="ai.perplexity.mac"},
	-- {prefix = {"ALT"}, key = "P", message="Perplexity", bundleId="ai.perplexity.mac"},
	-- {prefix = {"CMD","SHIFT"}, key = "I", message="insomnia", bundleId="com.insomnia.app"},
	{ prefix = { "SHIFT", "ALT" }, key = "S", message = "SnapNDrag Pro", bundleId = "com.yellowmug.SnapNDrag" },
	{ prefix = { "CMD" }, key = ",", message = "Chrome", bundleId = "com.google.Chrome" },
	{ prefix = { "CMD" }, key = ".", message = "Zen Browser", bundleId = "app.zen-browser.zen" },
	{ prefix = { "ALT", "SHIFT" }, key = "I", message = "iTerm2", bundleId = "com.googlecode.iterm2" },
	{ prefix = { "ALT" }, key = "I", message = "Ghostty", bundleId = "com.mitchellh.ghostty" },
	-- {prefix = {"ALT","SHIFT"}, key = "I", message="Ghostty", bundleId="com.mitchellh.ghostty"},
	-- {prefix = {}, key = "F1", message="Cursor", bundleId="com.todesktop.230313mzl4w4u92"},
	-- {prefix = {"CMD","SHIFT"}, key = "I", message="iTerm2", bundleId="com.googlecode.iterm2"},
	-- -- {prefix = {}, key = "F3", message="VSCode", bundleId="com.microsoft.VSCode"},
	-- {prefix = {"CMD","SHIFT"}, key = "Z", message="Zed", bundleId="dev.zed.Zed"},
	-- {prefix = {"CMD","SHIFT"}, key = "S", message="Sublime", bundleId="com.sublimetext.4"},
	-- {prefix = {}, key = "F1", message="Zen", bundleId="org.mozilla.com.zen.browser"},
	-- {prefix = {}, key = "F2", message="Chrome", bundleId="com.google.Chrome"},
	-- -- {prefix = {}, key = "F2", message="Opera", bundleId="com.operasoftware.Opera"},
	-- {prefix = {}, key = "F3", message="Brave", bundleId="com.brave.Browser"},
	-- {prefix = {}, key = "F4", message="Edge", bundleId="com.microsoft.edgemac"},

	-- { prefix = {}, key = "F1", message = "Cursor", bundleId = "com.todesktop.230313mzl4w4u92" },
	{ prefix = { "ALT" }, key = "G", message = "Ghostty", bundleId = "com.mitchellh.ghostty" },
	{ prefix = { "ALT" }, key = "V", message = "VSCode", bundleId = "com.microsoft.VSCode" },
	{ prefix = { "ALT" }, key = "Z", message = "Zed", bundleId = "dev.zed.Zed" },
	{ prefix = { "ALT" }, key = "S", message = "Sublime", bundleId = "com.sublimetext.4" },
	{ prefix = { "CMD" }, key = "1", message = "neovide", bundleId = "com.neovide.neovide" },
	{ prefix = { "ALT" }, key = "N", message = "neovide", bundleId = "com.neovide.neovide" },
	{ prefix = {}, key = "F1", message = "neovide", bundleId = "com.neovide.neovide" },
	{ prefix = { "ALT" }, key = "C", message = "Cursor", bundleId = "com.todesktop.230313mzl4w4u92" },
	-- {prefix = {"CMD"}, key = "1", message="iTerm2", bundleId="com.googlecode.iterm2"},
	-- {prefix = {"CMD"}, key = "2", message="Cursor", bundleId="com.todesktop.230313mzl4w4u92"},
	-- {prefix = {"ALT"}, key = "2", message="VSCode", bundleId="com.microsoft.VSCode"},
	-- {prefix = {"CMD"}, key = "3", message="Zed", bundleId="dev.zed.Zed"},
	-- {prefix = {"CMD"}, key = "4", message="Sublime", bundleId="com.sublimetext.4"},
}

-- 窗口管理快捷键配置
windows = {
	-- 同一应用的所有窗口自动网格式布局
	same_application_auto_layout_grid = { prefix = { "Ctrl", "Option" }, key = "Z", message = "" },
	-- 同一应用的所有窗口自动水平均分或垂直均分
	same_space_auto_layout_grid = { prefix = { "Ctrl", "Option" }, key = "X", message = "" },
	-- 同一工作空间下的所有窗口自动网格式布局
	same_application_auto_layout_horizontal_or_vertical = { prefix = { "Ctrl", "Option" }, key = "A", message = "" },
	-- 同一工作空间下的所有窗口自动水平均分或垂直均分
	same_space_auto_layout_horizontal_or_vertical = { prefix = { "Ctrl", "Option" }, key = "S", message = "" },
	-- 左半屏
	left = { prefix = { "Ctrl", "Option" }, key = "Left", message = "Left Half" },
	-- 右半屏
	right = { prefix = { "Ctrl", "Option" }, key = "Right", message = "Right Half" },
	-- 上半屏
	up = { prefix = { "Ctrl", "Option" }, key = "Up", message = "Up Half" },
	-- 下半屏
	down = { prefix = { "Ctrl", "Option" }, key = "Down", message = "Down Half" },
	-- 左上角
	top_left = { prefix = { "Ctrl", "Option" }, key = "U", message = "Top Left" },
	-- 右上角
	top_right = { prefix = { "Ctrl", "Option" }, key = "I", message = "Top Right" },
	-- 左下角
	left_bottom = { prefix = { "Ctrl", "Option" }, key = "N", message = "Left Bottom" },
	-- 右下角
	right_bottom = { prefix = { "Ctrl", "Option" }, key = "M", message = "Right Bottom" },
	-- 1/9
	one = { prefix = { "Ctrl", "Option" }, key = "1", message = "1/9" },
	-- 2/9
	two = { prefix = { "Ctrl", "Option" }, key = "2", message = "2/9" },
	-- 3/9
	three = { prefix = { "Ctrl", "Option" }, key = "3", message = "3/9" },
	-- 4/9
	four = { prefix = { "Ctrl", "Option" }, key = "4", message = "4/9" },
	-- 5/9
	five = { prefix = { "Ctrl", "Option" }, key = "5", message = "5/9" },
	-- 6/9
	six = { prefix = { "Ctrl", "Option" }, key = "6", message = "6/9" },
	-- 7/9
	seven = { prefix = { "Ctrl", "Option" }, key = "7", message = "7/9" },
	-- 8/9
	eight = { prefix = { "Ctrl", "Option" }, key = "8", message = "8/9" },
	-- 9/9
	nine = { prefix = { "Ctrl", "Option" }, key = "9", message = "9/9" },
	-- 左 1/3（横屏）或上 1/3（竖屏）
	left_1_3 = {
		prefix = { "Ctrl", "Option" },
		key = "D",
		message = "Left 1/3(Horizontal screen) Or Top 1/3(Vertical screen)",
	},
	-- 中 1/3
	middle = { prefix = { "Ctrl", "Option" }, key = "F", message = "Middle 1/3" },
	-- 右 1/3（横屏）或下 1/3（竖屏）
	right_1_3 = {
		prefix = { "Ctrl", "Option" },
		key = "G",
		message = "Right 1/3(Horizontal screen)Or Bottom 1/3(Vertical screen)",
	},
	-- 左 2/3（横屏）或上 2/3（竖屏）
	left_2_3 = {
		prefix = { "Ctrl", "Option" },
		key = "E",
		message = "Left 2/3(Horizontal screen) Or Top 2/3(Vertical screen)",
	},
	-- 右 2/3（横屏）或下 2/3（竖屏）
	right_2_3 = {
		prefix = { "Ctrl", "Option" },
		key = "T",
		message = "Right 2/3(Horizontal screen)Or Bottom 2/3(Vertical screen)",
	},
	-- 居中
	-- disable it and leave it for snapshot
	center = { prefix = { "Ctrl", "Option" }, key = "\\", message = "Center" },
	--
	-- 等比例放大窗口
	zoom = { prefix = { "Ctrl", "Option" }, key = "=", message = "Zoom Window" },
	-- 等比例缩小窗口
	narrow = { prefix = { "Ctrl", "Option" }, key = "-", message = "Narrow Window" },
	-- 最大化
	max = { prefix = { "Ctrl", "Option" }, key = "Return", message = "Max Window" },
	-- 将窗口移动到上方屏幕
	to_up = { prefix = { "Ctrl", "Option", "Command" }, key = "Up", message = "Move To Up Screen" },
	-- 将窗口移动到下方屏幕
	to_down = { prefix = { "Ctrl", "Option", "Command" }, key = "Down", message = "Move To Down Screen" },
	-- 将窗口移动到左侧屏幕
	to_left = { prefix = { "Ctrl", "Option", "Command" }, key = "Left", message = "Move To Left Screen" },
	-- 将窗口移动到右侧屏幕
	to_right = { prefix = { "Ctrl", "Option", "Command" }, key = "Right", message = "Move To Right Screen" },
}
