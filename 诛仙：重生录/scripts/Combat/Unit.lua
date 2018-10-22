Unit = {}
local mt = {}
Unit.__index = mt
Unit.Locomotion = nil
--Unit.__index = mt
mt.Entity = nil --实体
mt.Attribute = nil
mt.Skills = nil
mt.Buffs = nil
mt.Items = nil
mt.Player = nil
mt.Name = "name"
mt.Id = 0
mt.LastFightTime = 0

function Unit:New(entity)
    if (entity == nil) then
        Game.LogError("单位为null")
        return nil
    end
    local newUnit = {}
    setmetatable(newUnit, {__index = Unit})
    newUnit.Entity = entity
    newUnit.Attribute = Attribute:New(newUnit)
    newUnit.Player = PlayerInfo:Player(GetPlayerId(GetOwningPlayer(entity)))  
    newUnit.Name = GetUnitName(entity)
    newUnit.Id = GetUnitTypeId(entity)
    newUnit.LastFightTime = 0
    newUnit.DieTime = 5
    newUnit.LifeDt = 0
    newUnit.TextDt = 0
    newUnit.ManaDt = 0
    newUnit.Skills = {}
    newUnit.Buffs = {}
    newUnit.Items = {}
    newUnit.Texts = {}
    return newUnit
end

function Unit:CreateDummy(modelName, x, y)
    local unit = CreateUnit(self.Player.Entity, GetId("uq00"), x, y, self:Facing())
    if (unit == nil) then
        Game.LogError("单位为null")
        return nil
    end
    if (modelName ~= "") then
        AddSpecialEffectTarget(modelName, unit, "origin")
    end
    return unit
end

function Unit:AddSkill(abilityid)
    abilityid = GetId(abilityid)
    UnitAddAbility(self.Entity, abilityid)
    UnitMakeAbilityPermanent(self.Entity, true, abilityid)
    local skill = Skill:New(self, abilityid)
    self.Skills[abilityid] = skill
    return skill
end

function Unit:LearnedSkill(abilityid)
    local skill = self.Skills[abilityid]
    if (skill == nil) then
        skill = Skill:New(self, abilityid)
        self.Skills[abilityid] = skill
    end
    skill:OnLearned()
    skill:SetStack(skill.Stack)
    return skill
end

function Unit:AddItem(entity)
    local item = Item:New(self, entity)
    self.Items[entity] = item
    item:OnAdd()
    item:OnRefresh()
    return item
end

function Unit:AddLocomotion(name)
    if (self.Attribute:get("生命") <= 0) then
        return
    end
    if (self.Locomotion ~= nil) then
        self:RemoveLocomotion()
    end
    self.Locomotion = Locomotion:New(self, name)
    return self.Locomotion
end

function Unit:AddDamageText(damage, isCritDamage, color)
    self.Texts[#self.Texts + 1] = {damage, isCritDamage, color}
end

function Unit:AddBuff(name, level)
    if (self.Attribute:get("生命") <= 0) then
        return
    end

    local buff = self.Buffs[name]
    if (buff ~= nil) then
        if (buff.MaxStack > 1) then
            buff:AddStack()
            return buff
        end
        self:RemoveBuff(name)
    end
    buff = Buff:New(self, name, level or 1)
    self.Buffs[name] = buff
    buff:OnAdd()
    return buff
end

function Unit:ContainBuff(name)
    if (self.Buffs[name] ~= nil) then
        return true
    end
    return false
end

function Unit:RemoveBuff(name)
    self.Buffs[name]:OnRemove()
    self.Buffs[name] = nil
end

function Unit:RemoveItem(entity)
    self.Items[entity]:OnRemove()
    self.Items[entity] = nil
end

function Unit:RemoveLocomotion()
    if (self.Locomotion ~= nil) then
        self.Locomotion:OnRemove()
        self.Locomotion = nil
    end
end

function Unit:DestroyItem(entity)
    self:RemoveItem(entity)
    RemoveItem(entity)
end

--走AssetsManager.DestroyObject(unit)删除逻辑，不要直接从这删除
--运动中的单位中途死亡也要让运动继续下去，死亡单位5秒后销毁，并释放相关内存
function Unit:Destroy(destroy)
    for k, v in pairs(self.Buffs) do
        self:RemoveBuff(v.Name)
    end
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
    if (destroy) then
        if (self.Entity ~= nil) then
            RemoveUnit(self.Entity)
        end
        self.Locomotion = nil
        self.Buffs = nil
        self.Skills = nil
        self.Items = nil
        self.Texts = nil
        self.Attribute = nil
        self.Entity = nil
        self.Player = nil
        self.Effect = nil
    end
end

function Unit:UpdateSkillCD()
    if (self.Skills ~= nil) then
        for k, v in pairs(self.Skills) do
            if (v ~= nil) then
                v:UpdateCD()
            else
                Game.LogError("丢失Skill")
            end
        end
    end
end

function Unit:Fighting()
    return GameScene.Elapsed - self.LastFightTime <= 2
end

function Unit:X()
    return GetUnitX(self.Entity)
end

function Unit:Y()
    return GetUnitY(self.Entity)
end

function Unit:Z()
    return GetUnitFlyHeight(self.Entity)
end

function Unit:Facing()
    return GetUnitFacing(self.Entity)
end

function Unit:SetPosition(x, y, z)
    SetUnitX(self.Entity, x)
    SetUnitY(self.Entity, y)
    if (z ~= nil) then
        GetUnitFlyHeight(self.Entity, z)
    end
end

function Unit:SetUnitRotation(zAngle)
    local i = zAngle * 0.7 + 0.5
    if i > 0 then
        SetUnitAnimationByIndex(self.Entity, i)
    else
        SetUnitAnimationByIndex(self.Entity, i + 252)
    end
end

function Unit:SetUnitFacing(facingAngle)
    EXSetUnitFacing(self.Entity, math.deg(facingAngle))
end

function Unit:SetUnitOwner(player)
    SetUnitOwner(self.Entity, player, true)
    self.Player = PlayerInfo:Player(GetPlayerId(player))  
end

function Unit:OnGameUpdate(dt)
    if (self.Locomotion ~= nil) then
        self.Locomotion:OnGameUpdate(dt)
    end

    if (self.Attribute ~= nil) then
        local regenMana = self.Attribute:get("魔法恢复")
        if (regenMana ~= 0) then
            self.Attribute:add("魔法值", regenMana * dt)
        end
    end

    if (self:Fighting() == false and self.ManaType == 2) then
        self.ManaDt = self.ManaDt - dt
        if (self.ManaDt <= 0) then
            self.ManaDt = 1
            self.Attribute:add("怒气值", -10)
        end
    end

    if (self.Texts ~= nil and #self.Texts > 0) then
        self.TextDt = self.TextDt - dt
        if (self.TextDt <= 0) then
            self.TextDt = 0.01
            local text = self.Texts[#self.Texts]
            CreateDamageText(text[1], self.Entity, text[2], text[3])
            self.Texts[#self.Texts] = nil
        end
    end

    if (self.Skills ~= nil) then
        for k, v in pairs(self.Skills) do
            if (v ~= nil) then
                v:OnGameUpdate(dt)
            else
                Game.LogError("丢失Skill")
            end
        end
    end

    if (self.Buffs ~= nil) then
        for k, v in pairs(self.Buffs) do
            if (v ~= nil) then
                v:OnGameUpdate(dt)
            else
                Game.LogError("丢失Buff")
            end
        end
    end
end

--死亡后还会调用的更新
function Unit:OnDyingUpdate(dt)
    if (self.Locomotion ~= nil) then
        self.Locomotion:OnGameUpdate(dt)
    end

    if (self.Texts ~= nil and #self.Texts > 0) then
        self.TextDt = self.TextDt - dt
        if (self.TextDt <= 0) then
            self.TextDt = 0.2
            local text = self.Texts[#self.Texts]
            CreateDamageText(text[1], self.Entity, text[2], text[3])
            self.Texts[#self.Texts] = nil
        end
    end
end

function Unit:IterateSkills(call)
    if (self.Skills ~= nil) then
        for k, v in pairs(self.Skills) do
            if (v ~= nil) then
                call(v)
            else
                Game.LogError("丢失技能")
            end
        end
    end
end

function Unit:IterateBuffs(call)
    if (self.Buffs ~= nil) then
        for k, v in pairs(self.Buffs) do
            if (v ~= nil) then
                call(v)
            else
                Game.LogError("丢失Buff")
            end
        end
    end
end

function Unit:IterateItems(call)
    if (self.Items ~= nil) then
        for k, v in pairs(self.Items) do
            if (v ~= nil) then
                call(v)
            else
                Game.LogError("丢失道具")
            end
        end
    end
end
