local M = {}

-- Variable to store the previously focused window
-- local previousWindow = nil

-- Function to find iTerm window with title "Notes"
function M.findNotesWindow()
    local iterm = hs.application.find("iTerm")
    if not iterm then
        return nil
    end
    
    local windows = iterm:allWindows()
    for _, window in pairs(windows) do
        if window:title() == "Notes" then
            return window
        end
    end
    
    return nil
end

-- Function to toggle Notes window (focus or minimize)
function M.toggleNotesWindow()
    local notesWindow = M.findNotesWindow()
    
    if not notesWindow then
        -- Window doesn't exist, do nothing
        print("Notes window not found")
        return
    end
    
    -- Check if the Notes window is currently the focused window
    local currentlyFocusedWindow = hs.window.focusedWindow()
    if currentlyFocusedWindow and currentlyFocusedWindow == notesWindow then
        -- Notes window is focused, hide the application (equivalent to Cmd+H)
        notesWindow:application():hide()
        
        -- Restore focus to the previously focused window if it exists and is still valid
        -- if previousWindow and previousWindow:isVisible() then
        --     previousWindow:focus()
        -- end
        
        -- Clear the previous window reference
        previousWindow = nil
    else
        -- Store the currently focused window before switching to Notes
        -- local currentWindow = hs.window.focusedWindow()
        -- if currentWindow and currentWindow ~= notesWindow then
        --     previousWindow = currentWindow
        -- end
        
        -- Window exists but not focused, focus it
        -- First ensure the application is unhidden
        notesWindow:application():unhide()
        
        -- Add a small delay to ensure unhiding completes, then focus the specific window
        hs.timer.doAfter(0.1, function()
            notesWindow:focus()
        end)
    end
end

-- Set up the hotkey binding
function M.init()
    -- Using Cmd+Ctrl+N as the hotkey (you can change this)
    hs.hotkey.bind({"cmd", "ctrl"}, "n", M.toggleNotesWindow)
end

return M 