-- -----------------------------------------------------------------------
--           ** HammerSpoon Config File by S1ngS1ng with ❤️ **           --
--               https://github.com/S1ngS1ng/HammerSpoon                --
--           https://github.com/danshan/hammerspoon-config              --
-- -----------------------------------------------------------------------

--   ***   Please refer to README.MD for instructions. Cheers!    ***   --

-- -----------------------------------------------------------------------
--                         ** Something Global **                       --
-- -----------------------------------------------------------------------
logger = hs.logger.new("config", "verbose")

hs.alert.defaultStyle.strokeColor = { white = 0, alpha = 0.75 }
hs.alert.defaultStyle.textSize = 25

-- Comment this following line if you wish to see animations
hs.window.animationDuration = 0
hs.window.setShadows(false)

hs.application.enableSpotlightForNameSearches(true)

mash = {
  app = { "alt" },                -- ⌥
  movement = { "alt", "ctrl" },   -- ⌥⌃
  resize = { "alt", "cmd" }       -- ⌥⌘
}

-- -----------------------------------------------------------------------
--                            ** Requires **                            --
-- -----------------------------------------------------------------------

require("window-management")
require("apps")
require("key-binding")


hs.alert.show('Hammerspoon config reload')
