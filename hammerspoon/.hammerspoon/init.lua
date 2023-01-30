hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall:andUse("AppLauncher", {
    hotkeys = {
        s = "Slack",
        b = "Brave Browser",
        f = "Finder",
        i = "Previewer",
        m = "Spotify",
        t = "iTerm",
        p = "System Preferences",
    },
    config = {
        modifiers = { "alt", "cmd", "shift", "ctrl" },
    },
})

spoon.SpoonInstall:andUse("HoldToQuit", {
    config = {
        duration = 1.2,
    },
    fn = function(htq)
        print(htq)
        htq:init()
        htq:start()
    end,
})
