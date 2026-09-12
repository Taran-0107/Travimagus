local M={}

local commands=require("commands")
function M.load()
    vim.cmd("colorscheme nightfox")
    vim.cmd("NvimTreeToggle")

    vim.api.nvim_create_autocmd("BufEnter",{
        callback=function()
            if vim.fn.winnr("$") == 1 and vim.bo.filetype == "NvimTree" then
                vim.cmd("quit")

            end
        end,
    })
    pcall(commands.cmd(),{})
end

function M.setup()
    vim.api.nvim_create_autocmd("User",{
        pattern="VeryLazy",
        callback=function()
            M.load()
        end,
    })

end

return M
