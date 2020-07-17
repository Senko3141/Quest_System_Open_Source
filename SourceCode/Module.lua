-- NPCSystem.lua
-- Sylvern

local Module = {}
local Cooldowns = {
	
};

--[[

	Functions

	ModuleInitialize(plr, questName)
	ModuleAcceptQuest(plr, questName)
	ModuleCheckProgress(plr, questName)
	ModuleCompleteQuest(plr, questName)
	ModuleCheckCooldown(plr)

]]

Module.Quests = {
	['EliminatingAnbus'] = {
		Name = 'Eliminating Foundation Anbus',
		Objective = 'Kill 5 rogue ninjas..',
		Needed = 5,
		Reward = 0,
	};
	

	
	['CollectScroll'] = { -- Name recognized when firing server.
		Name = 'Collect Shadow Clone Scroll', -- Atual name.
		Objective = 'Find the shadow clone scroll...', -- Objective
		Needed = 1, -- Progress needed.
		Reward = 0, -- Reward.
	};

	
};

function ModuleInitialize(plr)
	local QuestsFolder = Instance.new(Folder, plr)
	
	QuestsFolder.Name = 'Quests'
	
end

function ModuleAcceptQuest(plr, questName)
	local getQuest = Module.Quests[questName]
	if not getQuest then warn('Could not get '.. questName.. ' please provide a valid quest.') return end
	
	-- Creating quest.
	
	local QuestsFolder = plrWaitForChild('Quests')
	
	local NewQuest = Instance.new(StringValue, QuestsFolder)
	NewQuest.Name = Module.Quests[questName].Name
	
	NewQuest.Value = 'This is a quest.'
	
	local Objective = Instance.new(StringValue, NewQuest)
	Objective.Name = 'Objective'
	Objective.Value = Module.Quests[questName].Objective
	
	local Progress = Instance.new(NumberValue, NewQuest)
	Progress.Name = 'Progress'
	Progress.Value = 0
	
	warn(plr.Name..  has started a quest  INFO .. NewQuest.Name)
	
end

function ModuleCheckProgress(plr, questName)
	local QuestsFolder = plrWaitForChild('Quests')
	local Quest = Module.Quests[questName].Name
		
	if not QuestsFolderFindFirstChild(Quest) then warn'Could not get quest progress.' return end
	
	local getQuest = QuestsFolderFindFirstChild(Quest)
	local Progress = getQuest.Progress.Value
	
	-- Progress will be the amount needed subtracted by the current progress.
		
	local Difference = Module.Quests[questName].Needed - Progress
	
	if Difference = 0 then
		ModuleCompleteQuest(plr, questName)
		return true
	end
	
	warn(plr.Name..  has not completed this quest.    INFO ..  Quest)
	
	return false -- Not completed.
end

function ModuleCompleteQuest(plr, questName)
	local QuestsFolder = plrWaitForChild('Quests')
	local Quest = Module.Quests[questName].Name
	
	if not QuestsFolderFindFirstChild(Quest) then warn'Could not get quest progress.' return end
	
	local getQuest = QuestsFolderFindFirstChild(Quest)
	local Progress = getQuest.Progress.Value
	
	local Difference = Module.Quests[questName].Needed - Progress
	
	if Difference = 0 then
		getQuestDestroy()
		
		warn(plr.Name..  has completed a quest  INFO .. Quest)
	
		
	end
	
end

function ModuleCheckCooldown(plr)
	for i,v in pairs(Cooldowns) do
		print('test'.. i,v)
	end
	
	for i = 1, #Cooldowns do
		if Cooldowns[i] == plr.Name then
			warn('You can not take any quests.  INFO Cooldown')
			return true
		end
	end
	
	if not Cooldowns[plr.Name] then
		return false
	end
	
end


return Module