local locomotion = Locomotions["击飞"]
locomotion.Target = nil
locomotion.Duration = 1
locomotion.High = 100
locomotion.TimeDt = 0

locomotion.OnUp = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    local targetUnit = self.Target.Entity
    local h = Lerp(0, self.High, self.TimeDt / self.Duration)
    SetUnitFlyHeight(targetUnit, h, 0.00)
    if (h > self.High) then
        self.TimeDt = 0
        self.CurAction = self.OnDown
    end
end

locomotion.OnDown = function(self, dt)
    self.TimeDt = self.TimeDt + dt
    local targetUnit = self.Target.Entity
    local h = Lerp(GetUnitFlyHeight(targetUnit), 0, self.TimeDt / self.Duration * 0.5)
    SetUnitFlyHeight(targetUnit, h, 0.00)
    if (h <= 0) then
        PauseUnit(targetUnit, false)
        self:PathEnded()
    end
end

function locomotion:Start(...)
    local arg = {...}
    self.Target = arg[1]
    self.Duration = arg[2]
    self.High = arg[3]
    self.OnPathEnd = arg[4]

    local targetUnit = self.Target.Entity
    UnitAddAbility(targetUnit, GetId("Arav"))
    UnitRemoveAbility(targetUnit, GetId("Arav"))
    PauseUnit(targetUnit, true)
    DestroyEffect(
        AddSpecialEffect("Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageDeathCaster.mdl", self.Target:X(), self.Target:Y())
    )
    self.TimeDt = 0
    self.CurAction = self.OnUp
    arg = nil
    return self
end
