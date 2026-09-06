local M = {}

function M.get(colors)
    local c = colors
    return {
        SnacksIndent = { fg = c.guide },
        SnacksIndentBlank = { link = 'SnacksIndent' },
        SnacksIndentScope = { fg = c.guide_active },
        SnacksPicker = { fg = c.fg, bg = c.bg_float },
        SnacksPickerBorder = { fg = c.border, bg = c.bg_float },
        SnacksPickerBoxBorder = { fg = c.border, bg = c.bg_float },
        SnacksPickerInput = { fg = c.fg, bg = c.bg_float },
        SnacksPickerInputBorder = { fg = c.border, bg = c.bg_float },
        SnacksPickerInputTitle = { fg = c.accent, bg = c.bg_float, bold = true },
        SnacksPickerList = { fg = c.fg, bg = c.bg_float },
        SnacksPickerListBorder = { fg = c.border, bg = c.bg_float },
        SnacksPickerListCursorLine = { bg = c.bg_selection },
        SnacksPickerPreview = { fg = c.fg, bg = c.bg_float },
        SnacksPickerPreviewBorder = { fg = c.border, bg = c.bg_float },
        SnacksPickerPreviewTitle = { fg = c.accent, bg = c.bg_float, bold = true },
        SnacksPickerPreviewCursorLine = { bg = c.bg_selection },
        SnacksPickerTitle = { fg = c.accent, bg = c.bg_float, bold = true },
        SnacksPickerFooter = { fg = c.fg_dim, bg = c.bg_float },
        SnacksPickerMatch = { fg = c.accent, bold = true },
        SnacksPickerPrompt = { fg = c.accent },
        SnacksPickerFile = { fg = c.fg },
        SnacksPickerDirectory = { link = 'Directory' },
        SnacksPickerComment = { link = 'Comment' },
        SnacksPickerDesc = { link = 'Comment' },
        SnacksPickerDelim = { link = 'Delimiter' },
        SnacksPickerSpinner = { fg = c.accent },
        SnacksPickerSelected = { link = 'Number' },
        SnacksPickerUnselected = { link = 'NonText' },
        SnacksPickerGitStatusAdded = { link = 'Added' },
        SnacksPickerGitStatusModified = { link = 'Changed' },
        SnacksPickerGitStatusDeleted = { link = 'Removed' },
        SnacksPickerGitStatusIgnored = { link = 'NonText' },
        SnacksPickerNotificationMessage = { fg = c.fg },
        SnacksDiffHeader = { link = 'DiagnosticVirtualTextInfo' },
        SnacksDiffAdd = { link = 'DiffAdd' },
        SnacksDiffDelete = { link = 'DiffDelete' },
        SnacksDiffContext = { link = 'DiffChange' },
        SnacksDiffConflict = { link = 'DiagnosticVirtualTextWarn' },
    }
end

return M
