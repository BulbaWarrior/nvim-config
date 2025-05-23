-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', --tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- use {
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    --     config = function()
    --         require("rose-pine").setup()
    --         -- vim.cmd('colorscheme rose-pine')
    --     end
    -- }
    use {
        'folke/tokyonight.nvim',
        config = function()
            require('tokyonight').setup()
            vim.api.nvim_set_hl(0, '@lsp.type.typeParameter.rust', { fg = '#f75385' })
        end
    }
    use "sindrets/diffview.nvim"
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'
    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    -- for jupyter notebooks
    use {
        'goerz/jupytext.vim',
        config = function()
            vim.g.jupytext_fmt = 'py:percent'
        end
    }
    use {
        'GCBallesteros/vim-textobj-hydrogen',
        requires = {
            { 'kana/vim-textobj-user' }
        }
    }
    use {
        "linux-cultist/venv-selector.nvim",
        branch = "regexp",
        requires = {
            "neovim/nvim-lspconfig",
            "nvim-telescope/telescope.nvim",
            "mfussenegger/nvim-dap-python"
        },
        config = function()
            require('venv-selector').setup {}
        end
    }
    -- use {
    --     "kiyoon/jupynium.nvim",
    --     run = "python -m pip --user .",
    --     config = function()
    --         require('jupynium').setup{
    --             python_host = 'python3'
    --         }
    --     end
    -- }
    -- use { "kiyoon/jupynium.nvim", run = "conda run --no-capture-output -n jupynium pip install ." }
    use { "rcarriga/nvim-notify" }   -- optional
    use { "stevearc/dressing.nvim" } -- optional, UI for :JupyniumKernelSelect
    -- jupyter shit end
    -- coq
    use "whonore/Coqtail"
    use {
        "tomtomjhj/coq-lsp.nvim",
        config = function()
            require("coq-lsp").setup {}
        end
    }
    --
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        "windwp/nvim-autopairs",
    }
    use {
        "gbprod/yanky.nvim"
    }
    use {
        "NvChad/nvterm",
        config = function()
            require("nvterm").setup()
        end
    }
    use { 'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup {}
    end
    }
    use {
        'Julian/lean.nvim',
        requires = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
        }
    }

    use { "kylechui/nvim-surround", config = function()
        require('nvim-surround').setup {}
    end }

    use { "nvim-treesitter/nvim-treesitter-context", config = function()
        require('treesitter-context').setup {}
    end }
    use { "lukas-reineke/indent-blankline.nvim", config = function()
        require('ibl').setup {
            scope = { enabled = false },
        }
    end
    }

    use {
        'j-hui/fidget.nvim',
        -- tag = 'legacy',
        config = function()
            require("fidget").setup {
                -- options
            }
        end,
    }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use {"HakonHarnes/img-clip.nvim"}
    use {'ShinKage/idris2-nvim',
        requires = {'neovim/nvim-lspconfig', 'MunifTanjim/nui.nvim'},
        config = function()
            require('idris2').setup({})
        end
    }

    local enabled, load = pcall(function()
        return require('main.yadeps')
    end)

    if enabled then
        load(use)
    end
end)
