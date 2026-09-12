
local modules={
    runner=require("runner.run"),
    refresh=require("runner.refresh"),
    term=require("termtoggle"),
}

local function create_commands()
    vim.api.nvim_create_user_command("Run",modules.runner.run,{})
    vim.api.nvim_create_user_command("Activate",modules.runner.activate,{})
    vim.api.nvim_create_user_command("Refresh",modules.refresh.refresh,{})
    vim.api.nvim_create_user_command("ToggleTerm", function(opts)
        if opts.args == "true" then
            modules.term.toggle(true)
        elseif opts.args == "false" then
            modules.term.toggle(false)
        else
            vim.notify("Usage: :ToggleTerm true|false", vim.log.levels.ERROR)
        end
    end, {
        nargs = 1,
    })
end

return {cmd=create_commands}
