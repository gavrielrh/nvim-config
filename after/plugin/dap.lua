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

