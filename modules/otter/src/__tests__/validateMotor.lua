--!strict
local JestGlobals = require("@pkg/@jsdotlua/jest-globals")

local expect = JestGlobals.expect

local function validateMotor(motor: any)
	expect(motor).toEqual(expect.any("table"))
	expect(motor.start).toEqual(expect.any("function"))
	expect(motor.stop).toEqual(expect.any("function"))
	expect(motor.step).toEqual(expect.any("function"))
	expect(motor.setGoal).toEqual(expect.any("function"))
	expect(motor.onStep).toEqual(expect.any("function"))
	expect(motor.onComplete).toEqual(expect.any("function"))
	expect(motor.destroy).toEqual(expect.any("function"))
end

return validateMotor
