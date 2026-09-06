local M = {}

function M.get(colors, options)
    local highlights = {}
    for _, name in ipairs({ 'git', 'blink', 'cmp', 'fzf', 'telescope', 'snacks', 'common' }) do
        highlights = vim.tbl_deep_extend(
            'force',
            highlights,
            require('cursor-theme.groups.integrations.' .. name).get(colors, options)
        )
    end
    return highlights
end

return M
