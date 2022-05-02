local packer = require("packer")
packer.startup(
    {
        -- 所有插件的安装都书写在 function 中
        function()
            -- 包管理器
            use 'wbthomason/packer.nvim'

            -- 中文文档
            use 'yianwillis/vimcdoc'

            -- nvim-tree文件树插件
            use {
                'kyazdani42/nvim-tree.lua',
                requires = 'kyazdani42/nvim-web-devicons',
                config = function()
                    -- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
                    require("conf.nvim-tree")
                end
            }

            -- 括号补全
            use {
                'windwp/nvim-autopairs',
                config = function()
                    require("conf.nvim-autopairs")
                end
            }

            -- 缩进提示
            use {
                'lukas-reineke/indent-blankline.nvim',
                config = function()
                    require("conf.indent-blankline")
                end
            }

            -- 自动保存
            use {
                'Pocco81/AutoSave.nvim',
                config = function()
                    require("conf.AutoSave")
                end
            }

            -- 自动恢复光标位置
            use {
                'ethanholz/nvim-lastplace',
                config = function()
                    require("conf.nvim-lastplace")
                end
            }

            -- 自动会话管理
            use {
                'rmagatti/auto-session',
                config = function()
                    require("conf.auto-session")
                end
            }

            -- LSP 基础服务
            use {
                'neovim/nvim-lspconfig',
                config = function()
                    require("conf.nvim-lspconfig")
                end
            }

            -- 自动安装 LSP
            use {
                'williamboman/nvim-lsp-installer',
                config = function()
                    require("conf.nvim-lsp-installer")
                end
            }

            -- LSP UI 美化
            use {
                'tami5/lspsaga.nvim',
                config = function()
                    require("conf.lspsaga")
                end
            }

            -- LSP 进度提示
            use {
                'j-hui/fidget.nvim',
                config = function()
                    require("conf.fidget")
                end
            }

            -- 搜索时显示条目
--            use {
--                "kevinhwang91/nvim-hlslens",
--                config = function()
--                    require("conf.nvim-hlslens")
--                end
--            }

        end,

        -- 使用浮动窗口
        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
    }
)

-- 实时生效配置
vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)
