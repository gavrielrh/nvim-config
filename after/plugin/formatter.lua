local function prettier()
  return {
    exe = 'prettier',
    args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
    stdin = true,
  }
end

require('formatter').setup({
  logging = true,
  filetype = {
    javascript = { prettier },
    typescript = { prettier },
    javascriptreact = { prettier },
    typescriptreact = { prettier },
    vue = { prettier },
    ['javascript.jsx'] = { prettier },
    ['typescript.tsx'] = { prettier },
    markdown = { prettier },
    css = { prettier },
    json = { prettier },
    jsonc = { prettier },
    scss = { prettier },
    less = { prettier },
    yaml = { prettier },
    graphql = { prettier },
    html = { prettier },
  },
})

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])
