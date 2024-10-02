--!strict
local ClassWithBinding = require("./Components/ClassWithBinding")
local ClassWithState = require("./Components/ClassWithState")
local FunctionWithBinding = require("./Components/FunctionWithBinding")
local FunctionWithState = require("./Components/FunctionWithState")
local Hook = require("./Components/Hook")
local Scroller = require("./Components/Scroller")
local Resizer = require("./Components/Resizer")

local legacyClassWithBinding = require("./Legacy/ClassWithBinding")
local legacyClassWithState = require("./Legacy/ClassWithState")

local runBenchmark = require("./runBenchmark")
local runLegacyBenchmark = require("./runLegacyBenchmark")
local runFPSBenchmark = require("./runFPSBenchmark")

local RunService = game:GetService("RunService")

return {
	classWithBinding = function()
		runBenchmark(ClassWithBinding)
	end,
	classWithState = function()
		runBenchmark(ClassWithState)
	end,
	functionWithBinding = function()
		runBenchmark(FunctionWithBinding)
	end,
	functionWithState = function()
		runBenchmark(FunctionWithState)
	end,
	useAnimatedBinding = function()
		runBenchmark(Hook)
	end,
	legacyClassWithState = function()
		runLegacyBenchmark(legacyClassWithState)
	end,
	legacyClassWithBinding = function()
		runLegacyBenchmark(legacyClassWithBinding)
	end,
	spring = require("./Goals/spring"),
	hookWithSpring = require("./Goals/HookWithSpring"),
	legacyWithSpring = require("./Goals/LegacyWithSpring"),
	heartbeatScrolling = function()
		runFPSBenchmark(Scroller, RunService.Heartbeat, 3800)
	end,
	renderSteppedScrolling = function()
		runFPSBenchmark(Scroller, RunService.RenderStepped, 3800)
	end,
	heartbeatResizing = function()
		runFPSBenchmark(Resizer, RunService.Heartbeat, 1000)
	end,
	renderSteppedResizing = function()
		runFPSBenchmark(Resizer, RunService.RenderStepped, 1000)
	end,
}
