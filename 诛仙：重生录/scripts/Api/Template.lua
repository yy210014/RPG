--参数
local mSpeed = 15
local mDistance = 1000
local mMaxDistance = 1000
local mRange = 300
local mDamages = {100, 200, 300, 500, 800, 1000}
local mDamages1 = {50, 100, 200, 400, 600, 800}
local mDamages2 = {0.6, 0.6, 0.6, 0.6, 0.6, 0.6}
local mDummyArt = "Abilities\\Spells\\NightElf\\Immolation\\ImmolationTarget.mdl"
local mTargetArt = "Abilities\\Spells\\NightElf\\Immolation\\ImmolationTarget.mdl"
local mSpecialArt = "Abilities\\Spells\\NightElf\\Immolation\\ImmolationDamage.mdl"
skill.Interval = 0.1
skill.IntervalDt = 0
skill.DamageList = nil

--创建万能马甲
self.dummy = spellUnit:CreateDummy("", spellUnit:X(), spellUnit:Y())

--创建马甲
self.dummy =
    spellUnit:CreateDummy(
    "Abilities\\Weapons\\BloodElfSpellThiefMISSILE\\BloodElfSpellThiefMISSILE.mdl",
    spellUnit:X(),
    spellUnit:Y()
)
--创建运动马甲
local dummy = AssetsManager.LoadUnit(spellUnit.Player, "uq00", spellUnit:X(), spellUnit:Y())
dummy.Effect =AddSpecialEffectTarget(mDummyArt, dummy.Entity, "origin")
local angle = AngleBetweenPoint(spellUnit:X(), GetSpellTargetX(), spellUnit:Y(), GetSpellTargetY())
dummy:SetUnitFacing(angle)
dummy.Owner = spellUnit
dummy.Skill = self

--创建运动
local loc = dummy:AddLocomotion("冲锋")
if (loc ~= nil) then
    loc:Start2(angle, mSpeed, mMaxDistance, self.OnPathEnd, self.OnPathUpdate)
end

--buff
local buff = Buffs["耀光"]
buff.values = {2, 2, 2, 2, 2, 2}
buff.Durs = {2, 2, 2, 2, 2, 2}
unit:AddBuff("耀光")
unit:RemoveBuff("耀光")

--特效
DestroyEffect(
    AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", unit.Entity, "chest")
)

DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", dummy:X(), dummy:Y()))

AssetsManager.OverlapCircle(
    u:X(),
    u:Y(),
    mRange,
    function(unit)
    end
)

--属性
unit.Attribute:add("物理攻击加成", 15)
local ad = spellUnit.Attribute:get("物理攻击") + spellUnit.Attribute:get("物理攻击加成")
local ap = spellUnit.Attribute:get("魔法攻击")
local damage = mDamages1[self:GetCurLevel()] + ap * mDamages2[self:GetCurLevel()]
--伤害
EXUnitDamageTarget(self.Owner.Entity, unit.Entity, damage, EXDamageType.Physics)

--医疗剂模板
[ID11] 
_parent = "phea"
-- 说明
Description = "强化S+装备，提升属性"
-- 名字
Name = "强化石"
-- 技能
abilList = "AI05"
-- 提示工具 - 扩展
Ubertip = "|CFFFED312点击左键对道具栏装备使用即可强化|R"

--生命药水模板
[ID10]
_parent = "phea"
-- 说明
Description = "增加修为2000点"
-- 名字
Name = "修为卷轴大"
-- 技能
abilList = "AI01"

--攻击之爪模板
[IE0d]
_parent = "rat6"
-- 说明
Description = ""
-- 名字
Name = "枯骨盔Lv1"
-- 提示工具 - 基础
Tip = ""
-- 提示工具 - 扩展
Ubertip = "能增加英雄全属性的装备"
-- 技能
abilList = ""
