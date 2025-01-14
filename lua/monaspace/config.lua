local Api = require("monaspace.api")

local M = {}

local defaults = {
	use_default = true,
	style_map = {
		bold = {},
		italic = {},
		bold_italic = {},
	},
}

function M.setup(options)
	M.options = vim.tbl_deep_extend("force", defaults, options or {})

	if M.options.use_default then
		local default_groups = require("monaspace.groups")
		M.options.style_map = vim.tbl_deep_extend("force", {}, default_groups, M.options.style_map or {})
	end

	vim.api.nvim_create_user_command("MonaspaceLoad", Api.load, {
		desc = "Load Monaspace font configuration",
		bang = true,
		nargs = 0,
	})

	vim.api.nvim_create_autocmd({ "ColorScheme", "FileType" }, {
		callback = function()
			Api.load()
		end,
		group = vim.api.nvim_create_augroup("MonaspaceSetup", { clear = true }),
	})
end

return M
