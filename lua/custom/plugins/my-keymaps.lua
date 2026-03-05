return {
  -- Vim nav/usage
  vim.keymap.set('n', '<leader>q', function()
    pcall(function() vim.cmd 'wall' end)
    vim.cmd 'qa!'
  end, { desc = 'Write all and quit' }),
  vim.keymap.set('n', '<leader>w', '<cmd>w!<CR>'),
  vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>'),
  vim.keymap.set('n', '<leader>`', '<cmd>b#<CR>'),
  vim.keymap.set('n', 'L', 'g_'),
  vim.keymap.set('n', 'H', '^'),

  vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', { desc = 'Move focus to the left window' }),
  vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', { desc = 'Move focus to the right window' }),
  vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', { desc = 'Move focus to the lower window' }),
  vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', { desc = 'Move focus to the upper window' }),

  -- Floaterm
  vim.keymap.set('n', '<leader>t', '<cmd>FloatermToggle<CR>'),

  -- Markdown Prev
  vim.keymap.set('n', '<leader>cp', '<cmd>MarkdownPreviewToggle<CR>'),
}
