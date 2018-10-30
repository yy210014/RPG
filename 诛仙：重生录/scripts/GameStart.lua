require "scripts.GameScene"
require "scripts.GameEventProc"

GameStart = {}

--游戏开始
function GameStart.OnGameStart()
    for i = 0, 12 do
        PlayerInfo:New(Player(i))
    end
    PlayerInfo:New(Player(PLAYER_NEUTRAL_PASSIVE))
    --禁用黑色阴影（开全图）
    FogMaskEnable(false)
    --禁用战争迷雾
    FogEnable(false)
    SetCameraField(CAMERA_FIELD_ZOFFSET, 800, 0)
    Game.ChooseLevel()
end

--更新
function GameStart.OnGameUpdate(dt)
    GameScene.OnGameUpdate(dt)
end

tianfu = {
    {GetId("UH06"), GetId("AH21")}, --英雄：阿刀 天赋：聚宝
    {GetId("UH10"), GetId("AH22")}, --英雄：姜承 天赋：迷惑体质
    {GetId("UH09"), GetId("AH23")}, --英雄：迪塔斯 天赋：守护之灵
    {GetId("UH11"), GetId("AH24")}, --英雄：九梦 天赋：破而后立
    {GetId("UH15"), GetId("AH25")}, --英雄：美狄亚 天赋：混沌法术
    {GetId("UH14"), GetId("AH26")}, --英雄：银子龙 天赋：九天衣
    {GetId("UH05"), GetId("AH27")}, --英雄：八重樱 天赋：厄难毒体
    {GetId("UH07"), GetId("AH28")}, --英雄：白斩月 天赋：粉碎重击
    {GetId("UH13"), GetId("AH29")}, --英雄：墨萧 天赋：敏锐思维
    {GetId("UH12"), GetId("AH30")}, --英雄：克劳德 天赋：先天资质
    {GetId("UH08"), GetId("AH31")}, --英雄：谷南 天赋：石裔契约
    {GetId("UH00"), GetId("AH32")}, --英雄：吕小布 天赋：玄天力
    {GetId("UH01"), GetId("AH32")}, --英雄：漠七 天赋：玄天力
    {GetId("UH03"), GetId("AH33")}, --英雄：龙游九州 天赋：仙帝血脉
    {GetId("UH04"), GetId("AH33")}, --英雄：七夜 天赋：仙帝血脉
    {GetId("UH02"), GetId("AH33")} --英雄：魔神 天赋：仙帝血脉
}

local mLastSelectedTime = 0
local mLastSelectedUnit = nil
function GameStart.AnyUnitSelected(trig)
    local unit = GetJ_Units()[GetTriggerUnit()]
    if (unit == nil) then
        return
    end
    Game.Log("unit.Player.Id :" .. unit.Player.Id)
    if (unit.Player.Hero == nil and IsUnitType(unit.Entity, UNIT_TYPE_HERO) and unit.Player.Id == FirendIndex) then
        if (GameScene.Elapsed - mLastSelectedTime < 0.4 and mLastSelectedUnit == unit) then
            unit:SetUnitOwner(GetTriggerPlayer())
            unit.Player.Hero = unit
            unit.Attribute:add("物理攻击加成", 1000000000)
            unit.Attribute:add("护甲", 10000)
            SetUnitPositionLoc(unit.Entity, JumpPoint.Home)
            PanCameraToTimedLocForPlayer(unit.Player.Entity, JumpPoint.Home, 0)
            --添加天赋
            DestroyTrigger(trig)
        end
        mLastSelectedTime = GameScene.Elapsed
        mLastSelectedUnit = unit
    end
end

function GameStart.AnyUnitAttack()
    local attactUnit = GetJ_Units()[GetAttacker()]
    local defUnit = GetJ_Units()[GetTriggerUnit()]
    if (attactUnit == nil or defUnit == nil) then
        return
    end
    --迭代技能
    attactUnit:IterateSkills(
        function(skill)
            skill:OnBeginAttack(attactUnit, defUnit)
        end
    )
end

--任意单位伤害
function GameStart.AnyUnitDamaged()
    local attactUnit = GetJ_Units()[GetEventDamageSource()]
    local defUnit = GetJ_Units()[GetTriggerUnit()]
    local damage = GetEventDamage()
    if (attactUnit == nil or defUnit == nil) then
        return
    end
    if (damage == 0 or defUnit.Attribute:get("生命") <= 0) then
        return
    end
    attactUnit.LastFightTime = GameScene.Elapsed

    local isCritDamage = false
    --普通攻击
    if (0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK)) then
        --模拟暴击
        local crit = attactUnit.Attribute.Crit * 100
        local random = math.random(1, 100)
        if (crit > random) then
            damage = damage * attactUnit.Attribute.CritDamage
            isCritDamage = true
            GameEventProc.SendEvent("任意单位暴击", attactUnit, defUnit)
        end

        --怒气
        if (attactUnit.ManaType == 2) then
            attactUnit.Attribute:add("怒气值", 5)
        end

        --普通攻击击中的第一个目标
        --  if GetUnitAbilityLevel(defUnit.Entity, GetId("B000")) > 0 then
        --  UnitRemoveAbility(defUnit.Entity, "B000")
        --迭代技能
        attactUnit:IterateSkills(
            function(skill)
                skill:OnAttack(attactUnit, defUnit)
            end
        )
        --迭代物品
        attactUnit:IterateItems(
            function(item)
                item:OnAttack(attactUnit, defUnit)
            end
        )
        --迭代Buff
        attactUnit:IterateBuffs(
            function(buff)
                buff:OnAttack(attactUnit, defUnit)
            end
        )
        --迭代Buff
        defUnit:IterateBuffs(
            function(buff)
                buff:OnHurt(attactUnit, defUnit)
            end
        )
    end

    --重新计算伤害
    if (EXGetDamageType() ~= EXDamageType.Real) then
        local def = defUnit.Attribute:get("护甲")
        if (def > 0) then
            local pen = attactUnit.Attribute:get("物理穿透")
            def = def - def * pen
            local attenuation = def * Game.DamageFactor / (def * Game.DamageFactor + 1)
            damage = damage - damage * attenuation
        else
            attenuation = 2 - (1 - Game.DamageFactor) ^ math.abs(def)
            damage = damage * attenuation
        end
    end

    if GetUnitAbilityLevel(attactUnit.Entity, GetId("Aloc")) > 0 then
        EXSetEventDamage(0)
        GameEventProc.SendEvent("任意马甲伤害", attactUnit, defUnit) --额外事件推送,伤害来源是马甲
    else
        defUnit:AddDamageText(damage, isCritDamage, EXGetDamageColor())
        EXSetEventDamage(damage)
    end

    --智能施法
    attactUnit:IterateSkills(
        function(skill)
            --   -1被动 0无目标 1单位目标 2点目标 3点范围
            if (skill.Order == nil or skill.SkillType == -1 or skill:IsCD()) then
                return
            end
            if (skill.SkillType == 0) then
                IssueImmediateOrder(attactUnit.Entity, skill.Order)
            else
                local target =
                    defUnit.Attribute:get("生命") > damage and defUnit or
                    AssetsManager.OverlapRandom(defUnit:X(), defUnit:Y(), 400)
                if (target ~= nil) then
                    if (skill.SkillType == 1) then
                        IssueTargetOrder(attactUnit.Entity, skill.Order, target.Entity)
                    elseif (skill.SkillType == 2 or skill.SkillType == 3) then
                        IssuePointOrder(attactUnit.Entity, skill.Order, target:X(), target:Y())
                    end
                end
            end
        end
    )
end

--任意单位完成建造
function GameStart.AnyUnitConstructFinish()
    local unit = AssetsManager.LoadEntity(GetConstructedStructure()) --完成的建筑
    --[[   if (IsUnitType(unit.Entity, UNIT_TYPE_MELEE_ATTACKER) == true) then
        UnitAddAbility(unit.Entity, GetId("AHZ1"))
        UnitMakeAbilityPermanent(unit.Entity, true, GetId("AHZ1"))
    else
        UnitAddAbility(unit.Entity, GetId("AHZ2"))
        UnitMakeAbilityPermanent(unit.Entity, true, GetId("AHZ2"))
    end]]
end

--任意单位被召唤
function GameStart.AnyUnitSummon()
    local summoningUnit = GetJ_Units()[GetSummoningUnit()]
    --召唤者
    if (summoningUnit == nil) then
        return
    end
    local summonedUnit = AssetsManager.LoadEntity(GetSummonedUnit()) --召唤单位
end

--任意单位死亡
function GameStart.AnyUnitDeath()
    local killUnit = GetJ_Units()[GetKillingUnit()]
    local dieUnit = GetJ_Units()[GetDyingUnit()]
    if (killUnit == nil or dieUnit == nil) then
        if dieUnit ~= nil and GetUnitAbilityLevel(dieUnit.Entity, GetId("Aloc")) > 0 then
        --马甲死亡,马甲死亡是没有凶手单位的
        end
        return
    end

    --迭代技能
    killUnit:IterateSkills(
        function(skill)
            skill:OnKill(dieUnit)
        end
    )
    --迭代物品
    killUnit:IterateItems(
        function(item)
            item:OnKill(dieUnit)
        end
    )

    --死亡单位是英雄
    if (IsUnitType(dieUnit.Entity, UNIT_TYPE_HERO) == true) then
    end

    if (killUnit.Player.Id ~= PLAYER_NEUTRAL_AGGRESSIVE and killUnit.Player.Id ~= EnemyIndex) then
        PlayerInfo:Kill(killUnit.Player)
    end

    --额外事件推送
    GameEventProc.SendEvent("任意单位死亡", killUnit, dieUnit)
    AssetsManager.RemoveObject(dieUnit)
end

--任意单位提升等级
function GameStart.AnyHeroLevelUp()
    local unit = GetJ_Units()[GetTriggerUnit()]
    if (unit == nil) then
        Game.LogError("任意单位提升等级-丢失单位")
        return
    end

    --迭代物品
    unit:IterateItems(
        function(item)
            item:OnUpgrade()
            item:OnRefresh()
        end
    )
    --额外事件推送
    GameEventProc.SendEvent("任意单位提升等级", unit)
end

--任意单位学习技能
function GameStart.AnyUnitLearnedSkill()
    local learnedUnit = GetJ_Units()[GetLearningUnit()]
    local abilityId = GetLearnedSkill()
    if (learnedUnit == nil) then
        Game.LogError("任意单位学习技能-丢失单位")
        return
    end
    local skill = learnedUnit:LearnedSkill(abilityId)
end

--任意准备施放技能
function GameStart.AnyUnitSpellChannel()
    local spellUnit = GetJ_Units()[GetSpellAbilityUnit()]
    local abilityId = GetSpellAbilityId()
    if (spellUnit == nil) then
        return
    end

    local skill = spellUnit.Skills[abilityId]
    if (skill ~= nil) then
        skill:OnSpellChannel()
    end
end

--任意单位发动技能效果
function GameStart.AnyUnitSpellEffect()
    local spellUnit = GetJ_Units()[GetSpellAbilityUnit()]
    local abilityId = GetSpellAbilityId()
    if (spellUnit == nil) then
        Game.LogError("任意单位发动技能效果-丢失单位")
        return
    end

    local skill = spellUnit.Skills[abilityId]
    if (skill ~= nil) then
        skill:OnSpell()
        --迭代物品
        spellUnit:IterateItems(
            function(item)
                item:OnCast()
            end
        )
    end
end

--任意单位施放技能结束
function GameStart.AnyUnitSpellFinish()
    local spellUnit = GetJ_Units()[GetSpellAbilityUnit()]
    if (spellUnit == nil) then
        Game.LogError("任意单位施放技能结束-丢失单位")
        return
    end

    IssueImmediateOrder(spellUnit.Entity, "stop")
end

--任意单位获得物品
function GameStart.AnyUnitPickUpItem()
    local unit = GetJ_Units()[GetManipulatingUnit()]
    local item = GetManipulatedItem()
    if (unit == nil) then
        Game.LogError("任意单位获得物品-丢失单位")
        return
    end
    local item = unit:AddItem(GetManipulatedItem())

    --刷新所有道具
    unit:IterateItems(
        function(item)
            item:OnRefresh()
        end
    )

    --传送道具功能
    local hero = unit.Id == GetId("ug00") and unit.Player.Hero or unit
    if (item.JumpPoints ~= nil) then
        hero:SetPosition(
            GetLocationX(item.JumpPoints[hero.Player.Id + 1]),
            GetLocationY(item.JumpPoints[hero.Player.Id + 1])
        )
        PanCameraToTimedLocForPlayer(hero.Player.Entity, item.JumpPoints[hero.Player.Id + 1], 0)
    end
    if (item.JumpPoint ~= nil) then
        hero:SetPosition(GetLocationX(item.JumpPoint), GetLocationY(item.JumpPoint))
        PanCameraToTimedLocForPlayer(hero.Player.Entity, item.JumpPoint, 0)
    end
    --练功房
    if (item.LianGongUnitId ~= nil) then
        MonsterRefresh:LianGongRefresh(hero, hero.Player.Id, item.LianGongUnitId)
    end

    Item.ItemCompound(unit.Entity, item.Entity)
    Item.ItemUpgrade(unit, item)
    --Game.Log("任意单位获得物品:" .. item.Name)
    --额外事件推送
    GameEventProc.SendEvent("任意单位获得物品", unit, item)
end

--任意单位使用物品
function GameStart.AnyUnitUseItem()
    local unit = GetJ_Units()[GetManipulatingUnit()]
    if (unit == nil) then
        Game.LogError("任意单位使用物品-丢失单位")
        return
    end
    local item = unit.Items[GetManipulatedItem()]
    if (item == nil) then
        return
    end
    --Game.Log("任意单位使用物品:" .. item.Name)
    item:OnUse()
end

--任意单位出售物品
function GameStart.AnyUnitSellItem()
    local unit = GetJ_Units()[GetBuyingUnit()]
    if (unit == nil) then
        Game.LogError("任意单位出售物品-丢失单位")
        return
    end
    local item = unit.Items[GetManipulatedItem()]
    unit:RemoveItem(GetSoldItem())

    --刷新所有道具
    unit:IterateItems(
        function(item)
            item:OnRefresh()
        end
    )
end

--任意单位丢弃物品
function GameStart.AnyUnitDropItem()
    local unit = GetJ_Units()[GetManipulatingUnit()]
    if (unit == nil) then
        Game.LogError("任意单位丢弃物品-丢失单位")
        return
    end
    --Game.Log("任意单位丢弃物品")
    --local item = unit.Items[GetManipulatedItem()]
    unit:RemoveItem(GetManipulatedItem())

    --刷新所有道具
    unit:IterateItems(
        function(i)
            i:OnRefresh()
        end
    )
end

--任意玩家输入字符串
function GameStart.AnyPlayerChat()
    local player = PlayerInfo:Player(GetPlayerId(GetTriggerPlayer()))
    local str = string.lower(GetEventPlayerChatString())
    if (str == "cheat") then
        cheat()
    end
    local index = string.find(str, "item:")
    if (index ~= nil) then
        local itemId = string.sub(str, index + 5, #str)
        if (#itemId == 4) then
            local playerId = GetPlayerId(GetTriggerPlayer())
            UnitAddItem(
                Worke[playerId].Entity,
                CreateItem(GetId(string.upper(itemId)), Worke[playerId]:X(), Worke[playerId]:Y())
            )
        end
    end

    if (str == "hg") then
        BackHome(player)
    end

    if (str == "++") then
        AddCameraFieldForPlayer(player)
    end

    if (str == "--") then
        MinusCameraFieldForPlayer(player)
    end
end
