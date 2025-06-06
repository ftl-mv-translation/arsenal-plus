if not (Hyperspace.version and Hyperspace.version.major == 1 and Hyperspace.version.minor >= 8) then
	error("Incorrect Hyperspace version detected! Hyperspace 1.8+ required.")
end

local function CreateDefaultPrimitive(path)
	return Hyperspace.Resources:CreateImagePrimitiveString(path, 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
end

-- Vanilla UI
local shieldBox = CreateDefaultPrimitive("statusUI/vanilla_shield_on.png")
local shieldBoxOff = CreateDefaultPrimitive("statusUI/vanilla_shield_off.png")
local enemyX = 882
local enemyY = 152
local bossX = 757
local bossY = 109

script.on_render_event(Defines.RenderEvents.SHIP, function() end, function()
	local playerShip = Hyperspace.ships.player
	local enemyShip = Hyperspace.ships.enemy
	
	if enemyShip and not playerShip.bJumping and Hyperspace.Global.GetInstance():GetCApp().world.bStartedGame then
		if enemyShip.shieldSystem and enemyShip.shieldSystem.shields.power.super.second ~= 0 then
			local currentX = enemyX
			local currentY = enemyY
			
			if Hyperspace.Global.GetInstance():GetCApp().gui.combatControl.boss_visual then
				currentX = bossX
				currentY = bossY
			end
			
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_LoadIdentity()
			Graphics.CSurface.GL_Translate(currentX, currentY)
			
			if enemyShip.shieldSystem.shields.power.super.first ~= 0 then
				Graphics.CSurface.GL_RenderPrimitive(shieldBox)
			else
				Graphics.CSurface.GL_RenderPrimitive(shieldBoxOff)
			end
			
			Graphics.freetype.easy_printCenter(0, 49, 15, string.format("%i", enemyShip.shieldSystem.shields.power.super.first))
			Graphics.CSurface.GL_PopMatrix()
		end
	end
end)
