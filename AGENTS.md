# AGENTS.md — cursor-theme.nvim

## Project purpose

This repository contains an unofficial Cursor-inspired colorscheme for
Neovim, plus terminal/tool exports. The active project is the installable
package at the repository root.

## Current variants

The package provides:

- `cursor-dark`
- `cursor-light`
- `cursor-dark-midnight`
- `cursor`, which follows `vim.o.background`

Automatic dark mode uses Cursor Dark by default. Users can select Midnight for
automatic dark mode with:

```lua
require('cursor-theme').setup({ dark = 'midnight' })
vim.cmd.colorscheme('cursor')
```

The requested scope is Dark, Light, and Midnight. Cursor Dark High Contrast is
not part of the current package.

## Visual decisions

The theme follows a hybrid policy:

- Cursor VS Code colors are the authority for primary syntax and editor intent.
- Neovim-specific surfaces may be tuned for clarity and interaction quality.
- Comments and functions are italic by default.
- Parentheses, commas, dots, braces, and brackets use the dedicated
  `punctuation` palette color through both `Delimiter` and
  `@punctuation.bracket`/`@punctuation.delimiter`.
- Dark Neovim uses `#141414` as its editor background to match the Ghostty
  Dark export.
- Dark floating/elevated surfaces use `#181818`; the dark statusline base uses
  `#101010` to retain visual hierarchy.
- Light uses `#ededed` for the statusline background so it remains visible
  against the light editor background.
- `Visual`, `PmenuSel`, search, diagnostics, and diff backgrounds are separate
  concepts and must not be collapsed into one selection color.

## Architecture

```text
colors/
    cursor.lua
    cursor-dark.lua
    cursor-light.lua
    cursor-dark-midnight.lua

lua/cursor-theme/
    init.lua              setup(), load(), terminal colors, hooks
    defaults.lua          public options and default styles
    palette.lua           Dark, Light, and Midnight color definitions
    utils.lua             styles, RGB conversion, blending, alpha flattening
    groups/
        init.lua          ordered group composition
        editor.lua        built-in Neovim UI groups
        syntax.lua        legacy Vim syntax groups
        treesitter.lua    modern Treesitter captures
        lsp.lua           diagnostics and semantic LSP groups
        integrations/
            init.lua      ordered integration composition
            git.lua
            blink.lua
            cmp.lua
            fzf.lua
            telescope.lua
            snacks.lua
            common.lua

extras/
    ghostty/              terminal themes named after the Neovim variants
```

Each group module should expose:

```lua
function M.get(colors, options)
    return highlights
end
```

Groups are merged in this order:

1. editor
2. syntax
3. Treesitter
4. LSP
5. integrations

Later groups intentionally win when a group overlaps. Prefer `link = 'Group'`
for aliases so user overrides cascade naturally.

## Public API

The supported setup shape is:

```lua
require('cursor-theme').setup({
    dark = 'default', -- or 'midnight'
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        functions = { italic = true },
        keywords = {},
        variables = {},
        operators = {},
        conditionals = {},
    },
    on_colors = function(colors) end,
    on_highlights = function(highlights, colors) end,
})
```

Explicit colorscheme files should use the internal explicit loader so that
`dark = 'midnight'` changes automatic dark mode without unexpectedly changing
the explicitly requested `cursor-dark` scheme.

Neovim 0.9+ is the compatibility target. Optional integrations must never
require their plugins to be installed.

## Palette and color rules

The source colors were derived from the checked-in Cursor VS Code theme files
that originally lived under the Zed reference port. The root package must be
self-contained: no Lua code should read those files at runtime.

Palette keys should describe semantic roles rather than individual plugin
names. Keep the following concepts distinct where applicable:

- `bg`, `bg_dark`, `bg_float`, `bg_elevated`
- `bg_cursorline`, `bg_visual`, `bg_selection`, `bg_search`
- `fg`, `fg_bright`, `fg_dim`, `fg_comment`, gutter colors
- `keyword`, `func`, `func_builtin`, `string`, `type`, `constant`, `variable`
- `operator`, `special`, `tag`, `regex`, `punctuation`
- diagnostic, Git, diff, and terminal colors

Neovim highlight APIs require opaque RGB colors. Never pass `#RRGGBBAA` to
`nvim_set_hl`. Use `utils.solid(alpha_color, background)` in `palette.lua` or
another controlled conversion before assigning a color to a highlight group.

When changing a background, review all alpha-derived colors that use it,
especially foregrounds, selections, search highlights, guides, and diff
backgrounds.

## Integrations

The current user setup includes Blink, FZF-Lua, GitSigns, Treesitter,
nvim-surround, lazy.nvim, and supporting plugins. The theme also covers common
Neovim tools such as nvim-cmp, Telescope, Snacks, file explorers, Noice,
which-key, notify.nvim, ibl, bufferline, lualine, mini.nvim, oil.nvim,
trouble.nvim, render-markdown, todo-comments, Flash, and Leap.

Add a dedicated integration module when a plugin has stable, meaningful
highlight groups. Add its name to
`lua/cursor-theme/groups/integrations/init.lua`. Keep plugin integrations
optional and use core theme links whenever possible.

Plugins that do not expose theme-specific highlight groups, such as conform,
plenary, lazydev, and configuration-only helpers, do not need integration
modules.

## Terminal/tool exports

All non-Neovim exports belong under `extras/<dest>`:

```text
extras/ghostty/
extras/<future-tool>/
```

Ghostty files use the names `cursor-dark`, `cursor-light`, and
`cursor-dark-midnight`. They must contain opaque values for the 16 ANSI palette
entries, background, foreground, cursor, and selection. Keep them visually
aligned with the Neovim palette, especially the Dark `#141414` background.

Future exports should be isolated in their own destination directory and must
not complicate the Neovim runtime module.

## Verification

After modifying palettes or groups, run headless Neovim checks from the root:

```sh
nvim --headless --clean -u NONE \
    -c 'set rtp^=.' \
    -c 'colorscheme cursor-dark' \
    -c 'colorscheme cursor-light' \
    -c 'colorscheme cursor-dark-midnight' \
    -c 'qa'
```

Checks should cover:

- all explicit variants loading without errors
- automatic dark/light selection and configurable Midnight selection
- `Normal`, `NormalFloat`, `Pmenu`, `PmenuSel`, `Visual`, and `StatusLine`
- `Comment`, `Function`, `@function`, and punctuation captures
- diagnostics, Git signs, diffs, terminal colors, and integration groups
- no unflattened alpha colors reaching `nvim_set_hl`
- optional integrations working when their plugins are absent

For visual changes, inspect representative Lua, JavaScript/TypeScript, Java,
JSON, Markdown, CSS, and Git diff buffers. Check completion menus, floating
windows, diagnostics, search, folds, status lines, and picker UIs.

## Editing conventions

- Preserve existing user changes and avoid destructive repository operations.
- Keep the root package independent from the reference port directories.
- Prefer small semantic palette changes over hard-coded colors in group files.
- Keep syntax behavior language-agnostic unless a true Treesitter/LSP capture
  distinction requires otherwise.
- When adding a group module, update the relevant ordered integration list.
- Update the root README when adding a public variant, option, or export.

## Credits and attribution

This is an unofficial community theme inspired by Cursor and its visual design.
Cursor is a product and trademark of Anysphere, Inc.; this project is not
affiliated with or endorsed by Anysphere.

The modular Neovim organization is inspired by the author's
`github-theme.nvim` project. The earlier Cursor Neovim and Zed ports in this
repository were consulted as visual and coverage references, but the root
package is an independent implementation.
