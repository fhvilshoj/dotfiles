version = "0.21.1"

local home = os.getenv("HOME")
package.path = home .. "/.config/xplr/plugins/?/init.lua;" .. home .. "/.config/xplr/plugins/?.lua;" .. package.path

require("context-switch").setup()

-- Fuzzy find
xplr.config.modes.custom.fzxplr = {
    name = "fzxplr",
    key_bindings = {
        on_key = {
            F = {
                help = "search",
                messages = {
                    {
                        BashExec = [===[
              PTH=$(cat "${XPLR_PIPE_DIRECTORY_NODES_OUT:?}" | awk -F/ '{print $NF}' | fzf)
              if [ -d "$PTH" ]; then
                "$XPLR" -m 'ChangeDirectory: %q' "$PTH"
              else
                "$XPLR" -m 'FocusPath: %q' "$PTH"
              fi
            ]===],
                    },
                    "PopMode",
                },
            },
        },
        default = {
            messages = {
                "PopMode",
            },
        },
    },
}

xplr.config.modes.builtin.default.key_bindings.on_key["F"] = {
    help = "fzf mode",
    messages = {
        { SwitchModeCustom = "fzxplr" },
    },
}

-- Batch rename
xplr.config.modes.builtin.default.key_bindings.on_key.R = {
    help = "batch rename",
    messages = {
        {
            BashExec = [===[
       SELECTION=$(cat "${XPLR_PIPE_SELECTION_OUT:?}")
       NODES=${SELECTION:-$(cat "${XPLR_PIPE_DIRECTORY_NODES_OUT:?}")}
       if [ "$NODES" ]; then
         echo -e "$NODES" | renamer
         "$XPLR" -m ExplorePwdAsync
       fi
     ]===],
        },
    },
}
