local M = {}
local utils = require('cursor-theme.utils')

function M.get(colors, options)
    local c = colors
    local styles = options.styles
    local function styled(foreground, style)
        return vim.tbl_extend('force', { fg = foreground }, utils.style(style))
    end

    return {
        Comment = styled(c.comment, styles.comments),
        String = { fg = c.string },
        Character = { fg = c.string },
        Number = { fg = c.constant },
        Float = { link = 'Number' },
        Boolean = styled(c.constant, styles.keywords),
        Identifier = styled(c.variable, styles.variables),
        Function = styled(c.func, styles.functions),
        Statement = styled(c.keyword, styles.keywords),
        Conditional = styled(c.keyword, styles.conditionals),
        Repeat = styled(c.keyword, styles.conditionals),
        Label = { fg = c.type },
        Operator = styled(c.operator, styles.operators),
        Keyword = styled(c.keyword, styles.keywords),
        Exception = styled(c.keyword, styles.keywords),
        PreProc = { fg = c.special },
        Include = { fg = c.special },
        Define = { fg = c.special },
        Macro = { fg = c.special },
        PreCondit = { fg = c.special },
        Type = { fg = c.type },
        StorageClass = { fg = c.keyword },
        Structure = { fg = c.type },
        Typedef = { fg = c.type },
        Constant = { fg = c.constant },
        Special = { fg = c.special },
        SpecialChar = { fg = c.special },
        Tag = { fg = c.tag },
        Delimiter = { fg = c.punctuation },
        SpecialComment = { fg = c.comment },
        Debug = { fg = c.error },
        Underlined = { fg = c.accent, underline = true },
        Bold = { bold = true },
        Italic = { italic = true },
        Ignore = { fg = c.nontext },
        Error = { fg = c.error },
        Todo = { fg = c.bg, bg = c.warning, bold = true },
    }
end

return M
