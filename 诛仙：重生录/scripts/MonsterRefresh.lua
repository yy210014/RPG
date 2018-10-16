require "scripts.AssetsManager"

MonsterRefresh = {}
path_map = {}
mon_next_pos_index = {}

gg_rct_monster_rect0 = nil
gg_rct_monster_rect1 = nil
gg_rct_monster_rect2 = nil
gg_rct_monster_rect3 = nil
gg_rct_run_rect_0 = nil
gg_rct_run_rect_1 = nil
gg_rct_run_rect_2 = nil
gg_rct_run_rect_3 = nil
gg_rct_run_rect_4 = nil
gg_rct_run_rect_5 = nil
gg_rct_run_rect_6 = nil
gg_rct_run_rect_7 = nil
gg_rct_run_rect_8 = nil
gg_rct_run_rect_9 = nil
gg_rct_run_rect_10 = nil
gg_rct_run_rect_11 = nil
gg_rct_run_rect_12 = nil
gg_rct_run_rect_13 = nil
gg_rct_run_rect_14 = nil
gg_rct_run_rect_15 = nil
gg_rct_run_rect_16 = nil
gg_rct_run_rect_17 = nil
gg_rct_run_rect_18 = nil
gg_rct_run_rect_19 = nil
gg_rct_run_rect_20 = nil
gg_rct_run_rect_21 = nil
gg_rct_run_rect_22 = nil
gg_rct_run_rect_23 = nil
gg_rct_rune_rect_0 = nil
gg_rct_rune_rect_1 = nil
gg_rct_rune_rect_2 = nil
gg_rct_rune_rect_3 = nil
gg_trg_init = nil
point_monster_0 = nil
point_monster_1 = nil
point_monster_2 = nil
point_monster_3 = nil
pos_arr_monster_start = _array_()
pos_arr_monster_path = _array_()
pos_arr_monster_path_region = _array_()
point_runes = _array_()

--每波兵出现倒计时时间
local time_of_space = {
    5, 10, 10, 10, 10, 10, 10, 10, 
    20, 10, 10, 10, 10, 10, 10, 10, 
    20, 10, 10, 10, 10, 10, 10, 10, 
    20, 10, 10, 10, 10, 10, 10, 10, 
    20, 10, 10, 10, 10, 10, 10, 10, 
    20, 10, 10, 10, 10, 10, 10, 10, 
    20, 10, 10, 10, 10, 10, 10, 10, 
}
--每波兵出兵持续时间（time_of_delay_show + time_of_space 必须大于 time_of_show）
local time_of_show = 
{
    40, 40, 40, 40, 40, 40, 40, 6, 
    40, 40, 40, 40, 40, 40, 40, 6, 
    40, 40, 40, 40, 40, 40, 40, 6, 
    40, 40, 40, 40, 40, 40, 40, 6, 
    40, 40, 40, 40, 40, 40, 40, 6, 
    40, 40, 40, 40, 40, 40, 40, 6, 
    40, 40, 40, 40, 40, 40, 40, 6
}
--每波兵出兵频率
local time_of_show_rate = {
    0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 4, 
    0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 4, 
    0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 4, 
    0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 4, 
    0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 4, 
    0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 4, 
    0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 4, 
}
--每波兵在上一波兵出现后多久倒计时
local time_of_delay_show = {
    0, 10, 10, 10, 10, 10, 10, 10, 
    30, 10, 10, 10, 10, 10, 10, 10, 
    30, 10, 10, 10, 10, 10, 10, 10, 
    30, 10, 10, 10, 10, 10, 10, 10, 
    30, 10, 10, 10, 10, 10, 10, 10, 
    30, 10, 10, 10, 10, 10, 10, 10, 
    30, 10, 10, 10, 10, 10, 10, 10
}

function Get_region_by_rect(r)
    local rectRegion = CreateRegion()
    RegionAddRect(rectRegion, r)
    return rectRegion
end

local function InitPoints()
    point_monster_0 = GetRectCenter(gg_rct_monster_rect0)
    point_monster_1 = GetRectCenter(gg_rct_monster_rect1)
    point_monster_2 = GetRectCenter(gg_rct_monster_rect2)
    point_monster_3 = GetRectCenter(gg_rct_monster_rect3)
    pos_arr_monster_start[0] = point_monster_0
    pos_arr_monster_start[1] = point_monster_1
    pos_arr_monster_start[2] = point_monster_2
    pos_arr_monster_start[3] = point_monster_3
    pos_arr_monster_path[0] = gg_rct_run_rect_0
    pos_arr_monster_path[1] = gg_rct_run_rect_1
    pos_arr_monster_path[2] = gg_rct_run_rect_2
    pos_arr_monster_path[3] = gg_rct_run_rect_3
    pos_arr_monster_path[4] = gg_rct_run_rect_4
    pos_arr_monster_path[5] = gg_rct_run_rect_5
    pos_arr_monster_path[6] = gg_rct_run_rect_6
    pos_arr_monster_path[7] = gg_rct_run_rect_7
    pos_arr_monster_path[8] = gg_rct_run_rect_8
    pos_arr_monster_path[9] = gg_rct_run_rect_9
    pos_arr_monster_path[10] = gg_rct_run_rect_10
    pos_arr_monster_path[11] = gg_rct_run_rect_11
    pos_arr_monster_path[12] = gg_rct_run_rect_12
    pos_arr_monster_path[13] = gg_rct_run_rect_13
    pos_arr_monster_path[14] = gg_rct_run_rect_14
    pos_arr_monster_path[15] = gg_rct_run_rect_15
    pos_arr_monster_path[16] = gg_rct_run_rect_16
    pos_arr_monster_path[17] = gg_rct_run_rect_17
    pos_arr_monster_path[18] = gg_rct_run_rect_18
    pos_arr_monster_path[19] = gg_rct_run_rect_19
    pos_arr_monster_path[20] = gg_rct_run_rect_20
    pos_arr_monster_path[21] = gg_rct_run_rect_21
    pos_arr_monster_path[22] = gg_rct_run_rect_22
    pos_arr_monster_path[23] = gg_rct_run_rect_23

    pos_arr_monster_path_region[0] = Get_region_by_rect(gg_rct_run_rect_0)
    pos_arr_monster_path_region[1] = Get_region_by_rect(gg_rct_run_rect_1)
    pos_arr_monster_path_region[2] = Get_region_by_rect(gg_rct_run_rect_2)
    pos_arr_monster_path_region[3] = Get_region_by_rect(gg_rct_run_rect_3)
    pos_arr_monster_path_region[4] = Get_region_by_rect(gg_rct_run_rect_4)
    pos_arr_monster_path_region[5] = Get_region_by_rect(gg_rct_run_rect_5)
    pos_arr_monster_path_region[6] = Get_region_by_rect(gg_rct_run_rect_6)
    pos_arr_monster_path_region[7] = Get_region_by_rect(gg_rct_run_rect_7)
    pos_arr_monster_path_region[8] = Get_region_by_rect(gg_rct_run_rect_8)
    pos_arr_monster_path_region[9] = Get_region_by_rect(gg_rct_run_rect_9)
    pos_arr_monster_path_region[10] = Get_region_by_rect(gg_rct_run_rect_10)
    pos_arr_monster_path_region[11] = Get_region_by_rect(gg_rct_run_rect_11)
    pos_arr_monster_path_region[12] = Get_region_by_rect(gg_rct_run_rect_12)
    pos_arr_monster_path_region[13] = Get_region_by_rect(gg_rct_run_rect_13)
    pos_arr_monster_path_region[14] = Get_region_by_rect(gg_rct_run_rect_14)
    pos_arr_monster_path_region[15] = Get_region_by_rect(gg_rct_run_rect_15)
    pos_arr_monster_path_region[16] = Get_region_by_rect(gg_rct_run_rect_16)
    pos_arr_monster_path_region[17] = Get_region_by_rect(gg_rct_run_rect_17)
    pos_arr_monster_path_region[18] = Get_region_by_rect(gg_rct_run_rect_18)
    pos_arr_monster_path_region[19] = Get_region_by_rect(gg_rct_run_rect_19)
    pos_arr_monster_path_region[20] = Get_region_by_rect(gg_rct_run_rect_20)
    pos_arr_monster_path_region[21] = Get_region_by_rect(gg_rct_run_rect_21)
    pos_arr_monster_path_region[22] = Get_region_by_rect(gg_rct_run_rect_22)
    pos_arr_monster_path_region[23] = Get_region_by_rect(gg_rct_run_rect_23)
    point_runes[0] = GetRectCenter(gg_rct_rune_rect_0)
    point_runes[1] = GetRectCenter(gg_rct_rune_rect_1)
    point_runes[2] = GetRectCenter(gg_rct_rune_rect_2)
    point_runes[3] = GetRectCenter(gg_rct_rune_rect_3)

    --怪物路径选择
    path_map[0] = {8}
    path_map[1] = {20}
    path_map[2] = {18}
    path_map[3] = {15}
    path_map[4] = {5, 11}
    path_map[5] = {4, 6, 9}
    path_map[6] = {5, 14}
    path_map[7] = {8, 12}
    path_map[8] = {7, 9}
    path_map[9] = {5, 8, 10}
    path_map[10] = {9, 20}
    path_map[11] = {4, 12, 21}
    path_map[12] = {7, 11, 15}
    path_map[13] = {14, 19, 20}
    path_map[14] = {6, 13, 23}
    path_map[15] = {12, 16}
    path_map[16] = {15, 17}
    path_map[17] = {16, 18, 22}
    path_map[18] = {17, 19}
    path_map[19] = {13, 18}
    path_map[20] = {10, 13}
    path_map[21] = {11, 22}
    path_map[22] = {17, 21, 23}
    path_map[23] = {14, 22}
end

local function InitRegions()
    gg_rct_monster_rect0 = Rect(-1152.0, 448.0, -416.0, 1088.0)
    gg_rct_monster_rect1 = Rect(416.0, 416.0, 1120.0, 1088.0)
    gg_rct_monster_rect2 = Rect(384.0, -1120.0, 1088.0, -448.0)
    gg_rct_monster_rect3 = Rect(-1152.0, -1120.0, -384.0, -448.0)
    gg_rct_run_rect_0 = Rect(-1888.0, 704.0, -1760.0, 864.0)
    gg_rct_run_rect_1 = Rect(704.0, 1728.0, 832.0, 1856.0)
    gg_rct_run_rect_2 = Rect(1760.0, -864.0, 1856.0, -704.0)
    gg_rct_run_rect_3 = Rect(-832.0, -1856.0, -704.0, -1760.0)
    gg_rct_run_rect_4 = Rect(-3904.0, 3776.0, -3808.0, 3872.0)
    gg_rct_run_rect_5 = Rect(-32.0, 3776.0, 64.0, 3872.0)
    gg_rct_run_rect_6 = Rect(3776.0, 3776.0, 3872.0, 3872.0)
    gg_rct_run_rect_7 = Rect(-2944.0, 2720.0, -2784.0, 2880.0)
    gg_rct_run_rect_8 = Rect(-1856.0, 2752.0, -1728.0, 2912.0)
    gg_rct_run_rect_9 = Rect(-64.0, 2784.0, 32.0, 2880.0)
    gg_rct_run_rect_10 = Rect(2752.0, 2752.0, 2848.0, 2848.0)
    gg_rct_run_rect_11 = Rect(-3872.0, -32.0, -3776.0, 64.0)
    gg_rct_run_rect_12 = Rect(-2880.0, -32.0, -2784.0, 64.0)
    gg_rct_run_rect_13 = Rect(2784.0, -64.0, 2880.0, 32.0)
    gg_rct_run_rect_14 = Rect(3808.0, -64.0, 3904.0, 32.0)
    gg_rct_run_rect_15 = Rect(-2848.0, -1856.0, -2752.0, -1760.0)
    gg_rct_run_rect_16 = Rect(-2848.0, -2880.0, -2752.0, -2784.0)
    gg_rct_run_rect_17 = Rect(-64.0, -2880.0, 32.0, -2784.0)
    gg_rct_run_rect_18 = Rect(1728.0, -2880.0, 1824.0, -2784.0)
    gg_rct_run_rect_19 = Rect(2784.0, -2848.0, 2880.0, -2752.0)
    gg_rct_run_rect_20 = Rect(2752.0, 1728.0, 2848.0, 1824.0)
    gg_rct_run_rect_21 = Rect(-3936.0, -3936.0, -3776.0, -3776.0)
    gg_rct_run_rect_22 = Rect(-64.0, -3904.0, 32.0, -3808.0)
    gg_rct_run_rect_23 = Rect(3808.0, -3904.0, 3904.0, -3808.0)
    gg_rct_rune_rect_0 = Rect(-1312.0, 1088.0, -1056.0, 1312.0)
    gg_rct_rune_rect_1 = Rect(1088.0, 1120.0, 1344.0, 1344.0)
    gg_rct_rune_rect_2 = Rect(1088.0, -1344.0, 1344.0, -1120.0)
    gg_rct_rune_rect_3 = Rect(-1344.0, -1344.0, -1088.0, -1120.0)
end

function Trig_unitIntoRect_Act()
    local trig_region
    local trig_rect
    local str
    local charStr
    local arrTemp = _array_(0)
    local arr = {}
    local i = 0
    local j = 1
    local k = 1
    local p = tonumber(GetUnitUserData(GetEnteringUnit()))
    for _ in _loop_() do
        if nil == pos_arr_monster_path_region[i] then
            break
        end
        trig_region = pos_arr_monster_path_region[i]
        if GetTriggeringRegion() == trig_region then
            SetUnitUserData(GetEnteringUnit(), i)
            str = path_map[i]
            for _ in _loop_() do
                if j > #str then
                    break
                end
                charStr = tonumber(str[j])
                if p ~= charStr then
                    arr[k] = charStr
                    k = k + 1
                end
                j = j + 1
            end
            if true then
                break
            end
        end
        i = i + 1
    end
    if (1 == #arr) then
        k = 1
    else
        k = math.floor(math.random(1, #arr))
    end
    trig_rect = pos_arr_monster_path[arr[k]]
    IssuePointOrderLoc(GetEnteringUnit(), "move", GetRectCenter(trig_rect))
    local index = IsInTable(GetEnteringUnit(), GetEnemyTeamUnits())
    if (-1 ~= index) then
        mon_next_pos_index[index] = arr[k]
    end
    trig_rect = nil
end

function Trig_UnitIntoRect()
    local trig = nil
    local i = 0
    for _ in _loop_() do
        if nil == pos_arr_monster_path_region[i] then
            break
        end
        trig = CreateTrigger()
        TriggerRegisterEnterRegion(trig, pos_arr_monster_path_region[i], nil)
        TriggerAddCondition(
            trig,
            Condition(
                function()
                    return GetOwningPlayer(GetEnteringUnit()) == Player(EnemyIndex)
                end
            )
        )
        TriggerAddAction(trig, Trig_unitIntoRect_Act)
        i = i + 1
    end
    trig = nil
end

GameMode = 0
NormalMode = 0
EndlessMode = 1

--当前波数
local mCurWaveIndex = 1
local mNextWaveIndex = 1
local mDuration = 0

local mRunTime = 0
local mTimeDt1 = 0
local mTimeDt2 = 0
local mTimeDt3 = 0
local mTimeDt4 = 0

local function IsBOSS(lv)
    return 0 == math.floor(lv % 8 * 10)
end

local function GetCurWaveMonName()
    local monName = ""
    local stringCurLv = tostring(mCurWaveIndex)
    if (2 > #stringCurLv) then
        stringCurLv = "0" .. stringCurLv
    end
    local nameStr = "um"
    if (IsBOSS(mCurWaveIndex)) then
        nameStr = "UM"
    end
    monName = nameStr .. stringCurLv
    return monName
end

local function Spawn(spawnPoint, index)
    local locB = GetRectCenter(pos_arr_monster_path[index])
    local unit = AssetsManager.LoadUnitAtLoc(Player(EnemyIndex), GetCurWaveMonName(), spawnPoint)
    SetUnitUserData(unit.Entity, -1)
  --  unit.Attribute:add("护甲", 10)
  --  unit.Attribute:add("生命上限", 200)
    unit.Attribute:add("生命", unit.Attribute:get("生命上限"))
    unit.Attribute:add("魔法值", unit.Attribute:get("魔法上限"))
    SetUnitPathing(unit.Entity, false)
    RemoveGuardPosition(unit.Entity)
    IssuePointOrderLoc(unit.Entity, "move", locB)
    RemoveLocation(locB)
end

local mDelayPushTimer = CreateTimer()
local mDelayPushTimerDialog = nil
local mSpawnEnable = false

local function DelayPush()
    ResumeTimer(mDelayPushTimer)
    local timeCount = time_of_space[mCurWaveIndex]
    TimerStart(
        mDelayPushTimer,
        timeCount,
        false,
        function()
            PushWave()
            PauseTimer(mDelayPushTimer)
        end
    )
    local contentStr = "第" .. (mCurWaveIndex) .. "波"
    mDelayPushTimerDialog = CreateTimerDialog(mDelayPushTimer)
    TimerDialogSetTitle(mDelayPushTimerDialog, contentStr)
    TimerDialogDisplay(mDelayPushTimerDialog, true)
end

function MonsterRefresh.OnGameStart()
    InitRegions()
    InitPoints()
    Trig_UnitIntoRect()
    DelayPush()
end

function PushWave()
    mSpawnEnable = true
end

function WavesClear()
    mTimeDt1 = 0
    mTimeDt2 = 0
    mTimeDt3 = 0
    mTimeDt4 = 0
    mSpawnEnable = false
    mCurWaveIndex = mCurWaveIndex + 1
    DelayPush()
end

function AllWavesDie()
    -- body
end

function MonsterRefresh.OnGameUpdate(dt)
    --	mRunTime = mRunTime + dt
    --	mTimeDt1 = mTimeDt1 + dt
    --	local t1 = time_of_space[mCurWaveIndex] --每波兵出现倒计时时间

    if (mSpawnEnable) then
        mTimeDt2 = mTimeDt2 + dt
        local t2 = time_of_show[mCurWaveIndex] --每波兵出兵持续时间
        local t3 = time_of_show_rate[mCurWaveIndex] --每波兵出兵频率
        --持续时间`1
        if (mTimeDt2 <= t2) then
            --出兵频率
            mTimeDt3 = mTimeDt3 + dt
            if (mTimeDt3 > t3) then
                mTimeDt3 = 0
                for i = 0, PlayerInfo.PlayerCount do
                    if
                        (GetPlayerController(Player(i)) == MAP_CONTROL_USER and
                            GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING)
                     then
                        Spawn(pos_arr_monster_start[i], i)
                    end
                end
                return
            end
        else
            local t4 = time_of_delay_show[mCurWaveIndex] --每波兵在上一波兵出现后多久倒计时
            mTimeDt4 = mTimeDt4 + dt
            if (mTimeDt4 > t4) then
                WavesClear()
            end
        end
    end
end
