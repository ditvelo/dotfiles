require'nvim-tree'.setup {
    -- 关闭文件时自动关闭
    -- auto_close = true,
    -- 不显示 git 状态图标
    git = {
        enable = true
    }
}
-- 目录后加上反斜杠 /
vim.g.nvim_tree_add_trailing = 1
