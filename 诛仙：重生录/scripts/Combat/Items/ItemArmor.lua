local mDefenses = {
    10,
    20,
    40,
    60,
    80,
    120,
    160,
    300,
    500,
    800,
    1400,
    2300,
    3300,
    5500,
    5750,
    6000,
    6250,
    6500,
    6750,
    7000,
    7250
}
local item = Items["新手防具Lv1"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[1])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[1])
end

item = Items["新手防具Lv2"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[2])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[2])
end

item = Items["新手防具Lv3"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[3])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[3])
end

item = Items["新手防具Lv4"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[4])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[4])
end

item = Items["新手防具LvMax"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[5])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[5])
end

item = Items["狂狼衣"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[6])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[6])
end

item = Items["大师衣"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[7])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[7])
end

item = Items["天火甲"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[8])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[8])
end

item = Items["幽冥甲"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[9])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[9])
end

item = Items["天劫甲"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[10])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[10])
end

item = Items["九玄冰霜甲"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[11])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[11])
end

item = Items["泯灭玄铁甲"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[12])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[12])
end

item = Items["混沌神火甲"]
function item:OnAdd()
    self.Owner.Attribute:add("护甲", mDefenses[13])
end

function item:OnRemove()
    self.Owner.Attribute:add("护甲", -mDefenses[13])
end
