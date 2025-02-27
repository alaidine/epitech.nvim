local M = {}

M.split = function(input, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(input, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

M.header = function()
  local current_filetype = vim.bo.filetype

  if current_filetype == "c" == false then
    print("epitech.nvim error: unsupported filetype")
    return
  end

  local buffer = 0
  local start_line = 0
  local end_line = 0
  local project_name = vim.fn.input("Enter a project name: ", "", "file")
  local description = vim.fn.input("Enter a description: ", "", "file")

  local lines = {
    "/*",
    string.format("** EPITECH PROJECT, %d", os.date("%Y")),
    string.format("** %s", project_name),
    "** File description:",
    string.format("** %s", description),
    "*/",
    "",
  }

  vim.api.nvim_buf_set_lines(buffer, start_line, end_line, true, lines)
end

return M
