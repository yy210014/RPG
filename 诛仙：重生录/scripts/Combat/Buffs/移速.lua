--通用buff，不叠加，相同buff会覆盖,需要先继承在用则可以叠加
local buff = Buffs["移速"]
buff.Durs = {2, 2, 2, 2, 2, 2}
buff.values = {0, 0, 0, 0, 0, 0}
buff.LastSpeed = 0

function buff:OnAdd()
    local unit = self.Owner
    self.LastSpeed =
        (GetUnitDefaultMoveSpeed(unit.Entity) + unit.Attribute:get("移动速度加成")) * self.values[self.Level] * self.Stack
    if (self.LastSpeed > 0) then
        self.Effect = AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIsp\\SpeedTarget.mdl", unit.Entity, "overhead")
    elseif (self.LastSpeed < 0) then
        self.Effect = AddSpecialEffectTarget("Abilities\\Spells\\Human\\slow\\slowtarget.mdl", unit.Entity, "origin")
    end
    unit.Attribute:add("移动速度加成", self.LastSpeed)
end

function buff:OnRemove()
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
    local unit = self.Owner
    unit.Attribute:add("移动速度加成", -self.LastSpeed)
end
