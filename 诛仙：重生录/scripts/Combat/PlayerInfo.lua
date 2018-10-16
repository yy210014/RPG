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
    Game.Log("New" .. newPlayer.Id .. "," .. "Count" .. #mPlayers)
    GameEventProc.SendEvent("玩家显示", newPlayer.Id + 1, newPlayer.Name)
    return newPlayer
end

function PlayerInfo:Kill(playerIndex)
    if (mPlayers[playerIndex] == nil) then
        Game.LogError("错误的玩家")
    end
    local player = mPlayers[playerIndex]
    player.KillCount = player.KillCount + 1
    GameEventProc.SendEvent("杀敌显示", player.Id + 1, player.KillCount)
end

function PlayerInfo:Player(id)
    Game.Log("Count" .. #mPlayers .. " ," .. id)
    return mPlayers[id]
end

function PlayerInfo:GetPlayerCount()
    return 4
end
