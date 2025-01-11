local M = {}

function M.set_hl_style(group, style)
	local hl = vim.api.nvim_get_hl(0, { name = group })
	style = style or {}
	local is_bold = style.bold or false
	local is_italic = style.italic or false

	-- Preserve original settings
	local new_hl = vim.tbl_extend("force", hl, {
		bold = is_bold,
		italic = is_italic,
		underline = false,
		undercurl = false,
		strikethrough = false,
		reverse = false,
		force = true,
	})

	if new_hl.cterm then
		new_hl.cterm.bold = is_bold
		new_hl.cterm.italic = is_italic
	end

	vim.api.nvim_set_hl(0, group, new_hl)
end

function M.normalize_hls()
	local all_groups = vim.api.nvim_get_hl(0, {})
	for group, _ in pairs(all_groups) do
		M.set_hl_style(group)
	end
	return all_groups
end

M.set_hl_style("Boolean", {})

return M
