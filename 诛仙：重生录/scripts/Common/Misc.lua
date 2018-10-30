local JumpEffect = "Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl"

function BackHome(player)
    if (player.Hero ~= nil) then
        player.Hero:SetPosition(GetLocationX(JumpPoint.Home), GetLocationY(JumpPoint.Home))
        PanCameraToTimedLocForPlayer(player.Entity, JumpPoint.Home, 0)
        DestroyEffect(AddSpecialEffect(JumpEffect, player.Hero:X(), player.Hero:Y()))
    end
end

--镜头+
function AddCameraFieldForPlayer(player)
    local player = player.Entity
    local nowCameraField = GetCameraTargetPositionZ()
    nowCameraField = nowCameraField + 100
    SetCameraFieldForPlayer(player, CAMERA_FIELD_ZOFFSET, nowCameraField, 0)
end

--镜头-
function MinusCameraFieldForPlayer(player)
    local player = player.Entity
    local nowCameraField = GetCameraTargetPositionZ()
    nowCameraField = nowCameraField - 50
    if (nowCameraField < 150) then
        nowCameraField = 150
    end
    SetCameraFieldForPlayer(player, CAMERA_FIELD_ZOFFSET, nowCameraField, 0)
end

local mCheatItems = {
    "27",
    "43",
    "45",
    "47",
    "48",
    "50",
    "52",
    "54",
    "56",
    "58",
    "60",
    "64",
    "66",
    "67",
    "69",
    "71",
    "73",
    "75"
}
--作弊
function cheat()
    if (Worke[0] == nil) then
        return
    end
    --创建所有道具到工人身边
    local x = GetUnitX(Worke[0].Entity)
    local y = GetUnitY(Worke[0].Entity)
    local offX = 0
    local offY = 0
    local id = "IA"
    for i = 0, 33 do
        offX = math.random(0, 600) * math.cos(math.random(0, 360))
        offY = math.random(0, 600) * math.sin(math.random(0, 360))
        id = #tostring(i) == 1 and "IA0" .. i or "IA" .. i
        CreateItem(GetId(id), x + offX, y + offY)
    end

    --遍历出所有状态
    for i = 0, 100 do
        --Game.Log("0x" .. i .. "->" .. R2S(GetUnitState(Worke[0].Entity, ConvertUnitState(0x1 * i))))
    end
end

function GetId(strName)
    if (#strName ~= 4) then
        Game.LogError("ID长度错误:" .. strName)
        return -1
    end
    local i = string.byte(strName, 1)
    i = i * 256 + string.byte(strName, 2)
    i = i * 256 + string.byte(strName, 3)
    i = i * 256 + string.byte(strName, 4)
    return i
end

function ID2Str(id)
    local s1, s2, s3, s4
    local i, j = math.modf(id / 256)
    s4 = string.char(j * 256)
    i, j = math.modf(i / 256)
    s3 = string.char(j * 256)
    i, j = math.modf(i / 256)
    s2 = string.char(j * 256)
    i, j = math.modf(i / 256)
    s1 = string.char(j * 256)
    return s1 .. s2 .. s3 .. s4
end

--判断数组中某个数是否存在
function IsInTable(value, arr)
    for i, v in pairs(arr) do
        if arr[i] == value then
            return i
        end
    end
    return -1
end

--获取table长度
function GetTableCount(t)
    local count = 0
    for k, v in pairs(t) do
        count = count + 1
    end
    return count
end

--过滤字符串颜色代码
function FilterStringColor(s)
    local startIndex = string.find(s, "|C" or "|c")
    if (startIndex ~= nil) then
        local endIndex = string.find(s, "|r")
        s = string.sub(s, startIndex + 10, endIndex - 1)
    end
    return s
end

function Clamp(value, min, max)
    if (value > max) then
        return max
    end
    if (value < min) then
        return min
    end
    return value
end

function HasItem(unit, itemID)
    local soltIndex = 0
    local item
    while (6 > soltIndex) do
        item = UnitItemInSlot(unit, soltIndex)
        if (itemID == GetItemTypeId(item) and item ~= GetManipulatedItem()) then
            return item
        end
        soltIndex = soltIndex + 1
    end
    return nil
end

function HasItemAtIndex(unit, itemIDList)
    local indexArr = {}
    local soltIndex = 0
    local hasAll = true
    for i, v in pairs(itemIDList) do
        if (1 < i) then
            hasAll = false
            soltIndex = 0
            while (6 > soltIndex) do
                if (v == GetItemTypeId(UnitItemInSlot(unit, soltIndex)) and -1 == IsInTable(soltIndex, indexArr)) then
                    indexArr[#indexArr + 1] = soltIndex
                    hasAll = true
                    break
                end
                soltIndex = soltIndex + 1
            end
            if (false == hasAll) then
                break
            end
        end
    end
    if (false == hasAll) then
        indexArr = {}
    end
    return indexArr
end
