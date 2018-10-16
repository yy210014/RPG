require "scripts.Common.Color"
local console = require "jass.console"
local debug = debug
Game = {}

Game.DamageFactor = 0.06 --伤害因子
local mGameLevel = 0

IsDebug = true
console.enable = IsDebug
function Game.Log(text)
    if (IsDebug) then
        console.write("------------------" .. text .. "---------------------")
        for i = 0, 3 do
            DisplayTextToPlayer(Player(i), 0, 0, "|cffffcc00" .. text .. "|r")
        end
    end
end

function Game.LogError(text)
    if (IsDebug) then
        console.write("---------------------------------------")
        console.write("              LUA ERROR!!              ")
        console.write("---------------------------------------")
        console.write(tostring(text) .. "\n")
        console.write(tostring(debug.traceback()) .. "\n")
        console.write("---------------------------------------")
        for i = 0, 3, 1 do
            --DisplayTextToPlayer(Player(i), 0, 0, "|cffff0000" .. text .. "|r")
        end
    end
end

function DisplayTextToAll(text, color)
    color = color or Color.white
    for i = 0, 3 do
        DisplayTextToPlayer(Player(i), 0, 0, "|c" .. color .. text .. "|r")
    end
end

function Game.GetLevel()
    return mGameLevel
end

function Game.SetLevel(level)
    mGameLevel = level
end

function Game.ChooseLevel()
    local timer = CreateTimer()
    local timerDialog = CreateTimerDialog(timer)
    local chooseLevel = true
    for i = 0, 3, 1 do
        if
            (chooseLevel and GetPlayerController(Player(i)) == MAP_CONTROL_USER and
                GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING)
         then
            local dialog = DialogCreate()
            DialogSetMessage(dialog, "难度选择")
            DisplayTextToPlayer(Player(i), 0, 0, "|cffffcc00请选择难度...|r")
            local trig = nil
            for j = 1, 8 do
                trig = CreateTrigger()
                TriggerRegisterDialogButtonEvent(trig, DialogAddButton(dialog, "难度" .. j, 0))
                TriggerAddAction(
                    trig,
                    function()
                        DisplayTextToAll("当前难度等级" .. j, Color.yellow)
                        Game.SetLevel(j)
                        GameScene.OnGameStart()
                        DestroyTimer(timer)
                        DestroyTimerDialog(timerDialog)
                    end
                )
            end
            trig = nil
            DialogDisplay(Player(i), dialog, true)
            chooseLevel = false
        elseif (false == chooseLevel) then
            DisplayTextToPlayer(Player(i), 0, 0, "|cffffcc00等待主机选取难度...|r")
        end
    end

    TimerDialogSetTitle(timerDialog, "选择难度时间")
    TimerDialogDisplay(timerDialog, true)
    TimerStart(
        timer,
        20,
        false,
        function()
            DisplayTextToAll("当前难度等级" .. (1), Color.yellow)
            for i = 0, 3, 1 do
                DialogDisplay(Player(i), dialog, false)
            end
            DialogDestroy(dialog)
            if (nil == timerDialog) then
                return
            end

            Game.SetLevel(1)
            GameScene.OnGameStart()
            DestroyTimer(timer)
            DestroyTimerDialog(timerDialog)
        end
    )
end
