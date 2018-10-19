globals
//globals from BzAPI:
constant boolean LIBRARY_BzAPI=true
trigger array BzAPI__DamageEventQueue
integer BzAPI__DamageEventNumber= 0
//endglobals from BzAPI
//globals from cjLib75hJKJ374s4e597nba9o7w45gf:
constant boolean LIBRARY_cjLib75hJKJ374s4e597nba9o7w45gf=true
group cj_tmpgr_copy_nw509ert7
//endglobals from cjLib75hJKJ374s4e597nba9o7w45gf
//globals from cjLibw560nbs9b8nse46703948:
constant boolean LIBRARY_cjLibw560nbs9b8nse46703948=true
boolexpr cj_true_bool_4896bnao87
//endglobals from cjLibw560nbs9b8nse46703948
integer array udg_Frame
rect gg_rct_ChuGuaiKou_1=null
rect gg_rct_ChuGuaiKou_2=null
rect gg_rct_ChuGuaiKou_Boss=null
rect gg_rct_weather_snow=null
rect gg_rct_weather_wind=null
rect gg_rct_weather_moonlight=null
rect gg_rct_weather_rain=null
rect gg_rct_weather_snow2=null
rect gg_rct_Jump_00=null
rect gg_rct_Jump_01=null
rect gg_rct_Jump_02=null
rect gg_rct_Jump_03=null
rect gg_rct_Jump_04=null
rect gg_rct_Jump_05=null
rect gg_rct_Jump_06=null
rect gg_rct_Jump_07=null
rect gg_rct_Jump_08=null
rect gg_rct_Jump_09=null
rect gg_rct_Jump_10=null
rect gg_rct_Jump_11=null
rect gg_rct_Jump_12=null
rect gg_rct_Jump_13=null
rect gg_rct_Jump_14=null
rect gg_rct_Jump_15=null
rect gg_rct_Jump_16=null
rect gg_rct_Jump_17=null
rect gg_rct_Jump_18=null
rect gg_rct_Jump_19=null
rect gg_rct_Jump_20=null
rect gg_rct_Jump_21=null
rect gg_rct_Jump_22=null
rect gg_rct_Jump_23=null
rect gg_rct_Jump_24=null
rect gg_rct_Jump_25=null
rect gg_rct_Jump_26=null
rect gg_rct_Jump_27=null
rect gg_rct_Jump_28=null
rect gg_rct_Jump_29=null
rect gg_rct_Jump_30=null
rect gg_rct_Jump_31=null
rect gg_rct_Jump_32=null
rect gg_rct_Jump_33=null
rect gg_rct_Jump_34=null
rect gg_rct_Jump_35=null
sound gg_snd_tr_w2=null
sound gg_snd_tr_w0=null
sound gg_snd_MouseClick1=null
trigger gg_trg_______u=null
rect gg_rct_LianGong1=null
rect gg_rct_LianGong2=null
rect gg_rct_LianGong3=null
rect gg_rct_LianGong4=null

trigger l__library_init

//JASSHelper struct globals:

endglobals
native DzGetMouseTerrainX takes nothing returns real
    native DzGetMouseTerrainY takes nothing returns real
    native DzGetMouseTerrainZ takes nothing returns real
    native DzIsMouseOverUI takes nothing returns boolean
    native DzGetMouseX takes nothing returns integer
    native DzGetMouseY takes nothing returns integer
    native DzGetMouseXRelative takes nothing returns integer
    native DzGetMouseYRelative takes nothing returns integer
    native DzSetMousePos takes integer x, integer y returns nothing
    native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzGetTriggerKey takes nothing returns integer
    native DzGetWheelDelta takes nothing returns integer
    native DzIsKeyDown takes integer iKey returns boolean
    native DzGetTriggerKeyPlayer takes nothing returns player
    native DzGetWindowWidth takes nothing returns integer
    native DzGetWindowHeight takes nothing returns integer
    native DzGetWindowX takes nothing returns integer
    native DzGetWindowY takes nothing returns integer
    native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzIsWindowActive takes nothing returns boolean
    native DzDestructablePosition takes destructable d, real x, real y returns nothing
    native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
    native DzExecuteFunc takes string funcName returns nothing
    native DzGetUnitUnderMouse takes nothing returns unit
    native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
    native DzSetMemory takes integer address, real value returns nothing
    native DzSetUnitID takes unit whichUnit, integer id returns nothing
    native DzSetUnitModel takes unit whichUnit, string path returns nothing
    native DzSetWar3MapMap takes string map returns nothing
    native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
    native DzSyncData takes string prefix, string data returns nothing
    native DzGetTriggerSyncData takes nothing returns string
    native DzGetTriggerSyncPlayer takes nothing returns player
    native DzFrameHideInterface takes nothing returns nothing
    native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
    native DzFrameGetPortrait takes nothing returns integer
    native DzFrameGetMinimap takes nothing returns integer
    native DzFrameGetCommandBarButton takes integer row, integer column returns integer
    native DzFrameGetHeroBarButton takes integer buttonId returns integer
    native DzFrameGetHeroHPBar takes integer buttonId returns integer
    native DzFrameGetHeroManaBar takes integer buttonId returns integer
    native DzFrameGetItemBarButton takes integer buttonId returns integer
    native DzFrameGetMinimapButton takes integer buttonId returns integer
    native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
    native DzFrameGetTooltip takes nothing returns integer
    native DzFrameGetChatMessage takes nothing returns integer
    native DzFrameGetUnitMessage takes nothing returns integer
    native DzFrameGetTopMessage takes nothing returns integer
    native DzGetColor takes integer r, integer g, integer b, integer a returns integer
    native DzFrameSetUpdateCallback takes string func returns nothing
    native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
    native DzFrameShow takes integer frame, boolean enable returns nothing
    native DzCreateFrame takes string frame, integer parent, integer id returns integer
    native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
    native DzDestroyFrame takes integer frame returns nothing
    native DzLoadToc takes string fileName returns nothing
    native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
    native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
    native DzFrameClearAllPoints takes integer frame returns nothing
    native DzFrameSetEnable takes integer name, boolean enable returns nothing
    native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
    native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
    native DzGetTriggerUIEventPlayer takes nothing returns player
    native DzGetTriggerUIEventFrame takes nothing returns integer
    native DzFrameFindByName takes string name, integer id returns integer
    native DzSimpleFrameFindByName takes string name, integer id returns integer
    native DzSimpleFontStringFindByName takes string name, integer id returns integer
    native DzSimpleTextureFindByName takes string name, integer id returns integer
    native DzGetGameUI takes nothing returns integer
    native DzClickFrame takes integer frame returns nothing
    native DzSetCustomFovFix takes real value returns nothing
    native DzEnableWideScreen takes boolean enable returns nothing
    native DzFrameSetText takes integer frame, string text returns nothing
    native DzFrameGetText takes integer frame returns string
    native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
    native DzFrameGetTextSizeLimit takes integer frame returns integer
    native DzFrameSetTextColor takes integer frame, integer color returns nothing
    native DzGetMouseFocus takes nothing returns integer
    native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
    native DzFrameSetFocus takes integer frame, boolean enable returns boolean
    native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
    native DzFrameGetEnable takes integer frame returns boolean
    native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
    native DzFrameGetAlpha takes integer frame returns integer
    native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
    native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
    native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
    native DzFrameSetScale takes integer frame, real scale returns nothing
    native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
    native DzFrameCageMouse takes integer frame, boolean enable returns nothing
    native DzFrameGetValue takes integer frame returns real
    native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
    native DzFrameSetStepValue takes integer frame, real step returns nothing
    native DzFrameSetValue takes integer frame, real value returns nothing
    native DzFrameSetSize takes integer frame, real w, real h returns nothing
    native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
    native DzFrameSetVertexColor takes integer frame, integer color returns nothing
    function DzTriggerRegisterMouseEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterKeyEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterKeyEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterMouseMoveEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseMoveEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterMouseWheelEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseWheelEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterWindowResizeEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterWindowResizeEvent(trg, true, null)
    endfunction
    function DzF2I takes integer i returns integer
        return i
    endfunction
    function DzI2F takes integer i returns integer
        return i
    endfunction
    function DzK2I takes integer i returns integer
        return i
    endfunction
    function DzI2K takes integer i returns integer
        return i
    endfunction
//library BzAPI ends

//library cjLib75hJKJ374s4e597nba9o7w45gf:
function cj_group_copy_75hJKJ3745gf takes nothing returns nothing
//# optional
call GroupAddUnit(cj_tmpgr_copy_nw509ert7, GetEnumUnit())
endfunction

function InitGlobals takes nothing returns nothing
endfunction
function InitSounds takes nothing returns nothing
set gg_snd_tr_w2=CreateSound("war3mapImported\\tr-w2.mp3", false, true, true, 10, 10, "DefaultEAXON")
call SetSoundDuration(gg_snd_tr_w2, 966)
call SetSoundChannel(gg_snd_tr_w2, 0)
call SetSoundVolume(gg_snd_tr_w2, 127)
call SetSoundPitch(gg_snd_tr_w2, 1.0)
call SetSoundDistances(gg_snd_tr_w2, 600.0, 10000.0)
call SetSoundDistanceCutoff(gg_snd_tr_w2, 3000.0)
call SetSoundConeAngles(gg_snd_tr_w2, 0.0, 0.0, 127)
call SetSoundConeOrientation(gg_snd_tr_w2, 0.0, 0.0, 0.0)
set gg_snd_tr_w0=CreateSound("war3mapImported\\tr-w0.mp3", false, true, true, 10, 10, "DefaultEAXON")
call SetSoundDuration(gg_snd_tr_w0, 575)
call SetSoundChannel(gg_snd_tr_w0, 0)
call SetSoundVolume(gg_snd_tr_w0, 127)
call SetSoundPitch(gg_snd_tr_w0, 1.0)
call SetSoundDistances(gg_snd_tr_w0, 600.0, 10000.0)
call SetSoundDistanceCutoff(gg_snd_tr_w0, 3000.0)
call SetSoundConeAngles(gg_snd_tr_w0, 0.0, 0.0, 127)
call SetSoundConeOrientation(gg_snd_tr_w0, 0.0, 0.0, 0.0)
set gg_snd_MouseClick1=CreateSound("Sound\\Interface\\MouseClick1.wav", false, false, false, 10, 10, "DefaultEAXON")
call SetSoundParamsFromLabel(gg_snd_MouseClick1, "InterfaceClick")
call SetSoundDuration(gg_snd_MouseClick1, 239)
call SetSoundPitch(gg_snd_MouseClick1, 2.0)
endfunction
function CreateUnitsForPlayer0 takes nothing returns nothing
local player p=Player(0)
local unit u
local integer unitID
local trigger t
local real life
set u=CreateUnit(p, 0x4870616C, - 8931.9, 675.4, 269.698)
set u=CreateUnit(p, 0x4870616C, - 3261.4, - 7839.3, 111.800)
endfunction
function CreateBuildingsForPlayer11 takes nothing returns nothing
local player p=Player(11)
local unit u
local integer unitID
local trigger t
local real life
set u=CreateUnit(p, 0x6E303047, 1152.0, - 9408.0, 270.000)
set u=CreateUnit(p, 0x75773030, - 2176.0, - 8256.0, 270.000)
set u=CreateUnit(p, 0x6E303047, 1152.0, - 6720.0, 270.000)
set u=CreateUnit(p, 0x6E303047, 1152.0, - 4032.0, 270.000)
set u=CreateUnit(p, 0x6E303047, 1152.0, - 1408.0, 270.000)
set u=CreateUnit(p, 0x75773133, 1152.0, - 8512.0, 270.000)
set u=CreateUnit(p, 0x75773133, 1152.0, - 5824.0, 270.000)
set u=CreateUnit(p, 0x75773133, 1152.0, - 3136.0, 270.000)
set u=CreateUnit(p, 0x75773133, 1152.0, - 576.0, 270.000)
set u=CreateUnit(p, 0x75773033, - 2816.0, - 9344.0, 270.000)
set u=CreateUnit(p, 0x75773138, - 3648.0, - 8256.0, 270.000)
set u=CreateUnit(p, 0x75773038, - 3648.0, - 9024.0, 270.000)
set u=CreateUnit(p, 0x75773134, - 3648.0, - 9408.0, 270.000)
set u=CreateUnit(p, 0x75773036, - 3648.0, - 8640.0, 270.000)
set u=CreateUnit(p, 0x75773034, - 2432.0, - 9344.0, 270.000)
set u=CreateUnit(p, 0x75773035, - 2048.0, - 9344.0, 270.000)
set u=CreateUnit(p, 0x75773130, - 1664.0, - 9344.0, 270.000)
set u=CreateUnit(p, 0x75773031, - 832.0, - 9344.0, 270.000)
set u=CreateUnit(p, 0x75773032, - 832.0, - 8128.0, 270.000)
set u=CreateUnit(p, 0x75773039, - 1280.0, - 9344.0, 270.000)
set u=CreateUnit(p, 0x75773037, - 832.0, - 8576.0, 270.000)
set u=CreateUnit(p, 0x75773132, - 832.0, - 8960.0, 270.000)
set u=CreateUnit(p, 0x75773131, - 832.0, - 7680.0, 270.000)
set u=CreateUnit(p, 0x75773230, - 3712.0, - 7552.0, 270.000)
set u=CreateUnit(p, 0x75773139, - 3328.0, - 7552.0, 270.000)
set u=CreateUnit(p, 0x75773135, - 1152.0, - 6912.0, 270.000)
set u=CreateUnit(p, 0x75773136, - 3328.0, - 6912.0, 270.000)
set u=CreateUnit(p, 0x75773137, - 3328.0, - 6528.0, 270.000)
set u=CreateUnit(p, 0x75773232, - 896.0, - 5440.0, 270.000)
set u=CreateUnit(p, 0x75773231, - 1152.0, - 6528.0, 270.000)
set u=CreateUnit(p, 0x75773235, 8000.0, - 8128.0, 270.000)
set u=CreateUnit(p, 0x75773234, 5056.0, - 7040.0, 270.000)
set u=CreateUnit(p, 0x75773239, 9344.0, - 12928.0, 270.000)
set u=CreateUnit(p, 0x75773233, 4992.0, - 11968.0, 270.000)
set u=CreateUnit(p, 0x75773330, 5120.0, - 14656.0, 270.000)
set u=CreateUnit(p, 0x75773238, 10816.0, - 8320.0, 270.000)
set u=CreateUnit(p, 0x6E303030, 11648.0, - 13632.0, 270.000)
set u=CreateUnit(p, 0x75773237, 10752.0, - 3776.0, 270.000)
endfunction
function CreateUnitsForPlayer11 takes nothing returns nothing
local player p=Player(11)
local unit u
local integer unitID
local trigger t
local real life
set u=CreateUnit(p, 0x4E303031, 4897.3, - 4218.4, 252.300)
set u=CreateUnit(p, 0x55483030, 2008.6, 1302.1, 257.659)
endfunction
function CreateNeutralHostile takes nothing returns nothing
local player p=Player(PLAYER_NEUTRAL_AGGRESSIVE)
local unit u
local integer unitID
local trigger t
local real life
set u=CreateUnit(p, 0x55423237, 11321.4, - 11502.9, 264.240)
set u=CreateUnit(p, 0x55423236, 4890.4, - 4731.1, 38.376)
set u=CreateUnit(p, 0x75303038, 10918.7, - 5211.4, 107.109)
set u=CreateUnit(p, 0x75303038, 8975.3, - 6553.3, 51.319)
set u=CreateUnit(p, 0x75303038, 8829.5, - 6646.2, 25.346)
set u=CreateUnit(p, 0x75303038, 8700.8, - 6946.7, 203.440)
set u=CreateUnit(p, 0x75303038, 8714.2, - 7113.4, 254.967)
set u=CreateUnit(p, 0x75303038, 9741.4, - 5646.1, 349.354)
set u=CreateUnit(p, 0x75303038, 9599.8, - 5845.5, 82.246)
set u=CreateUnit(p, 0x75303038, 9918.2, - 5621.6, 341.894)
set u=CreateUnit(p, 0x75303038, 10109.0, - 5334.2, 216.426)
set u=CreateUnit(p, 0x75303038, 10361.7, - 5475.3, 209.362)
set u=CreateUnit(p, 0x75303038, 10868.9, - 4644.5, 180.961)
set u=CreateUnit(p, 0x75303038, 10612.9, - 5032.4, 304.605)
set u=CreateUnit(p, 0x75303038, 10329.0, - 5133.0, 260.856)
set u=CreateUnit(p, 0x75303038, 9288.3, - 6140.7, 240.674)
set u=CreateUnit(p, 0x75303038, 9100.7, - 6200.9, 175.127)
set u=CreateUnit(p, 0x75303038, 10236.0, - 5028.9, 220.821)
set u=CreateUnit(p, 0x75303038, 10917.2, - 5941.9, 118.162)
set u=CreateUnit(p, 0x75303038, 10737.1, - 5901.2, 57.900)
set u=CreateUnit(p, 0x75303039, 11309.5, - 6035.3, 159.307)
set u=CreateUnit(p, 0x75303131, 7070.0, - 5374.0, 287.818)
set u=CreateUnit(p, 0x75303131, 7223.2, - 5725.1, 243.234)
set u=CreateUnit(p, 0x75303131, 6711.5, - 5657.8, 89.684)
set u=CreateUnit(p, 0x75303131, 7363.6, - 6396.7, 311.373)
set u=CreateUnit(p, 0x75303131, 7013.3, - 6546.5, 275.007)
set u=CreateUnit(p, 0x75303131, 7513.0, - 5990.4, 264.625)
set u=CreateUnit(p, 0x75303131, 7785.6, - 6505.5, 128.555)
set u=CreateUnit(p, 0x75303131, 6783.6, - 5403.3, 73.885)
set u=CreateUnit(p, 0x75303131, 6965.1, - 6850.3, 42.947)
set u=CreateUnit(p, 0x75303131, 6032.4, - 6896.8, 187.652)
set u=CreateUnit(p, 0x75303131, 5893.9, - 6379.2, 304.418)
set u=CreateUnit(p, 0x75303131, 6417.9, - 5767.2, 41.617)
set u=CreateUnit(p, 0x75303131, 6790.1, - 7088.9, 139.509)
set u=CreateUnit(p, 0x75303132, 5951.8, - 5897.7, 316.778)
set u=CreateUnit(p, 0x75303134, 5360.7, - 8729.6, 302.661)
set u=CreateUnit(p, 0x75303134, 4965.8, - 10110.5, 219.393)
set u=CreateUnit(p, 0x75303134, 5502.2, - 9129.4, 81.147)
set u=CreateUnit(p, 0x75303134, 4855.5, - 8750.7, 347.750)
set u=CreateUnit(p, 0x75303134, 4784.3, - 9208.4, 144.277)
set u=CreateUnit(p, 0x75303134, 4919.1, - 9618.3, 328.512)
set u=CreateUnit(p, 0x75303134, 5727.5, - 9459.5, 72.073)
set u=CreateUnit(p, 0x75303134, 7105.5, - 8885.3, 338.554)
set u=CreateUnit(p, 0x75303134, 6400.1, - 8979.6, 202.374)
set u=CreateUnit(p, 0x75303134, 7568.6, - 9327.2, 345.113)
set u=CreateUnit(p, 0x75303134, 6004.1, - 9730.0, 125.545)
set u=CreateUnit(p, 0x75303134, 4774.9, - 9897.8, 179.907)
set u=CreateUnit(p, 0x75303135, 4728.0, - 8224.7, 323.557)
set u=CreateUnit(p, 0x75303137, 7183.1, - 11760.5, 72.864)
set u=CreateUnit(p, 0x75303137, 7687.2, - 10836.4, 74.281)
set u=CreateUnit(p, 0x75303137, 7577.7, - 10204.8, 47.418)
set u=CreateUnit(p, 0x75303137, 7146.5, - 11258.9, 317.086)
set u=CreateUnit(p, 0x75303137, 6756.7, - 10689.2, 259.131)
set u=CreateUnit(p, 0x75303137, 7786.6, - 12134.1, 331.061)
set u=CreateUnit(p, 0x75303137, 7203.3, - 12716.0, 121.194)
set u=CreateUnit(p, 0x75303137, 8227.1, - 10312.5, 12.525)
set u=CreateUnit(p, 0x75303137, 8547.7, - 10781.9, 218.843)
set u=CreateUnit(p, 0x75303137, 7919.4, - 11597.5, 174.864)
set u=CreateUnit(p, 0x75303138, 8739.7, - 11317.6, 175.374)
set u=CreateUnit(p, 0x75303230, 5970.5, - 13418.8, 0.286)
set u=CreateUnit(p, 0x75303230, 5606.3, - 13773.5, 301.870)
set u=CreateUnit(p, 0x75303230, 6042.9, - 13049.2, 50.561)
set u=CreateUnit(p, 0x75303230, 5607.6, - 13060.2, 161.449)
set u=CreateUnit(p, 0x75303230, 5361.6, - 12491.1, 357.737)
set u=CreateUnit(p, 0x75303230, 5348.6, - 12748.5, 245.442)
set u=CreateUnit(p, 0x75303230, 6259.8, - 12665.8, 87.399)
set u=CreateUnit(p, 0x75303230, 5866.8, - 12521.5, 85.773)
set u=CreateUnit(p, 0x75303230, 5565.5, - 13433.1, 357.825)
set u=CreateUnit(p, 0x75303230, 5043.0, - 12892.8, 332.445)
set u=CreateUnit(p, 0x75303230, 5599.6, - 11016.8, 266.514)
set u=CreateUnit(p, 0x75303230, 5744.3, - 12744.8, 24.566)
set u=CreateUnit(p, 0x75303231, 6542.0, - 13955.6, 143.772)
set u=CreateUnit(p, 0x75303233, 6485.8, - 14629.1, 157.296)
set u=CreateUnit(p, 0x75303233, 5698.1, - 15218.9, 79.324)
set u=CreateUnit(p, 0x75303233, 5464.0, - 15613.3, 6.680)
set u=CreateUnit(p, 0x75303233, 5066.2, - 15423.9, 80.752)
set u=CreateUnit(p, 0x75303233, 5394.5, - 15813.3, 144.815)
set u=CreateUnit(p, 0x75303233, 6031.5, - 15602.8, 15.700)
set u=CreateUnit(p, 0x75303233, 6515.3, - 15260.3, 53.351)
set u=CreateUnit(p, 0x75303233, 6854.6, - 14966.8, 157.043)
set u=CreateUnit(p, 0x75303233, 7142.1, - 15380.8, 128.928)
set u=CreateUnit(p, 0x75303233, 7167.6, - 14816.5, 234.972)
set u=CreateUnit(p, 0x75303234, 7593.3, - 14081.7, 262.463)
set u=CreateUnit(p, 0x55423039, - 10856.5, - 4008.6, 356.700)
set u=CreateUnit(p, 0x55423130, - 11134.5, - 5487.3, 13.535)
set u=CreateUnit(p, 0x55423131, - 8125.8, - 3930.3, 268.000)
set u=CreateUnit(p, 0x55423132, - 8153.1, - 6262.0, 9.048)
set u=CreateUnit(p, 0x55423133, - 5155.9, - 6020.1, 250.458)
set u=CreateUnit(p, 0x55423134, 143.4, 10930.7, 354.078)
set u=CreateUnit(p, 0x55423135, 288.0, 8998.6, 348.892)
set u=CreateUnit(p, 0x55423136, 194.7, 6952.3, 351.123)
set u=CreateUnit(p, 0x55423138, 7978.0, 10757.4, 273.021)
set u=CreateUnit(p, 0x55423137, 4974.4, 10830.2, 271.586)
set u=CreateUnit(p, 0x55423233, - 443.0, - 11042.9, 271.610)
set u=CreateUnit(p, 0x55423139, - 5494.5, - 14170.0, 217.853)
set u=CreateUnit(p, 0x55423232, - 2007.0, - 10790.6, 251.974)
set u=CreateUnit(p, 0x55423231, 902.8, - 14786.0, 138.685)
set u=CreateUnit(p, 0x55423230, - 2981.9, - 14194.1, 307.068)
set u=CreateUnit(p, 0x75303236, 5042.5, 1625.8, 277.717)
set u=CreateUnit(p, 0x75303237, 7849.3, 1553.7, 263.211)
set u=CreateUnit(p, 0x75303238, 10723.6, 1659.2, 269.052)
set u=CreateUnit(p, 0x75303239, 5033.8, - 1403.4, 240.378)
set u=CreateUnit(p, 0x75303330, 7841.0, - 1379.2, 246.042)
set u=CreateUnit(p, 0x55423234, 10698.1, - 1369.8, 278.358)
set u=CreateUnit(p, 0x55423034, - 10907.1, 5084.3, 276.342)
set u=CreateUnit(p, 0x6F303031, - 10623.1, - 15006.0, 165.833)
set u=CreateUnit(p, 0x6F303031, - 10537.2, - 14443.6, 157.362)
set u=CreateUnit(p, 0x6F303031, - 9617.2, - 14284.9, 296.146)
set u=CreateUnit(p, 0x6F303031, - 8965.6, - 14818.0, 324.085)
set u=CreateUnit(p, 0x6F303031, - 8881.7, - 14210.3, 0.846)
set u=CreateUnit(p, 0x6F303031, - 10906.3, - 14194.9, 11.162)
set u=CreateUnit(p, 0x6F303031, - 8793.7, - 13685.4, 253.891)
set u=CreateUnit(p, 0x55423235, - 9808.8, - 13576.3, 263.319)
set u=CreateUnit(p, 0x4E303033, - 11008.0, - 10986.0, 17.164)
set u=CreateUnit(p, 0x4E303032, - 7399.8, - 11532.6, 139.976)
set u=CreateUnit(p, 0x4E303034, - 8863.3, - 8186.5, 261.447)
set u=CreateUnit(p, 0x4E303042, - 8555.9, 11458.5, 269.293)
set u=CreateUnit(p, 0x4E303038, - 8803.3, 7265.5, 184.989)
set u=CreateUnit(p, 0x4E303039, - 6263.7, 9175.3, 175.495)
set u=CreateUnit(p, 0x4E303041, - 10726.9, 9340.7, 1.181)
set u=CreateUnit(p, 0x55423330, - 8931.9, 1040.2, 271.721)
set u=CreateUnit(p, 0x55423331, - 5631.0, - 2958.1, 263.665)
set u=CreateUnit(p, 0x55423238, - 2590.1, 10069.8, 246.804)
set u=CreateUnit(p, 0x75303034, 4074.6, 6268.3, 136.103)
set u=CreateUnit(p, 0x75303034, 4351.7, 6679.3, 201.012)
set u=CreateUnit(p, 0x75303034, 4851.0, 6948.8, 293.915)
set u=CreateUnit(p, 0x75303034, 5196.9, 4697.9, 129.961)
set u=CreateUnit(p, 0x75303034, 6206.2, 4730.9, 233.115)
set u=CreateUnit(p, 0x75303034, 6305.5, 5437.2, 253.484)
set u=CreateUnit(p, 0x75303034, 6927.4, 6563.2, 7.669)
set u=CreateUnit(p, 0x75303034, 6032.9, 7003.3, 163.646)
set u=CreateUnit(p, 0x6F303032, 11634.5, 6372.4, 305.968)
set u=CreateUnit(p, 0x6F303032, 9424.9, 7047.9, 243.992)
set u=CreateUnit(p, 0x6F303032, 11672.6, 6172.6, 30.246)
set u=CreateUnit(p, 0x6F303032, 9746.8, 5130.5, 337.126)
set u=CreateUnit(p, 0x6F303032, 9908.0, 4627.8, 337.126)
set u=CreateUnit(p, 0x6F303032, 7942.9, 6494.5, 101.572)
set u=CreateUnit(p, 0x6F303032, 9573.4, 6478.5, 274.414)
set u=CreateUnit(p, 0x6F303032, 10698.9, 4605.9, 207.659)
set u=CreateUnit(p, 0x4E303035, 5377.1, 5968.9, 183.873)
set u=CreateUnit(p, 0x4E303036, 7525.3, 5600.4, 254.371)
set u=CreateUnit(p, 0x6F303032, 9267.9, 5499.4, 337.126)
set u=CreateUnit(p, 0x75303331, 11278.0, 8322.4, 273.114)
set u=CreateUnit(p, 0x4E303037, 10711.8, 5706.7, 145.749)
set u=CreateUnit(p, 0x6F303032, 9931.3, 7228.2, 243.992)
set u=CreateUnit(p, 0x6F303032, 11867.7, 7176.1, 243.992)
set u=CreateUnit(p, 0x6F303032, 11850.0, 4678.5, 243.992)
set u=CreateUnit(p, 0x6F303032, 11188.7, 5107.8, 243.992)
set u=CreateUnit(p, 0x6F303032, 8606.2, 6135.1, 243.992)
set u=CreateUnit(p, 0x6F303032, 6685.9, 7091.9, 243.992)
set u=CreateUnit(p, 0x75303034, 6918.0, 4651.1, 233.115)
set u=CreateUnit(p, 0x55423239, - 5708.4, 911.3, 267.424)
endfunction
function CreatePlayerBuildings takes nothing returns nothing
call CreateBuildingsForPlayer11()
endfunction
function CreatePlayerUnits takes nothing returns nothing
call CreateUnitsForPlayer0()
call CreateUnitsForPlayer11()
endfunction
function CreateAllUnits takes nothing returns nothing
call CreateBuildingsForPlayer11() // INLINED!!
call CreateNeutralHostile()
call CreatePlayerUnits()
endfunction
function CreateRegions takes nothing returns nothing
local weathereffect we
set gg_rct_ChuGuaiKou_1=Rect(- 3136.0, 1728.0, - 2464.0, 2240.0)
set gg_rct_ChuGuaiKou_2=Rect(- 1920.0, 1728.0, - 1248.0, 2240.0)
set gg_rct_ChuGuaiKou_Boss=Rect(- 2432.0, 1728.0, - 1952.0, 2240.0)
set gg_rct_weather_snow=Rect(- 4288.0, - 15552.0, - 1440.0, - 12960.0)
set we=AddWeatherEffect(gg_rct_weather_snow, 0x534E6273)
call EnableWeatherEffect(we, true)
set gg_rct_weather_wind=Rect(- 6240.0, - 11872.0, - 4608.0, - 8096.0)
set we=AddWeatherEffect(gg_rct_weather_wind, 0x574F6C77)
call EnableWeatherEffect(we, true)
set gg_rct_weather_moonlight=Rect(- 3840.0, - 11968.0, - 2240.0, - 10336.0)
set we=AddWeatherEffect(gg_rct_weather_moonlight, 0x4C526D61)
call EnableWeatherEffect(we, true)
set gg_rct_weather_rain=Rect(8512.0, - 6848.0, 12256.0, - 3456.0)
set we=AddWeatherEffect(gg_rct_weather_rain, 0x52416872)
call EnableWeatherEffect(we, true)
set gg_rct_weather_snow2=Rect(3712.0, 4544.0, 12000.0, 7520.0)
set we=AddWeatherEffect(gg_rct_weather_snow2, 0x534E6273)
call EnableWeatherEffect(we, true)
set gg_rct_Jump_00=Rect(1280.0, - 9120.0, 1696.0, - 8800.0)
set gg_rct_Jump_01=Rect(1280.0, - 6400.0, 1696.0, - 6080.0)
set gg_rct_Jump_02=Rect(1280.0, - 3680.0, 1696.0, - 3360.0)
set gg_rct_Jump_03=Rect(1280.0, - 1120.0, 1696.0, - 800.0)
set gg_rct_Jump_04=Rect(- 9824.0, - 4224.0, - 9440.0, - 3808.0)
set gg_rct_Jump_05=Rect(- 9792.0, - 5664.0, - 9408.0, - 5280.0)
set gg_rct_Jump_06=Rect(- 8352.0, - 5120.0, - 7840.0, - 4800.0)
set gg_rct_Jump_07=Rect(- 6816.0, - 6464.0, - 6496.0, - 5952.0)
set gg_rct_Jump_08=Rect(- 5472.0, - 7488.0, - 4896.0, - 7136.0)
set gg_rct_Jump_09=Rect(- 9312.0, - 10464.0, - 8896.0, - 10080.0)
set gg_rct_Jump_10=Rect(- 7072.0, - 14400.0, - 6720.0, - 13888.0)
set gg_rct_Jump_11=Rect(- 3680.0, - 12096.0, - 3200.0, - 11872.0)
set gg_rct_Jump_12=Rect(- 2112.0, - 15424.0, - 1760.0, - 15104.0)
set gg_rct_Jump_13=Rect(- 128.0, - 13728.0, 384.0, - 13408.0)
set gg_rct_Jump_14=Rect(8320.0, - 4928.0, 8832.0, - 4512.0)
set gg_rct_Jump_15=Rect(8512.0, - 9536.0, 9120.0, - 9216.0)
set gg_rct_Jump_16=Rect(4800.0, - 2144.0, 5248.0, - 1888.0)
set gg_rct_Jump_17=Rect(7552.0, - 2176.0, 8096.0, - 1856.0)
set gg_rct_Jump_18=Rect(10112.0, - 2240.0, 10656.0, - 1952.0)
set gg_rct_Jump_19=Rect(10016.0, 768.0, 10528.0, 992.0)
set gg_rct_Jump_20=Rect(7200.0, 768.0, 7584.0, 960.0)
set gg_rct_Jump_21=Rect(4352.0, 704.0, 4800.0, 928.0)
set gg_rct_Jump_22=Rect(- 2496.0, - 7904.0, - 1856.0, - 7616.0)
set gg_rct_Jump_23=Rect(- 5856.0, - 4768.0, - 5440.0, - 4544.0)
set gg_rct_Jump_24=Rect(- 9216.0, - 992.0, - 8768.0, - 704.0)
set gg_rct_Jump_25=Rect(- 5888.0, - 992.0, - 5472.0, - 736.0)
set gg_rct_Jump_26=Rect(- 11232.0, 3936.0, - 10688.0, 4160.0)
set gg_rct_Jump_27=Rect(- 8960.0, 9088.0, - 8288.0, 9664.0)
set gg_rct_Jump_28=Rect(- 2816.0, 8128.0, - 2336.0, 8480.0)
set gg_rct_Jump_29=Rect(1632.0, 8640.0, 1920.0, 9248.0)
set gg_rct_Jump_30=Rect(1568.0, 6656.0, 1920.0, 7104.0)
set gg_rct_Jump_31=Rect(1568.0, 10688.0, 1856.0, 11296.0)
set gg_rct_Jump_32=Rect(4544.0, 9184.0, 5344.0, 9504.0)
set gg_rct_Jump_33=Rect(7616.0, 9024.0, 8480.0, 9408.0)
set gg_rct_Jump_34=Rect(4032.0, 4672.0, 4544.0, 5056.0)
set gg_rct_Jump_35=Rect(- 608.0, - 12064.0, - 192.0, - 11840.0)
set gg_rct_LianGong1=Rect(864.0, - 9664.0, 3296.0, - 8224.0)
set gg_rct_LianGong2=Rect(864.0, - 6912.0, 3296.0, - 5472.0)
set gg_rct_LianGong3=Rect(896.0, - 4256.0, 3328.0, - 2816.0)
set gg_rct_LianGong4=Rect(896.0, - 1728.0, 3328.0, - 288.0)
endfunction
function Trig_______uActions takes nothing returns nothing
call FogEnable(false)
call FogMaskEnableOff()
call SetSkyModel("war3mapImported\\StarSphere.mdx")
endfunction
function InitTrig_______u takes nothing returns nothing
set gg_trg_______u=CreateTrigger()
call TriggerRegisterTimerEventSingle(gg_trg_______u, 0.00)
call TriggerAddAction(gg_trg_______u, function Trig_______uActions)
endfunction
function InitCustomTriggers takes nothing returns nothing
call InitTrig_______u()
endfunction
function InitCustomPlayerSlots takes nothing returns nothing
call SetPlayerStartLocation(Player(0), 0)
call SetPlayerColor(Player(0), ConvertPlayerColor(0))
call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
call SetPlayerRaceSelectable(Player(0), true)
call SetPlayerController(Player(0), MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(1), 1)
call SetPlayerColor(Player(1), ConvertPlayerColor(1))
call SetPlayerRacePreference(Player(1), RACE_PREF_ORC)
call SetPlayerRaceSelectable(Player(1), true)
call SetPlayerController(Player(1), MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(2), 2)
call SetPlayerColor(Player(2), ConvertPlayerColor(2))
call SetPlayerRacePreference(Player(2), RACE_PREF_UNDEAD)
call SetPlayerRaceSelectable(Player(2), true)
call SetPlayerController(Player(2), MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(3), 3)
call SetPlayerColor(Player(3), ConvertPlayerColor(3))
call SetPlayerRacePreference(Player(3), RACE_PREF_NIGHTELF)
call SetPlayerRaceSelectable(Player(3), true)
call SetPlayerController(Player(3), MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(10), 4)
call ForcePlayerStartLocation(Player(10), 4)
call SetPlayerColor(Player(10), ConvertPlayerColor(10))
call SetPlayerRacePreference(Player(10), RACE_PREF_UNDEAD)
call SetPlayerRaceSelectable(Player(10), true)
call SetPlayerController(Player(10), MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(11), 5)
call ForcePlayerStartLocation(Player(11), 5)
call SetPlayerColor(Player(11), ConvertPlayerColor(11))
call SetPlayerRacePreference(Player(11), RACE_PREF_NIGHTELF)
call SetPlayerRaceSelectable(Player(11), true)
call SetPlayerController(Player(11), MAP_CONTROL_USER)
endfunction
function InitCustomTeams takes nothing returns nothing
call SetPlayerTeam(Player(0), 0)
call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
call SetPlayerTeam(Player(1), 0)
call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
call SetPlayerTeam(Player(2), 0)
call SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
call SetPlayerTeam(Player(3), 0)
call SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)
call SetPlayerTeam(Player(11), 0)
call SetPlayerState(Player(11), PLAYER_STATE_ALLIED_VICTORY, 1)
call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
call SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
call SetPlayerAllianceStateAllyBJ(Player(0), Player(11), true)
call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
call SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
call SetPlayerAllianceStateAllyBJ(Player(1), Player(11), true)
call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
call SetPlayerAllianceStateAllyBJ(Player(2), Player(11), true)
call SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
call SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
call SetPlayerAllianceStateAllyBJ(Player(3), Player(11), true)
call SetPlayerAllianceStateAllyBJ(Player(11), Player(0), true)
call SetPlayerAllianceStateAllyBJ(Player(11), Player(1), true)
call SetPlayerAllianceStateAllyBJ(Player(11), Player(2), true)
call SetPlayerAllianceStateAllyBJ(Player(11), Player(3), true)
call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
call SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
call SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
call SetPlayerAllianceStateVisionBJ(Player(0), Player(11), true)
call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
call SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
call SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
call SetPlayerAllianceStateVisionBJ(Player(1), Player(11), true)
call SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
call SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
call SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
call SetPlayerAllianceStateVisionBJ(Player(2), Player(11), true)
call SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
call SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
call SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
call SetPlayerAllianceStateVisionBJ(Player(3), Player(11), true)
call SetPlayerAllianceStateVisionBJ(Player(11), Player(0), true)
call SetPlayerAllianceStateVisionBJ(Player(11), Player(1), true)
call SetPlayerAllianceStateVisionBJ(Player(11), Player(2), true)
call SetPlayerAllianceStateVisionBJ(Player(11), Player(3), true)
call SetPlayerAllianceStateControlBJ(Player(0), Player(1), true)
call SetPlayerAllianceStateControlBJ(Player(0), Player(2), true)
call SetPlayerAllianceStateControlBJ(Player(0), Player(3), true)
call SetPlayerAllianceStateControlBJ(Player(0), Player(11), true)
call SetPlayerAllianceStateControlBJ(Player(1), Player(0), true)
call SetPlayerAllianceStateControlBJ(Player(1), Player(2), true)
call SetPlayerAllianceStateControlBJ(Player(1), Player(3), true)
call SetPlayerAllianceStateControlBJ(Player(1), Player(11), true)
call SetPlayerAllianceStateControlBJ(Player(2), Player(0), true)
call SetPlayerAllianceStateControlBJ(Player(2), Player(1), true)
call SetPlayerAllianceStateControlBJ(Player(2), Player(3), true)
call SetPlayerAllianceStateControlBJ(Player(2), Player(11), true)
call SetPlayerAllianceStateControlBJ(Player(3), Player(0), true)
call SetPlayerAllianceStateControlBJ(Player(3), Player(1), true)
call SetPlayerAllianceStateControlBJ(Player(3), Player(2), true)
call SetPlayerAllianceStateControlBJ(Player(3), Player(11), true)
call SetPlayerAllianceStateControlBJ(Player(11), Player(0), true)
call SetPlayerAllianceStateControlBJ(Player(11), Player(1), true)
call SetPlayerAllianceStateControlBJ(Player(11), Player(2), true)
call SetPlayerAllianceStateControlBJ(Player(11), Player(3), true)
call SetPlayerTeam(Player(10), 1)
call SetPlayerState(Player(10), PLAYER_STATE_ALLIED_VICTORY, 1)
endfunction
function InitAllyPriorities takes nothing returns nothing
call SetStartLocPrioCount(0, 3)
call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(1, 3)
call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(2, 3)
call SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(3, 3)
call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(4, 4)
call SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(4, 1, 1, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(4, 2, 2, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(4, 3, 3, MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(5, 5)
call SetStartLocPrio(5, 0, 0, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(5, 1, 1, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(5, 2, 2, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(5, 3, 3, MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(5, 4, 4, MAP_LOC_PRIO_HIGH)
endfunction

function BackHome takes nothing returns nothing
      call  PanCameraToTimedLocForPlayer(DzGetTriggerUIEventPlayer(), GetRectCenter(gg_rct_Jump_22), 0)
endfunction

function InitUi takes nothing returns nothing
    set udg_Frame[1] = DzCreateFrameByTagName("GLUETEXTBUTTON", "回城", DzGetGameUI(), "template", 0)
    call DzFrameSetSize( udg_Frame[1], 0.03, 0.03 )
    call DzFrameSetPoint( udg_Frame[1], 3, DzGetGameUI(), 3, 0.20, -0.15 )
    call DzFrameShow( udg_Frame[1], true )
    set udg_Frame[2] = DzCreateFrameByTagName("BACKDROP", "回城贴图", DzGetGameUI(), "template", 0)
    call DzFrameSetTexture( udg_Frame[2], "ReplaceableTextures\\CommandButtons\\BTNStaffOfPreservation.blp", 0 )
    call DzFrameSetSize( udg_Frame[2], 0.03, 0.03 )
    call DzFrameSetPoint( udg_Frame[2], 3, DzGetGameUI(), 3, 0.20, -0.15 )
    call DzFrameShow( udg_Frame[2], true )
    call DzFrameSetScriptByCode( udg_Frame[1], 1,function BackHome, false )
endfunction

function main takes nothing returns nothing
call SetCameraBounds(- 11520.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 16000.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 12032.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 12288.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 11520.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 12288.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 12032.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 16000.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
call SetDayNightModels("Environment\\DNC\\DNCDalaran\\DNCDalaranTerrain\\DNCDalaranTerrain.mdl", "Environment\\DNC\\DNCDalaran\\DNCDalaranUnit\\DNCDalaranUnit.mdl")
call NewSoundEnvironment("Default")
call SetAmbientDaySound("DalaranDay")
call SetAmbientNightSound("DalaranNight")
call SetMapMusic("Music", true, 0)
call InitSounds()
call CreateRegions()
call CreateAllUnits()
call InitBlizzard()

call InitGlobals()
call InitTrig_______u() // INLINED!!
call InitUi()
call Cheat("exec-lua:scripts.main")
endfunction
function config takes nothing returns nothing
call SetMapName("只是另外一张魔兽争霸的地图")
call SetMapDescription("没有说明")
call SetPlayers(6)
call SetTeams(6)
call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
call DefineStartLocation(0, 2048.0, 1792.0)
call DefineStartLocation(1, 2048.0, 1792.0)
call DefineStartLocation(2, 2048.0, 1792.0)
call DefineStartLocation(3, 2048.0, 1792.0)
call DefineStartLocation(4, - 2176.0, 2240.0)
call DefineStartLocation(5, - 2176.0, - 8320.0)
call InitCustomPlayerSlots()
call InitCustomTeams()
call InitAllyPriorities()
endfunction



//Struct method generated initializers/callers:

