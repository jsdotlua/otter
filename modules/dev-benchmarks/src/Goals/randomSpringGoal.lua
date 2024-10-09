--!strict
local Otter = require("@pkg/@jsdotlua/react-otter")

local function randomSpringGoal()
	return Otter.spring(math.random() * 1000, {
		frequency = 1 + math.random() * 4,
		dampingRatio = 0.5 + math.random() * 0.5,
	})
end

return randomSpringGoal
