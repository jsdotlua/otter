--!strict
local createGroupMotor = require("./createGroupMotor")
local createSingleMotor = require("./createSingleMotor")
local ease = require("./ease")
local spring = require("./spring")
local instant = require("./instant")
local types = require("./types")

local AnimationStepSignal = require("./AnimationStepSignal")

export type Goal<T> = types.Goal<T>
export type Motor<T, U> = types.Motor<T, U>
export type Unsubscribe = types.Unsubscribe
export type MotorCallback<T> = types.MotorCallback<T>

export type SingleMotor = createSingleMotor.SingleMotor
export type GroupMotor = createGroupMotor.GroupMotor

export type SpringOptions = spring.SpringOptions
export type EaseOptions = ease.EaseOptions

return {
	createGroupMotor = createGroupMotor,
	createSingleMotor = createSingleMotor,
	ease = ease,
	spring = spring,
	instant = instant,
	__devAnimationStepSignal = AnimationStepSignal,
}
