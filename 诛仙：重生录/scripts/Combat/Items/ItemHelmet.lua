local mAttributes = {
    200,
    600,
    1200,
    2400,
    4000,
    12000,
    32000,
    80000,
    200000,
    400000,
    640000,
    1120000,
    1900000,
    2800000,
    2900000,
    3000000,
    3100000,
    3200000,
    3300000,
    3400000,
    3500000,
    3600000,
    3700000
}
local item = Items["新手头盔Lv1"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[1])
    self.Owner.Attribute:add("敏捷", mAttributes[1])
    self.Owner.Attribute:add("智力", mAttributes[1])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[1])
    self.Owner.Attribute:add("敏捷", -mAttributes[1])
    self.Owner.Attribute:add("智力", -mAttributes[1])
end

item = Items["新手头盔Lv2"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[2])
    self.Owner.Attribute:add("敏捷", mAttributes[2])
    self.Owner.Attribute:add("智力", mAttributes[2])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[2])
    self.Owner.Attribute:add("敏捷", -mAttributes[2])
    self.Owner.Attribute:add("智力", -mAttributes[2])
end

item = Items["新手头盔Lv3"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[3])
    self.Owner.Attribute:add("敏捷", mAttributes[3])
    self.Owner.Attribute:add("智力", mAttributes[3])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[3])
    self.Owner.Attribute:add("敏捷", -mAttributes[3])
    self.Owner.Attribute:add("智力", -mAttributes[3])
end

item = Items["新手头盔Lv4"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[4])
    self.Owner.Attribute:add("敏捷", mAttributes[4])
    self.Owner.Attribute:add("智力", mAttributes[4])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[4])
    self.Owner.Attribute:add("敏捷", -mAttributes[4])
    self.Owner.Attribute:add("智力", -mAttributes[4])
end

item = Items["新手头盔Max"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[5])
    self.Owner.Attribute:add("敏捷", mAttributes[5])
    self.Owner.Attribute:add("智力", mAttributes[5])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[5])
    self.Owner.Attribute:add("敏捷", -mAttributes[5])
    self.Owner.Attribute:add("智力", -mAttributes[5])
end

item = Items["狂狼盔"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[6])
    self.Owner.Attribute:add("敏捷", mAttributes[6])
    self.Owner.Attribute:add("智力", mAttributes[6])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[6])
    self.Owner.Attribute:add("敏捷", -mAttributes[6])
    self.Owner.Attribute:add("智力", -mAttributes[6])
end

item = Items["大师盔"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[7])
    self.Owner.Attribute:add("敏捷", mAttributes[7])
    self.Owner.Attribute:add("智力", mAttributes[7])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[7])
    self.Owner.Attribute:add("敏捷", -mAttributes[7])
    self.Owner.Attribute:add("智力", -mAttributes[7])
end

item = Items["天火盔"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[8])
    self.Owner.Attribute:add("敏捷", mAttributes[8])
    self.Owner.Attribute:add("智力", mAttributes[8])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[8])
    self.Owner.Attribute:add("敏捷", -mAttributes[8])
    self.Owner.Attribute:add("智力", -mAttributes[8])
end

item = Items["幽冥盔"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[9])
    self.Owner.Attribute:add("敏捷", mAttributes[9])
    self.Owner.Attribute:add("智力", mAttributes[9])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[9])
    self.Owner.Attribute:add("敏捷", -mAttributes[9])
    self.Owner.Attribute:add("智力", -mAttributes[9])
end

item = Items["天劫盔"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[10])
    self.Owner.Attribute:add("敏捷", mAttributes[10])
    self.Owner.Attribute:add("智力", mAttributes[10])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[10])
    self.Owner.Attribute:add("敏捷", -mAttributes[10])
    self.Owner.Attribute:add("智力", -mAttributes[10])
end

item = Items["九玄冰霜盔"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[11])
    self.Owner.Attribute:add("敏捷", mAttributes[11])
    self.Owner.Attribute:add("智力", mAttributes[11])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[11])
    self.Owner.Attribute:add("敏捷", -mAttributes[11])
    self.Owner.Attribute:add("智力", -mAttributes[11])
end

item = Items["泯灭玄铁盔"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[12])
    self.Owner.Attribute:add("敏捷", mAttributes[12])
    self.Owner.Attribute:add("智力", mAttributes[12])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[12])
    self.Owner.Attribute:add("敏捷", -mAttributes[12])
    self.Owner.Attribute:add("智力", -mAttributes[12])
end

item = Items["圣兽神火盔"]
function item:OnAdd()
    self.Owner.Attribute:add("力量", mAttributes[13])
    self.Owner.Attribute:add("敏捷", mAttributes[13])
    self.Owner.Attribute:add("智力", mAttributes[13])
end

function item:OnRemove()
    self.Owner.Attribute:add("力量", -mAttributes[13])
    self.Owner.Attribute:add("敏捷", -mAttributes[13])
    self.Owner.Attribute:add("智力", -mAttributes[13])
end
