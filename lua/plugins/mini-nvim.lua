--   vi: tw=100
-- lua/plugins/mini-nvim.lua @ Leonardo Valeri Manera 2023

-- mini-ai
require("mini.ai").setup()

-- mini-align
require("mini.align").setup()

-- mini-basics
require("mini.basics").setup({
    options = {
        basic = false
    },
})

-- mini-bracketed
require("mini.bracketed").setup()

-- mini-comment
require("mini.comment").setup({
    options = {
        custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
    }
})

-- mini-cursorword
require("mini.cursorword").setup()

-- mini-files
require("mini.files").setup({
    windows = {
        preview = true,
    }
})
-- <leader>o -> Mini-Files
vim.keymap.set('n', "<leader>o", ":lua MiniFiles.open()<CR>", { silent = true, desc = "Open Mini-Files" })

-- mini-move
require("mini.move").setup()

-- mini-splitjoin
require("mini.splitjoin").setup({
    mappings = {
        toggle = "",
        split = "<leader>s",
        join = "<leader>j",
    },
})

-- mini-starter
local starter = require("mini.starter")
starter.setup({
    items = {
        starter.sections.telescope(),
        {
            name = "Configuration",
            action = [[lua require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })]],
            section = "Actions",
        },
        {
            name = "Update Plugins",
            action = [[lua require("lazy").sync()]],
            section = "Actions",
        },
        {
            name = "Restore Plugins from lockfile",
            action = [[lua require("lazy").restore()]],
            section = "Actions",
        },
        starter.sections.builtin_actions(),
    },
    header = table.concat({
        [[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
        [[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
        [[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
        [[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
        [[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
        [[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
    },"\n"),
    content_hooks = {
        starter.gen_hook.indexing("all", nil),
        starter.gen_hook.aligning("center", "center"),
    },
})

-- mini-trailspace
require('mini.trailspace').setup()

