local wm = require('window-management')
local hk = require "hs.hotkey"

-- * Key Binding Utility
--- Bind hotkey for window management.
-- @function windowBind
-- @param {table} hyper - hyper key set
-- @param { ...{key=value} } keyFuncTable - multiple hotkey and function pairs
--   @key {string} hotkey
--   @value {function} callback function
local function windowBind(hyper, keyFuncTable)
  for key,fn in pairs(keyFuncTable) do
    hk.bind(hyper, key, fn)
  end
end

-- * Move window to screen
windowBind(mash.movement, {
  left = wm.throwLeft,
  right = wm.throwRight
})

-- * Set Window Position on screen
windowBind(mash.resize, {
  m = wm.maximizeWindow,    -- ⌥⇧ + M
  c = wm.centerOnScreen,    -- ⌥⇧ + C
  left = wm.leftHalf,       -- ⌥⇧ + ←
  right = wm.rightHalf,     -- ⌥⇧ + →
  up = wm.topHalf,          -- ⌥⇧ + ↑
  down = wm.bottomHalf      -- ⌥⇧ + ↓
})
-- -- -- * Set Window Position on screen
-- windowBind({"ctrl", "alt", "shift"}, {
--   left = wm.rightToLeft,      -- ⌃⌥⇧ + ←
--   right = wm.rightToRight,    -- ⌃⌥⇧ + →
--   up = wm.bottomUp,           -- ⌃⌥⇧ + ↑
--   down = wm.bottomDown        -- ⌃⌥⇧ + ↓
-- })
-- -- * Set Window Position on screen
-- windowBind({"alt", "cmd", "shift"}, {
--   left = wm.leftToLeft,      -- ⌥⌘⇧ + ←
--   right = wm.leftToRight,    -- ⌥⌘⇧ + →
--   up = wm.topUp,             -- ⌥⌘⇧ + ↑
--   down = wm.topDown          -- ⌥⌘⇧ + ↓
-- })

-- -- * Windows-like cycle
-- windowBind(mash.movement, {
--   left = wm.cycleLeft,          -- ⌥⌃ + ←
--   right = wm.cycleRight          -- ⌥⌃ + →
-- })

-- launch and focus applications with below shortkey
hs.fnutils.each({
    { key = "t", app = "iTerm" },
    { key = "f", app = "Finder" },
    { key = "escape", app = "Activity Monitor" },
    { key = "c", app = "Google Chrome" },
    { key = "s", app = "Station" },
    { key = "x", app = "Slack" },
    { key = "m", app = "Meld" },
    { key = "v", app = "Visual Studio Code" },
    { key = "z", app = "zoom.us" },
}, function(object)
    launchApp(mash.app, object)
end)

hs.hotkey.bind(mash.app, "h", function()
    hs.reload()
end)

local keymapping_layouts = {}
for k, v in pairs(hs.keycodes.layouts()) do
    keymapping_layouts[tonumber(k)] = {["key"] = tostring(k), ["layout"] = tostring(v)}
end

hs.fnutils.each(keymapping_layouts, function(object)
    setLayout(mash.app, object)
end)
