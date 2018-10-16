Multiboard = {}
local mMultiboard = nil
local mTimeStrs = {}
local mTime1 = 0
local mTime2 = 0
local mTime3 = 0
local mTimeDt = 0

function Multiboard.CreateMultiboard()
    mMultiboard = CreateMultiboard()
    MultiboardMinimize(mMultiboard, false)
    MultiboardSetTitleText(mMultiboard, "第一波：(0：0：0)")
    MultiboardSetRowCount(mMultiboard, PlayerInfo:GetPlayerCount() + 2)
    MultiboardSetColumnCount(mMultiboard, 5)
    MultiboardSetItemsWidth(mMultiboard, 0.03)
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, 0, 0), "|cffFF6633玩家：|r")
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, 0, 1), "|cffFF6633杀敌数：|r")
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, 0, 2), "XX")
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, 0, 3), "XX")
    MultiboardSetItemValue(MultiboardGetItem(mMultiboard, 0, 4), "XX")
    MultiboardSetItemsStyle(mMultiboard, true, false)
    MultiboardDisplay(mMultiboard, true)

    GameEventProc.RegisterEventHandler(
        "玩家显示",
        function(i, playerName)
            MultiboardSetItemValue(MultiboardGetItem(mMultiboard, i, 0), playerName)
        end
    )
    GameEventProc.RegisterEventHandler(
        "杀敌显示",
        function(i, killCount)
            MultiboardSetItemValue(MultiboardGetItem(mMultiboard, i, 1), killCount)
        end
    )
end

function Multiboard.OnGameUpdate(dt)
    if (mMultiboard == nil) then
        return
    end
    mTimeDt = mTimeDt + dt
    if (mTimeDt > 1) then
        mTimeDt = 0
        mTime1 = mTime1 + 1
        if (mTime1 == 60) then
            mTime1 = 1
            mTime2 = mTime2 + 1
            if (mTime2 == 60) then
                mTime2 = 1
                mTime3 = mTime3 + 1
            end
        end
        mTimeStrs[1] = "("
        mTimeStrs[2] = mTime3
        mTimeStrs[3] = "："
        mTimeStrs[4] = mTime2
        mTimeStrs[5] = "："
        mTimeStrs[6] = mTime1
        mTimeStrs[7] = ")"
        MultiboardSetTitleText(mMultiboard, table.concat(mTimeStrs))
    end
end
