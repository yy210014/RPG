require "scripts.Combat.PlayerInfo"
require "scripts.AssetsManager"
require "scripts.MonsterRefresh"
require "scripts.Multiboard"
require "scripts.Combat.Unit"
require "scripts.Combat.Attribute"
require "scripts.Combat.Buffs.InitBuff"
require "scripts.Combat.Items.InitItem"
require "scripts.Combat.Skills.InitSkill"
require "scripts.Combat.Locomotions.InitLocomotion"
require "scripts.Combat.Mission"
Jglobals = require "jass.globals"

GameScene = {}
Worke = _array_()
GameScene.Elapsed = 0
GameScene.DeltaTime = 0.016

JumpPoint = {
    Home = GetRectCenter(Jglobals.gg_rct_Jump_22), --基地
    LianGong1 = GetRectCenter(Jglobals.gg_rct_Jump_00),
    LianGong2 = GetRectCenter(Jglobals.gg_rct_Jump_01),
    LianGong3 = GetRectCenter(Jglobals.gg_rct_Jump_02),
    LianGong4 = GetRectCenter(Jglobals.gg_rct_Jump_03),
    KuangLang = GetRectCenter(Jglobals.gg_rct_Jump_04), --狂狼Boss
    QingYi = GetRectCenter(Jglobals.gg_rct_Jump_05), --青衣冢BOSS
    HuoYan = GetRectCenter(Jglobals.gg_rct_Jump_06), --火岩洞穴BOSS
    XueMing = GetRectCenter(Jglobals.gg_rct_Jump_07), --幽冥居BOSS
    TianJie = GetRectCenter(Jglobals.gg_rct_Jump_08), --天劫谷BOSS
    LieYan = GetRectCenter(Jglobals.gg_rct_Jump_09), --烈焰地宫
    Tu = GetRectCenter(Jglobals.gg_rct_Jump_10), --土族Boss
    Mu = GetRectCenter(Jglobals.gg_rct_Jump_11), --木族Boss
    Xue = GetRectCenter(Jglobals.gg_rct_Jump_12), --雪族Boss
    Huo = GetRectCenter(Jglobals.gg_rct_Jump_13), --火族Boss
    RenYu = GetRectCenter(Jglobals.gg_rct_Jump_14), --人鱼女王
    YeQu = GetRectCenter(Jglobals.gg_rct_Jump_15), --野区副本
    JueXue1 = GetRectCenter(Jglobals.gg_rct_Jump_21), --绝学殿护卫
    JueXue2 = GetRectCenter(Jglobals.gg_rct_Jump_20), --绝学殿弟子阿风
    JueXue3 = GetRectCenter(Jglobals.gg_rct_Jump_19), --绝学殿二弟子雷火冥
    JueXue4 = GetRectCenter(Jglobals.gg_rct_Jump_16), --绝学殿大弟子破心
    JueXue5 = GetRectCenter(Jglobals.gg_rct_Jump_17), --绝学殿大师-无能
    JueXue6 = GetRectCenter(Jglobals.gg_rct_Jump_18), --绝学殿掌门
    ShiLi1 = GetRectCenter(Jglobals.gg_rct_Jump_25), --势力BOSS1
    ShiLi2 = GetRectCenter(Jglobals.gg_rct_Jump_23), --势力BOSS2
    ShiJie = GetRectCenter(Jglobals.gg_rct_Jump_24), --世界BOSS
    XiuLuo = GetRectCenter(Jglobals.gg_rct_Jump_26), --修罗场1层BOSS
    ShenShou = GetRectCenter(Jglobals.gg_rct_Jump_27), --神兽岛
    QingLing = GetRectCenter(Jglobals.gg_rct_Jump_28), --器灵BOSS
    HuangHun = GetRectCenter(Jglobals.gg_rct_Jump_29), --黄昏神殿BOSS
    TianJie = GetRectCenter(Jglobals.gg_rct_Jump_30), --天界炼狱BOSS
    LvShuang = GetRectCenter(Jglobals.gg_rct_Jump_34), --覆霜雪地
    LvShuangBoss = GetRectCenter(Jglobals.gg_rct_Jump_31), --履霜密境BOSS
    ZhiTian = GetRectCenter(Jglobals.gg_rct_Jump_32), --指天神殿BOSS
    TunTian = GetRectCenter(Jglobals.gg_rct_Jump_33), --吞天神殿BOSS
    God = GetRectCenter(Jglobals.gg_rct_Jump_35) --上古神族族长
}

local function InitPlayer()
    for i = 0, PlayerInfo:GetPlayerCount() - 1 do
        SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD, 100000)
        SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_LUMBER, 100000)
        SetPlayerState(Player(i), PLAYER_STATE_FOOD_CAP_CEILING, FOOD_MAX)
        --修改了人口上限
        SetPlayerState(Player(i), PLAYER_STATE_RESOURCE_FOOD_CAP, FOOD_MAX)
        if
            (GetPlayerController(Player(i)) == MAP_CONTROL_USER and
                GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING)
         then
        --local p = GetStartLocationLoc(GetPlayerStartLocation(Player(i)))
        -- Worke[i] = AssetsManager.LoadUnit(Player(i), "ug00", 0, 0)
        --  UnitAddItem(Worke[i].Entity, CreateItem(GetId("IU01"), Worke[i]:X(), Worke[i]:Y()))
        --  UnitAddItem(Worke[i].Entity, CreateItem(GetId("IH07"), Worke[i]:X(), Worke[i]:Y()))
        --  RemoveGuardPosition(Worke[i].Entity)
        end
    end
    SetPlayerState(Player(EnemyIndex), PLAYER_STATE_GIVES_BOUNTY, 1)
end

local function InitAllUnit()
    local rect =
        Rect(
        GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT),
        GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM),
        GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT),
        GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP)
    )
    local g = CreateGroup()
    GroupEnumUnitsInRect(g, rect, nil)
    ForGroup(
        g,
        function()
            local unit = AssetsManager.LoadEntity(GetEnumUnit())
            if
                (IsUnitType(unit.Entity, UNIT_TYPE_STRUCTURE) == false and
                    unit.Player.Entity == Player(PLAYER_NEUTRAL_AGGRESSIVE))
             then
                unit.InitPoint = Location(unit:X(), unit:Y())
            end
        end
    )
    RemoveRect(rect)
    DestroyGroup(g)
end

function GameScene.OnGameStart()
    InitPlayer()
    InitAllUnit()
    InitItem()
    Multiboard.CreateMultiboard()
    MonsterRefresh.OnGameStart()
    --Game.Log(os.date("%c"))
    --Game.Log(os.time())
end

function GameScene.OnGameUpdate(dt)
    GameScene.Elapsed = GameScene.Elapsed + dt
    AssetsManager.OnGameUpdate(dt)
    MonsterRefresh.OnGameUpdate(dt)
    Multiboard.OnGameUpdate(dt)
end
