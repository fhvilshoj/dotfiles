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
