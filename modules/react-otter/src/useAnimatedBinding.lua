--!strict
local React = require("@pkg/@jsdotlua/react")
type Binding<T> = React.Binding<T>

local Otter = require("@pkg/@jsdotlua/otter")
type Callback<T> = Otter.MotorCallback<T>

local useMotor = require("./useMotor")
type SetGoal<G> = useMotor.SetGoal<G>

local function useAnimatedBinding<V, G>(initialValue: V, onComplete: Callback<V>?): (Binding<V>, SetGoal<G>)
	local value, setValue = React.useBinding(initialValue)
	local setGoal = useMotor(initialValue, setValue, onComplete)

	return value, setGoal
end

return useAnimatedBinding
