--   vi: tw=100
-- lua/plugins/coq.lua @ Leonardo Valeri Manera 2022

if vim.fn.has('python3') then
    vim.g.coq_settings = {
        ["auto_start"] = 'shut-up',
        ["keymap.manual_complete_insertion_only"] = true
    }

    require("coq") {}

    require("coq_3p") {
        { src = "builtin/ada"     },
        { src = "builtin/c"       },
        { src = "builtin/clojure" },
        { src = "builtin/css"     },
        { src = "builtin/haskell" },
        { src = "builtin/html"    },
        { src = "builtin/js"      },
        { src = "builtin/php"     },
        { src = "builtin/syntax"  },
        { src = "builtin/xml"     },
        { src = "nvimlua", short_name = "nLUA", conf_only = true },
    }
end

