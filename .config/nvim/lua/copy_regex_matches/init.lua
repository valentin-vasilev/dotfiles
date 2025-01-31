M = {}

function M.CopyRegexMatchesToRegister(regex_pattern, register)
	if not regex_pattern or regex_pattern == "" then
		print("Error: No regex provided")
		return
	end

	local regex = vim.regex(regex_pattern)
	local matches = {}

	local buf_line_count = vim.api.nvim_buf_line_count(0)
	for line_num = 0, buf_line_count - 1 do
		local line = vim.api.nvim_buf_get_lines(0, line_num, line_num + 1, false)[1]
		local start, finish = regex:match_str(line)
    while start do
      table.insert(matches, line:sub(start + 1, finish))
      line = line:sub(finish + 1)
      start, finish = regex:match_str(line)
    end
	end

  if #matches > 0 then
    vim.fn.setreg(register, table.concat(matches, "\n"))
    print("Copied " .. #matches .. " matches to register " .. (register or '"+'))
  else
    print("No matches found")
  end
end

vim.api.nvim_create_user_command("CopyRegexMatchesToRegister", function()
  local input = vim.fn.input("Enter regex register(opt): ")
  vim.cmd("redraw")
  local parts = vim.split(input, " ")
  local regex = parts[1]
  local register = parts[2] or "+" -- System clipboard as default register
  if regex ~= "" then
    register = register or "+"
    M.CopyRegexMatchesToRegister(regex, register)
  else
    print("No regex provided")
  end
end, { nargs = "?" })

return M
