local dap = require('dap')

-- PHP
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { '~/vscode-php-debug/out/phpDebug.js' }
}
dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9000,
    }
}

-- Python
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { '~/vscode-php-debug/out/phpDebug.js' }
}

-- Rust
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = "lldb"
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {}
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
