-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/
--

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "alacritty"
local fileManager = "nautilus"
local file2 = "vicinae vicinae://launch/files/search"
local menu        = "vicinae toggle"
local browser = "firefox"
local winoverview ="qs ipc -c overview call overview toggle"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar")
  hl.exec_cmd("swaync")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("numlockx")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("vicinae server")
  hl.exec_cmd("hyprsunset")
  hl.exec_cmd("qs -c overview")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "27")
hl.env("HYPRCURSOR_SIZE", "27")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 0,
        gaps_out = 0,

        border_size = 0,

        col = {
            active_border   = { colors = {"rgba(7E7C7EFF)"}},
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 4,
        rounding_power = 5,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 0.7,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 12,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        -- pseudotile = true,
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
        middle_click_paste = false,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us, latam",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:win_space_toggle",
        kb_rules   = "",
        numlock_by_default = true,
        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})


hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.gesture({
    fingers = 4,
    direction = "down",
    action = "close"
})

hl.gesture({
    fingers = 3,
    direction = "pinch",
    action = "resize"
})

hl.gesture({ fingers = 4, direction = "up", action = function() hl.exec_cmd(menu) end })
hl.gesture({ fingers = 3, direction = "up", action = function() hl.exec_cmd(winoverview) end })

-- hl.gesture({
--   fingers = 4,
--   direction = "up",
--   action = function()
--     hl.notification.create({ text = "I just swiped on my trackpad!", duration = 5000, icon = "ok" })
--   end
-- })
-- hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 1, mode = "live" })



-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.device({
    name        = "razer-razer-deathadder-v2-1",
    sensitivity = -0.5,
    accel_profile = flat,
})
---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

---CLIPBOARD
local clipboard = "vicinae vicinae://launch/clipboard/history"
hl.bind(mainMod .. "+ V", hl.dsp.exec_cmd(clipboard), { locked = false, repeating = false })

--SCREENSHOTS HYPRSHOT
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -m eDP-1 -z -s -f Screenshot__$(date +'%d-%m-%Y__%H-%M-%S').png -o ~/Pictures/Screenshots"), { locked = false, repeating = false })
hl.bind(mainMod .. "+ PRINT", hl.dsp.exec_cmd("hyprshot -m window -m eDP-1 -z -s -f Screenshot__$(date +'%d-%m-%Y__%H-%M-%S').png -o ~/Pictures/Screenshots"), { locked = false, repeating = false })
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output -m eDP-1 -z -s -f Screenshot__$(date +'%d-%m-%Y__%H-%M-%S').png -o ~/Pictures/Screenshots "), { locked = false, repeating = false })

--SCREENSHOTS HYPRSHOT + SATTY
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("~/.config/hypr/scripts/ssdmenusatty.sh"), { locked = false, repeating = false })
-- hl.bind(mainMod .. "+ PRINT", hl.dsp.exec_cmd("~/.config/hypr/scripts/sswindow.sh"), { locked = false, repeating = false })
-- hl.bind("PRINT", hl.dsp.exec_cmd("~/.config/hypr/scripts/ssfullscreen.sh"), { locked = false, repeating = false })

--INSERT WORKSPACE
hl.bind(mainMod .. " + return", function()
    dofile(os.getenv("HOME") .. "/.config/hypr/scripts/shiftwork.lua")
end)

--MOVE WINDOWS
hl.bind(mainMod .. " + " .. "M", hl.dsp.window.float())
hl.bind(mainMod .. " + " .. "M", hl.dsp.window.pin())
hl.bind(mainMod .. " + " .. "M", hl.dsp.window.resize({x = 600, y=600}))


---PANEL NOTIS
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"), { locked = false, repeating = false })

--HYPRLOCK
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"), { locked = false, repeating = false })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("wlogout"), { locked = false, repeating = false })


hl.bind("ALT + TAB", hl.dsp.exec_cmd(winoverview), { locked = false, repeating = false })



--SHOW TAB WINDOWS
-- hl.bind("SHIFT + TAB", hl.dsp.exec_cmd(" vicinae vicinae://launch/wm/switch-windows "), { locked = false, repeating = false })

-- SHOW EMOJIS
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("vicinae vicinae://launch/core/search-emojis"), { locked = false, repeating = false })

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + K", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(file2), { locked = false, repeating = false })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + TAB", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + H", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + " .. "S", hl.dsp.window.swap({next = true}))
hl.bind(mainMod .. "+ F", hl.dsp.window.fullscreen({action = toggle}))


-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))



-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
--
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

--- Scroll through existing workspaces with mainMod + pgkeys
hl.bind(mainMod .. " + " .. "page_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + " .. "page_up", hl.dsp.focus({ workspace = "e+1" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("ALT + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- Resize windows with alt
hl.bind("ALT + right",  hl.dsp.window.resize({ x = 20, y = 0,   relative = true }), {repeating = true })
hl.bind("ALT + left",  hl.dsp.window.resize({ x = -20, y = 0,   relative = true }), {repeating = true })
hl.bind("ALT + down",  hl.dsp.window.resize({ x = 0, y = 20,   relative = true }), {repeating = true })
hl.bind("ALT + up",  hl.dsp.window.resize({ x = 0, y = -20,   relative = true}), {repeating = true })


-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("~/.config/hypr/scripts/volumemute.sh"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh down"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Window Rules
hl.window_rule({ match = { class = "firefox" },                   opacity = "1.0 override" })
hl.window_rule({ match = { class = "Code" },                      opacity = "0.9 override" })
hl.window_rule({ match = { class = "chromium" },                  opacity = "1.0 override" })
hl.window_rule({ match = { class = "spotify" },                   workspace = "6" })
hl.window_rule({ match = { class = "Spotify" },                   workspace = "6" })
hl.window_rule({ match = { class = "org.gnome.Nautilus" },        opacity = "0.8 override" })
hl.window_rule({ match = { class = "discord" },                   workspace = "5 silent" })
hl.window_rule({ match = { class = "com.gabm.satty" },            size = { 1000, 700 }, center = true, float = true })
hl.window_rule({ match = { class = "com.obsproject.Studio" },     workspace = "8", border_color = "rgba(ff0000ff)" })
hl.window_rule({ match = { class = "org.gnome.Calendar" },        float = true, size = { 836, 612 }, move = { 527, 49 } })
hl.window_rule({ match = { class = "org.gnome.Loupe" },           float = true, center = true })
hl.window_rule({ match = { class = "org.gnome.Papers" },          float = true })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" },    float = true })
hl.window_rule({ match = { class = "org.gnome.Showtime" },        float = true, center = true })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" },float = true, size = { 862, 461 }, move = { 1048, 53 } })
hl.window_rule({ match = { class = "blueman-manager" },           float = true, size = { 837, 531 }, center = true })
hl.window_rule({ match = { class = "Waydroid" },                  float = true, size = { 576, 1024 }, center = true })
-- hl.window_rule({ match = { class = "discord" },                   no_screen_share = true})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)


hl.layer_rule({
  match = { namespace = "vicinae" },
  name = "vicinae-blur",
  blur = true,
  ignore_alpha = 0,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- hl.layer_rule({
--   match = { namespace = "vicinae" },
--   name = "vicinae-no-animation",
--   no_anim = true,
-- })
--
--

hl.config({
    input = {
        numlock_by_default = true,
    },
})



hl.config({
  misc = {
    focus_on_activate = true,
  },
})

