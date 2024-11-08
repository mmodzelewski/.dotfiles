-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('ThePrimeagen/harpoon')
    use('ThePrimeagen/vim-be-good')
    use('mbbill/undotree')
    use { 'saecki/crates.nvim', tag = 'v0.4.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('tpope/vim-fugitive')
    use { 'sindrets/diffview.nvim', requires = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippet Collection (Optional)
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use 'nvim-treesitter/nvim-treesitter-context'
    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
            vim.diagnostic.config({
                virtual_lines = false,
            })
        end,
    })
    use 'sainnhe/sonokai'
--    use {
--        "zbirenbaum/copilot.lua",
--        cmd = "Copilot",
--        event = "InsertEnter",
--        config = function()
--            require("copilot").setup({
--                suggestion = {
--                    enabled = true,
--                    auto_trigger = true,
--                    keymap = {
--                        accept = "<M-l>",
--                        accept_word = false,
--                        accept_line = false,
--                        next = "<M-]>",
--                        prev = "<M-[>",
--                        dismiss = "<C-]>",
--                    },
--                }
--            })
--        end,
--    }
    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release', -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
        config = function()
            require('gitsigns').setup()
        end,
    }

    use {
        'stevearc/oil.nvim',
        config = function() require('oil').setup() end
    }
end)
