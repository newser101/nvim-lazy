-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- function to add desc to opts
local function new_opts(text)
  local newtable = { noremap = true, silent = true }
  newtable.desc = text
  return newtable
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- my keymaps BEGINN
-- Normal --
keymap("n", "<leader>p", ":exec 'w | !python3 %'<CR>", new_opts("run pythonfile")) --run python file
-- keymap("n", "<leader>p", ":exec 'w | !python3 %'<CR>", opts)                   --run python file
keymap("n", "<leader>b", ":exec 'w | !bash %'<CR>", new_opts("run bash file")) -- run bash file
keymap("n", "<leader>l", ":exec 'w | !lua %'<CR>", new_opts("run lua file"))   -- run lua file
keymap("n", "<leader>w", ":exec 'w' <CR>", opts)                               -- save file
keymap("n", "<leader>q", ":exec 'q' <CR>", opts)                               -- quit file

keymap("i", "<leader>l", "<C-Right>", new_opts("jump out"))                    -- jump next

-- split windows
keymap("n", "<leader>sd", "<C-W>v", new_opts("split vertical"))
keymap("n", "<leader>sf", "<C-W>s", new_opts("split horizontal"))
-- my keymaps END

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", new_opts("window left"))
keymap("n", "<C-j>", "<C-w>j", new_opts("window down"))
keymap("n", "<C-k>", "<C-w>k", new_opts("window up"))
keymap("n", "<C-l>", "<C-w>l", new_opts("window right"))

-- Move Lines
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", new_opts("clear highlights"))

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", new_opts("NvimTreeToggle"))

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", new_opts("find files"))
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", new_opts("live grep"))
keymap("n", "<leader>fp", ":Telescope projects<CR>", new_opts("projects"))
keymap("n", "<leader>fb", ":Telescope buffers<CR>", new_opts("buffers"))

-- Git
keymap("n", "<leader>gg", "<cmd>lua lazygit_toggle()<CR>", new_opts("lazygit"))

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", new_opts("Comment"))
keymap(
  "x",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  new_opts("Blockcomment")
)

-- markdown --
-- Glow
keymap("n", "md", "<cmd>Glow<CR>", new_opts("markdown Glow"))

-- illuminate
keymap("n", "<a-n>", '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', opts)
keymap("n", "<a-p>", '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', opts)

-- indentblanklines
keymap("n", "<leader>it", ":IndentBlanklineToggle<CR>", new_opts("toggle blank lines"))

-- folke/todocomments
keymap("n", "<leader>st", "<cmd>TodoTelescope<cr>", new_opts("Telescope Todo"))
keymap("n", "<leader>sl", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", new_opts("Todo/Fix/Fixme"))
keymap("n", "<leader>sr", "<cmd>TodoTrouble<cr>", new_opts("TodoTrouble"))
keymap("n", "<leader>sq", "<cmd>TodoQuickFix<cr>", new_opts("Qickfix"))

-- lsp global diagnostic
-- keymap("n", "gl", vim.diagnostic.open_float)
-- keymap("n", "<leader>lk", vim.diagnostic.goto_prev)
-- keymap("n", "<leader>lj", vim.diagnostic.goto_next)
-- keymap("n", "<leader>ll", vim.diagnostic.setloclist)

-- DAP
--keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
--keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
--keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
--keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
--keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
--keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
--keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
--keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
--keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
