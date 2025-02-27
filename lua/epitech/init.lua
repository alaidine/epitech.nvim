local M = {}

local utils = require("epitech.utils")

M.setup = function(opts)
  vim.keymap.set("n", "<leader>hh", utils.header, { desc = "New epitech header" })
end

return M
