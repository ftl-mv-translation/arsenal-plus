
local box = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/top_evade_oxygen_enemy.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local enemyX = 1242
local enemyY = 527
local bossX = 1235
local bossY = 532
local offsetX = 0
local offsetY = 0
local dragging = false
local deltaX = 0
local deltaY = 0

local function dragBegin()
    local cApp = Hyperspace.Global.GetInstance():GetCApp()
    if not cApp.world.bStartedGame or cApp.gui.menu_pause then
        return
    end
    local playerShip = Hyperspace.ships.player
    local enemyShip = Hyperspace.ships.enemy
    if not (playerShip and not playerShip.bJumping and enemyShip and enemyShip._targetable.hostile) then
        return
    end
    -- 4 is actually 3 and 3 is 4
    if not playerShip:DoSensorsProvide(4) then
        return
    end
    local isBoss = cApp.gui.combatControl.boss_visual
    local defaultX = isBoss and bossX or enemyX
	local defaultY = isBoss and bossY or enemyY
    local currentX = defaultX + offsetX
    local currentY = defaultY + offsetY
    local mouse = Hyperspace.Mouse.position
    local iconWidth = 104
    local iconHeight = 56
    if currentX <= mouse.x and mouse.x < currentX + iconWidth and
        currentY <= mouse.y and mouse.y < currentY + iconHeight then
        dragging = true
        deltaX = mouse.x - currentX
        deltaY = mouse.y - currentY
    end
end

script.on_internal_event(Defines.InternalEvents.ON_MOUSE_R_BUTTON_DOWN, dragBegin)
script.on_internal_event(Defines.InternalEvents.ON_MOUSE_R_BUTTON_UP, function()
    dragging = false
    deltaX = 0
    deltaY = 0
end)

script.on_render_event(Defines.RenderEvents.MOUSE_CONTROL, function()
    local cApp = Hyperspace.Global.GetInstance():GetCApp()
    if not cApp.world.bStartedGame or cApp.gui.menu_pause then
        return
    end
    local playerShip = Hyperspace.ships.player
    local enemyShip = Hyperspace.ships.enemy
    if not (playerShip and not playerShip.bJumping and enemyShip and enemyShip._targetable.hostile) then
        return
    end
    -- 4 is actually 3 and 3 is 4
    if not playerShip:DoSensorsProvide(4) then
        return
    end
    local isBoss = cApp.gui.combatControl.boss_visual
    local defaultX = isBoss and bossX or enemyX
	local defaultY = isBoss and bossY or enemyY
    local currentX = defaultX + offsetX
    local currentY = defaultY + offsetY
    local mouse = Hyperspace.Mouse.position
    local iconWidth = 104
    local iconHeight = 56
    local alpha = 1.0
    if dragging then
        currentX = mouse.x - deltaX
        currentY = mouse.y - deltaY
        offsetX = currentX - defaultX
        offsetY = currentY - defaultY
    else
        if currentX <= mouse.x and mouse.x < currentX + iconWidth and
            currentY <= mouse.y and mouse.y < currentY + iconHeight then
            alpha = 1.0
        end
    end
    local dodge = enemyShip:GetDodgeFactor()
    if enemyShip.ship.bCloaked then
        dodge = dodge + 60
    end
    Graphics.CSurface.GL_PushMatrix()
    pcall(function()
        Graphics.CSurface.GL_Translate(currentX, currentY)
        Graphics.CSurface.GL_RenderPrimitiveWithAlpha(box, alpha)
        Graphics.freetype.easy_printRightAlign(10, 35, 19, string.format("%d%%", dodge))
        Graphics.freetype.easy_printRightAlign(10, 35, 38, string.format("%d%%", enemyShip:GetOxygenPercentage()))
    end)
    Graphics.CSurface.GL_PopMatrix()
end, function() end)