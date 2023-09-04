return {
  'jay-babu/mason-null-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'williamboman/mason.nvim',
    'jose-elias-alvarez/null-ls.nvim',
  },
  config = function()
    require('mason').setup()
    require('mason-null-ls').setup({
      automatic_installation = false,
      handlers = {},
      ensure_installed = {
        'eslint_d',
        'stylua',
      },
    })

    local null_ls = require('null-ls')

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.code_actions.gitsigns,
        -- Looks like sources from eslint_d are auto-provided,
        -- because manual supply resolves to double clients.
      },
      on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
          local augroup = vim.api.nvim_create_augroup('NullLsFormat', {})

          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                name = 'null-ls',
                bufnr = bufnr,
              })
            end,
          })
        end
      end,
    })
  end,
}
