local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = ","

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
require('lazy')
if not status_ok then
    return
end

-- Start setup
lazy.setup({
    pkg = {
        enabled = true,
        cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
        -- the first package source that is found for a plugin will be used.
        sources = {
            "lazy",
            "rockspec", -- will only be used when rocks.enabled is true
            "packspec",
            vim.fn.stdpath("config") .. "/lua/plugins"
        },
    },
    rocks = {
        -- disable rockspec
        -- see: https://github.com/folke/lazy.nvim?tab=readme-ov-file#%EF%B8%8F-requirements
        -- https://github.com/folke/lazy.nvim/issues/1576
        enabled = false,
        root = vim.fn.stdpath("data") .. "/lazy-rocks",
        server = "https://nvim-neorocks.github.io/rocks-binaries/",
    },
    spec = {
        --[[
        Colorscheme:
        The colorscheme should be available when starting Neovim.
        --]]

        {
            'catppuccin/nvim',
            name = 'catppuccin',
            lazy = false,
            priority = 1000
        },

        -- Other color schemes:
        --{ 'rebelot/kanagawa.nvim', lazy = true },
        --{ 'tanvirtin/monokai.nvim', lazy = true },
        --{ 'https://github.com/rose-pine/neovim', name = 'rose-pine', lazy = true },

        -- Icons
        { 'kyazdani42/nvim-web-devicons',        lazy = true },

        -- Statusline
        {
            'nvim-lualine/lualine.nvim',
            dependencies = {
                'kyazdani42/nvim-web-devicons',
                'lewis6991/gitsigns.nvim',
            },
        },

        -- Treesitter
        { 'nvim-treesitter/nvim-treesitter',     build = ':TSUpdate' },

        -- Indent line
        { 'lukas-reineke/indent-blankline.nvim', main = 'ibl',       opts = {} },

        -- Autopair
        {
            'windwp/nvim-autopairs',
            event = 'InsertEnter',
            config = function()
                require('nvim-autopairs').setup {}
            end
        },

        -- Nvim Tree
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
        },

        -- LSP
        { 'neovim/nvim-lspconfig' },

        -- Autocomplete
        {
            'hrsh7th/nvim-cmp',
            -- load cmp on InsertEnter
            event = 'InsertEnter',
            -- these dependencies will only be loaded when cmp loads
            -- dependencies are always lazy-loaded unless specified otherwise
            dependencies = {
                'L3MON4D3/LuaSnip',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-buffer',
                'saadparwaiz1/cmp_luasnip',
            },
        },
    }
})
