--[[
Copyright 2009-2025 João Cardoso
All Rights Reserved
--]]

local ADDON, Addon = ...
local Server = Addon:NewModule('Server')

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

function Server.GetItem(kind, i)
	return strmatch(GetQuestItemLink(kind, i) or '', 'item:(%d+)')
end
