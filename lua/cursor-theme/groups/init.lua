local M = {}

function M.setup(colors, options)
    local highlights = {}
    for _, name in ipairs({ 'editor', 'syntax', 'treesitter', 'lsp', 'integrations' }) do
        highlights = vim.tbl_deep_extend(
            'force',
            highlights,
            require('cursor-theme.groups.' .. name).get(colors, options)
        )
    end
    return highlights
end

return M
