local function find_map(lhs)
	local maps = vim.api.nvim_get_keymap("n")

	for _, map in ipairs(maps) do
		if map.lhs == lhs then
			return map
		end
	end
end

describe("epitech", function()
	before_each(function()
		pcall(vim.keymap.del, "n", "blahblah")
		require("epitech")._clear()
	end)

	it("can be required", function()
		require("epitech")
	end)

	it("cat push a single mapping", function()
		local rhs = "echo 'This is a test'"
		require("epitech").push("test1", "n", {
			blahblah = rhs,
		})

		local maps = vim.api.nvim_get_keymap("n")
		local found = find_map("blahblah")
		assert(found.rhs == rhs)
	end)

	it("can delete mapping after pop: no existing", function()
		local rhs = "echo 'This is a test'"
		require("epitech").push("test1", "n", {
			blahblah = rhs,
		})

		local maps = vim.api.nvim_get_keymap("n")
		local found = find_map("blahblah")
		assert(rhs == found.rhs)

		require("epitech").pop("test1", "n")
		local after_pop = find_map("blahblah")
		assert(nil == after_pop)
	end)

	it("can delete mapping after pop: yes existing", function()
		vim.keymap.set("n", "blahblah", "echo 'OG Mapping'")

		local rhs = "echo 'This is a test'"
		require("epitech").push("test1", "n", {
			blahblah = rhs,
		})

		local maps = vim.api.nvim_get_keymap("n")
		local found = find_map("blahblah")
		assert(rhs == found.rhs)

		require("epitech").pop("test1", "n")
		local after_pop = find_map("blahblah")
		assert("echo 'OG Mapping'" == after_pop.rhs)
	end)
end)
