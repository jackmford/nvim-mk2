-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/snacks.nvim',
    opts = {
      input = {},
      terminal = {},
      picker = {
        actions = {
          opencode_send = function(...) return require('opencode').snacks_picker_send(...) end,
        },
        win = {
          input = {
            keys = {
              ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
            },
          },
        },
      },
    },
  },
  {
    'nickjvandyke/opencode.nvim',
    version = '*',
    init = function()
      local opencode_cmd = 'opencode --port'
      local snacks_terminal_opts = {
        win = {
          position = 'right',
          enter = true,
          on_win = function(win) require('opencode.terminal').setup(win.win) end,
        },
      }

      vim.g.opencode_opts = {
        server = {
          start = function() require('snacks.terminal').open(opencode_cmd, snacks_terminal_opts) end,
          stop = function() require('snacks.terminal').get(opencode_cmd, snacks_terminal_opts):close() end,
          toggle = function() require('snacks.terminal').toggle(opencode_cmd, snacks_terminal_opts) end,
        },
      }

      vim.o.autoread = true
    end,
    config = function()
      vim.keymap.set({ 'n', 'x' }, '<leader>oa', function() require('opencode').ask('', { submit = true }) end, { desc = 'Opencode: Ask' })

      vim.keymap.set({ 'n', 'x' }, '<leader>oo', function() require('opencode').select() end, { desc = 'Opencode: Actions' })
      vim.keymap.set({ 'n', 't' }, '<leader>ot', function() require('opencode').toggle() end, { desc = 'Opencode: Toggle' })

      vim.keymap.set({ 'n', 'x' }, 'go', function() return require('opencode').operator '@this ' end, { desc = 'Opencode: Add range', expr = true })
      vim.keymap.set('n', 'goo', function() return require('opencode').operator '@this ' .. '_' end, { desc = 'Opencode: Add line', expr = true })
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    init = function() vim.g.tmux_navigator_no_mappings = 1 end,
  },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function() vim.fn['mkdp#util#install']() end,
  },
}
