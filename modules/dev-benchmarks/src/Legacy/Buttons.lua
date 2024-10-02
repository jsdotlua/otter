--!strict
local Roact = require("@pkg/@jsdotlua/roact-compat")

local function Buttons(_)
	return Roact.createFragment({
		Left = Roact.createElement("TextButton", {
			Text = "Example",
			Size = UDim2.fromScale(0.5, 1),
		}),
		Right = Roact.createElement("TextButton", {
			Text = "Buttons",
			Size = UDim2.fromScale(0.5, 1),
			Position = UDim2.fromScale(0.5, 0),
		}),
	})
end

return Buttons
