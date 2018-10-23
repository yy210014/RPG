DropInfo={}

local mDropInfos = {
    ["进攻怪"] = {
        {
            8,
            GetId("ID00"),
            GetId("ID01"),
            GetId("ID02"),
            GetId("ID03"),
            GetId("ID04"),
            GetId("ID05"),
            GetId("ID06"),
            GetId("ID07")
        }
    },
    --仇恨天
    [GetId("UB27")] = {
        {
            100,
            GetId("IE28"),
            GetId("IE44"),
            GetId("IE61"),
            GetId("IE7d")
        }
    },
    --宝石怪
    [GetId("u006")] = {
        {
            2,
            GetId("ID3c"),
            GetId("ID3e"),
            GetId("ID40")
        },
        {
            3,
            GetId("ID3d"),
            GetId("ID3f"),
            GetId("ID41")
        }
    },
    --上古神石房
    [GetId("u007")] = {
        {
            2,
            GetId("ID3c"),
            GetId("ID3e"),
            GetId("ID40")
        }
    },
    --仙帝BOSS
    [""] = {
        {
            100,
            GetId("ID49")
        }
    },
    --人鱼女王
    [GetId("u009")] = {
        {
            40,
            GetId("ID0f")
        },
        {
            60,
            GetId("ID00"),
            GetId("ID01"),
            GetId("ID02"),
            GetId("ID03"),
            GetId("ID04"),
            GetId("ID05"),
            GetId("ID06"),
            GetId("ID07")
        },
        {
            100,
            GetId("ID28"),
            GetId("ID29")
        }
    },
    --变异的人鱼女王
    [GetId("u010")] = {
        {
            100,
            GetId("ID10"),
            GetId("ID34")
        }
    },
    --烈火蜘蛛 *
    [GetId("u012")] = {
        {
            40,
            GetId("ID0f")
        },
        {
            60,
            GetId("ID00"),
            GetId("ID01"),
            GetId("ID02"),
            GetId("ID03"),
            GetId("ID04"),
            GetId("ID05"),
            GetId("ID06"),
            GetId("ID07")
        },
        {
            100,
            GetId("ID2a"),
            GetId("ID2b")
        }
    },
    --变异的烈火蜘蛛
    [GetId("u013")] = {
        {
            100,
            GetId("ID10"),
            GetId("ID35")
        }
    },
    --强盗首领
    [GetId("u015")] = {
        {
            40,
            GetId("ID0f")
        },
        {
            60,
            GetId("ID00"),
            GetId("ID01"),
            GetId("ID02"),
            GetId("ID03"),
            GetId("ID04"),
            GetId("ID05"),
            GetId("ID06"),
            GetId("ID07")
        },
        {
            100,
            GetId("ID2c"),
            GetId("ID2d")
        }
    },
    --变异的强盗首领
    [GetId("u016")] = {
        {
            100,
            GetId("ID10"),
            GetId("ID36")
        }
    },
    --疯狼王
    [GetId("u018")] = {
        {
            40,
            GetId("ID0f")
        },
        {
            60,
            GetId("ID00"),
            GetId("ID01"),
            GetId("ID02"),
            GetId("ID03"),
            GetId("ID04"),
            GetId("ID05"),
            GetId("ID06"),
            GetId("ID07")
        },
        {
            100,
            GetId("ID2e"),
            GetId("ID2f")
        }
    },
    --变异的疯狼王
    [GetId("u019")] = {
        {
            100,
            GetId("ID10"),
            GetId("ID37")
        }
    },
    --熊族将军
    [GetId("u021")] = {
        {
            40,
            GetId("ID0f")
        },
        {
            60,
            GetId("ID00"),
            GetId("ID01"),
            GetId("ID02"),
            GetId("ID03"),
            GetId("ID04"),
            GetId("ID05"),
            GetId("ID06"),
            GetId("ID07")
        },
        {
            100,
            GetId("ID30"),
            GetId("ID31")
        }
    },
    --变异的熊族将军
    [GetId("u022")] = {
        {
            100,
            GetId("ID10"),
            GetId("ID38")
        }
    },
    --妖魂女王
    [GetId("u024")] = {
        {
            40,
            GetId("ID0f")
        },
        {
            60,
            GetId("ID00"),
            GetId("ID01"),
            GetId("ID02"),
            GetId("ID03"),
            GetId("ID04"),
            GetId("ID05"),
            GetId("ID06"),
            GetId("ID07")
        },
        {
            100,
            GetId("ID32"),
            GetId("ID33")
        }
    },
    --变异的妖魂女王
    [GetId("u025")] = {
        {
            100,
            GetId("ID10"),
            GetId("ID39")
        }
    },
    --狂狼巢穴BOSS
    [GetId("UB09")] = {
        {
            100,
            GetId("ID15")
        }
    },
    --青衣冢BOSS
    [GetId("UB10")] = {
        {
            100,
            GetId("ID16")
        }
    },
    --火岩洞穴BOSS
    [GetId("UB11")] = {
        {
            100,
            GetId("ID17")
        }
    },
    --幽冥居BOSS
    [GetId("UB12")] = {
        {
            100,
            GetId("ID18")
        }
    },
    --天劫谷BOSS
    [GetId("UB13")] = {
        {
            100,
            GetId("ID19")
        }
    },
    --履霜密境BOSS
    [GetId("UB14")] = {
        {
            100,
            GetId("ID1a")
        }
    },
    --黄昏神殿BOSS
    [GetId("UB15")] = {
        {
            100,
            GetId("ID1b")
        }
    },
    --天界炼狱BOSS
    [GetId("UB16")] = {
        {
            100,
            GetId("ID1c")
        }
    },
    --指天神殿BOSS
    [GetId("UB17")] = {
        {
            100,
            GetId("ID1d")
        }
    },
    --吞天神殿BOSS
    [GetId("UB18")] = {
        {
            100,
            GetId("ID1e")
        }
    },
    --上古神族族长
    [GetId("UB23")] = {
        {
            100,
            GetId("ID1f")
        }
    },
    --绝学殿护卫
    [GetId("u026")] = {
        {
            100,
            GetId("ID42")
        }
    },
    --绝学殿弟子阿风
    [GetId("u027")] = {
        {
            100,
            GetId("ID43")
        }
    },
    --绝学殿大弟子雷火冥
    [GetId("u028")] = {
        {
            100,
            GetId("ID44")
        }
    },
    --绝学殿大弟子破心
    [GetId("u029")] = {
        {
            100,
            GetId("ID45")
        }
    },
    --绝学殿大师-无能
    [GetId("u030")] = {
        {
            100,
            GetId("ID47")
        }
    },
    --绝学殿掌门-绝尘子
    [GetId("UB24")] = {
        {
            100,
            GetId("ID48")
        }
    },
    --修罗场1层BOSS
    [GetId("UB04")] = {
        {
            70,
            GetId("IA34")
        },
        {
            90,
            GetId("IA35")
        },
        {
            100,
            GetId("IA36")
        }
    },
    --修罗场2层BOSS
    [GetId("UB05")] = {
        {
            70,
            GetId("IA37")
        },
        {
            90,
            GetId("IA38")
        },
        {
            100,
            GetId("IA39")
        }
    },
    --修罗场3层BOSS
    [GetId("UB06")] = {
        {
            100,
            GetId("IE32"),
            GetId("IE4e"),
            GetId("IE6b")
        }
    },
    --修罗场4层BOSS
    [GetId("UB07")] = {
        {
            100,
            GetId("IE33"),
            GetId("IE4f"),
            GetId("IE6c")
        }
    },
    --修罗场5层BOSS
    [GetId("UB08")] = {
        {
            100,
            GetId("IE34"),
            GetId("IE50"),
            GetId("IE6d")
        }
    },
    --小树人
    [GetId("o001")] = {
        {
            100,
            GetId("ID0f")
        }
    },
    --紫色仙境BOSS
    [GetId("UB25")] = {
        {
            20,
            GetId("ID3b")
        }
    },
    --玄武
    [GetId("N009")] = {
        {
            100,
            GetId("ID24")
        }
    },
    --青龙
    [GetId("N00A")] = {
        {
            100,
            GetId("ID25")
        }
    },
    --朱雀
    [GetId("N00B")] = {
        {
            100,
            GetId("ID26")
        }
    },
    --白虎
    [GetId("N008")] = {
        {
            100,
            GetId("ID27")
        }
    },
    --狂暴屠夫
    [GetId("N002")] = {
        {
            100,
            GetId("IE35"),
            GetId("IE3a"),
            GetId("IE3f")
        }
    },
    --地宫虫王
    [GetId("N003")] = {
        {
            100,
            GetId("IE51"),
            GetId("IE56"),
            GetId("IE5b")
        }
    },
    --地下领主
    [GetId("N004")] = {
        {
            100,
            GetId("IE6e"),
            GetId("IE73"),
            GetId("IE78")
        }
    },
    --护卫兵
    [GetId("u004")] = {
        {
            10,
            GetId("ID10")
        }
    },
    --冰霜熊
    [GetId("o002")] = {
        {
            10,
            GetId("ID10")
        }
    },
    --覆霜幽灵
    [GetId("N005")] = {
        {
            100,
            GetId("IE94"),
            GetId("IE99"),
            GetId("IE9e"),
            GetId("IEa3"),
            GetId("IEa8")
        }
    },
    --冰霜眷灵
    [GetId("N006")] = {
        {
            100,
            GetId("IEc4"),
            GetId("IEc9"),
            GetId("IEcf"),
            GetId("IEd4"),
            GetId("IEd9")
        }
    },
    --冰霜巨象
    [GetId("N007")] = {
        {
            100,
            GetId("IE0d"),
            GetId("IE13"),
            GetId("IE18"),
            GetId("IE1d"),
            GetId("IE23")
        }
    },
    --冰霜公主
    [GetId("u031")] = {
        {
            30,
            GetId("IEad"),
            GetId("IEdf"),
            GetId("IE28")
        }
    },
    --器灵BOSS
    [GetId("UB28")] = {
        {
            100,
            GetId("ID4a")
        }
    },
    --世界BOSS
    [GetId("UB30")] = {
        {
            100,
            GetId("ID4b")
        }
    },
    --势力BOSS-1号
    [GetId("UB29")] = {
        {
            100,
            GetId("ID4b")
        }
    },
    --势力BOSS-2号
    [GetId("UB31")] = {
        {
            100,
            GetId("ID4b")
        }
    }
}

function DropInfo:New(key)
    return mDropInfos[key]
end

--[[进攻怪	水果，裙子，零食，山水图，古书，玫瑰，胭脂，石头/8%							
仇恨天	随机S+装备/100%							
宝石房-小怪	初级烈火石、初级金橘石、初级水玉石/0.9%	高级烈火石、高级金橘石、高级水玉石/0.15%						
上古神石房-小怪	上古神石/1%							
仙帝BOSS	仙帝绝学/100%							
人鱼女王	修为卷轴小/40%	水果，裙子，零食，山水图，古书，玫瑰，胭脂，石头/20%	人鱼头环、女王王冠/40%					
变异的人鱼女王	修为卷轴大、变异人鱼之心/100%							
烈火蜘蛛	修为卷轴小/40%	水果，裙子，零食，山水图，古书，玫瑰，胭脂，石头/20%	烈火蛛炎、蜘蛛毒器/40%					
变异的烈火蜘蛛	修为卷轴大、变异蜘蛛之心/100%							
强盗首领	修为卷轴小/40%	水果，裙子，零食，山水图，古书，玫瑰，胭脂，石头/20%	珠宝长靴、首领之意/40%					
变异的强盗首领	修为卷轴大、变异强盗之心/100%							
疯狼王	修为卷轴小/40%	水果，裙子，零食，山水图，古书，玫瑰，胭脂，石头/20%	癫狂狼爪、狼王之意/40%					
变异的疯狼王	修为卷轴大、变异疯狼之心/100%							
熊族将军	修为卷轴小/40%	水果，裙子，零食，山水图，古书，玫瑰，胭脂，石头/20%	熊熊护腕、熊族之意/40%					
变异的熊族将军	修为卷轴大、变异熊族之心/50%							
妖魂女王	修为卷轴小/40%	水果，裙子，零食，山水图，古书，玫瑰，胭脂，石头/20%	妖魂护手、女王之意/40%					
变异的妖魂女王	修为卷轴大、变异妖魂之心/100%							
狂狼巢穴BOSS	狂狼爪/100%							
青衣冢BOSS	青衣血脉/100%			
火岩洞穴BOSS	天火石/100%							
幽冥居BOSS	幽冥石/100%							
天劫谷BOSS	天劫之力/100%							
履霜密境BOSS	冰霜符咒/100%							
黄昏神殿BOSS	玄铁/100%							
天界炼狱BOSS	炼狱神火/100%							
指天神殿BOSS	指天神火/100%							
吞天神殿BOSS	吞天神火/100%							
上古神族族长	领地本源/100%							
绝学殿护卫	逍遥心法1级/100%							
绝学殿弟子阿风	金燕功1级/100%		
绝学殿大弟子雷火冥	无相功1级/100%							
绝学殿大弟子破心	先天功1级/100%							
绝学殿大师-无能	风火林山1级/100%							
绝学殿掌门-绝尘子	太乙鬼谷功1级/100%							
修罗场1层BOSS	普通品质技能卷轴/70%	稀有品质技能卷轴/20%	绝世品质技能卷轴/10%					
修罗场2层BOSS	普通品质技能进阶卷轴/70%	稀有品质技能进阶卷轴/20%	绝世品质技能进阶卷轴/10%					
修罗场3层BOSS	C级项链、C级戒指、C级法宝/100%							
修罗场4层BOSS	B级项链、B级戒指、B级法宝/100%							
修罗场5层BOSS	A级项链、A级戒指、A级法宝/100%							
小树人	修为卷轴小/10%			
紫色仙境BOSS	复制BOSS/20%							
玄武	玄武之力/100%							
青龙	青龙之力/100%							
朱雀	朱雀之力/100%							
白虎	白虎之力/100%							
狂暴屠夫	S级戒指/100%							
地宫虫王	S级项链/100%							
地下领主	S级法宝/100%							
护卫兵 	修为卷轴大/10%							
冰霜熊	修为卷轴大/10%							
覆霜幽灵	S级武器/100%							
冰霜眷灵	S级衣服/100%							
冰霜巨象	S级头盔/100%							
冰冻公主	S+装备/30%							
器灵BOSS	器灵碎片/100%							
世界BOSS	势力值/100%							
势力BOSS-1号	势力值/100%							
势力BOSS-2号	势力值/100%							
]]
