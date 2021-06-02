local CLASS = {}

--// STATIC PROPERTIES //--

CLASS.ClassName = "Physics"

--// CONSTRUCTOR //--

function CLASS.new(airplane)
	local self = setmetatable({}, CLASS)

	--// INSTANCE PROPERTIES //--
	self.Airplane = airplane
	--////--

	self:Initialize()

	return self
end

--// STATIC METHODS //--

--// INSTANCE METHODS //--

function CLASS:Initialize()
	local rootPart = self.Airplane.RootPart

	local bodyVelocity = self:GenerateBodyVelocity()
	bodyVelocity.Parent = rootPart
	self.BodyVelocity = bodyVelocity

	local bodyGyro = self:GenerateBodyGyro()
	bodyGyro.Parent = rootPart
	self.GenerateBodyGyro = rootPart
end

function CLASS:GenerateBodyVelocity()
	local bodyVelocity = Instance.new("BodyVelocity")

	bodyVelocity.Velocity = Vector3.new(0, 0, 0)
	bodyVelocity.MaxForce = Vector3.new(5000, 5000, 5000)

	return bodyVelocity
end

function CLASS:GenerateBodyGyro()
	local bodyGyro = Instance.new("BodyGyro")

	bodyGyro.MaxTorque = Vector3.new(10000, 10000, 10000)

	return bodyGyro
end

--// INSTRUCTIONS //--

CLASS.__index = CLASS

return CLASS
