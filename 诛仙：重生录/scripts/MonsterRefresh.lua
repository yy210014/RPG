MonsterRefresh = {}


function MonsterRefresh.LianGongRefresh(unitid, point)
    local newUnit = null
    for i = 0, 4 do
        for j = 0, 3 do
            local x = GetRectCenterX(whichRect)
            local y = GetRectCenterY(whichRect)
            local offX = -200.00 + 100.00 * I2R(bj_forLoopAIndex)
            local offY = -200.00 + 100.00 * I2R(bj_forLoopBIndex)
        end
    end
end

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
