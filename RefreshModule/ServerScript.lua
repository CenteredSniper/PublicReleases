-- // Variables \\ --

-- [ Services ] --

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- [ Variables ] --

local Remote = Instance.new("RemoteEvent"); do
	Remote.Name = "Refresh"
	Remote.Parent = ReplicatedStorage
end

-- // Functions \\ --

-- // Events \\ --

Remote.OnServerEvent:Connect(function(Player)
	Player:LoadCharacter()
end)

-- // Runtime \\ --
