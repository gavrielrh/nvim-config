dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/Users/grachaelhomann/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000,
  }
}
