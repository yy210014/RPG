require "scripts.Combat.Item"
require "scripts.Combat.Items.ItemWeapon"
require "scripts.Combat.Items.ItemArmor"
require "scripts.Combat.Items.ItemHelmet"

function InitItem()
    Items["进入练功房"].JumpPoints = { JumpPoint.LianGong1, JumpPoint.LianGong2, JumpPoint.LianGong3, JumpPoint.LianGong4 }
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
    Items["金币房"].LianGongUnitId = GetId("u000")
    Items["高级金币房"].LianGongUnitId = GetId("u001")
    Items["超级金币房"].LianGongUnitId = GetId("u002")
    Items["终极金币房"].LianGongUnitId = GetId("u003")
    Items["修为怪"].LianGongUnitId = GetId("o000")
    Items["高级修为怪"].LianGongUnitId = GetId("u005")
    Items["宝石怪"].LianGongUnitId = GetId("u006")
    Items["上古神石怪"].LianGongUnitId = GetId("u007")
end

local item = Items["领取野外击杀鱼怪任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀任务", 1)
end
item = Items["领取野外击杀蜘蛛任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀任务", 2)
end
item = Items["领取野外击杀强盗任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀任务", 3)
end
item = Items["领取野外击杀疯狼任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀任务", 4)
end
item = Items["领取野外击杀狂熊任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀任务", 5)
end
item = Items["领取野外击杀妖魂任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀任务", 6)
end
item = Items["领取寻找随机指定物品"]
function item:OnAdd()
    GameEventProc.SendEvent("领取寻找随机指定物品")
end
item = Items["领取野外击杀变异的人鱼女王任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀任务", 7)
end
item = Items["领取野外击杀变异的烈火蜘蛛任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀任务", 8)
end
item = Items["领取野外击杀变异的强盗首领任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀任务", 9)
end
item = Items["领取野外击杀变异的疯狼王任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀任务", 10)
end
item = Items["领取野外击杀变异的熊族将军任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀任务", 11)
end
item = Items["领取野外击杀变异的妖魂女王任务"]
function item:OnAdd()
    GameEventProc.SendEvent("领取野外击杀任务", 12)
end
item = Items["技能卷轴：无中生有"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH01")
end
item = Items["进阶卷轴：无中生有"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH01"))
end
item = Items["技能卷轴：无懈可击"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH02")
end
item = Items["进阶卷轴：无懈可击"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH02"))
end
item = Items["技能卷轴：静止陷阱"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH03")
end
item = Items["进阶卷轴：静止陷阱"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH03"))
end
item = Items["技能卷轴：献祭"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH04")
end
item = Items["进阶卷轴：献祭"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH04"))
end
item = Items["技能卷轴：狂牛冲锋"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH05")
end
item = Items["进阶卷轴：狂牛冲锋"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH05"))
end
item = Items["技能卷轴：蛮牛踏击"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH06")
end
item = Items["进阶卷轴：蛮牛踏击"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH06"))
end
item = Items["技能卷轴：无影盗手"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH07")
end
item = Items["进阶卷轴：无影盗手"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH07"))
end
item = Items["技能卷轴：鬼推磨"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH08")
end
item = Items["进阶卷轴：鬼推磨"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH08"))
end
item = Items["技能卷轴：有勇有谋"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH09")
end
item = Items["进阶卷轴：有勇有谋"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH09"))
end
item = Items["技能卷轴：勇武之气"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH10")
end
item = Items["进阶卷轴：勇武之气"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH10"))
end
item = Items["技能卷轴：裂魂咒"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH11")
end
item = Items["进阶卷轴：裂魂咒"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH11"))
end
item = Items["技能卷轴：破心咒"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH12")
end
item = Items["进阶卷轴：破心咒"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH12"))
end
item = Items["技能卷轴：生命汲取"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH13")
end
item = Items["进阶卷轴：生命汲取"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH13"))
end
item = Items["技能卷轴：生命奉献"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH14")
end
item = Items["进阶卷轴：生命奉献"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH14"))
end
item = Items["技能卷轴：混沌拳"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH15")
end
item = Items["技能卷轴：真·混沌拳"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH16")
end
item = Items["技能卷轴：先古秘法·力量"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH17")
end
item = Items["进阶卷轴：先古秘法·力量"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH17"))
end
item = Items["技能卷轴：先古秘法·敏捷"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH18")
end
item = Items["进阶卷轴：先古秘法·敏捷"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH18"))
end
item = Items["技能卷轴：先古秘法·智力"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH19")
end
item = Items["进阶卷轴：先古秘法·智力"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH19"))
end
item = Items["技能卷轴：先古秘法·奥义"]
function item:OnUse()
    AddSkill(self, self.Owner, "AH20")
end
item = Items["进阶卷轴：先古秘法·奥义"]
function item:OnUse()
    SkillLevelUp(self, self.Owner, GetId("AH20"))
end

function AddSkill(self, unit, skillId)
    local skill = unit.Skills[skillId]
    if (skill ~= nil) then
        DisplayTextToAll("学习技能失败，您已拥有该技能!", Color.red)
        SetItemCharges(self.Entity, 1)
        return
    end
    unit:AddSkill(skillId)
    RemoveItem(self.Entity)
    DisplayTextToAll("学习技能成功!", Color.yellow)
end

function SkillLevelUp(self, unit, skillId)
    local skill = unit.Skills[skillId]
    if (skill == nil) then
        DisplayTextToAll("进阶失败，请确认是否拥有该技能!", Color.red)
        SetItemCharges(self.Entity, 1)
        return
    end
    local skillLevel = GetUnitAbilityLevel(unit.Entity, skillId)
    if (skillLevel >= 10) then
        DisplayTextToAll("进阶失败，该技能已经升至满级!", Color.red)
        SetItemCharges(self.Entity, 1)
        return
    end
    Game.Log("skillLevel: " .. skillLevel)
    SetUnitAbilityLevel(unit.Entity, skillId, skillLevel + 1)
    RemoveItem(self.Entity)
    DisplayTextToAll("进阶技能成功!", Color.yellow)
end