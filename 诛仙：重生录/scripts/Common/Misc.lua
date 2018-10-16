--镜头+
function AddCameraFieldForPlayer()
    local player = GetTriggerPlayer()
    local nowCameraField = GetCameraTargetPositionZ()
    nowCameraField = nowCameraField + 100
    if (nowCameraField > 600) then
        nowCameraField = 600
    end
    SetCameraFieldForPlayer(player, CAMERA_FIELD_ZOFFSET, nowCameraField, 0)
end

--镜头-
function MinusCameraFieldForPlayer()
    local player = GetTriggerPlayer()
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
    local id = "I0"
    for k, v in pairs(mCheatItems) do
        offX = math.random(0, 600) * math.cos(math.random(0, 360))
        offY = math.random(0, 600) * math.sin(math.random(0, 360))
        CreateItem(GetId(id .. v), x + offX, y + offY)
    end

    for i = 0, 3 do
        if
            (GetPlayerController(Player(i)) == MAP_CONTROL_USER and
                GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING)
         then
            SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, 100000)
            UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH01"), Worke[i]:X(), Worke[i]:Y()))
            for j = 0, 4 do
                UnitAddItem(Worke[i].Entity, CreateItem(GetId("IU01"), Worke[i]:X(), Worke[i]:Y()))
            end
        end
    end

    --遍历出所有状态
    for i = 0, 100 do
        --Game.Log("0x" .. i .. "->" .. R2S(GetUnitState(Worke[0].Entity, ConvertUnitState(0x1 * i))))
    end
end

function GetId(strName)
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
