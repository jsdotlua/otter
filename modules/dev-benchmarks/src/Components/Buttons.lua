--!strict
local React = require("@pkg/@jsdotlua/react")

local function Buttons(_)
	return React.createElement(
		React.Fragment,
		nil,
		React.createElement("TextButton", {
			Text = "Example",
			Size = UDim2.fromScale(0.5, 1),
		}),
		React.createElement("TextButton", {
			Text = "Buttons",
			Size = UDim2.fromScale(0.5, 1),
			Position = UDim2.fromScale(0.5, 0),
		})
	)
end

return Buttons
