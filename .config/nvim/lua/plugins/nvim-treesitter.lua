return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { 
                                 "lua", 
                                 "vim", 
                                 "html", 
                                 "css", 
                                 "javascript", 
                                 "c", 
                                 "cpp", 
                                 "xml", 
                                 "yaml", 
                                 "bash", 
                                 "dockerfile"
                               }, 
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = false,
        })
    end
}

