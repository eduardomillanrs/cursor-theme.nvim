---@class CursorThemeStyle
---@field bold? boolean
---@field italic? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field strikethrough? boolean

---@class CursorThemeOptions
---@field dark 'default' | 'midnight'
---@field terminal_colors boolean
---@field styles table
---@field on_colors fun(colors: table)
---@field on_highlights fun(highlights: table, colors: table)
return {
    dark = 'default',
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        functions = { italic = true },
        keywords = {},
        variables = {},
        operators = {},
        conditionals = {},
    },
    on_colors = function() end,
    on_highlights = function() end,
}
