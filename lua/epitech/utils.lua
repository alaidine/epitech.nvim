local M = {}

M.split = function(input, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(input, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

M.header = function()
  local supported_filetype = { "c" }
  local path = vim.api.nvim_buf_get_name(0)
  local current_filetype = vim.bo.filetype
  local splitted_path = M.split(path, "/")
  local filename = vim.fn.expand("%")

  P(splitted_path)

  local buffer = 0
  local start_line = 0
  local end_line = 0
  local project_name = ""
  local description = ""

  if current_filetype == "c" == false then
    print("epitech.nvim error: unsupported filetype")
    return
  end

  local lines = {
    "/*",
    string.format("** EPITECH PROJECT, %d", os.date("%Y")),
    string.format("** %s", filename),
    "** File description:",
    string.format("** %s", filename),
    "*/",
    ""
  }

  vim.api.nvim_buf_set_lines(buffer, start_line, end_line, true, lines)
end

return M
