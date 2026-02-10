require 'modules.shortcut'

local function Chinese()
  hs.keycodes.setMethod("Pinyin - Simplified")
  -- hs.keycodes.currentSourceID("com.apple.inputmethod.SCIM.ITABC")
  -- hs.keycodes.currentSourceID("com.tencent.inputmethod.wetype.pinyin")
end

local function English()
  -- hs.keycodes.setLayout("U.S.")
  hs.keycodes.currentSourceID("com.apple.keylayout.US")
end

local function Sougou()
  hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
end

hs.hotkey.bind(input_methods.abc.prefix, input_methods.abc.key, input_methods.abc.message,English)
hs.hotkey.bind(input_methods.chinese.prefix, input_methods.chinese.key, input_methods.chinese.message, Chinese)
-- hs.hotkey.bind(input_methods.sougou.prefix, input_methods.sougou.key, input_methods.sougou.message, Sougou)

-- hs.hotkey.bind({"option"}, "k", Chinese)

