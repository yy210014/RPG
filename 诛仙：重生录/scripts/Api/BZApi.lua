--hardware

--获取鼠标在游戏内的坐标X
DzGetMouseTerrainX = _native_ "DzGetMouseTerrainX"

--获取鼠标在游戏内的坐标Y
DzGetMouseTerrainY = _native_ "DzGetMouseTerrainY"


--获取鼠标在游戏内的坐标Z
DzGetMouseTerrainZ = _native_ "DzGetMouseTerrainZ"

--鼠标是否在游戏内
DzIsMouseOverUI = _native_ "DzIsMouseOverUI"

--获取鼠标屏幕坐标X
DzGetMouseX = _native_ "DzGetMouseX"

--获取鼠标屏幕坐标Y
DzGetMouseY = _native_ "DzGetMouseY"

--获取鼠标游戏窗口坐标X
DzGetMouseXRelative = _native_ "DzGetMouseXRelative"

--获取鼠标游戏窗口坐标Y
DzGetMouseYRelative = _native_ "DzGetMouseYRelative"

--设置鼠标位置
DzSetMousePos = _native_ "DzSetMousePos"

--注册鼠标点击触发（sync为true时，调用TriggerExecute。为false时，直接运行action函数，可以异步不掉线，action里不要有同步操作）
DzTriggerRegisterMouseEvent = _native_ "DzTriggerRegisterMouseEvent"
DzTriggerRegisterMouseEventByCode = _native_ "DzTriggerRegisterMouseEventByCode"

--注册键盘点击触发
DzTriggerRegisterKeyEvent = _native_ "DzTriggerRegisterMouseEvent"
DzTriggerRegisterKeyEventByCode = _native_ "DzTriggerRegisterMouseEvent"

--注册鼠标滚轮触发
DzTriggerRegisterMouseWheelEvent = _native_ "DzTriggerRegisterMouseWheelEvent"
DzTriggerRegisterMouseWheelEventByCode = _native_ "DzTriggerRegisterMouseWheelEventByCode"

--注册鼠标移动触发
DzTriggerRegisterMouseMoveEvent = _native_ "DzTriggerRegisterMouseMoveEvent"
DzTriggerRegisterMouseMoveEventByCode = _native_ "DzTriggerRegisterMouseMoveEventByCode"

--获取触发器的按键码
DzGetTriggerKey = _native_ "DzGetTriggerKey"

--获取滚轮delta
DzGetWheelDelta = _native_ "DzGetWheelDelta"

--判断按键是否按下
DzIsKeyDown = _native_ "DzIsKeyDown"

--获取触发key的玩家
DzGetTriggerKeyPlayer = _native_ "DzGetTriggerKeyPlayer"

--获取war3窗口宽度
DzGetWindowWidth = _native_ "DzGetWindowWidth"

--获取war3窗口高度
DzGetWindowHeight = _native_ "DzGetWindowHeight"

--获取war3窗口X坐标
DzGetWindowX = _native_ "DzGetWindowX"

--获取war3窗口Y坐标
DzGetWindowY = _native_ "DzGetWindowY"

--注册war3窗口大小变化事件
DzTriggerRegisterWindowResizeEvent = _native_ "DzTriggerRegisterWindowResizeEvent"
DzTriggerRegisterWindowResizeEventByCode = _native_ "DzTriggerRegisterWindowResizeEventByCode"

--判断窗口是否激活
DzIsWindowActive = _native_ "DzIsWindowActive"

--plus

--设置可摧毁物位置
DzDestructablePosition = _native_ "DzDestructablePosition"

--设置单位位置-本地调用
DzSetUnitPosition = _native_ "DzSetUnitPosition"

--异步执行函数
DzExecuteFunc = _native_ "DzExecuteFunc"

--取鼠标指向的unit
DzGetUnitUnderMouse = _native_ "DzGetUnitUnderMouse"

--设置unit的贴图
DzSetUnitTexture = _native_ "DzSetUnitTexture"

--设置内存数值
DzSetMemory = _native_ "DzSetMemory"

--设置单位ID
DzSetUnitID = _native_ "DzSetUnitID"

--设置单位模型
DzSetUnitModel = _native_ "DzSetUnitModel"

--设置小地图背景图片
DzSetWar3MapMap = _native_ "DzSetWar3MapMap"

--[[
--sync

--注册数据同步trigger
native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing

--同步游戏数据
native DzSyncData takes string prefix, string data returns nothing

--获取同步的数据
native DzGetTriggerSyncData takes nothing returns string

--获取同步数据的玩家
native DzGetTriggerSyncPlayer takes nothing returns player

--gui

------------------------------/ 原生UI修改
--隐藏界面元素
native DzFrameHideInterface takes nothing returns nothing

--修改游戏世界窗口位置
native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing

--头像
native DzFrameGetPortrait takes nothing returns integer

--小地图
native DzFrameGetMinimap takes nothing returns integer

--技能按钮
native DzFrameGetCommandBarButton takes integer row, integer column returns integer

--英雄按钮
native DzFrameGetHeroBarButton takes integer buttonId returns integer

--英雄血条
native DzFrameGetHeroHPBar takes integer buttonId returns integer

--英雄蓝条
native DzFrameGetHeroManaBar takes integer buttonId returns integer

--道具按钮
native DzFrameGetItemBarButton takes integer buttonId returns integer

--小地图按钮
native DzFrameGetMinimapButton takes integer buttonId returns integer

--左上菜单按钮
native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer

--鼠标提示
native DzFrameGetTooltip takes nothing returns integer 

--聊天信息
native DzFrameGetChatMessage takes nothing returns integer 

--unit message
native DzFrameGetUnitMessage takes nothing returns integer 

--top message
native DzFrameGetTopMessage takes nothing returns integer 

------------------------------/
--取rgba色值
native DzGetColor takes integer r, integer g, integer b, integer a returns integer

--设置界面更新回调（非同步）
native DzFrameSetUpdateCallback takes string func returns nothing
native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing

--显示/隐藏Frame
native DzFrameShow takes integer frame, boolean enable returns nothing

--创建frame
native DzCreateFrame takes string frame, integer parent, integer id returns integer

--创建SimpleFrame
native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer

--销毁frame
native DzDestroyFrame takes integer frame returns nothing

--加载toc
native DzLoadToc takes string fileName returns nothing

--设置frame相对位置
native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing

--设置frame绝对位置
native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing

--清空frame锚点
native DzFrameClearAllPoints takes integer frame returns nothing

--设置frame禁用/启用
native DzFrameSetEnable takes integer name, boolean enable returns nothing

--注册UI事件回调
native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing

--获取触发ui的玩家
native DzGetTriggerUIEventPlayer takes nothing returns player

--获取触发的Frame
native DzGetTriggerUIEventFrame takes nothing returns integer

--查找frame
native DzFrameFindByName takes string name, integer id returns integer

--查找SimpleFrame
native DzSimpleFrameFindByName takes string name, integer id returns integer

--查找String
native DzSimpleFontStringFindByName takes string name, integer id returns integer

--查找Texture
native DzSimpleTextureFindByName takes string name, integer id returns integer

--获取game ui
native DzGetGameUI takes nothing returns integer

--点击frame
native DzClickFrame takes integer frame returns nothing

--自定义屏幕比例
native DzSetCustomFovFix takes real value returns nothing

--使用宽屏模式
native DzEnableWideScreen takes boolean enable returns nothing

--设置文字（支持EditBox, TextFrame, TextArea, SimpleFontString、GlueEditBoxWar3、SlashChatBox、TimerTextFrame、TextButtonFrame、GlueTextButton）
native DzFrameSetText takes integer frame, string text returns nothing

--获取文字（支持EditBox, TextFrame, TextArea, SimpleFontString）
native DzFrameGetText takes integer frame returns string

--设置字数限制（支持EditBox）
native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing

--获取字数限制（支持EditBox）
native DzFrameGetTextSizeLimit takes integer frame returns integer

--设置文字颜色（支持TextFrame, EditBox）
native DzFrameSetTextColor takes integer frame, integer color returns nothing

--获取鼠标所在位置的ui控件指针
native DzGetMouseFocus takes nothing returns integer

--设置所有锚点到目标frame上
native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean

--设置焦点
native DzFrameSetFocus takes integer frame, boolean enable returns boolean

--设置模型（支持Sprite、Model、StatusBar）
native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing

--获取控件是否启用
native DzFrameGetEnable takes integer frame returns boolean

--设置透明度（0-255）
native DzFrameSetAlpha takes integer frame, integer alpha returns nothing

--获取透明度
native DzFrameGetAlpha takes integer frame returns integer

--设置动画
native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing

--设置动画进度（autocast为false是可用）
native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing

--设置texture（支持Backdrop、SimpleStatusBar）
native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing

--设置缩放
native DzFrameSetScale takes integer frame, real scale returns nothing

--设置tooltip
native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing

--鼠标限制在ui内
native DzFrameCageMouse takes integer frame, boolean enable returns nothing

--获取当前值（支持Slider、SimpleStatusBar、StatusBar）
native DzFrameGetValue takes integer frame returns real

--设置最大最小值（支持Slider、SimpleStatusBar、StatusBar）
native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing

--设置Step值（支持Slider）
native DzFrameSetStepValue takes integer frame, real step returns nothing

--设置当前值（支持Slider、SimpleStatusBar、StatusBar）
native DzFrameSetValue takes integer frame, real value returns nothing

--设置frame大小
native DzFrameSetSize takes integer frame, real w, real h returns nothing

--根据tag创建frame
native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer

--设置颜色（支持SimpleStatusBar）
native DzFrameSetVertexColor takes integer frame, integer color returns nothing


/*
DzFrameSetPoint achor定义，从0开始
enum class AnchorPoint
{
    TOPLEFT = 0,
    TOP = 1,
    TOPRIGHT = 2,
    LEFT = 3,
    CENTER = 4,
    RIGHT = 5,
    BOTTOMLEFT = 6,
    BOTTOM = 7,
    BOTTOMRIGHT = 8,
};

DzFrameSetScript  注册ui事件的事件ID
enum class CFrameEvents
{
    NONE = 0,
    FRAME_EVENT_PRESSED = 1,
    FRAME_MOUSE_ENTER = 2,
    FRAME_MOUSE_LEAVE = 3,
    FRAME_MOUSE_UP = 4,
    FRAME_MOUSE_DOWN = 5,
    FRAME_MOUSE_WHEEL = 6,
    FRAME_FOCUS_ENTER = FRAME_MOUSE_ENTER,
    FRAME_FOCUS_LEAVE = FRAME_MOUSE_LEAVE,
    FRAME_CHECKBOX_CHECKED = 7,
    FRAME_CHECKBOX_UNCHECKED = 8,
    FRAME_EDITBOX_TEXT_CHANGED = 9,
    FRAME_POPUPMENU_ITEM_CHANGE_START = 10,
    FRAME_POPUPMENU_ITEM_CHANGED = 11,
    FRAME_MOUSE_DOUBLECLICK = 12,
    FRAME_SPRITE_ANIM_UPDATE = 13,
};
 */
 ]]