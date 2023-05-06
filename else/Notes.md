## allgem
- All plugins with lazy=false are loaded. This includes sourcing /plugin and /ftdetect files. (/after will not be sourced yet)
- All files from /plugin and /ftdetect directories in you rtp are sourced (excluding /after)
- Any lua file in ~/.config/nvim/lua/plugins/*.lua will be automatically merged in the main plugin spec

## LazyNvim
### General Settings
The files autocmds.lua, keymaps.lua, lazy.lua and options.lua under lua/config will be automatically loaded at the appropriate time, so you don't need to require those files manually. LazyVim comes with a set of default config files that will be loaded before your own.


The files autocmds.lua, keymaps.lua, lazy.lua and options.lua under lua/config will be automatically loaded at the appropriate time, so you don't need to require those files manually. LazyVim comes with a set of default config files that will be loaded before your own.

~/.config/nvim
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
└── init.toml

DANGER
Do not require autocmds, keymaps, lazy or options under lua/config/ or lazyvim.config manually. LazyVim will load those files automatically.

DANGER
Do not require autocmds, keymaps, lazy or options under lua/config/ or lazyvim.config manually. LazyVim will load those files automatically.