local M = {}

function M.get(colors)
    local c = colors
    return {
        TelescopeNormal = { fg = c.fg, bg = c.bg_float },
        TelescopeBorder = { fg = c.border, bg = c.bg_float },
        TelescopeTitle = { fg = c.accent, bg = c.bg_float, bold = true },
        TelescopePromptNormal = { fg = c.fg, bg = c.bg_float },
        TelescopePromptBorder = { fg = c.border, bg = c.bg_float },
        TelescopePromptTitle = { fg = c.accent, bg = c.bg_float, bold = true },
        TelescopePromptPrefix = { fg = c.accent, bg = c.bg_float },
        TelescopeResultsNormal = { fg = c.fg, bg = c.bg_float },
        TelescopeResultsBorder = { fg = c.border, bg = c.bg_float },
        TelescopeResultsTitle = { fg = c.accent, bg = c.bg_float, bold = true },
        TelescopePreviewNormal = { fg = c.fg, bg = c.bg_float },
        TelescopePreviewBorder = { fg = c.border, bg = c.bg_float },
        TelescopePreviewTitle = { fg = c.accent, bg = c.bg_float, bold = true },
        TelescopeSelection = { fg = c.fg, bg = c.bg_selection },
        TelescopeSelectionCaret = { fg = c.accent, bg = c.bg_selection },
        TelescopeMatching = { fg = c.accent, bold = true },
    }
end

return M
