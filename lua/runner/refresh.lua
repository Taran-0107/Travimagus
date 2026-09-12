local function refresh()
    vim.cmd("lsp restart")
end

return {refresh=refresh}
