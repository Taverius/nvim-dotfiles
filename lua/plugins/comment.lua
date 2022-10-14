--   vi: tw=100
-- lua/plugins/comment.lua @ Leonardo Valeri Manera 2022

require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
    })

