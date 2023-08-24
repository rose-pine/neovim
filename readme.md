# My Neovim Theme (Modified Rose Pine)

## IMPORTANT NOTE

I often make changes to this theme, so if you want to use this theme, make a
fork if you don't want random changes I make.

## Install

**[Paq](https://github.com/savq/paq-nvim)**

```lua
require('paq')({
  { 'NycRat/rose-pine', as = 'rose-pine' }
})
```

**[lazy.nvim](https://github.com/folke/lazy.nvim)**

```lua
require("lazy").setup({
  { 'NycRat/rose-pine', name = 'rose-pine' }
})
```

**[packer.nvim](https://github.com/wbthomason/packer.nvim)**

```lua
require('packer').startup(function(use)
  use({ 'NycRat/rose-pine', as = 'rose-pine' })
end)
```
