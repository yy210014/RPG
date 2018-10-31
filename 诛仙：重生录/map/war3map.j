globals
    // Generated
rect gg_rct_ChuGuaiKou_1= null
rect gg_rct_ChuGuaiKou_2= null
rect gg_rct_ChuGuaiKou_Boss= null
rect gg_rct_weather_snow= null
rect gg_rct_weather_wind= null
rect gg_rct_weather_moonlight= null
rect gg_rct_weather_rain= null
rect gg_rct_weather_snow2= null
rect gg_rct_Jump_00= null
rect gg_rct_Jump_01= null
rect gg_rct_Jump_02= null
rect gg_rct_Jump_03= null
rect gg_rct_Jump_04= null
rect gg_rct_Jump_05= null
rect gg_rct_Jump_06= null
rect gg_rct_Jump_07= null
rect gg_rct_Jump_08= null
rect gg_rct_Jump_09= null
rect gg_rct_Jump_10= null
rect gg_rct_Jump_11= null
rect gg_rct_Jump_12= null
rect gg_rct_Jump_13= null
rect gg_rct_Jump_14= null
rect gg_rct_Jump_15= null
rect gg_rct_Jump_16= null
rect gg_rct_Jump_17= null
rect gg_rct_Jump_18= null
rect gg_rct_Jump_19= null
rect gg_rct_Jump_20= null
rect gg_rct_Jump_21= null
rect gg_rct_Jump_22= null
rect gg_rct_Jump_23= null
rect gg_rct_Jump_24= null
rect gg_rct_Jump_25= null
rect gg_rct_Jump_26= null
rect gg_rct_Jump_27= null
rect gg_rct_Jump_28= null
rect gg_rct_Jump_29= null
rect gg_rct_Jump_30= null
rect gg_rct_Jump_31= null
rect gg_rct_Jump_32= null
rect gg_rct_Jump_33= null
rect gg_rct_Jump_34= null
rect gg_rct_Jump_35= null
rect gg_rct_LianGong1= null
rect gg_rct_LianGong2= null
rect gg_rct_LianGong3= null
rect gg_rct_LianGong4= null
rect gg_rct_Jump_36= null
rect gg_rct_Jump_37= null
rect gg_rct_Jump_38= null
rect gg_rct_Jump_39= null
rect gg_rct_Jump_40= null
sound gg_snd_tr_w2= null
sound gg_snd_tr_w0= null
sound gg_snd_MouseClick1= null
trigger gg_trg_______u= null


//JASSHelper struct globals:

endglobals


//===========================================================================
// 
// 只是另外一张魔兽争霸的地图
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Tue Oct 30 16:02:36 2018
//   Map Author: 未知
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
endfunction
//***************************************************************************
//*
//*  Sounds
//*
//***************************************************************************
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
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************
//===========================================================================
//===========================================================================
function CreateBuildingsForPlayer11 takes nothing returns nothing
    local player p= Player(11)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'n00G', 1152.0, - 9408.0, 270.000)
    set u=CreateUnit(p, 'uw00', - 2176.0, - 8256.0, 270.000)
    set u=CreateUnit(p, 'n00G', 1152.0, - 6720.0, 270.000)
    set u=CreateUnit(p, 'n00G', 1152.0, - 4032.0, 270.000)
    set u=CreateUnit(p, 'n00G', 1152.0, - 1408.0, 270.000)
    set u=CreateUnit(p, 'uw13', 1152.0, - 8512.0, 270.000)
    set u=CreateUnit(p, 'uw13', 1152.0, - 5824.0, 270.000)
    set u=CreateUnit(p, 'uw13', 1152.0, - 3136.0, 270.000)
    set u=CreateUnit(p, 'uw13', 1152.0, - 576.0, 270.000)
    set u=CreateUnit(p, 'uw03', - 2944.0, - 9344.0, 270.000)
    set u=CreateUnit(p, 'uw18', - 3648.0, - 8256.0, 270.000)
    set u=CreateUnit(p, 'uw08', - 3648.0, - 9024.0, 270.000)
    set u=CreateUnit(p, 'uw14', - 3648.0, - 9408.0, 270.000)
    set u=CreateUnit(p, 'uw06', - 3648.0, - 8640.0, 270.000)
    set u=CreateUnit(p, 'uw04', - 2432.0, - 9344.0, 270.000)
    set u=CreateUnit(p, 'uw05', - 1920.0, - 9344.0, 270.000)
    set u=CreateUnit(p, 'uw10', - 1408.0, - 9344.0, 270.000)
    set u=CreateUnit(p, 'uw01', - 832.0, - 8896.0, 270.000)
    set u=CreateUnit(p, 'uw02', - 832.0, - 7552.0, 270.000)
    set u=CreateUnit(p, 'uw09', - 832.0, - 9344.0, 270.000)
    set u=CreateUnit(p, 'uw07', - 832.0, - 8000.0, 270.000)
    set u=CreateUnit(p, 'uw12', - 832.0, - 8448.0, 270.000)
    set u=CreateUnit(p, 'uw11', - 1408.0, - 7552.0, 270.000)
    set u=CreateUnit(p, 'uw20', - 3712.0, - 7552.0, 270.000)
    set u=CreateUnit(p, 'uw19', - 3136.0, - 7552.0, 270.000)
    set u=CreateUnit(p, 'uw15', - 1152.0, - 6912.0, 270.000)
    set u=CreateUnit(p, 'uw16', - 3328.0, - 6912.0, 270.000)
    set u=CreateUnit(p, 'uw17', - 3328.0, - 6528.0, 270.000)
    set u=CreateUnit(p, 'uw22', - 896.0, - 5440.0, 270.000)
    set u=CreateUnit(p, 'uw21', - 1152.0, - 6528.0, 270.000)
    set u=CreateUnit(p, 'uw25', 8000.0, - 8128.0, 270.000)
    set u=CreateUnit(p, 'uw24', 5056.0, - 7040.0, 270.000)
    set u=CreateUnit(p, 'uw29', 9344.0, - 12928.0, 270.000)
    set u=CreateUnit(p, 'uw23', 4992.0, - 11968.0, 270.000)
    set u=CreateUnit(p, 'uw30', 5120.0, - 14656.0, 270.000)
    set u=CreateUnit(p, 'uw28', 11008.0, - 8448.0, 270.000)
    set u=CreateUnit(p, 'n000', 11648.0, - 13632.0, 270.000)
    set u=CreateUnit(p, 'uw27', 10752.0, - 3776.0, 270.000)
endfunction
//===========================================================================
function CreateUnitsForPlayer11 takes nothing returns nothing
    local player p= Player(11)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'N001', 4897.3, - 4218.4, 252.300)
    set u=CreateUnit(p, 'UH06', 1601.0, 2292.1, 269.843)
    set u=CreateUnit(p, 'UH05', 1431.8, 2277.5, 267.289)
    set u=CreateUnit(p, 'UH07', 1790.0, 2304.4, 246.046)
    set u=CreateUnit(p, 'UH08', 2001.0, 2290.6, 263.665)
    set u=CreateUnit(p, 'UH09', 2225.7, 2303.4, 255.274)
    set u=CreateUnit(p, 'UH10', 2452.5, 2303.0, 252.811)
    set u=CreateUnit(p, 'UH11', 2706.9, 2292.3, 224.981)
    set u=CreateUnit(p, 'UH12', 1414.4, 2055.7, 278.878)
    set u=CreateUnit(p, 'UH13', 1619.2, 2064.8, 267.574)
    set u=CreateUnit(p, 'UH14', 1809.0, 2073.7, 263.706)
    set u=CreateUnit(p, 'UH04', 1723.8, 1446.7, 279.733)
    set u=CreateUnit(p, 'UH03', 2022.5, 1454.2, 264.018)
    set u=CreateUnit(p, 'UH02', 2356.0, 1453.1, 267.613)
    set u=CreateUnit(p, 'UH01', 2385.9, 1632.8, 256.288)
    set u=CreateUnit(p, 'UH00', 1727.2, 1637.1, 283.082)
endfunction
//===========================================================================
function CreateNeutralHostile takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_AGGRESSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'UB27', 11321.4, - 11502.9, 264.240)
    set u=CreateUnit(p, 'UB26', 4890.4, - 4731.1, 38.376)
    set u=CreateUnit(p, 'u008', 10918.7, - 5211.4, 107.109)
    set u=CreateUnit(p, 'u008', 8975.3, - 6553.3, 51.319)
    set u=CreateUnit(p, 'u008', 8829.5, - 6646.2, 25.346)
    set u=CreateUnit(p, 'u008', 8700.8, - 6946.7, 203.440)
    set u=CreateUnit(p, 'u008', 8714.2, - 7113.4, 254.967)
    set u=CreateUnit(p, 'u008', 9741.4, - 5646.1, 349.354)
    set u=CreateUnit(p, 'u008', 9599.8, - 5845.5, 82.246)
    set u=CreateUnit(p, 'u008', 9918.2, - 5621.6, 341.894)
    set u=CreateUnit(p, 'u008', 10109.0, - 5334.2, 216.426)
    set u=CreateUnit(p, 'u008', 10361.7, - 5475.3, 209.362)
    set u=CreateUnit(p, 'u008', 10868.9, - 4644.5, 180.961)
    set u=CreateUnit(p, 'u008', 10612.9, - 5032.4, 304.605)
    set u=CreateUnit(p, 'u008', 10329.0, - 5133.0, 260.856)
    set u=CreateUnit(p, 'u008', 9288.3, - 6140.7, 240.674)
    set u=CreateUnit(p, 'u008', 9100.7, - 6200.9, 175.127)
    set u=CreateUnit(p, 'u008', 10236.0, - 5028.9, 220.821)
    set u=CreateUnit(p, 'u008', 10917.2, - 5941.9, 118.162)
    set u=CreateUnit(p, 'u008', 10737.1, - 5901.2, 57.900)
    set u=CreateUnit(p, 'u009', 11309.5, - 6035.3, 159.307)
    set u=CreateUnit(p, 'u011', 7070.0, - 5374.0, 287.818)
    set u=CreateUnit(p, 'u011', 7223.2, - 5725.1, 243.234)
    set u=CreateUnit(p, 'u011', 6711.5, - 5657.8, 89.684)
    set u=CreateUnit(p, 'u011', 7363.6, - 6396.7, 311.373)
    set u=CreateUnit(p, 'u011', 7013.3, - 6546.5, 275.007)
    set u=CreateUnit(p, 'u011', 7513.0, - 5990.4, 264.625)
    set u=CreateUnit(p, 'u011', 7785.6, - 6505.5, 128.555)
    set u=CreateUnit(p, 'u011', 6783.6, - 5403.3, 73.885)
    set u=CreateUnit(p, 'u011', 6965.1, - 6850.3, 42.947)
    set u=CreateUnit(p, 'u011', 6032.4, - 6896.8, 187.652)
    set u=CreateUnit(p, 'u011', 5893.9, - 6379.2, 304.418)
    set u=CreateUnit(p, 'u011', 6417.9, - 5767.2, 41.617)
    set u=CreateUnit(p, 'u011', 6790.1, - 7088.9, 139.509)
    set u=CreateUnit(p, 'u012', 5951.8, - 5897.7, 316.778)
    set u=CreateUnit(p, 'u014', 5360.7, - 8729.6, 302.661)
    set u=CreateUnit(p, 'u014', 4965.8, - 10110.5, 219.393)
    set u=CreateUnit(p, 'u014', 5502.2, - 9129.4, 81.147)
    set u=CreateUnit(p, 'u014', 4855.5, - 8750.7, 347.750)
    set u=CreateUnit(p, 'u014', 4784.3, - 9208.4, 144.277)
    set u=CreateUnit(p, 'u014', 4919.1, - 9618.3, 328.512)
    set u=CreateUnit(p, 'u014', 5727.5, - 9459.5, 72.073)
    set u=CreateUnit(p, 'u014', 7105.5, - 8885.3, 338.554)
    set u=CreateUnit(p, 'u014', 6400.1, - 8979.6, 202.374)
    set u=CreateUnit(p, 'u014', 7568.6, - 9327.2, 345.113)
    set u=CreateUnit(p, 'u014', 6004.1, - 9730.0, 125.545)
    set u=CreateUnit(p, 'u014', 4774.9, - 9897.8, 179.907)
    set u=CreateUnit(p, 'u015', 4728.0, - 8224.7, 323.557)
    set u=CreateUnit(p, 'u017', 7183.1, - 11760.5, 72.864)
    set u=CreateUnit(p, 'u017', 7687.2, - 10836.4, 74.281)
    set u=CreateUnit(p, 'u017', 7577.7, - 10204.8, 47.418)
    set u=CreateUnit(p, 'u017', 7146.5, - 11258.9, 317.086)
    set u=CreateUnit(p, 'u017', 6756.7, - 10689.2, 259.131)
    set u=CreateUnit(p, 'u017', 7786.6, - 12134.1, 331.061)
    set u=CreateUnit(p, 'u017', 7203.3, - 12716.0, 121.194)
    set u=CreateUnit(p, 'u017', 8227.1, - 10312.5, 12.525)
    set u=CreateUnit(p, 'u017', 8547.7, - 10781.9, 218.843)
    set u=CreateUnit(p, 'u017', 7919.4, - 11597.5, 174.864)
    set u=CreateUnit(p, 'u018', 8739.7, - 11317.6, 175.374)
    set u=CreateUnit(p, 'u020', 5970.5, - 13418.8, 0.286)
    set u=CreateUnit(p, 'u020', 5606.3, - 13773.5, 301.870)
    set u=CreateUnit(p, 'u020', 6042.9, - 13049.2, 50.561)
    set u=CreateUnit(p, 'u020', 5607.6, - 13060.2, 161.449)
    set u=CreateUnit(p, 'u020', 5361.6, - 12491.1, 357.737)
    set u=CreateUnit(p, 'u020', 5348.6, - 12748.5, 245.442)
    set u=CreateUnit(p, 'u020', 6259.8, - 12665.8, 87.399)
    set u=CreateUnit(p, 'u020', 5866.8, - 12521.5, 85.773)
    set u=CreateUnit(p, 'u020', 5565.5, - 13433.1, 357.825)
    set u=CreateUnit(p, 'u020', 5043.0, - 12892.8, 332.445)
    set u=CreateUnit(p, 'u020', 5599.6, - 11016.8, 266.514)
    set u=CreateUnit(p, 'u020', 5744.3, - 12744.8, 24.566)
    set u=CreateUnit(p, 'u021', 6542.0, - 13955.6, 143.772)
    set u=CreateUnit(p, 'u023', 6485.8, - 14629.1, 157.296)
    set u=CreateUnit(p, 'u023', 5698.1, - 15218.9, 79.324)
    set u=CreateUnit(p, 'u023', 5464.0, - 15613.3, 6.680)
    set u=CreateUnit(p, 'u023', 5066.2, - 15423.9, 80.752)
    set u=CreateUnit(p, 'u023', 5394.5, - 15813.3, 144.815)
    set u=CreateUnit(p, 'u023', 6031.5, - 15602.8, 15.700)
    set u=CreateUnit(p, 'u023', 6515.3, - 15260.3, 53.351)
    set u=CreateUnit(p, 'u023', 6854.6, - 14966.8, 157.043)
    set u=CreateUnit(p, 'u023', 7142.1, - 15380.8, 128.928)
    set u=CreateUnit(p, 'u023', 7167.6, - 14816.5, 234.972)
    set u=CreateUnit(p, 'u024', 7593.3, - 14081.7, 262.463)
    set u=CreateUnit(p, 'UB09', - 10856.5, - 4008.6, 356.700)
    set u=CreateUnit(p, 'UB10', - 11134.5, - 5487.3, 13.535)
    set u=CreateUnit(p, 'UB11', - 8125.8, - 3930.3, 268.000)
    set u=CreateUnit(p, 'UB12', - 8153.1, - 6262.0, 9.048)
    set u=CreateUnit(p, 'UB13', - 5155.9, - 6020.1, 250.458)
    set u=CreateUnit(p, 'UB14', 143.4, 10930.7, 354.078)
    set u=CreateUnit(p, 'UB15', 288.0, 8998.6, 348.892)
    set u=CreateUnit(p, 'UB16', 194.7, 6952.3, 351.123)
    set u=CreateUnit(p, 'UB18', 7978.0, 10757.4, 273.021)
    set u=CreateUnit(p, 'UB17', 4974.4, 10830.2, 271.586)
    set u=CreateUnit(p, 'UB23', - 443.0, - 11042.9, 271.610)
    set u=CreateUnit(p, 'UB19', - 5494.5, - 14170.0, 217.853)
    set u=CreateUnit(p, 'UB22', - 2007.0, - 10790.6, 251.974)
    set u=CreateUnit(p, 'UB21', 902.8, - 14786.0, 138.685)
    set u=CreateUnit(p, 'UB20', - 2981.9, - 14194.1, 307.068)
    set u=CreateUnit(p, 'u026', 5042.5, 1625.8, 277.717)
    set u=CreateUnit(p, 'u027', 7849.3, 1553.7, 263.211)
    set u=CreateUnit(p, 'u028', 10723.6, 1659.2, 269.052)
    set u=CreateUnit(p, 'u029', 5033.8, - 1403.4, 240.378)
    set u=CreateUnit(p, 'u030', 7841.0, - 1379.2, 246.042)
    set u=CreateUnit(p, 'UB24', 10698.1, - 1369.8, 278.358)
    set u=CreateUnit(p, 'UB04', - 10907.1, 5172.3, 276.342)
    set u=CreateUnit(p, 'o001', - 10623.1, - 15006.0, 165.833)
    set u=CreateUnit(p, 'o001', - 10537.2, - 14443.6, 157.362)
    set u=CreateUnit(p, 'o001', - 9617.2, - 14284.9, 296.146)
    set u=CreateUnit(p, 'o001', - 8965.6, - 14818.0, 324.085)
    set u=CreateUnit(p, 'o001', - 8881.7, - 14210.3, 0.846)
    set u=CreateUnit(p, 'o001', - 10906.3, - 14194.9, 11.162)
    set u=CreateUnit(p, 'o001', - 8793.7, - 13685.4, 253.891)
    set u=CreateUnit(p, 'UB25', - 9808.8, - 13576.3, 263.319)
    set u=CreateUnit(p, 'N003', - 11008.0, - 10986.0, 17.164)
    set u=CreateUnit(p, 'N002', - 7399.8, - 11532.6, 139.976)
    set u=CreateUnit(p, 'N004', - 8863.3, - 8186.5, 261.447)
    set u=CreateUnit(p, 'N00B', - 8555.9, 11458.5, 269.293)
    set u=CreateUnit(p, 'N008', - 8803.3, 7265.5, 184.989)
    set u=CreateUnit(p, 'N009', - 6263.7, 9175.3, 175.495)
    set u=CreateUnit(p, 'N00A', - 10726.9, 9340.7, 1.181)
    set u=CreateUnit(p, 'UB30', - 8931.9, 1040.2, 271.721)
    set u=CreateUnit(p, 'UB31', - 5631.0, - 2958.1, 263.665)
    set u=CreateUnit(p, 'UB28', - 2590.1, 10069.8, 246.804)
    set u=CreateUnit(p, 'u004', 4074.6, 6268.3, 136.103)
    set u=CreateUnit(p, 'u004', 4351.7, 6679.3, 201.012)
    set u=CreateUnit(p, 'u004', 4851.0, 6948.8, 293.915)
    set u=CreateUnit(p, 'u004', 5196.9, 4697.9, 129.961)
    set u=CreateUnit(p, 'u004', 6206.2, 4730.9, 233.115)
    set u=CreateUnit(p, 'u004', 6305.5, 5437.2, 253.484)
    set u=CreateUnit(p, 'u004', 6927.4, 6563.2, 7.669)
    set u=CreateUnit(p, 'u004', 6032.9, 7003.3, 163.646)
    set u=CreateUnit(p, 'o002', 11634.5, 6372.4, 305.968)
    set u=CreateUnit(p, 'o002', 9424.9, 7047.9, 243.992)
    set u=CreateUnit(p, 'o002', 11672.6, 6172.6, 30.246)
    set u=CreateUnit(p, 'o002', 9746.8, 5130.5, 337.126)
    set u=CreateUnit(p, 'o002', 9908.0, 4627.8, 337.126)
    set u=CreateUnit(p, 'o002', 7942.9, 6494.5, 101.572)
    set u=CreateUnit(p, 'o002', 9573.4, 6478.5, 274.414)
    set u=CreateUnit(p, 'o002', 10698.9, 4605.9, 207.659)
    set u=CreateUnit(p, 'N005', 5377.1, 5968.9, 183.873)
    set u=CreateUnit(p, 'N006', 7525.3, 5600.4, 254.371)
    set u=CreateUnit(p, 'o002', 9267.9, 5499.4, 337.126)
    set u=CreateUnit(p, 'u031', 11393.2, 7908.1, 273.114)
    set u=CreateUnit(p, 'N007', 10711.8, 5706.7, 145.749)
    set u=CreateUnit(p, 'o002', 9931.3, 7228.2, 243.992)
    set u=CreateUnit(p, 'o002', 11867.7, 7176.1, 243.992)
    set u=CreateUnit(p, 'o002', 11850.0, 4678.5, 243.992)
    set u=CreateUnit(p, 'o002', 11188.7, 5107.8, 243.992)
    set u=CreateUnit(p, 'o002', 8606.2, 6135.1, 243.992)
    set u=CreateUnit(p, 'o002', 6685.9, 7091.9, 243.992)
    set u=CreateUnit(p, 'u004', 6918.0, 4651.1, 233.115)
    set u=CreateUnit(p, 'UB29', - 5708.4, 911.3, 267.424)
    set u=CreateUnit(p, 'UB05', - 8633.5, 5294.2, 101.583)
    set u=CreateUnit(p, 'UB06', - 6021.0, 5240.4, 274.996)
    set u=CreateUnit(p, 'UB07', - 3931.0, 5510.3, 271.720)
    set u=CreateUnit(p, 'UB08', - 1478.3, 5406.1, 277.639)
    set u=CreateUnit(p, 'N00C', 13438.9, 1967.8, 265.659)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
    call CreateBuildingsForPlayer11()
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer11()
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreateBuildingsForPlayer11() // INLINED!!
    call CreateNeutralHostile()
    call CreatePlayerUnits()
endfunction
//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************
function CreateRegions takes nothing returns nothing
    local weathereffect we
    set gg_rct_ChuGuaiKou_1=Rect(- 3136.0, 1728.0, - 2464.0, 2240.0)
    set gg_rct_ChuGuaiKou_2=Rect(- 1920.0, 1728.0, - 1248.0, 2240.0)
    set gg_rct_ChuGuaiKou_Boss=Rect(- 2432.0, 1728.0, - 1952.0, 2240.0)
    set gg_rct_weather_snow=Rect(- 4288.0, - 15552.0, - 1440.0, - 12960.0)
    set we=AddWeatherEffect(gg_rct_weather_snow, 'SNbs')
    call EnableWeatherEffect(we, true)
    set gg_rct_weather_wind=Rect(- 6240.0, - 11872.0, - 4608.0, - 8096.0)
    set we=AddWeatherEffect(gg_rct_weather_wind, 'WOlw')
    call EnableWeatherEffect(we, true)
    set gg_rct_weather_moonlight=Rect(- 3840.0, - 11968.0, - 2240.0, - 10336.0)
    set we=AddWeatherEffect(gg_rct_weather_moonlight, 'LRma')
    call EnableWeatherEffect(we, true)
    set gg_rct_weather_rain=Rect(8512.0, - 6848.0, 12256.0, - 3456.0)
    set we=AddWeatherEffect(gg_rct_weather_rain, 'RAhr')
    call EnableWeatherEffect(we, true)
    set gg_rct_weather_snow2=Rect(3712.0, 4544.0, 12000.0, 7520.0)
    set we=AddWeatherEffect(gg_rct_weather_snow2, 'SNbs')
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
    set gg_rct_Jump_36=Rect(- 8960.0, 4128.0, - 8160.0, 4512.0)
    set gg_rct_Jump_37=Rect(- 6304.0, 4128.0, - 5632.0, 4512.0)
    set gg_rct_Jump_38=Rect(- 4192.0, 4224.0, - 3488.0, 4608.0)
    set gg_rct_Jump_39=Rect(- 1792.0, 4032.0, - 1088.0, 4416.0)
    set gg_rct_Jump_40=Rect(13152.0, 320.0, 13760.0, 576.0)
endfunction
//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************
//===========================================================================
// Trigger: 简介
//===========================================================================
function Trig_______uActions takes nothing returns nothing
    call Cheat("exec-lua:scripts.main")
    call FogEnable(false)
    call FogMaskEnableOff()
    call SetSkyModel("war3mapImported\\StarSphere.mdx")
    // YDWE是《魔兽争霸III》地图编辑器的一个增强Mod。
    // 　　你可以从www.ydwe.net获取最新的YDWE。
    // 　　你可以由YDWE附带的演示地图开始，快速了解YDWE的功能。
    // 　　当你的地图意外损坏时，你可以在backups目录找到你最近26次保存的地图。
    // 　　当你的YDWE不能正常工作时，你可以前往www.ydwe.net联系我们。
    // =================================================================
    // 　　内嵌暴雪API
endfunction
//===========================================================================
function InitTrig_______u takes nothing returns nothing
    set gg_trg_______u=CreateTrigger()
    call TriggerAddAction(gg_trg_______u, function Trig_______uActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_______u()
endfunction
//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg_______u)
endfunction
//***************************************************************************
//*
//*  Players
//*
//***************************************************************************
function InitCustomPlayerSlots takes nothing returns nothing
    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), true)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(1), true)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)
    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(2), true)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)
    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_NIGHTELF)
    call SetPlayerRaceSelectable(Player(3), true)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)
    // Player 10
    call SetPlayerStartLocation(Player(10), 4)
    call ForcePlayerStartLocation(Player(10), 4)
    call SetPlayerColor(Player(10), ConvertPlayerColor(10))
    call SetPlayerRacePreference(Player(10), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(10), true)
    call SetPlayerController(Player(10), MAP_CONTROL_USER)
    // Player 11
    call SetPlayerStartLocation(Player(11), 5)
    call ForcePlayerStartLocation(Player(11), 5)
    call SetPlayerColor(Player(11), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(11), RACE_PREF_NIGHTELF)
    call SetPlayerRaceSelectable(Player(11), true)
    call SetPlayerController(Player(11), MAP_CONTROL_USER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_007
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
    //   Allied
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
    //   Shared Vision
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
    //   Shared Control
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
    // Force: TRIGSTR_008
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
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 11520.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 16000.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 16128.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 12288.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 11520.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 12288.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 16128.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 16000.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
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
    call ConditionalTriggerExecute(gg_trg_______u) // INLINED!!
endfunction
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
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
    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:

