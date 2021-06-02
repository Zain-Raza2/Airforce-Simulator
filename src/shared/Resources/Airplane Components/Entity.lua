local CLASS = {}

--// STATIC PROPERTIES //--

CLASS.ClassName = "Entity"

--// CONSTRUCTOR //--

function CLASS.new(airplane)
	local self = setmetatable({}, CLASS)

	--// INSTANCE PROPERTIES //--
	self.Airplane = airplane
	--////--

	return self
end

--// STATIC METHODS //--

--// INSTANCE METHODS //--

--// INSTRUCTIONS //--

CLASS.__index = CLASS

return CLASS
