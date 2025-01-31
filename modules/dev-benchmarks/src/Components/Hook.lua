--!strict
local React = require("@pkg/@jsdotlua/react")
local ReactOtter = require("@pkg/@jsdotlua/react-otter")

local Buttons = require("./Buttons")

local function Hook(props)
	local animationValue, setGoal = ReactOtter.useAnimatedBinding(0, props.onComplete)

	React.useEffect(function()
		setGoal(props.goal)
	end, { props.goal })

	return React.createElement("Frame", {
		Size = UDim2.new(0, 100, 0, 100),
		Position = animationValue:map(function(value: number)
			local progress = value / props.stepCount
			return UDim2.new(progress, 0, progress, 0)
		end),
	}, React.createElement(Buttons))
end

return Hook
