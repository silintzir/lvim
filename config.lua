vim.opt.hlsearch = false

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"
vim.g.gruvbox_contrast_dark = "hard"
lvim.transparent_window = true
lvim.line_wrap_cursor_movement = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":lua require('spectre').open()<cr>"

-- better putting
lvim.keys.visual_mode["p"] = "pgvy"
-- better yanking
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.visual_mode["y"] = "ygv<ESC>"
-- hop
lvim.keys.normal_mode["S"] = ":lua require('hop').hint_words()<CR>"
-- quickfix list
lvim.keys.normal_mode["<C-j>"] = ":cnext<CR>"
lvim.keys.normal_mode["<C-k>"] = ":cprev<CR>"
-- forward delete
lvim.keys.insert_mode["<C-l>"] = "<del>"
-- pattern replace
lvim.keys.normal_mode["s*"] = ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn"
lvim.keys.visual_mode["s*"] = '"sy:let @/=@s<CR>cgn'

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.open_on_setup = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.nvimtree.show_icons.git = 0

-- update lualine style
local custom_gruvbox = require "custom_gruvbox"
local green = custom_gruvbox.palette.green
local darkgray = custom_gruvbox.palette.darkgray
-- custom_gruvbox.theme.normal.c.bg = "none"
-- custom_gruvbox.theme.inactive.c.bg = "none"
-- custom_gruvbox.theme.command.c.bg = "none"
lvim.builtin.lualine.options.theme = custom_gruvbox.theme
lvim.builtin.lualine.on_config_done = function(lualine)
    local config = lualine.get_config()
    config.sections.lualine_b[2] = { "filename", path = 1, color = { bg = green, fg = darkgray, gui = "bold" } }
    lualine.setup(config)
end

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "css",
    "rust",
    "java",
    "yaml",
}

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" } -- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.

-- Additional Plugins
lvim.plugins = {
    { "folke/zen-mode.nvim" },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    { "rktjmp/lush.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    { "p00f/nvim-ts-rainbow" },
    { "windwp/nvim-ts-autotag" },
    { "windwp/nvim-spectre" },
    { "phaazon/hop.nvim" },
    { "jose-elias-alvarez/nvim-lsp-ts-utils" },
    { "tpope/vim-surround" },
    { "sindrets/diffview.nvim" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "dstein64/vim-startuptime" },
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.context_commentstring.enable = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {
        exe = "stylua",
        filetypes = {
            "lua",
        },
    },
    {
        exe = "prettier",
        filetypes = {
            "typescript",
            "typescriptreact",
            "javascript",
            "javascriptreact",
        },
    },
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {
        exe = "eslint",
        filetypes = {
            "typescript",
            "typescriptreact",
            "javascript",
            "javascriptreact",
        },
    },
}

lvim.autocommands.custom_groups = {
    -- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
    { "Filetype", "php", "setlocal ts=4 sw=4" },
    { "Filetype", "go", "setlocal ft=php ts=4 sw=4" },
    { "Colorscheme", "*", "hi BufferCurrent gui=bold guifg=#ec5f67" },
    { "Colorscheme", "*", "hi BufferTabpageFill guibg=none" },
    { "Colorscheme", "*", "hi GitSignsAdd guibg=none" },
}
