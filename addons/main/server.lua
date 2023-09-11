--[[
Copyright 2009-2023 João Cardoso
All Rights Reserved
--]]

local ADDON, Addon = ...
local Server = Addon:NewModule('Server')
Server.SelectActive = C_GossipInfo.SelectActiveQuest or SelectGossipActiveQuest
Server.SelectAvailable = C_GossipInfo.SelectAvailableQuest or SelectGossipAvailableQuest
Server.NumActive = C_GossipInfo.GetNumActiveQuests or GetNumGossipActiveQuests
Server.NumAvailable = C_GossipInfo.GetNumAvailableQuests or GetNumGossipAvailableQuests

function Server.GetActive(i)
  if C_GossipInfo.GetActiveQuests then
    return C_GossipInfo.GetActiveQuests()[i].questID
  end

  return select(i*7, GetGossipActiveQuests())
end

function Server.GetAvailable(i)
  if C_GossipInfo.GetAvailableQuests then
    return C_GossipInfo.GetAvailableQuests()[i].questID
  end
end

function Server.IsComplete(id)
  if C_QuestLog.IsComplete then
    return C_QuestLog.IsComplete(id)
  end

  return select(6, GetQuestLogTitle(GetQuestLogIndexByID(id))) == 1
end

function Server.GetItem(kind, i)
	return strmatch(GetQuestItemLink(kind, i) or '', 'item:(%d+)')
end
