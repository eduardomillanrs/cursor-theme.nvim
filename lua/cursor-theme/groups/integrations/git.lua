local M = {}

function M.get(colors)
    local c = colors
    return {
        Added = { fg = c.git_add },
        Changed = { fg = c.git_change },
        Removed = { fg = c.git_delete },
        DiffAdd = { bg = c.diff_add_bg },
        DiffChange = { bg = c.diff_change_bg },
        DiffDelete = { bg = c.diff_delete_bg },
        DiffText = { bg = c.diff_text_bg },
        GitSignsAdd = { fg = c.git_add },
        GitSignsChange = { fg = c.git_change },
        GitSignsDelete = { fg = c.git_delete },
        GitSignsTopdelete = { fg = c.git_delete },
        GitSignsChangedelete = { fg = c.git_change },
        GitSignsUntracked = { fg = c.git_add },
        GitSignsCurrentLineBlame = { fg = c.fg_comment },
        GitSignsAddLn = { bg = c.diff_add_bg },
        GitSignsChangeLn = { bg = c.diff_change_bg },
        GitSignsDeleteLn = { bg = c.diff_delete_bg },
        GitSignsAddInline = { bg = c.diff_add_bg },
        GitSignsChangeInline = { bg = c.diff_change_bg },
        GitSignsDeleteInline = { bg = c.diff_delete_bg },
    }
end

return M
