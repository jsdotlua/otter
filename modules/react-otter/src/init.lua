local Otter = require("@pkg/@jsdotlua/otter")
local useAnimatedBinding = require("./useAnimatedBinding")
local useMotor = require("./useMotor")

export type Goal = Otter.Goal<any>
export type SpringOptions = Otter.SpringOptions

return {
	useAnimatedBinding = useAnimatedBinding,
	useMotor = useMotor,
	ease = Otter.ease,
	spring = Otter.spring,
	instant = Otter.instant,
}
