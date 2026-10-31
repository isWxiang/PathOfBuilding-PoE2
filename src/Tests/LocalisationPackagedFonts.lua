-- 从实际解压包执行，检查配置路径及首次生成；测试入口和缓存均不进入分发包。
local Font = dofile('Modules/Localisation/Font.lua')
local Messages = dofile('Modules/Localisation/Messages.lua')
local manifest = dofile('Locales/Manifest.lua')
local messages = Messages.New()
-- 从解压包读取实际声明的显示资源，检查漏包、损坏和模板参数。
for _, language in ipairs(manifest.items) do
	messages:LoadFiles(language.id, language.messagePath or language.path, language.messageFiles)
	local count = 0
	for _ in pairs(assert(messages.languages[language.id], '发布包缺少语言资源：' .. language.id)) do count = count + 1 end
	assert(count > 0, '发布包语言资源为空：' .. language.id)
	assert(messages:Text('attribute.strength', {}, { language.id, 'en' }) ~= '')
	print('Packaged messages passed: ' .. language.id .. ' -> ' .. count .. ' keys')
end
messages:Validate()
GetScriptPath = function() return '.' end
GetRuntimePath = function() return '.' end
GetUserPath = function() return assert(os.getenv('POB_PACKAGED_TEST_USER')) end
-- 字体生成器自己创建输出目录，无界面宿主仅提供所需入口。
MakeDir = function() return true end
local samples = { ['zh-CN'] = '简体中文', ['zh-TW'] = '繁體中文', ['ja-JP'] = '日本語', ['ko-KR'] = '한국어' }
for _, language in ipairs(manifest.items) do
	if language.font then
		local file = assert(io.open(language.font.fontFile, 'rb'), '发布包缺少字体：' .. language.id)
		file:close()
		local font = assert(Font.New(language.font.folder, language.font), '发布包字体无法载入：' .. language.id)
		for _, token in ipairs(font:Layout(16, samples[language.id]).lines[1].tokens) do
			assert(token.glyph ~= font.metrics.glyphs[63], '发布包字体缺少语言本名字形：' .. language.id)
		end
		assert(font:Cursor(16, samples[language.id], 9999, 0) == #samples[language.id] + 1)
		print('Packaged font passed: ' .. language.id .. ' -> ' .. font.folder)
	end
end
