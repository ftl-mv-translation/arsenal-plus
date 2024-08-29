mods.speed_UI={}

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
