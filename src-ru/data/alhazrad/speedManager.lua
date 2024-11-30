--by slow

mods.speed_UI={}

local isWork = false;

script.on_game_event("SPEED_CONTROL_SLOW",false,
function()
  Hyperspace.FPS.speedLevel=-2
end
)
script.on_game_event("SPEED_CONTROL_RESET",false,
function()
  Hyperspace.FPS.speedLevel=0
end
)
script.on_game_event("SPEED_CONTROL_FAST",false,
function()
  Hyperspace.FPS.speedLevel=50
end
)

--by AlHazrad

local function InGame()
	--print('InGame')
	Hyperspace.FPS.speedLevel=0
	Hyperspace.playerVariables['speed_control_slow_set'] = 1
	Hyperspace.playerVariables['speed_control_norm_set'] = 0
	Hyperspace.playerVariables['speed_control_fast_set'] = 1
	isWork = true;
end
local function InMain()
	--print('InMain')
	Hyperspace.FPS.speedLevel=0
	Hyperspace.playerVariables['speed_control_slow_set'] = 1
	Hyperspace.playerVariables['speed_control_norm_set'] = 0
	Hyperspace.playerVariables['speed_control_fast_set'] = 1
	isWork = false;
end

script.on_game_event("START_BEACON", false, InGame)
script.on_internal_event(Defines.InternalEvents.MAIN_MENU, InMain)
script.on_init(InGame)

script.on_internal_event(Defines.InternalEvents.ON_KEY_DOWN, function(key)
	if not isWork then
		return
	end
    if key == Defines.SDL.KEY_RIGHTBRACKET then
		if key == Defines.SDL.KEY_RIGHTBRACKET then
			if Hyperspace.FPS.speedLevel == -2 then
				Hyperspace.FPS.speedLevel=0
				Hyperspace.playerVariables['speed_control_slow_set'] = 1
				Hyperspace.playerVariables['speed_control_norm_set'] = 0
				Hyperspace.playerVariables['speed_control_fast_set'] = 1
			else
				if Hyperspace.FPS.speedLevel==0 then
					Hyperspace.FPS.speedLevel=50
					Hyperspace.playerVariables['speed_control_slow_set'] = 1
					Hyperspace.playerVariables['speed_control_norm_set'] = 1
					Hyperspace.playerVariables['speed_control_fast_set'] = 0
				end
			end
		end
    end
end)


script.on_internal_event(Defines.InternalEvents.ON_KEY_DOWN, function(key)
	if not isWork then
		return
	end
    if key == Defines.SDL.KEY_LEFTBRACKET then
		if Hyperspace.FPS.speedLevel==50 then
			Hyperspace.FPS.speedLevel=0
			Hyperspace.playerVariables['speed_control_slow_set'] = 1
			Hyperspace.playerVariables['speed_control_norm_set'] = 0
			Hyperspace.playerVariables['speed_control_fast_set'] = 1
		else
			if Hyperspace.FPS.speedLevel==0 then
				Hyperspace.FPS.speedLevel=-2
				Hyperspace.playerVariables['speed_control_slow_set'] = 0
				Hyperspace.playerVariables['speed_control_norm_set'] = 1
				Hyperspace.playerVariables['speed_control_fast_set'] = 1
			end
		end
    end
end)

script.on_internal_event(Defines.InternalEvents.ON_KEY_DOWN, function(key)
	if not isWork then
		return
	end
    if key == Defines.SDL.KEY_LALT then
		Hyperspace.FPS.speedLevel=50
		Hyperspace.playerVariables['speed_control_slow_set'] = 1
		Hyperspace.playerVariables['speed_control_norm_set'] = 1
		Hyperspace.playerVariables['speed_control_fast_set'] = 0		
    end
end)

script.on_internal_event(Defines.InternalEvents.ON_KEY_UP, function(key)
	if not isWork then
		return
	end
    if key == Defines.SDL.KEY_LALT then
		Hyperspace.FPS.speedLevel=0
		Hyperspace.playerVariables['speed_control_slow_set'] = 1
		Hyperspace.playerVariables['speed_control_norm_set'] = 0
		Hyperspace.playerVariables['speed_control_fast_set'] = 1		
    end
end)
