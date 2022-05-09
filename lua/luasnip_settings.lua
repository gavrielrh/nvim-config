local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
    -- This tells Luasnip to keep around the last snippet
    -- You can jump back to it even if you move outside the selection
    history = true,

    -- If you have dynamic snippets, it updates as you type
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets
    enable_autosnippets = true,

    ext_opts = nil,
}
