require "scripts.utility"
require "scripts.Api.common"
require "scripts.Api.blizzard"
require "scripts.Api.japi"
require "scripts.Api.BZApi"
Jglobals = require "jass.globals"
Slk = require "jass.slk"
require "scripts.GameEventProc"
require "scripts.Common.Misc"
require "scripts.Game"
require "scripts.GameStart"

FirendIndex = 11
EnemyIndex = 10

function main()
    local PlayerCount = 4
    local trig = CreateTrigger()
    TriggerRegisterTimerEvent(trig, 0.00, false)
    TriggerAddAction(
        trig,
        function()
            GameStart.OnGameStart()
        end
    )

    trig = CreateTrigger()
    TriggerRegisterTimerEvent(trig, GameScene.DeltaTime, true)
    TriggerAddAction(
        trig,
        function()
            GameStart.OnGameUpdate(GameScene.DeltaTime)
        end
    )

    for i = 0, PlayerCount do
        trig = CreateTrigger()
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_SELECTED, null)
        TriggerAddAction(
            trig,
            function()
                GameStart.AnyUnitSelected(trig)
            end
        )
    end

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_ATTACKED, null)
    end
    TriggerRegisterPlayerUnitEvent(trig, Player(EnemyIndex), EVENT_PLAYER_UNIT_ATTACKED, null)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitAttack()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_CONSTRUCT_FINISH, null)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitConstructFinish()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_SUMMON, null)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitSummon()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_DEATH, null)
    end
    TriggerRegisterPlayerUnitEvent(trig, Player(EnemyIndex), EVENT_PLAYER_UNIT_DEATH, null)
    TriggerRegisterPlayerUnitEvent(trig, Player(PLAYER_NEUTRAL_AGGRESSIVE), EVENT_PLAYER_UNIT_DEATH, null)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitDeath()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_HERO_LEVEL, null)
    end
    TriggerRegisterPlayerUnitEvent(trig, Player(EnemyIndex), EVENT_PLAYER_HERO_LEVEL, null)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyHeroLevelUp()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_HERO_SKILL, null)
    end
    TriggerRegisterPlayerUnitEvent(trig, Player(EnemyIndex), EVENT_PLAYER_HERO_SKILL, null)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitLearnedSkill()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_SPELL_CHANNEL, null)
    end
    TriggerRegisterPlayerUnitEvent(trig, Player(EnemyIndex), EVENT_PLAYER_UNIT_SPELL_CHANNEL, null)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitSpellChannel()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_SPELL_EFFECT, null)
    end
    TriggerRegisterPlayerUnitEvent(trig, Player(EnemyIndex), EVENT_PLAYER_UNIT_SPELL_EFFECT, null)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitSpellEffect()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_SPELL_FINISH, null)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitSpellFinish()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_USE_ITEM, null)
    end
    TriggerRegisterPlayerUnitEvent(trig, Player(EnemyIndex), EVENT_PLAYER_UNIT_USE_ITEM, null)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitUseItem()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_PICKUP_ITEM, null)
    end
    TriggerRegisterPlayerUnitEvent(trig, Player(EnemyIndex), EVENT_PLAYER_UNIT_PICKUP_ITEM, null)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitPickUpItem()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_SELL_ITEM, null)
    end
    TriggerRegisterPlayerUnitEvent(trig, Player(EnemyIndex), EVENT_PLAYER_UNIT_SELL_ITEM, null)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitSellItem()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_SELL_ITEM, null)
    end
    TriggerRegisterPlayerUnitEvent(trig, Player(EnemyIndex), EVENT_PLAYER_UNIT_SELL_ITEM, null)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitSellItem()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_DROP_ITEM, null)
    end
    TriggerRegisterPlayerUnitEvent(trig, Player(EnemyIndex), EVENT_PLAYER_UNIT_DROP_ITEM, null)
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyUnitDropItem()
        end
    )

    trig = CreateTrigger()
    for i = 0, PlayerCount do
        TriggerRegisterPlayerChatEvent(trig, Player(i), "", true)
    end
    TriggerAddAction(
        trig,
        function()
            GameStart.AnyPlayerChat()
        end
    )
    trig = nil
end

main()
