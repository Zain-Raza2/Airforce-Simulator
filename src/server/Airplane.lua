local CLASS = {}

--// STATIC PROPERTIES //--

local REPLICATED_STORAGE = game:GetService("ReplicatedStorage")
local RESOURCES = REPLICATED_STORAGE.Common.Resources
local AIRPLANE_COMPONENTS = RESOURCES["Airplane Components"]

local AppearanceComponent = require(AIRPLANE_COMPONENTS.Appearance)
local EntityComponent = require(AIRPLANE_COMPONENTS.Entity)
local PhysicsComponent = require(AIRPLANE_COMPONENTS.Physics)

CLASS.ClassName = "Airplane"

--// CONSTRUCTOR //--

function CLASS.new()
	local self = setmetatable({}, CLASS)

	self:GenerateAirplane()

	--// INSTANCE PROPERTIES //--
	self.Components = {
		Appearance = AppearanceComponent.new(self),
		Entity = EntityComponent.new(self),
		Physics = PhysicsComponent.new(self),
	}
	--////--

	return self
end

--// STATIC METHODS //--

--// INSTANCE METHODS //--

function CLASS:GenerateAirplane()
	local model = self:GenerateModel()
	model.Parent = workspace
	self.Model = model

	local rootPart = self:GenerateRootPart()
	rootPart.Parent = model
	self.RootPart = rootPart
end

function CLASS:GenerateModel()
	local model = Instance.new("Model")
	model.Name = "Airplane"

	return model
end

function CLASS:GenerateRootPart()
	local rootPart = Instance.new("Part")
	rootPart.Name = "Root"
	rootPart.Size = Vector3.new(1, 1, 1)
	rootPart.CFrame = CFrame.new()
	rootPart.Anchored = false
	rootPart.CanCollide = false
	rootPart.Transparency = 1

	return rootPart
end

--// INSTRUCTIONS //--

CLASS.__index = CLASS

return CLASS
