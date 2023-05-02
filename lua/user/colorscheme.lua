local M={
    'folke/tokyonight',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    }

M.name = "tokionight-night" -- aviable night, stormm, moon, day
function M.config()
    local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
    if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
    end
end

return M

-- Todo
-- for lualine:
-- require('lualine').setup {
--     options = {
--       -- ... your lualine config
--       theme = 'tokyonight'
--       -- ... your lualine config
--     }
--   }