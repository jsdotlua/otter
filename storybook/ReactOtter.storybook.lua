local Roact = require("@pkg/@jsdotlua/roact-compat")

return {
	name = "React + Otter",
	storyRoots = { script.Parent.stories },
	-- RoactCompat is required for storybooks to work with Roact 17
	roact = Roact,
}
