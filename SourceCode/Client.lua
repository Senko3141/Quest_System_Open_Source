-- ClientQuest.lua
-- Sylvern

-- Variables

local Workspace = game:GetService("Workspace")
local NPCs = Workspace:WaitForChild("NPCs")
local Storage = game:GetService("ReplicatedStorage")

local Modules = Storage:WaitForChild('Modules')
local NPCModule = require(Modules.NPC)

local Events = Storage:WaitForChild("Events")

local event = Events.Quest

for _,v in pairs(NPCs:GetChildren()) do
	if not v.PrimaryPart:FindFirstChild('Click') then return end
	
	v.PrimaryPart:FindFirstChild('Click').MouseClick:Connect(function(plr)
		local QuestsFolder = game.Players.LocalPlayer:WaitForChild('Quests')
		
		local Name = NPCModule.Quests[v.QuestName.Value].Name
				
		if QuestsFolder:FindFirstChild(Name) then
			
			event:InvokeServer('CheckQuest', v.QuestName.Value)
			
			return
		end
				
		
		event:InvokeServer('AcceptQuest', v.QuestName.Value)
	end)
	
end

