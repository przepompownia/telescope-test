local keymap = require('vim.keymap')

keymap.set('v', ',w', function()
  local query = 'test'
  require('telescope.builtin').live_grep({
    default_text = query,
  })
end)
vim.cmd([[
  vnoremap ,a :<c-u>lua require('telescope.builtin').live_grep({ default_text = 'test' })<cr>
]])
