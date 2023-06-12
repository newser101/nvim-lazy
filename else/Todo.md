## complete
- lazy.lua
 performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",:
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

- autocmds.lua
- keymaps.lua
- bufferline: highlights = { .....
- statusline add gitsigns
>set statusline+=%{get(b:,'gitsigns_status','')}

## check
- check init.lau if something is missing/needed/can be done
- check keymaps

- lualine + navic
https://alpha2phi.medium.com/neovim-for-beginners-status-line-dd0c97fba978