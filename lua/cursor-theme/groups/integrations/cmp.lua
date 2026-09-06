local M = {}

function M.get(colors)
    local c = colors
    return {
        CmpItemAbbr = { fg = c.fg },
        CmpItemAbbrDeprecated = { fg = c.fg_dim, strikethrough = true },
        CmpItemAbbrMatch = { fg = c.accent, bold = true },
        CmpItemAbbrMatchFuzzy = { fg = c.accent, bold = true },
        CmpItemKind = { fg = c.fg_dim },
        CmpItemMenu = { fg = c.fg_comment },
        CmpItemKindText = { fg = c.fg },
        CmpItemKindMethod = { fg = c.func },
        CmpItemKindFunction = { fg = c.func },
        CmpItemKindConstructor = { fg = c.type },
        CmpItemKindField = { fg = c.constant },
        CmpItemKindVariable = { fg = c.variable },
        CmpItemKindClass = { fg = c.type },
        CmpItemKindInterface = { fg = c.type },
        CmpItemKindModule = { fg = c.type },
        CmpItemKindProperty = { fg = c.constant },
        CmpItemKindUnit = { fg = c.constant },
        CmpItemKindValue = { fg = c.constant },
        CmpItemKindEnum = { fg = c.type },
        CmpItemKindKeyword = { fg = c.keyword },
        CmpItemKindSnippet = { fg = c.special },
        CmpItemKindColor = { fg = c.special },
        CmpItemKindFile = { fg = c.fg },
        CmpItemKindReference = { fg = c.variable },
        CmpItemKindFolder = { fg = c.accent },
        CmpItemKindEnumMember = { fg = c.constant },
        CmpItemKindConstant = { fg = c.constant },
        CmpItemKindStruct = { fg = c.type },
        CmpItemKindEvent = { fg = c.keyword },
        CmpItemKindOperator = { fg = c.operator },
        CmpItemKindTypeParameter = { fg = c.type },
    }
end

return M
