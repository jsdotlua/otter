--!strict
local Otter = require("@pkg/@jsdotlua/react-otter")
local Roact = require("@pkg/@jsdotlua/roact-compat")

local measureAndReport = require("../measureAndReport")

local randomSpringGoal = require("./randomSpringGoal")
local Buttons = require("../Legacy/Buttons")

local STEP_COUNT = 10000

local LegacyWithSpring = Roact.Component:extend("LegacyWithSpring")

function LegacyWithSpring:init()
	local position, updatePosition = Roact.createBinding(0)

	self.position = position
	self.motor = Otter.createSingleMotor(0)

	self.motor:onStep(updatePosition)
	self.motor:onComplete(function()
		self.motor:setGoal(randomSpringGoal())
	end)
end

function LegacyWithSpring:didMount()
	self.motor:setGoal(randomSpringGoal())
end

function LegacyWithSpring:render()
	return Roact.createElement("Frame", {
		Size = UDim2.new(0, 100, 0, 100),
		Position = self.position:map(function(value: number)
			return UDim2.new(0, value, 0, value)
		end),
	}, Roact.createElement(Buttons))
end

return function()
	local LocalPlayer = game:GetService("Players").LocalPlayer
	assert(LocalPlayer, "LocalPlayer not available")

	local container = Instance.new("ScreenGui")
	container.Parent = LocalPlayer.PlayerGui
	local handle = Roact.mount(Roact.createElement(LegacyWithSpring), container)

	local AnimationStepSignal = Otter.__devAnimationStepSignal

	measureAndReport(function()
		for _ = 1, STEP_COUNT do
			AnimationStepSignal:Fire()
		end
	end, STEP_COUNT)

	Roact.unmount(handle)
end
