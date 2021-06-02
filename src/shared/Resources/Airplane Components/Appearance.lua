local CLASS = {}

--// STATIC PROPERTIES //--

local REPLICATED_STORAGE = game:GetService("ReplicatedStorage")
local RESOURCES = REPLICATED_STORAGE.Common.Resources
local AIRPLANE_MODELS = RESOURCES["Airplane Models"]

CLASS.ClassName = "Appearance"

--// CONSTRUCTOR //--

function CLASS.new(airplane)
	local self = setmetatable({}, CLASS)

	--// INSTANCE PROPERTIES //--
	self.Airplane = airplane
	self.Model = nil
	--////--

	return self
end

--// STATIC METHODS //--

function CLASS.WeldParts(part0, part1)
	local weld = Instance.new("WeldConstraint")

	weld.Part0 = part0
	weld.Part1 = part1

	weld.Parent = part0
end

--// INSTANCE METHODS //--

function CLASS:SetModel(modelName)
	if self.Model then
		self.Model:Destroy()
	end

	local model = AIRPLANE_MODELS:FindFirstChild(modelName)
	local clone = model:Clone()

	clone:SetPrimaryPartCFrame(self.Airplane.RootPart.CFrame)
	CLASS.WeldParts(clone.PrimaryPart, self.Airplane.RootPart)

	clone.Parent = self.Airplane.Model
	self.Model = clone
end

--// INSTRUCTIONS //--

CLASS.__index = CLASS

return CLASS
