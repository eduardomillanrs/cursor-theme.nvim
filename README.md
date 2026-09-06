# cursor-theme.nvim

An unofficial Neovim port of Cursor's Dark, Light, and Dark Midnight themes.
The palettes are based on the checked-in Cursor VS Code sources in
`cursor-themes-for-zed/vscode-themes`.

## Variants

```vim
colorscheme cursor-dark
colorscheme cursor-light
colorscheme cursor-dark-midnight
```

`cursor` follows `vim.o.background`. Dark mode uses Cursor Dark by default:

```vim
colorscheme cursor
```

To make automatic dark mode use Midnight:

```lua
require('cursor-theme').setup({ dark = 'midnight' })
vim.cmd.colorscheme('cursor')
```

## Installation

With lazy.nvim:

```lua
{
    'eduardomillanrs/cursor-theme.nvim',
    lazy = false,
    priority = 1000,
}
```

## Configuration

```lua
require('cursor-theme').setup({
    dark = 'default',
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        functions = { italic = true },
    },
})
```

Both comments and functions are italic by default. The theme includes editor,
legacy syntax, Treesitter, LSP, Git, completion, picker, file explorer,
notification, statusline, and Markdown integrations for common Neovim plugins.

This community project is not affiliated with or endorsed by Anysphere.

## Ghostty

Ghostty theme files are available in `extras/ghostty`. Copy the desired file
to Ghostty's themes directory and select it with, for example:

```ini
theme = cursor-dark
```
