local Utils = require("monaspace.utils")

local M = {}

local styles = {
	bold = { bold = true },
	italic = { italic = true },
	bold_italic = { bold = true, italic = true },
}

function M.load()
	Utils.normalize_hls()

	local style_map = require("monaspace.config").options.style_map
	for option, groups in pairs(style_map) do
		for group, setting in pairs(groups) do
			if setting then
				Utils.set_hl_style(group, styles[option])
			end
		end
	end
end

return M
