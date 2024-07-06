local M = {}

M.setup = function(opts)
	print("setup")

  vim.keymap.set('n', '<leader>hh', function ()
    print("Hello")
  end, { desc = "New epitech header" })
end

return M
