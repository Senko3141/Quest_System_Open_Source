-- QuestSystem.lua
-- Sylvern

-- Variables

local Storage = game:GetService("ReplicatedStorage")

local Modules = Storage:WaitForChild("Modules")
local Events = Storage:WaitForChild("Events")

local Players = game:GetService("Players")

local Event = Events:WaitForChild("Quest")
local NPC = require(Modules.NPC)

-- Functions

Players.PlayerAdded:Connect(function(plr)
	NPC:Initialize(plr)
end)

Event.OnServerInvoke = function(plr, action, questName)
	if action == 'AcceptQuest' then
		NPC:AcceptQuest(plr, questName)
	end
	
	if action == 'CheckQuest' then
		
		NPC:CheckProgress(plr, questName)
	end
	
end
