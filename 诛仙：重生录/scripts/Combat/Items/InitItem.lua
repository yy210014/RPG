require "scripts.Combat.Item"

function InitItem()
    Items["进入练功房"].JumpPoints = {JumpPoint.LianGong1, JumpPoint.LianGong2, JumpPoint.LianGong3, JumpPoint.LianGong4}
    Items["狂狼巢穴"].JumpPoint = JumpPoint.KuangLang
    Items["青衣冢"].JumpPoint = JumpPoint.QingYi
    Items["火岩洞穴"].JumpPoint = JumpPoint.HuoYan
    Items["幽冥居"].JumpPoint = JumpPoint.XueMing
    Items["天劫谷"].JumpPoint = JumpPoint.TianJie
    Items["烈焰地宫"].JumpPoint = JumpPoint.LieYan
    Items["进攻土族领地"].JumpPoint = JumpPoint.Tu
    Items["进攻木族领地"].JumpPoint = JumpPoint.Mu
    Items["进攻雪族领地"].JumpPoint = JumpPoint.Xue
    Items["进攻火族领地"].JumpPoint = JumpPoint.Huo
    Items["传送到野外森林处"].JumpPoint = JumpPoint.RenYu
    Items["传送到野外森林处"].JumpPoint = JumpPoint.YeQu
    Items["挑战绝学殿护卫"].JumpPoint = JumpPoint.JueXue1
    Items["绝学殿弟子阿风"].JumpPoint = JumpPoint.JueXue2
    Items["挑战绝学殿大弟子雷火冥"].JumpPoint = JumpPoint.JueXue3
    Items["挑战绝学殿大弟子破心"].JumpPoint = JumpPoint.JueXue4
    Items["挑战绝学殿大师-无能"].JumpPoint = JumpPoint.JueXue5
    Items["挑战绝学殿掌门-绝尘子"].JumpPoint = JumpPoint.JueXue6
    Items["挑战势力BOSS1号"].JumpPoint = JumpPoint.ShiLi1
    Items["挑战势力BOSS2号"].JumpPoint = JumpPoint.ShiLi2
    Items["挑战世界BOSS"].JumpPoint = JumpPoint.ShiJie
    Items["修罗场1层"].JumpPoint = JumpPoint.XiuLuo
    Items["神兽岛"].JumpPoint = JumpPoint.ShenShou
    Items["挑战器灵BOSS"].JumpPoint = JumpPoint.QingLing
    Items["黄昏神殿"].JumpPoint = JumpPoint.HuangHun
    Items["天界炼狱"].JumpPoint = JumpPoint.TianJie
    Items["覆霜雪地"].JumpPoint = JumpPoint.LvShuang
    Items["指天神殿"].JumpPoint = JumpPoint.ZhiTian
    Items["履霜密境"].JumpPoint = JumpPoint.LvShuangBoss
    Items["挑战上古神族族长"].JumpPoint = JumpPoint.God
    Items["金币房"].LianGongUnitId = "u000"
    Items["高级金币房"].LianGongUnitId = "u001"
    Items["超级金币房"].LianGongUnitId = "u002"
    Items["终极金币房"].LianGongUnitId = "u003"
    Items["修为怪"].LianGongUnitId = "o000"
    Items["高级修为怪"].LianGongUnitId = "u005"
    Items["宝石怪"].LianGongUnitId = "u006"
    Items["上古神石怪"].LianGongUnitId = "u007"
end

local item = Items["领取野外击杀鱼怪任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀鱼怪任务", 1)
end
item = Items["领取野外击杀蜘蛛任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀蜘蛛任务", 2)
end
item = Items["领取野外击杀强盗任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀强盗任务", 3)
end
item = Items["领取野外击杀疯狼任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀疯狼任务", 4)
end
item = Items["领取野外击杀狂熊任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀狂熊任务", 5)
end
item = Items["领取野外击杀妖魂任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀妖魂任务", 6)
end
