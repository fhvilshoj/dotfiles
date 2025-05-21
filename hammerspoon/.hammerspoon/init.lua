hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall:andUse("AppLauncher", {
    hotkeys = {
        a = "Brain.fm App",
        b = "Arc",
        c = "Visual Studio Code",
        --- d = ""
        --- e = "Raycast:: emojis",
        f = "Finder",
        --- g = "",
        --- h = "",
        i = "Previewer",
        --- j = "",
        k = "Cursor",
        l = "Linear",
        m = "Spotify",
        n = "Notion",
        --- o = "Raycast:: calendar",
        --- p = "Raycast:: perplexity",
        q = "Beekeeper Studio",
        --- r = "Raycast"
        s = "Slack",
        t = "iTerm",
        --- u = "Raycast:: Gemini Chat",
        --- v = "Raycast: paste",
        x = "Notion Calendar",
        --- y = "",
        z = "Zotero",
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
            screen_left = { { "alt", "cmd", "shift", "ctrl" }, "[" },
            screen_right = { { "alt", "cmd", "shift", "ctrl" }, "]" },
        })
    end,
})

-------------------------------------------------------------------------------
-- FORCE LANGUAGE
-------------------------------------------------------------------------------

-- Specify the target app names here
local target_apps = {}
table.insert(target_apps, { language = "ABC", application = "iTerm" })
table.insert(target_apps, { language = "Danish", application = "WhatsApp" })

-- Global variable to prevent GC, see https://github.com/Hammerspoon/hammerspoon/issues/681
force_lang_watcher = nil

function initForceLanguage()
    force_lang_watcher = hs.application.watcher.new(checkForceLanguage):start()
end

function checkForceLanguage(name, event, app)
    -- Ignore not interesting events
    if event ~= hs.application.watcher.activated then
        return
    end

    for id, app_lang in pairs(target_apps) do
        if string.match(name, app_lang.application) then
            if string.match(hs.keycodes.currentLayout(), app_lang.language) then
                return
            end
            hs.keycodes.setLayout(app_lang.language)
            break
        end
    end
end

initForceLanguage()
