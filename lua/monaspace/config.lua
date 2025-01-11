local M = {}
local Utils = require("monaspace.utils")

local defaults = {
	use_default = true,
	style_map = {
		bold = {},
		italic = {},
		bold_italic = {},
	},
}

function M.enable()
	Utils.normalize_hls()

	local styles = {
		bold = { bold = true },
		italic = { italic = true },
		bold_italic = { bold = true, italic = true },
	}

	for option, groups in pairs(M.options.style_map) do
		for group, setting in pairs(groups) do
			if setting then
				Utils.set_hl_style(group, styles[option])
			end
		end
	end
end

function M.setup(options)
	M.options = vim.tbl_deep_extend("force", defaults, options or {})
	if M.options.use_default then
		local default_groups = require("monaspace.groups")
		M.options.style_map = vim.tbl_deep_extend("force", {}, default_groups, M.options.style_map or {})
	end
	vim.api.nvim_create_autocmd("VimEnter", {
		callback = function()
			M.enable()
		end,
		group = vim.api.nvim_create_augroup("MonaspaceSetup", { clear = true }),
	})
end

return M
