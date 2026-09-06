local M = {}

local options = vim.deepcopy(require('cursor-theme.defaults'))

function M.setup(user_options)
    options = vim.tbl_deep_extend('force', options, user_options or {})
end

function M.load(style, explicit)
    if style == 'dark' and not explicit and options.dark == 'midnight' then
        style = 'dark_midnight'
    elseif style == 'dark' then
        style = 'dark'
    end

    if vim.g.colors_name then
        vim.cmd('highlight clear')
    end
    if vim.fn.exists('syntax_on') == 1 then
        vim.cmd('syntax reset')
    end

    vim.o.termguicolors = true
    vim.g.colors_name = 'cursor'

    local colors = require('cursor-theme.palette')[style]
    assert(colors, 'cursor-theme: unknown style ' .. tostring(style))
    options.on_colors(colors)

    local highlights = require('cursor-theme.groups').setup(colors, options)
    options.on_highlights(highlights, colors)

    for group, highlight in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, highlight)
    end

    if options.terminal_colors then
        local terminal = {
            colors.terminal_black,
            colors.terminal_red,
            colors.terminal_green,
            colors.terminal_yellow,
            colors.terminal_blue,
            colors.terminal_magenta,
            colors.terminal_cyan,
            colors.terminal_white,
            colors.terminal_bright_black,
            colors.terminal_bright_red,
            colors.terminal_bright_green,
            colors.terminal_bright_yellow,
            colors.terminal_bright_blue,
            colors.terminal_bright_magenta,
            colors.terminal_bright_cyan,
            colors.terminal_bright_white,
        }
        for index, color in ipairs(terminal) do
            vim.g['terminal_color_' .. index - 1] = color
        end
    end
end

function M._load_explicit(style)
    M.load(style, true)
end

return M
