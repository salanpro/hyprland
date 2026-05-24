local current_id = hl.get_active_workspace().id
local workspaces = hl.get_workspaces()

table.sort(workspaces, function(a, b) return a.id > b.id end)

for _, ws in ipairs(workspaces) do
    if ws.id > current_id then
        local target = ws.id + 1
        local windows = hl.get_windows()
        for _, win in ipairs(windows) do
            if win.workspace.id == ws.id then
                hl.dispatch(hl.dsp.window.move({
                    workspace = target,
                    window    = win,
                    silent    = true,
                }))
            end
        end
    end
end

hl.dispatch(hl.dsp.focus({ workspace = current_id + 1 }))
