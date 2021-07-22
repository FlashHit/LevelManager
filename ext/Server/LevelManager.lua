class 'LevelManager'

-- =============================================
-- Get Functions
-- =============================================

-- Current Level / GameModeName / Round(s) /Info
function LevelManager:GetCurrentLevelName()
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_CurrentLevelIndex = RCON:SendCommand('mapList.getMapIndices')
	local s_CurrentLevelName = (s_CurrentLevelIndex[2] + 1) * 3 + 1
	return s_LevelList[s_CurrentLevelName]
end

function LevelManager:GetCurrentGameModeName()
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_CurrentLevelIndex = RCON:SendCommand('mapList.getMapIndices')
	local s_CurrentGameModeName = (s_CurrentLevelIndex[2] + 1) * 3 + 2
	return s_LevelList[s_CurrentGameModeName]
end

function LevelManager:GetCurrentRounds()
	local s_GetRounds = RCON:SendCommand('mapList.getRounds')
	local s_CurrentRounds = tonumber(s_GetRounds[3])
	return s_CurrentRounds
end

function LevelManager:GetCurrentRound()
	local s_GetRounds = RCON:SendCommand('mapList.getRounds')
	local s_CurrentRound = tonumber(s_GetRounds[2]) + 1
	return s_CurrentRound
end

function LevelManager:GetCurrentLevelInfo()
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_CurrentLevelIndex = RCON:SendCommand('mapList.getMapIndices')
	local s_CurrentLevelName = (s_CurrentLevelIndex[2] + 1) * 3 + 1
	local s_CurrentGameModeName = (s_CurrentLevelIndex[2] + 1) * 3 + 2

	local s_GetRounds = RCON:SendCommand('mapList.getRounds')
	local s_CurrentRounds = tonumber(s_GetRounds[3])
	local s_CurrentRound = tonumber(s_GetRounds[2]) + 1
	return s_LevelList[s_CurrentLevelName], s_LevelList[s_CurrentGameModeName], s_CurrentRounds, s_CurrentRound
end

-- Next Level / GameModeName / Rounds / Info
function LevelManager:GetNextLevelName()
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_NextLevelIndex = RCON:SendCommand('mapList.getMapIndices')
	local s_NextLevelName = (s_NextLevelIndex[3] + 1) * 3 + 1
	return s_LevelList[s_NextLevelName]
end

function LevelManager:GetNextGameModeName()
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_NextLevelIndex = RCON:SendCommand('mapList.getMapIndices')
	local s_NextGameModeName = (s_NextLevelIndex[3] + 1) * 3 + 2
	return s_LevelList[s_NextGameModeName]
end

function LevelManager:GetNextRounds()
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_NextLevelIndex = RCON:SendCommand('mapList.getMapIndices')
	local s_NextRounds = (s_NextLevelIndex[3] + 1) * 3 + 3
	return s_LevelList[s_NextRounds]
end

function LevelManager:GetNextLevelInfo()
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_NextLevelIndex = RCON:SendCommand('mapList.getMapIndices')
	local s_NextLevelName = (s_NextLevelIndex[3] + 1) * 3 + 1
	local s_NextGameModeName = (s_NextLevelIndex[3] + 1) * 3 + 2
	local s_NextRounds = (s_NextLevelIndex[3] + 1) * 3 + 3
	return s_LevelList[s_NextLevelName], s_LevelList[s_NextGameModeName], s_NextRounds
end

-- Get Level / GameModeName / Rounds for index
function LevelManager:GetLevelNameForIndex(p_Index)
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_LevelNameForIndex = s_LevelList[(p_Index + 1) * 3 + 1]
	return s_LevelNameForIndex
end

function LevelManager:GetGameModeNameForIndex(p_Index)
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_GameModeNameForIndex = s_LevelList[(p_Index + 1) * 3 + 2]
	return s_GameModeNameForIndex
end

function LevelManager:GetRoundsForIndex(p_Index)
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_RoundsForIndex = s_LevelList[(p_Index + 1) * 3 + 3]
	return s_RoundsForIndex
end

function LevelManager:GetLevelInfoForIndex(p_Index)
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_LevelNameForIndex = s_LevelList[(p_Index + 1) * 3 + 1]
	local s_GameModeNameForIndex = s_LevelList[(p_Index + 1) * 3 + 2]
	local s_RoundsForIndex = s_LevelList[(p_Index + 1) * 3 + 3]
	return s_LevelNameForIndex, s_GameModeNameForIndex, s_RoundsForIndex
end

function LevelManager:GetList()
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_LevelEntries = tonumber(s_LevelList[2])
	local s_LevelInfos = {}

	for p_Index = 0, s_LevelEntries - 1 do
		s_LevelInfos[p_Index] = {
			levelName = s_LevelList[(p_Index + 1) * 3 + 1],
			gameModeName = s_LevelList[(p_Index + 1) * 3 + 2],
			rounds = tonumber(s_LevelList[(p_Index + 1) * 3 + 3])
		}
	end

	return s_LevelInfos
end

function LevelManager:IsNextLevelDifferent(p_IsLevelDestroyed)
	if not p_IsLevelDestroyed then
		local s_LevelList = RCON:SendCommand('mapList.list')
		local s_LevelIndex = RCON:SendCommand('mapList.getMapIndices')
		local s_CurrentLevelIndex = s_LevelIndex[2]
		local s_CurrentLevelName = s_LevelList[(s_CurrentLevelIndex + 1) * 3 + 1]
		local s_CurrentGameModeName = s_LevelList[(s_CurrentLevelIndex + 1) * 3 + 2]

		local s_GetRounds = RCON:SendCommand('mapList.getRounds')
		local s_CurrentRounds = tonumber(s_GetRounds[3])
		local s_CurrentRound = tonumber(s_GetRounds[2]) + 1

		local s_NextLevelIndex = s_LevelIndex[3]
		local s_NextLevelName = s_LevelList[(s_NextLevelIndex + 1) * 3 + 1]
		local s_NextGameModeName = s_LevelList[(s_NextLevelIndex + 1) * 3 + 2]

		if s_CurrentRound ~= s_CurrentRounds then
			return false
		end

		if s_CurrentLevelIndex == s_NextLevelIndex then
			return false
		end

		if s_CurrentLevelName == s_NextLevelName and s_CurrentGameModeName == s_NextGameModeName then
			return false
		end

		return true
	else
		local s_CurrentLevelName = SharedUtils:GetLevelName():gsub(".*/", "")
		local s_CurrentGameModeName = SharedUtils:GetCurrentGameModeName()

		local s_LevelList = RCON:SendCommand('mapList.list')
		local s_LevelIndex = RCON:SendCommand('mapList.getMapIndices')
		local s_LoadingLevelName = s_LevelList[(s_LevelIndex[2] + 1) * 3 + 1]
		local s_LoadingGameModeName = s_LevelList[(s_LevelIndex[2] + 1) * 3 + 2]

		if s_CurrentLevelName == s_LoadingLevelName and s_CurrentGameModeName == s_LoadingGameModeName then
			return false
		else
			return true
		end
	end
end

-- =============================================
-- Set Functions
-- =============================================

function LevelManager:SetNextLevel(p_LevelName, p_GameModeName, p_Rounds)
	local s_LevelList = RCON:SendCommand('mapList.list')
	local s_LevelEntries = tonumber(s_LevelList[2])

	for p_Index = 0, s_LevelEntries - 1 do
		if p_LevelName == s_LevelList[(p_Index + 1) * 3 + 1] and p_GameModeName == s_LevelList[(p_Index + 1) * 3 + 2] and p_Rounds == tonumber(s_LevelList[(p_Index + 1) * 3 + 3]) then
			RCON:SendCommand('mapList.setNextMapIndex', {tostring(p_Index)})
			return true
		end
	end

	local s_Response = RCON:SendCommand('mapList.add', {p_LevelName, p_GameModeName, tostring(p_Rounds)})
	local s_SecondResponse = RCON:SendCommand('mapList.setNextMapIndex', {tostring(s_LevelEntries)})

	if s_Response[1] == 'OK' and s_SecondResponse[1] == 'OK' then
		return true
	else
		return false
	end
end

function LevelManager:SetNextLevelIndex(p_Index)
	local s_Response = RCON:SendCommand('mapList.setNextMapIndex', {tostring(p_Index)})

	if s_Response[1] == 'OK' then
		return true
	else
		return false
	end
end

function LevelManager:Add(p_LevelName, p_GameModeName, p_Rounds, p_Index)
	local s_Response

	if p_Index == nil then
		s_Response = RCON:SendCommand('mapList.add', {p_LevelName, p_GameModeName, tostring(p_Rounds)})
	else
		s_Response = RCON:SendCommand('mapList.add', {p_LevelName, p_GameModeName, tostring(p_Rounds), tostring(p_Index)})
	end

	if s_Response[1] == 'OK' then
		return true
	else
		return false
	end
end

function LevelManager:Remove(p_Index)
	local s_Response = RCON:SendCommand('mapList.remove', {tostring(p_Index)})

	if s_Response[1] == 'OK' then
		return true
	else
		return false
	end
end

function LevelManager:Clear()
	local s_Response = RCON:SendCommand('mapList.clear')

	if s_Response[1] == 'OK' then
		return true
	else
		return false
	end
end

function LevelManager:Load()
	local s_Response = RCON:SendCommand('mapList.load')

	if s_Response[1] == 'OK' then
		return true
	else
		return false
	end
end

function LevelManager:Save()
	local s_Response = RCON:SendCommand('mapList.save')

	if s_Response[1] == 'OK' then
		return true
	else
		return false
	end
end

function LevelManager:RestartRound()
	local s_Response = RCON:SendCommand('mapList.restartRound')

	if s_Response[1] == 'OK' then
		return true
	else
		return false
	end
end

function LevelManager:RunNextRound()
	local s_Response = RCON:SendCommand('mapList.runNextRound')

	if s_Response[1] == 'OK' then
		return true
	else
		return false
	end
end

function LevelManager:EndRound(p_Winner)
	local s_Response = RCON:SendCommand('mapList.endRound', {tostring(p_Winner)})

	if s_Response[1] == 'OK' then
		return true
	else
		return false
	end
end

if g_LevelManager == nil then
	g_LevelManager = LevelManager()
end

return g_LevelManager
