hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall:andUse("AppLauncher", {
    hotkeys = {
        a = "Brain.fm App",
        b = "Brave Browser",
        c = "Google Chrome",
        d = "Discord",
        f = "Finder",
        i = "Previewer",
        m = "Spotify",
        n = "Notion",
        p = "System Preferences",
        s = "Slack",
        t = "iTerm",
        w = "WhatsApp",
        z = "zoom.us",
        q = "1Password",
    },
    config = {
        modifiers = { "alt", "cmd", "shift", "ctrl" },
    },
})

spoon.SpoonInstall:andUse("HoldToQuit", {
    config = {
        duration = 0.8,
    },
    fn = function(htq)
        htq:init()
        htq:start()
    end,
})

spoon.SpoonInstall:andUse("WindowScreenLeftAndRight", {
    config = {
        animationDuration = 0,
    },
    fn = function(wslr)
        wslr:bindHotkeys({
            screen_left = { { "alt", "cmd", "shift", "ctrl" }, "Left" },
            screen_right = { { "alt", "cmd", "shift", "ctrl" }, "Right" },
        })
    end,
})
