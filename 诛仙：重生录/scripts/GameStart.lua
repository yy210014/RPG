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
    SetCameraField(CAMERA_FIELD_ZOFFSET, 200, 0)
    Game.ChooseLevel()
end

--更新
function GameStart.OnGameUpdate(dt)
    GameScene.OnGameUpdate(dt)
end

local mLastSelectedTime = 0
function GameStart.AnyUnitSelected(trig)
    local unit = GetJ_Units()[GetTriggerUnit()]
    if (unit == nil) then
        return
    end

    Game.Log(unit.Player.Id)
    if (IsUnitType(unit.Entity, UNIT_TYPE_HERO) and unit.Player.Id == FirendIndex) then
        if (GameScene.Elapsed - mLastSelectedTime < 0.2) then
            unit:SetUnitOwner(GetTriggerPlayer())
            SetUnitPositionLoc(unit.Entity, JumpPoint.Home)
            PanCameraToTimedLocForPlayer(unit.Player.Entity, JumpPoint.Home, 0)
            DestroyTrigger(trig)
        end
        mLastSelectedTime = GameScene.Elapsed
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
            if GetUnitTypeId(dieUnit.Entity) ~= GetId("uq05") then --地雷特殊处理
                AssetsManager.RemoveObject(dieUnit)
            end
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

    --死亡单位是野怪
    if (dieUnit.InitPoint ~= nil) then
    end
    AssetsManager.RemoveObject(dieUnit)
    if (killunit.Player.ID ~= EnemyIndex) then
        PlayerInfo:Kill(killunit.Player)
    end
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
            Item:OnUpgrade()
            item:OnRefresh()
        end
    )
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
    if (spellUnit == nil) then
        return
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
    --迭代物品
    spellUnit:IterateItems(
        function(item)
            item:OnCast()
        end
    )

    local skill = spellUnit.Skills[abilityId]
    if (skill ~= nil) then
        skill:OnSpell()
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
    unit:AddItem(item)

    --刷新所有道具
    unit:IterateItems(
        function(item)
            item:OnRefresh()
        end
    )
end

--任意单位使用物品
function GameStart.AnyUnitUseItem()
    local unit = GetJ_Units()[GetManipulatingUnit()]
    if (unit == nil) then
        Game.LogError("任意单位使用物品-丢失单位")
        return
    end
    local item = unit.Items[GetManipulatedItem()]
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

    if (str == "++") then
        AddCameraFieldForPlayer()
    end

    if (str == "--") then
        MinusCameraFieldForPlayer()
    end
end
