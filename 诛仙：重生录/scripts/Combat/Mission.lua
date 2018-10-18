local Mission = {}

MissionState = {
    --领取状态，完成状态，怪兽id,击杀数量，最大数量
    {false, false, GetId("u008"), Count = 0, MaxCount = 10},
    {false, false, GetId("u011"), Count = 0, MaxCount = 10},
    {false, false, GetId("u014"), Count = 0, MaxCount = 10},
    {false, false, GetId("u017"), Count = 0, MaxCount = 10},
    {false, false, GetId("u020"), Count = 0, MaxCount = 10},
    {false, false, GetId("u023"), Count = 0, MaxCount = 10}
}

Mission.Action = function(id)
    if (id == 1) then
        DisplayTextToAll("领取野外击杀鱼怪任务!", Color.yellow)
    elseif (id == 2) then
        DisplayTextToAll("领取野外击杀蜘蛛任务!", Color.yellow)
    elseif (id == 3) then
        DisplayTextToAll("领取野外击杀强盗任务!", Color.yellow)
    elseif (id == 4) then
        DisplayTextToAll("领取野外击杀疯狼任务!", Color.yellow)
    elseif (id == 5) then
        DisplayTextToAll("领取野外击杀狂熊任务!", Color.yellow)
    elseif (id == 6) then
        DisplayTextToAll("领取野外击杀妖魂任务!", Color.yellow)
    end
    MissionState[id][1] = true
end

Mission.AnyUnitDeath = function(killUnit, dieUnit)
    local index = 0
    for k, v in pairs(MissionState) do
        if (v[1] == true) then
            index = index + 1
            if (v[3] == dieUnit.Id) then
                v.Count = v.Count + 1
                DisplayTextToAll("击杀数量：" .. v.Count, Color.yellow)
                if (v.Count >= v.MaxCount) then
                    GameEventProc.SendEvent("任意单位完成任务", index)
                end
            end
        end
    end
end

Mission.AnyUnitFinish = function(id)
    if (id == 1) then
        DisplayTextToAll("完成野外击杀鱼怪任务!", Color.yellow)
    elseif (id == 2) then
        DisplayTextToAll("完成野外击杀蜘蛛任务!", Color.yellow)
    elseif (id == 3) then
        DisplayTextToAll("完成野外击杀强盗任务!", Color.yellow)
    elseif (id == 4) then
        DisplayTextToAll("完成野外击杀疯狼任务!", Color.yellow)
    elseif (id == 5) then
        DisplayTextToAll("完成野外击杀狂熊任务!", Color.yellow)
    elseif (id == 6) then
        DisplayTextToAll("完成野外击杀妖魂任务!", Color.yellow)
    end
    MissionState[id][1] = false
    MissionState[id][2] = false
    MissionState[id].Count = 0
end

GameEventProc.RegisterEventHandler("领取野外击杀鱼怪任务", Mission.Action)
GameEventProc.RegisterEventHandler("领取野外击杀蜘蛛任务", Mission.Action)
GameEventProc.RegisterEventHandler("领取野外击杀强盗任务", Mission.Action)
GameEventProc.RegisterEventHandler("领取野外击杀疯狼任务", Mission.Action)
GameEventProc.RegisterEventHandler("领取野外击杀狂熊任务", Mission.Action)
GameEventProc.RegisterEventHandler("领取野外击杀妖魂任务", Mission.Action)
GameEventProc.RegisterEventHandler("任意单位死亡", Mission.AnyUnitDeath)
GameEventProc.RegisterEventHandler("任意单位完成任务", Mission.AnyUnitFinish)
