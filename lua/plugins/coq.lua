--   vi: tw=100
-- lua/plugins/coq.lua @ Leonardo Valeri Manera 2022

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
  { src = "nvimlua", short_name = "nLUA" },
}

