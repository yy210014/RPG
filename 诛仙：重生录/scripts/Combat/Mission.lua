local Mission = {}

MissionState = {
    --领取状态，完成状态，怪兽id,击杀数量，最大数量
    {"鱼怪", false, false, GetId("u008"), Count = 0, MaxCount = 10},
    {"蜘蛛", false, false, GetId("u011"), Count = 0, MaxCount = 10},
    {"强盗", false, false, GetId("u014"), Count = 0, MaxCount = 10},
    {"疯狼", false, false, GetId("u017"), Count = 0, MaxCount = 10},
    {"狂熊", false, false, GetId("u020"), Count = 0, MaxCount = 10},
    {"妖魂", false, false, GetId("u023"), Count = 0, MaxCount = 10},
    {"变异的人鱼女王", false, false, GetId("u010"), Count = 0, MaxCount = 1},
    {"变异的烈火蜘蛛", false, false, GetId("u013"), Count = 0, MaxCount = 1},
    {"变异的强盗首领", false, false, GetId("u016"), Count = 0, MaxCount = 1},
    {"变异的疯狼王", false, false, GetId("u019"), Count = 0, MaxCount = 1},
    {"变异的熊族将军", false, false, GetId("u022"), Count = 0, MaxCount = 1},
    {"变异的妖魂女王", false, false, GetId("u025"), Count = 0, MaxCount = 1}
}

--[[
    狂狼爪、青衣血脉、天火石、幽冥石、天劫之力、
    冰霜符咒、筑天玄铁、炼狱神火；技能书-无中生有、技能书-无懈可击、
    技能书-静止陷阱、技能书-献祭、技能书-狂牛冲锋、技能书-无影盗手、技能书-有勇有谋、
    技能书-勇武之气、技能书-裂魂咒、技能书-破心咒、技能书-生命汲取
]]
MissionRandomItem = {
    --[[GetId("u023"), GetId("u023"), GetId("u023"), GetId("u023"), GetId("u023"),
    GetId("u023"), GetId("u023"), GetId("u023"), ]]GetId("IA21"), GetId("IA00"),
    GetId("IA02"), GetId("IA05"), GetId("IA10"), GetId("IA04"), GetId("IA07"),
    GetId("IA15"), GetId("IA14"), GetId("IA09"), GetId("IA12")
}
local mCurRandomItem = -1

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
    if (id == -1) then
        DisplayTextToAll("完成领取寻找随机指定物品任务!", Color.yellow)
        return
    end
    DisplayTextToAll("完成野外击杀" .. MissionState[id][1] .. "任务!", Color.yellow)
    MissionState[id][2] = false
    MissionState[id][3] = false
    MissionState[id].Count = 0
end

Mission.FindRandomItem = function()
    mCurRandomItem = MissionRandomItem[math.random(1, #MissionRandomItem)]
    DisplayTextToAll("领取寻找随机指定物品:" .. Slk.item[mCurRandomItem]["Name"] .. "任务!", Color.yellow)
end

Mission.AnyUnitPickUpItem = function(unit, item)
    if (item.Id == mCurRandomItem) then
        GameEventProc.SendEvent("任意单位完成任务", -1)
    end
end

GameEventProc.RegisterEventHandler("领取野外击杀任务", Mission.Action)
GameEventProc.RegisterEventHandler("任意单位死亡", Mission.AnyUnitDeath)
GameEventProc.RegisterEventHandler("任意单位完成任务", Mission.AnyUnitFinish)
GameEventProc.RegisterEventHandler("领取寻找随机指定物品", Mission.FindRandomItem)
GameEventProc.RegisterEventHandler("任意单位获得物品", Mission.AnyUnitPickUpItem)
