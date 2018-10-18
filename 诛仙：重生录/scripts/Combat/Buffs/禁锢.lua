--通用buff，不叠加，相同buff会覆盖,需要先继承在用则可以叠加
local buff = Buffs["禁锢"]
buff.Durs = {1}

function buff:OnAdd()
    local unit = self.Owner
    SetUnitAnimation(unit.Entity, "stand")
    DestroyEffect(
        AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl", unit.Entity, "origin")
    )
    self.Effect = AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTo.mdl", unit.Entity, "origin")
    self.LastSpeed = (GetUnitDefaultMoveSpeed(unit.Entity) + unit.Attribute:get("移动速度加成")) * -1
    unit.Attribute:add("移动速度加成", self.LastSpeed)
end

function buff:OnRemove()
    if (self.Effect ~= nil) then
        DestroyEffect(self.Effect)
    end
    self.Owner.Attribute:add("移动速度加成", -self.LastSpeed)
end
