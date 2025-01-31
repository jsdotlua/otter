--!strict
local Otter = require("@pkg/@jsdotlua/react-otter")
local React = require("@pkg/@jsdotlua/react")
local ReactOtter = require("@pkg/@jsdotlua/react-otter")
local ReactRoblox = require("@pkg/@jsdotlua/react-roblox")

local Buttons = require("../Components/Buttons")
local measureAndReport = require("../measureAndReport")
local randomSpringGoal = require("./randomSpringGoal")

local STEP_COUNT = 10000

local function HookWithSpring(_props)
	local animationValue, setGoal
	animationValue, setGoal = ReactOtter.useAnimatedBinding(0, function()
		setGoal(randomSpringGoal())
	end)

	React.useEffect(function()
		setGoal(randomSpringGoal())
	end, {})

	return React.createElement("Frame", {
		Size = UDim2.new(0, 100, 0, 100),
		Position = animationValue:map(function(value: number)
			return UDim2.new(0, value, 0, value)
		end),
	}, React.createElement(Buttons))
end

return function()
	local LocalPlayer = game:GetService("Players").LocalPlayer
	assert(LocalPlayer, "LocalPlayer not available")

	local container = Instance.new("ScreenGui")
	container.Parent = LocalPlayer.PlayerGui
	local root = ReactRoblox.createLegacyRoot(container)

	root:render(React.createElement(HookWithSpring))
	-- even on a legacy root, effects still queue up for the next frame
	task.wait(0)

	local AnimationStepSignal = Otter.__devAnimationStepSignal

	measureAndReport(function()
		for _ = 1, STEP_COUNT do
			AnimationStepSignal:Fire()
		end
	end, STEP_COUNT)

	root:unmount()
end
