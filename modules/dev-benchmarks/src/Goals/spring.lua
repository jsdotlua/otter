--!strict
local Otter = require("@pkg/@jsdotlua/react-otter")

local measureAndReport = require("../measureAndReport")

local randomSpringGoal = require("./randomSpringGoal")

local STEP_COUNT = 10000

return function()
	local motor = Otter.createSingleMotor(0)

	motor:onComplete(function()
		motor:setGoal(randomSpringGoal())
	end)

	motor:setGoal(randomSpringGoal())

	local AnimationStepSignal = Otter.__devAnimationStepSignal

	measureAndReport(function()
		for _ = 1, STEP_COUNT do
			AnimationStepSignal:Fire()
		end
	end, STEP_COUNT)
end
