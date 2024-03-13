-- // Variables \\ --

-- [ Services ] --

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- [ Variables ] --

local Module = {}

local Camera = workspace.CurrentCamera
local Player = Players.LocalPlayer

local Remote = ReplicatedStorage:WaitForChild("Refresh")

-- // Functions \\ --

local function GetPrimary(Character)
	return Character:FindFirstChild("HumanoidRootPart") or Character:FindFirstChild("Head") or Character:FindFirstChildOfClass("BasePart")
end

local function GetCharacterCFrame()
	local BasePart = GetPrimary(Player.Character)

	if BasePart then
		return BasePart.CFrame
	end
end

local function Refresh()
	if Player.Character then
		Player.CharacterRemoving:Wait()
	end

	local CharacterOrigin = GetCharacterCFrame()
	local CameraOrigin = Camera.CFrame
	
	local Character = Player.CharacterAdded:Wait()
	
	task.defer(function()
		RunService.PreRender:Wait()
		Camera.CFrame = CameraOrigin
	end)

	if CharacterOrigin then
		local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart",500)
		HumanoidRootPart.CFrame = CharacterOrigin
	end
end

function Module:Refresh()
	Remote:FireServer() -- respawns the player on the server

	Refresh() -- starts the refresh; should be handled on client to be more smooth
end

-- // Events \\ --

-- // Runtime \\ --

return Module
