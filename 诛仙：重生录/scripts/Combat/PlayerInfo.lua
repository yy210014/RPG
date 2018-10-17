PlayerInfo = {}

local mPlayers = {}
local mt = {}
mt.Hero = nil
mt.Worke = nil

function mt:New(player)
    local newPlayer = {}
    setmetatable(newPlayer, {__index = mt})
    newPlayer.Name = GetPlayerName(player)
    newPlayer.Entity = player
    newPlayer.Id = GetPlayerId(player)
    return newPlayer
end

function PlayerInfo:New(player)
    local newPlayer = mt:New(player)
    newPlayer.KillCount = 0
    mPlayers[newPlayer.Id + 1] = newPlayer
    GameEventProc.SendEvent("玩家显示", newPlayer.Id + 1, newPlayer.Name)
    return newPlayer
end

function PlayerInfo:Kill(player)
    player.KillCount = player.KillCount + 1
    GameEventProc.SendEvent("杀敌显示", player.Id + 1, player.KillCount)
end

function PlayerInfo:Player(id)
    return mPlayers[id+1]
end

function PlayerInfo:GetPlayerCount()
    return 4
end
