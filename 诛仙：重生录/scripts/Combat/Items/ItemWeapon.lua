local mAttacks = {
    500,
    1500,
    3000,
    6000,
    10000,
    30000,
    80000,
    200000,
    500000,
    1000000,
    1600000,
    2800000,
    4300000,
    7000000,
    7500000,
    8000000,
    8500000,
    9000000,
    9250000
}
local item = Items["新手武器Lv1"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[1])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[1])
end

item = Items["新手武器Lv2"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[2])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[2])
end

item = Items["新手武器Lv3"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[3])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[3])
end

item = Items["新手武器Lv4"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[4])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[4])
end

item = Items["新手武器LvMax"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[5])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[5])
end

item = Items["狂狼剑"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[6])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[6])
end

item = Items["大师剑"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[7])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[7])
end

item = Items["天火剑"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[8])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[8])
end

item = Items["幽冥剑"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[9])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[9])
end

item = Items["天劫剑"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[10])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[10])
end

item = Items["九玄冰霜剑"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[11])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[11])
end

item = Items["泯灭玄铁剑"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[12])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[12])
end

item = Items["混沌神火剑"]
function item:OnAdd()
    self.Owner.Attribute:add("物理攻击加成", mAttacks[13])
end

function item:OnRemove()
    self.Owner.Attribute:add("物理攻击加成", -mAttacks[13])
end

