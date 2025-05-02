local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "vim", "javascript", "html", "css", "yaml", "c", "cpp", "xml", "bash", "dockerfile"}, 
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = false,
        })
    end
}

return M

