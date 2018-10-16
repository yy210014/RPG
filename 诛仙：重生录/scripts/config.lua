require 'scripts.utility'
require 'scripts.native'
require 'scripts.common'
require 'scripts.blizzard'

function config()
    -- body
    SetMapName("撸啊循环圈")
	SetMapDescription("")
	SetPlayers(5)
	SetTeams(5)
	SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
	DefineStartLocation(0, -2304.0000, 832.0000)
	DefineStartLocation(1, 896.0000, 2304.0000)
	DefineStartLocation(2, 2304.0000, -832.0000)
	DefineStartLocation(3, -768.0000, -2304.0000)
end

config()
