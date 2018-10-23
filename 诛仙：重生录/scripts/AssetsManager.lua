AssetsManager = {}

local mPlayerTeamUnits = {}
local mEnemyTeamUnits = {}
local mDefUnitFacing = 270
local mJ_Units = {}
local mDyingUnits = {}

function GetJ_Units()
    return mJ_Units
end

function GetJ_DyingUnits()
    return mDyingUnits
end

function GetPlayerTeamUnits()
    return mPlayerTeamUnits
end

function GetEnemyTeamUnits()
    return mEnemyTeamUnits
end

function AssetsManager.LoadUnit(player, id, x, y)
    local entity = CreateUnit(player, id, x, y, mDefUnitFacing)
    local unit = Unit:New(entity)
    if (unit.Player.Id == EnemyIndex) then
        mEnemyTeamUnits[unit.Entity] = unit
    else
        mPlayerTeamUnits[unit.Entity] = unit
    end
    mJ_Units[unit.Entity] = unit

    local trig = CreateTrigger()
    TriggerRegisterUnitEvent(trig, entity, EVENT_UNIT_DAMAGED)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitDamaged()
        end
    )
    unit.Trigger = trig
    trig = nil
    return unit
end

function AssetsManager.LoadUnitAtLoc(player, id, point)
    local entity = CreateUnitAtLoc(player, id, point, mDefUnitFacing)
    local unit = Unit:New(entity)
    if (unit.Player.Id == EnemyIndex) then
        mEnemyTeamUnits[unit.Entity] = unit
    else
        mPlayerTeamUnits[unit.Entity] = unit
    end
    mJ_Units[unit.Entity] = unit

    local trig = CreateTrigger()
    TriggerRegisterUnitEvent(trig, entity, EVENT_UNIT_DAMAGED)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitDamaged()
        end
    )
    unit.Trigger = trig
    trig = nil
    return unit
end

function AssetsManager.LoadEntity(entity)
    local unit = Unit:New(entity)
    if (unit.Player.Id == EnemyIndex) then
        mEnemyTeamUnits[unit.Entity] = unit
    else
        mPlayerTeamUnits[unit.Entity] = unit
    end
    mJ_Units[unit.Entity] = unit

    local trig = CreateTrigger()
    TriggerRegisterUnitEvent(trig, entity, EVENT_UNIT_DAMAGED)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitDamaged()
        end
    )
    unit.Trigger = trig
    trig = nil
    return unit
end

local function DestroyPlayerObject(unit, destroy)
    DestroyTrigger(unit.Trigger)
    mJ_Units[unit.Entity] = nil
    mPlayerTeamUnits[unit.Entity] = nil
    unit:Destroy(destroy)
    if (destroy == false) then
        mDyingUnits[#mDyingUnits + 1] = unit
    end
end

local function DestroyEnemyObject(unit, destroy)
    DestroyTrigger(unit.Trigger)
    unit.Trigger = nil
    mJ_Units[unit.Entity] = nil
    mEnemyTeamUnits[unit.Entity] = nil
    unit:Destroy(destroy)
    if (destroy == false) then
        mDyingUnits[#mDyingUnits + 1] = unit
    end
end

function AssetsManager.RemoveObject(unit)
    if (unit.Player.Id == EnemyIndex) then
        DestroyEnemyObject(unit, false)
    else
        DestroyPlayerObject(unit, false)
    end
end

function AssetsManager.DestroyObject(unit)
    if (unit.Player.Id == EnemyIndex) then
        DestroyEnemyObject(unit, true)
    else
        DestroyPlayerObject(unit, true)
    end
end

function AssetsManager.OnGameUpdate(dt)
    for k, v in pairs(mJ_Units) do
        v:OnGameUpdate(dt)
    end

    for i = #mDyingUnits, 1, -1 do
        mDyingUnits[i]:OnDyingUpdate(dt)
        mDyingUnits[i].LifeDt = mDyingUnits[i].LifeDt + dt
        if (mDyingUnits[i].LifeDt >= mDyingUnits[i].DieTime) then
            if (mDyingUnits[i].InitPoint ~= nil) then
                local newUnit =
                    AssetsManager.LoadUnitAtLoc(
                    mDyingUnits[i].Player.Entity,
                    mDyingUnits[i].Id,
                    mDyingUnits[i].InitPoint
                ) --野怪复活
                newUnit.InitPoint = mDyingUnits[i].InitPoint
            end

            mDyingUnits[i]:Destroy(true)
            table.remove(mDyingUnits, i)
        end
    end
end

function AssetsManager.IterateUnits(call)
    for k, v in pairs(mJ_Units) do
        if (v.Attribute:get("生命") > 0) then
            call(v)
        end
    end
end

function AssetsManager.IteratePlayerUnits(call)
    for k, v in pairs(mPlayerTeamUnits) do
        if (v.Attribute:get("生命") > 0) then
            call(v)
        end
    end
end

function AssetsManager.IterateEnemyUnits(call)
    for k, v in pairs(mEnemyTeamUnits) do
        if (v.Attribute:get("生命") > 0) then
            call(v)
        end
    end
end

function AssetsManager.OverlapRandom(x1, y1, radius)
    for k, v in pairs(mEnemyTeamUnits) do
        local dist = DistanceBetweenPoint(x1, v:X(), y1, v:Y())
        if (dist < radius and v.Attribute:get("生命") > 0) then
            return v
        end
    end
end

function AssetsManager.OverlapLine(x1, y1, dis, rng, angle, call)
    for k, v in pairs(mEnemyTeamUnits) do
        local x2 = x1 + dis * math.cos(angle)
        local y2 = y1 + dis * math.sin(angle)
        local x, y = (x1 + x2) / 2, (y1 + y2) / 2
        local r = dis / 2
        local dist1 = DistanceBetweenPoint(x, v:X(), y, v:Y())
        if (dist1 < r + 200 and v.Attribute:get("生命") > 0) then --先选一个圆
            local a, b = y1 - y2, x2 - x1
            local c = -a * x1 - b * y1
            local l = (a * a + b * b) ^ 0.5
            local w = rng / 2
            local dist2 = math.abs(a * v:X() + b * v:Y() + c) / l
            if (dist2 <= w) then
                call(v)
            end
        end
    end
end

function AssetsManager.OverlapCircle(x1, y1, radius, call)
    for k, v in pairs(mEnemyTeamUnits) do
        local dist = DistanceBetweenPoint(x1, v:X(), y1, v:Y())
        if (dist < radius and v.Attribute:get("生命") > 0) then
            call(v)
        end
    end
end

function AssetsManager.OverlapBox()
    for k, v in pairs(mEnemyTeamUnits) do
        if (v.Attribute:get("生命") > 0) then
            call(v)
        end
    end
end

function AssetsManager.OverlapSector()
    for k, v in pairs(mEnemyTeamUnits) do
        if (v.Attribute:get("生命") > 0) then
            call(v)
        end
    end
end
