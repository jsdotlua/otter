--!strict
local Otter = require("@pkg/@jsdotlua/react-otter")
local React = require("@pkg/@jsdotlua/react")

local Buttons = require("./Buttons")

local function FunctionWithBinding(props)
	local animationValue, setAnimationValue = React.useBinding(0)
	local motor = React.useRef(nil :: Otter.SingleMotor?)
	if not motor.current then
		local newMotor = Otter.createSingleMotor(0)

		newMotor:onStep(setAnimationValue)
		newMotor:onComplete(props.onComplete)

		motor.current = newMotor
	end

	React.useEffect(function()
		assert(motor.current, "type checking")
		motor.current:setGoal(props.goal)
	end, { props.goal })

	return React.createElement("Frame", {
		Size = UDim2.new(0, 100, 0, 100),
		Position = animationValue:map(function(value: number)
			local progress = value / props.stepCount
			return UDim2.new(progress, 0, progress, 0)
		end),
	}, React.createElement(Buttons))
end

return FunctionWithBinding
