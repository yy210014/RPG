Item = {}
local mt = {}
Item.__index = mt
mt.Owner = nil
mt.Entity = nil --实体
mt.Name = ""
mt.Id = 0

--合成列表
local itemComList = {
    {GetId("I013"), GetId("I004"), GetId("I004"), GetId("I012")}, --反曲之弓:短剑+短剑+反曲之弓（卷轴）
    {GetId("I015"), GetId("I004"), GetId("I006"), GetId("I014")}, --狂热黄叉:短剑+格斗手套+狂热黄叉（卷轴）
    {GetId("I017"), GetId("I005"), GetId("I016")}, --轻语:长剑+轻语（卷轴）
    {GetId("I019"), GetId("I005"), GetId("I005"), GetId("I018")}, --锯齿短匕:长剑+长剑+锯齿短匕（卷轴）
    {GetId("I021"), GetId("I005"), GetId("I005"), GetId("I020")}, --考尔菲德的战锤:长剑+长剑+考尔菲德的战锤（卷轴）
    {GetId("I023"), GetId("I005"), GetId("I022")}, --小木槌:长剑+小木槌（卷轴）
    {GetId("I025"), GetId("I005"), GetId("I005"), GetId("I024")}, --提亚马特:长剑+长剑+提亚马特（卷轴）
    {GetId("I027"), GetId("I015"), GetId("I004"), GetId("I026")}, --电刀:狂热黄叉+短剑+电刀（卷轴）
    {GetId("I031"), GetId("I007"), GetId("I008"), GetId("I030")}, --女神之泪:蓝水晶+仙女护符+女神之泪（卷轴）
    {GetId("I033"), GetId("I007"), GetId("I032")}, --耀光:蓝水晶+耀光（卷轴）
    {GetId("I035"), GetId("I009"), GetId("I008"), GetId("I008"), GetId("I034")}, --和谐圣杯:增幅典籍+仙女护符+仙女护符+和谐圣杯（卷轴）
    {GetId("I037"), GetId("I009"), GetId("I036")}, --恶魔法典:增幅典籍+恶魔法典（卷轴）
    {GetId("I039"), GetId("I008"), GetId("I008"), GetId("I038")}, --禁忌雕像:仙女护符+仙女护符+禁忌雕像（卷轴）
    {GetId("I041"), GetId("I009"), GetId("I007"), GetId("I040")}, --遗失的章节:增幅典籍+蓝水晶+遗失的章节（卷轴）
    {GetId("I043"), GetId("I011"), GetId("I011"), GetId("I042")}, --无尽之刃:暴风大剑+暴风大剑+无尽之刃（卷轴）
    {GetId("I045"), GetId("I023"), GetId("I033"), GetId("I015"), GetId("I044")}, --三相之力:小木槌+耀光+狂热黄叉+三相之力（卷轴）
    {GetId("I047"), GetId("I031"), GetId("I010"), GetId("I046")}, --魔宗:女神之泪+十字镐+魔宗（卷轴）
    {GetId("I050"), GetId("I023"), GetId("I021"), GetId("I049")}, --黑切:小木槌+考尔菲德的战锤+黑切（卷轴）
    {GetId("I052"), GetId("I025"), GetId("I010"), GetId("I051")}, --九头蛇:提亚马特+十字镐+九头蛇（卷轴）
    {GetId("I054"), GetId("I021"), GetId("I019"), GetId("I053")}, --幕刃:考尔菲德的战锤+锯齿短匕+幕刃（卷轴）
    {GetId("I056"), GetId("I015"), GetId("I004"), GetId("I004"), GetId("I055")}, --幻影之舞:狂热黄叉+短剑+短剑+幻影之舞（卷轴）
    {GetId("I058"), GetId("I015"), GetId("I013"), GetId("I057")}, --飓风:狂热黄叉+反曲之弓+飓风（卷轴）
    {GetId("I060"), GetId("I023"), GetId("I010"), GetId("I059")}, --大冰锤:小木槌+十字镐+大冰锤（卷轴）
    {GetId("I064"), GetId("I033"), GetId("I028"), GetId("I063")}, --巫妖之祸:耀光+爆裂魔杖+巫妖之祸（卷轴）
    {GetId("I066"), GetId("I031"), GetId("I029"), GetId("I065")}, --大天使:女神之泪+无用大棒+大天使（卷轴）
    {GetId("I069"), GetId("I009"), GetId("I028"), GetId("I068")}, --法穿棒:增幅典籍+爆裂魔杖+法穿棒（卷轴）
    {GetId("I071"), GetId("I035"), GetId("I037"), GetId("I039"), GetId("I070")}, --大圣杯:和谐圣杯+恶魔法典+禁忌雕像+大圣杯（卷轴）
    {GetId("I073"), GetId("I029"), GetId("I028"), GetId("I009"), GetId("I072")}, --帽子:无用大棒+爆裂魔杖+增幅典籍+帽子（卷轴）
    {GetId("I075"), GetId("I037"), GetId("I041"), GetId("I039"), GetId("I074")}, --莫雷洛秘典:恶魔法典+遗失的章节+禁忌雕像+莫雷洛秘典（卷轴）
    {GetId("I062"), GetId("I001"), GetId("I061")}, --杀人剑:多兰剑+杀人剑（卷轴）
    {GetId("I077"), GetId("I002"), GetId("I076")} --杀人书:多兰戒+杀人书（卷轴）
}

--合成
function Item.ItemCompound(unit, item)
    local getItemID = GetItemTypeId(item)

    local deleIndexArr = {}
    local itemU
    for i, list in pairs(itemComList) do
        if (-1 ~= IsInTable(getItemID, list) and 1 ~= IsInTable(getItemID, list)) then
            deleIndexArr = HasItemAtIndex(unit, list)
            if (0 < #deleIndexArr) then
                for u, y in pairs(deleIndexArr) do
                    itemU = UnitItemInSlot(unit, y)
                    if (GetItemCharges(itemU) > 1) then
                        SetItemCharges(itemU, GetItemCharges(itemU) - 1)
                    else
                        RemoveItem(itemU)
                    end
                end
                local itemAXAD = CreateItem(list[1], GetUnitX(unit), GetUnitY(unit))
                UnitAddItem(unit, itemAXAD)
                DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", unit, "origin"))
                Game.Log("合成物品： " .. GetItemName(itemAXAD))
                return
            end
        end
    end
end

function Item:New(owner, entity)
    local newItem = {}
    local name = FilterStringColor(GetItemName(entity))
    setmetatable(newItem, {__index = Items[name]})
    newItem.Owner = owner
    newItem.Entity = entity
    newItem.Id = GetItemTypeId(entity)
    return newItem
end

function Item:OnAdd()
end

function Item:OnRemove()
end

function Item:OnCast()
end

function Item:OnUse()
end

function Item:OnAttack(attactUnit, defUnit)
end

function Item:OnKill(dieUnit)
end

function Item:OnUpgrade()
end

function Item:OnRefresh()
end

function Item:SetIcon(art)
    EXSetItemDataString(self.Id, ITEM_DATA_ART, art)
end

Items =
    setmetatable(
    {},
    {
        __index = function(self, name)
            self[name] = {}
            setmetatable(self[name], {__index = Item})
            self[name].Name = name
            return self[name]
        end
    }
)