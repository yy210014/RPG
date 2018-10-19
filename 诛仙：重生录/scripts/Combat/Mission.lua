local Mission = {}

MissionState = {
    --领取状态，完成状态，怪兽id,击杀数量，最大数量
    {"鱼怪", false, false, GetId("u008"), Count = 0, MaxCount = 10},
    {"蜘蛛", false, false, GetId("u011"), Count = 0, MaxCount = 10},
    {"强盗", false, false, GetId("u014"), Count = 0, MaxCount = 10},
    {"疯狼", false, false, GetId("u017"), Count = 0, MaxCount = 10},
    {"狂熊", false, false, GetId("u020"), Count = 0, MaxCount = 10},
    {"妖魂", false, false, GetId("u023"), Count = 0, MaxCount = 10}
}

Mission.Action = function(id)
    DisplayTextToAll("领取野外击杀" .. MissionState[id][1] .. "任务!", Color.yellow)
    MissionState[id][2] = true
end

Mission.AnyUnitDeath = function(killUnit, dieUnit)
    local index = 0
    for k, v in pairs(MissionState) do
        index = index + 1
        if (v[2] == true) then
            if (v[4] == dieUnit.Id) then
                v.Count = v.Count + 1
                DisplayTextToAll("击杀" .. v[1] .. "数量：" .. v.Count, Color.yellow)
                if (v.Count >= v.MaxCount) then
                    GameEventProc.SendEvent("任意单位完成任务", index)
                end
            end
        end
    end
end

Mission.AnyUnitFinish = function(id)
    DisplayTextToAll("完成野外击杀" .. MissionState[id][1] .. "任务!", Color.yellow)
    MissionState[id][2] = false
    MissionState[id][3] = false
    MissionState[id].Count = 0
    GameEventProc.UnregisterEventHandler("任意单位完成任务", Mission.AnyUnitFinish)
end

GameEventProc.RegisterEventHandler("领取野外击杀鱼怪任务", Mission.Action)
GameEventProc.RegisterEventHandler("领取野外击杀蜘蛛任务", Mission.Action)
GameEventProc.RegisterEventHandler("领取野外击杀强盗任务", Mission.Action)
GameEventProc.RegisterEventHandler("领取野外击杀疯狼任务", Mission.Action)
GameEventProc.RegisterEventHandler("领取野外击杀狂熊任务", Mission.Action)
GameEventProc.RegisterEventHandler("领取野外击杀妖魂任务", Mission.Action)
GameEventProc.RegisterEventHandler("任意单位死亡", Mission.AnyUnitDeath)
GameEventProc.RegisterEventHandler("任意单位完成任务", Mission.AnyUnitFinish)
