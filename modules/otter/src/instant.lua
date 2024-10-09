--!strict
local types = require("./types")
type Goal = types.Goal

local function instant(targetValue): Goal
	return {
		step = function()
			return {
				value = targetValue,
				complete = true,
			}
		end,
	}
end

return instant
