vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.clipboard:append("unnamedplus")
vim.opt.laststatus=2
vim.opt.wrap=true
vim.opt.encoding="utf-8"
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.softtabstop=4
vim.opt.modifiable=true
vim.opt.mouse="a"
vim.opt.smartcase=true
vim.opt.splitbelow=true
vim.cmd("syntax enable")

vim.cmd("highlight VertSplit cterm=None")

vim.diagnostic.config({
    virtual_text=true,
    signs = true,
    underline = true,
    severity_sort = true,

    float = {
        border = "rounded",
    },
})
vim.lsp.config("lua_ls",{
    settings={
        Lua={
            diagnostics={
                globals={"vim"},
            },
        },
    },
})
