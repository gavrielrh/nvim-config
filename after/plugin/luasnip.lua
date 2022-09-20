local ls = require('luasnip')
local types = require('luasnip.util.types')

ls.config.set_config({
  -- This tells Luasnip to keep around the last snippet
  -- You can jump back to it even if you move outside the selection
  history = true,

  -- If you have dynamic snippets, it updates as you type
  updateevents = 'TextChanged,TextChangedI',

  -- Autosnippets
  enable_autosnippets = true,

  ext_opts = nil,
})

-- <c-k> is my expansion key
-- will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key
vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is for selecting within a list of options
-- This is useful for choice nodes
vim.keymap.set('i', '<c-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- shortcut to source luasnips file again, which will reload snippets
vim.keymap.set(
  'n',
  '<Leader><Leader>s',
  '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>'
)
