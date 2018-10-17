MonsterRefresh = {}
MonsterRefresh.LianGongs = {}
LianGong = {}
local mEnemyPlayer = nil

function LianGong:Clear()
    if (self.Monsters == nil) then
        return
    end
    for k, v in pairs(self.Monsters) do
        AssetsManager.DestroyObject(v)
    end
    self.Monsters = nil
end

function LianGong:Refresh(unitid)
    self:Clear()
    local unit = nil
    self.Monsters = {}
    self.MonsterCount = 20
    for i = 0, 4 do
        for j = 0, 3 do
            local x = GetRectCenterX(self.Rect)
            local y = GetRectCenterY(self.Rect)
            local offX = -200 + 100 * i
            local offY = -200 + 100 * j
            unit = AssetsManager.LoadUnit(mEnemyPlayer.Entity, unitid, x + offX, y + offY)
            self.Monsters[unit] = unit
        end
    end
end

function LianGong:UnitDeath(unit)
    self.Monsters[unit] = nil
    self.MonsterCount = self.MonsterCount - 1
    if (self.MonsterCount <= 0) then
        self:Refresh(ID2Str(unit.Id))
    end
end

function MonsterRefresh.InitLianGong()
    mEnemyPlayer = PlayerInfo:Player(PLAYER_NEUTRAL_AGGRESSIVE)
    for i = 1, PlayerInfo:GetPlayerCount() do
        MonsterRefresh.LianGongs[i] = setmetatable({}, {__index = LianGong})
        MonsterRefresh.LianGongs[i].Action = function(attactUnit, defUnit)
            MonsterRefresh.LianGongs[i]:UnitDeath(defUnit)
        end
    end
    MonsterRefresh.LianGongs[1].Rect = Jglobals.gg_rct_LianGong1
    MonsterRefresh.LianGongs[1].Region = CreateRegion()
    RegionAddRect(MonsterRefresh.LianGongs[1].Region, Jglobals.gg_rct_LianGong1)
    MonsterRefresh.LianGongs[2].Rect = Jglobals.gg_rct_LianGong2
    MonsterRefresh.LianGongs[2].Region = CreateRegion()
    RegionAddRect(MonsterRefresh.LianGongs[2].Region, Jglobals.gg_rct_LianGong2)
    MonsterRefresh.LianGongs[3].Rect = Jglobals.gg_rct_LianGong3
    MonsterRefresh.LianGongs[3].Region = CreateRegion()
    RegionAddRect(MonsterRefresh.LianGongs[3].Region, Jglobals.gg_rct_LianGong3)
    MonsterRefresh.LianGongs[4].Rect = Jglobals.gg_rct_LianGong4
    MonsterRefresh.LianGongs[4].Region = CreateRegion()
    RegionAddRect(MonsterRefresh.LianGongs[4].Region, Jglobals.gg_rct_LianGong4)
end

function MonsterRefresh:LianGongRefresh(enteringUnit, playerId, unitid)
    self.LianGongs[playerId + 1]:Refresh(unitid)
    if (self.LianGongs[playerId + 1].Trigger ~= nil) then
        return
    end
    self.LianGongs[playerId + 1].Trigger = CreateTrigger()
    TriggerRegisterLeaveRectSimple(self.LianGongs[playerId + 1].Trigger, self.LianGongs[playerId + 1].Rect)
    GameEventProc.RegisterEventHandler("任意单位死亡", self.LianGongs[playerId + 1].Action)
    TriggerAddAction(
        self.LianGongs[playerId + 1].Trigger,
        function()
            if (GetLeavingUnit() == enteringUnit.Entity) then
                self.LianGongs[playerId + 1]:Clear()
                GameEventProc.UnregisterEventHandler("任意单位死亡", self.LianGongs[playerId + 1].Action)
                DestroyTrigger(self.LianGongs[playerId + 1].Trigger)
                self.LianGongs[playerId + 1].Trigger = nil
            end
        end
    )
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
    MonsterRefresh.InitLianGong()
    --DelayPush()
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
