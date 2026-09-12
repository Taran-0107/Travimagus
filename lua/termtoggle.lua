
local M = {
term_buf=nil,
term_win=nil,
term_job_id=nil,
term_win_height=15
}



function M.toggle(insert)
    -- Terminal is currently visible

    local pwin=vim.api.nvim_get_current_win()
    if M.term_win and vim.api.nvim_win_is_valid(M.term_win) then
        M.term_win_height=vim.api.nvim_win_get_height(M.term_win)
        vim.api.nvim_win_close(M.term_win, true)
        M.term_win = nil
        return
    end
    -- Terminal buffer already exists, reopen it
    if M.term_buf and vim.api.nvim_buf_is_valid(M.term_buf) then
        vim.cmd(M.term_win_height .. "split")
        M.term_win = vim.api.nvim_get_current_win()

        vim.api.nvim_win_set_buf(M.term_win, M.term_buf)

        if insert then
            vim.cmd("startinsert")
        else
            vim.api.nvim_set_current_win(pwin)
        end

        return
    end
    -- Create terminal for the first time
    vim.cmd(M.term_win_height .. "split")
    vim.cmd("terminal")

    M.term_buf= vim.api.nvim_get_current_buf()
    M.term_win = vim.api.nvim_get_current_win()
    M.term_job_id=vim.api.nvim_buf_get_var(M.term_buf,"terminal_job_id")

    if insert then
        vim.cmd("startinsert")
    else
        vim.api.nvim_set_current_win(pwin)
    end

end



function M.putup(insert)

    if not M.term_win or not vim.api.nvim_win_is_valid(M.term_win) then
        if insert then
            M.toggle(true)
        else
            M.toggle(false)
        end
    else
        if insert then
            vim.api.nvim_set_current_win(M.term_win)
            vim.cmd("startinsert")
        end
    end
end

function M.scrollterm()
    local pwin=vim.api.nvim_get_current_win()
    M.putup(true)
    vim.cmd("startinsert")
    vim.cmd("normal! G")
    vim.cmd("stopinsert")
    vim.api.nvim_set_current_win(pwin)
end

function M.typeinterm(command,insert)
    vim.defer_fn(function ()
    vim.fn.chansend(M.term_job_id, command .. "\n")
    end,100
    )
    M.scrollterm()
    M.putup(insert)

end




return M
