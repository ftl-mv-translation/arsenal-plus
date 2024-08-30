local function randomPointRadius(origin, radius)
    local theta = 2 * math.pi * math.random()
    local r = math.random() + math.random()
    r = radius * (r > 1 and 2 - r or r)
    return Hyperspace.Pointf(origin.x + r * math.cos(theta), origin.y + r * math.sin(theta))
end

local function resizeLine(point1, point2, length)
    if length == 0 then
        point2.x = point1.x
        point2.y = point1.y
        return
    end
    local dx = point2.x - point1.x
    local dy = point2.y - point1.y
    local d = math.sqrt(dx ^ 2 + dy ^ 2)
    if d <= 0 then
        local theta = 2 * math.pi * math.random()
        point2.x = point1.x + length * math.cos(theta)
        point2.y = point1.y + length * math.sin(theta)
        return
    end
    local r = length / d
    point2.x = point1.x + dx * r
    point2.y = point1.y + dy * r
end

local function defaultPrimitive(filename)
    return Hyperspace.Resources:CreateImagePrimitiveString(filename, 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
end

local yellowColor = Graphics.GL_Color(1, 1, 0, 1)
local orangeolor = Graphics.GL_Color(1, 188 / 255, 0, 1)

local artilleryCrosshairs = {}
artilleryCrosshairs[1] = defaultPrimitive('aimable/crosshairs_placed_artillery_1.png')
artilleryCrosshairs[2] = defaultPrimitive('aimable/crosshairs_placed_artillery_2.png')
artilleryCrosshairs[3] = defaultPrimitive('aimable/mouse_crosshairs_artillery.png')

local droneCrosshairs = {}
droneCrosshairs[1] = defaultPrimitive('aimable/crosshairs_placed_drone_1.png')
droneCrosshairs[2] = defaultPrimitive('aimable/crosshairs_placed_drone_2.png')
droneCrosshairs[3] = defaultPrimitive('aimable/mouse_crosshairs_drone.png')

local xButtons = {}
xButtons[1] = defaultPrimitive('aimable/button_x_on.png')
xButtons[2] = defaultPrimitive('aimable/button_x_off.png')
xButtons[3] = defaultPrimitive('aimable/button_x_select2.png')

local rButtons = {}
rButtons[1] = defaultPrimitive('aimable/button_mouse_on.png')
rButtons[2] = defaultPrimitive('aimable/button_mouse_off.png')
rButtons[3] = defaultPrimitive('aimable/button_mouse_select2.png')

local selectedButtons = {}
selectedButtons[1] = defaultPrimitive('aimable/button_1.png')
selectedButtons[2] = defaultPrimitive('aimable/button_2.png')
selectedButtons[3] = defaultPrimitive('aimable/button_12.png')

local artilleryButtons = {}
artilleryButtons[1] = defaultPrimitive('aimable/artillery_on.png')
artilleryButtons[2] = defaultPrimitive('aimable/artillery_off.png')
artilleryButtons[3] = defaultPrimitive('aimable/artillery_select2.png')

local droneButtons = {}
droneButtons[1] = defaultPrimitive('aimable/drone_on.png')
droneButtons[2] = defaultPrimitive('aimable/drone_off.png')
droneButtons[3] = defaultPrimitive('aimable/drone_select2.png')

local enemySystemX = {}
local enemySystemBaseX = 0
local enemySystemBaseY = 0
local function checkEnemySystemPositions(shipMgr, isBoss)
    enemySystemX = {}
    local vSystemList = shipMgr.vSystemList
    local size = vSystemList:size()
    local xOffset = isBoss and 851 or 931
    if size > 12 then
        xOffset = xOffset - 45
    end
    enemySystemBaseX = xOffset
    enemySystemBaseY = isBoss and 587 or 560
    for i = 0, size - 1 do
        local sys = vSystemList[i]
        enemySystemX[sys:GetRoomId()] = xOffset
        xOffset = xOffset + 30
    end
end

script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipMgr)
    if shipMgr.iShipId ~= 1 then
        return
    end
    local cApp = Hyperspace.Global.GetInstance():GetCApp()
    local isBoss = cApp.gui.combatControl.boss_visual
    checkEnemySystemPositions(shipMgr, isBoss)
end)

local function renderXButton(mouse, buttons, yOffset)
    local x = enemySystemBaseX - 55
    local y = enemySystemBaseY + yOffset
    local hitboxWidth = 17
    local hitboxHeight = 17
    local status = 1
    local hover = false
    if x <= mouse.x and mouse.x < x + hitboxWidth and
        y <= mouse.y and mouse.y < y + hitboxHeight then
        status = 3
        hover = true
    end
    Graphics.CSurface.GL_PushMatrix()
    Graphics.CSurface.GL_Translate(x - 4, y - 4)
    Graphics.CSurface.GL_RenderPrimitive(buttons[status])
    Graphics.CSurface.GL_PopMatrix()
    return hover
end

local function renderRButton(mouse, buttons, yOffset, mouseMode)
    local x = enemySystemBaseX - 35
    local y = enemySystemBaseY + yOffset
    local hitboxWidth = 32
    local hitboxHeight = 17
    local hover = false
    if x <= mouse.x and mouse.x < x + hitboxWidth and
        y <= mouse.y and mouse.y < y + hitboxHeight then
        hover = true
    end
    local status = mouseMode and 2 or (hover and 3 or 1)
    Graphics.CSurface.GL_PushMatrix()
    Graphics.CSurface.GL_Translate(x - 4, y - 4)
    Graphics.CSurface.GL_RenderPrimitive(buttons[status])
    Graphics.CSurface.GL_PopMatrix()
    return hover
end

local function renderButtons(buttons, yOffset, cond, selectedRooms, crosshair)
    local cApp = Hyperspace.Global.GetInstance():GetCApp()
    if not cApp.world.bStartedGame or cApp.gui.menu_pause then
        return
    end
    local playerShip = Hyperspace.ships.player
    local enemyShip = Hyperspace.ships.enemy
    if not (playerShip and cond() and not playerShip.bJumping and enemyShip and enemyShip._targetable.hostile) then
        selectedRooms.mouseMode = false
        return
    end
    local mouse = Hyperspace.Mouse.position
    local y = enemySystemBaseY + yOffset
    local hitboxWidth = 32
    local hitboxHeight = 17
    local vSystemList = enemyShip.vSystemList
    local size = vSystemList:size()
    local hover = renderXButton(mouse, xButtons, yOffset)
    hover = renderRButton(mouse, rButtons, yOffset, selectedRooms.mouseMode) or hover
    for i = 0, size - 1 do
        local sys = vSystemList[i]
        local roomId = sys:GetRoomId()
        local x = (enemySystemX[roomId] or 0) - 3
        local button = buttons[1]
        local firstSelected = (selectedRooms[1] == roomId)
        local secondSelected = (selectedRooms[2] == roomId)
        if firstSelected or secondSelected then
            if firstSelected and secondSelected then
                button = selectedButtons[3]
            elseif firstSelected then
                button = selectedButtons[1]
            else
                button = selectedButtons[2]
            end
        elseif not hover and x <= mouse.x and mouse.x < x + hitboxWidth and
            y <= mouse.y and mouse.y < y + hitboxHeight then
            button = buttons[3]
            hover = true
        end
        Graphics.CSurface.GL_PushMatrix()
        Graphics.CSurface.GL_Translate(x - 4, y - 4)
        Graphics.CSurface.GL_RenderPrimitive(button)
        Graphics.CSurface.GL_PopMatrix()
    end
    if selectedRooms.mouseMode then
        Graphics.CSurface.GL_PushMatrix()
        Graphics.CSurface.GL_Translate(mouse.x + 5, mouse.y - 21)
        Graphics.CSurface.GL_RenderPrimitive(crosshair)
        Graphics.CSurface.GL_PopMatrix()
    end
end

local function renderMouseHoverRoom(ship, selectedRooms)
    if ship.iShipId ~= 1 or not selectedRooms.mouseMode then
        return
    end
    local mouse = Hyperspace.Mouse.position
    local cApp = Hyperspace.Global.GetInstance():GetCApp()
    local targetPosition = cApp.gui.combatControl.targetPosition
    local hoverRoom = ship:GetSelectedRoomId(mouse.x - targetPosition.x - 747, mouse.y - targetPosition.y, false)
    if hoverRoom < 0 then
        return
    end
    local room = ship.vRoomList[hoverRoom]
    if not room then
        return
    end
    local roomShape = room.rect
    Graphics.CSurface.GL_DrawRectOutline(roomShape.x + 5, roomShape.y + 5, roomShape.w - 10, roomShape.h - 10, orangeolor, 1)
    Graphics.CSurface.GL_DrawRectOutline(roomShape.x, roomShape.y, roomShape.w, roomShape.h, yellowColor, 5)
end

local function renderSelectedEnemyRoom(ship, selectedRooms, sprites)
    if ship.iShipId ~= 1 or not Hyperspace.ships.enemy._targetable.hostile then
        return
    end
    for i, roomId in ipairs(selectedRooms) do
        if roomId > -1 then
            local room = ship.vRoomList[roomId]
            if room then
                local rect = room.rect
                Graphics.CSurface.GL_PushMatrix()
                Graphics.CSurface.GL_Translate(rect.x + rect.w // 2 - 26, rect.y + rect.h // 2 - 26)
                Graphics.CSurface.GL_RenderPrimitive(sprites[i])
                Graphics.CSurface.GL_PopMatrix()
            end
        end
    end
end

local function clearTargets(yOffset, mouse, selectedRooms)
    local x = enemySystemBaseX - 55
    local y = enemySystemBaseY + yOffset
    local hitboxWidth = 17
    local hitboxHeight = 17
    if x <= mouse.x and mouse.x < x + hitboxWidth and
        y <= mouse.y and mouse.y < y + hitboxHeight then
        selectedRooms[1] = -1
        selectedRooms[2] = -1
        selectedRooms.mouseMode = false
        return true
    end
    return false
end

local function mouseModeBegin(yOffset, mouse, selectedRooms)
    local x = enemySystemBaseX - 35
    local y = enemySystemBaseY + yOffset
    local hitboxWidth = 32
    local hitboxHeight = 17
    if x <= mouse.x and mouse.x < x + hitboxWidth and
        y <= mouse.y and mouse.y < y + hitboxHeight then
        selectedRooms.mouseMode = true
        return true
    end
    return false
end

local function selectEnemyRoom(cApp, mouse, selectedRooms, index)
    local shipGraph = Hyperspace.ShipGraph.GetShipInfo(1)
    local targetPosition = cApp.gui.combatControl.targetPosition
    local selectedRoom = shipGraph:GetSelectedRoom(mouse.x - targetPosition.x - 747, mouse.y - targetPosition.y, false)
    if selectedRoom > -1 then
        selectedRooms[index] = selectedRoom
        selectedRooms.mouseMode = false
        return true
    end
    return false
end

local function selectEnemySystem(yOffset, cond, selectedRooms, index)
    local cApp = Hyperspace.Global.GetInstance():GetCApp()
    if not cApp.world.bStartedGame or cApp.gui.menu_pause then
        return
    end
    local playerShip = Hyperspace.ships.player
    local enemyShip = Hyperspace.ships.enemy
    if not (playerShip and cond() and not playerShip.bJumping and enemyShip and enemyShip._targetable.hostile) then
        return
    end
    local mouse = Hyperspace.Mouse.position
    if selectedRooms.mouseMode and selectEnemyRoom(cApp, mouse, selectedRooms, index) then
        return
    end
    local y = enemySystemBaseY + yOffset
    local hitboxWidth = 32
    local hitboxHeight = 17
    if not (y <= mouse.y and mouse.y < y + hitboxHeight) then
        return
    end
    if clearTargets(yOffset, mouse, selectedRooms) then
        return
    end
    if mouseModeBegin(yOffset, mouse, selectedRooms) then
        return
    end
    local vSystemList = enemyShip.vSystemList
    local size = vSystemList:size()
    for i = 0, vSystemList:size() - 1 do
        local sys = vSystemList[i]
        local roomId = sys:GetRoomId()
        local x = (enemySystemX[roomId] or 0) - 3
        if x <= mouse.x and mouse.x < x + hitboxWidth then
            selectedRooms[index] = roomId
            break
        end
    end
end

local function createAimable(buttons, yOffset, cond, apply, crosshairs)
    local selectedRooms = { [1] = -1, [2] = -1, crosshairs = crosshairs, mouseMode = false }
    script.on_internal_event(Defines.InternalEvents.CONSTRUCT_SHIP_MANAGER, function()
        selectedRooms[1] = -1
        selectedRooms[2] = -1
        selectedRooms.mouseMode = false
    end)
    script.on_render_event(Defines.RenderEvents.MOUSE_CONTROL, function()
        renderButtons(buttons, yOffset, cond, selectedRooms, crosshairs[3])
    end, function() end)
    script.on_render_event(Defines.RenderEvents.SHIP_SPARKS, function() end, function(ship)
        renderMouseHoverRoom(ship, selectedRooms)
    end)
    script.on_render_event(Defines.RenderEvents.SHIP, function() end, function(ship)
        renderSelectedEnemyRoom(ship, selectedRooms, crosshairs)
    end)
    script.on_internal_event(Defines.InternalEvents.ON_MOUSE_L_BUTTON_DOWN, function()
        selectEnemySystem(yOffset, cond, selectedRooms, 1)
    end)
    script.on_internal_event(Defines.InternalEvents.ON_MOUSE_R_BUTTON_DOWN, function()
        selectEnemySystem(yOffset, cond, selectedRooms, 2)
    end)
    apply(selectedRooms, cond)
end

local function applyTargets(enemyShip, selectedRooms, bp, projectile)
    local targets = {}
    local healthyTargets = {}
    for _, v in ipairs(selectedRooms) do
        if v >= 0 then
            table.insert(targets, v)
            local sys = enemyShip:GetSystemInRoom(v)
            if sys and not sys:CompletelyDestroyed() then
                table.insert(healthyTargets, v)
            end
        end
    end
    local n = #targets
    if n <= 0 then
        return
    end
    if bp.typeName == 'BURST' then
        if #healthyTargets > 0 then
            projectile.target = randomPointRadius(enemyShip:GetRoomCenter(healthyTargets[1]), bp.radius)
        else
            projectile.target = randomPointRadius(enemyShip:GetRoomCenter(targets[math.random(1, n)]), bp.radius)
        end
        return
    end
    if projectile.target1 then
        local newTarget = enemyShip:GetRoomCenter(targets[1])
        projectile.target = newTarget
        projectile.target1 = newTarget
        projectile.final_end = newTarget
        if n >= 2 then
            projectile.target2 = enemyShip:GetRoomCenter(targets[2])
        end
        resizeLine(projectile.target1, projectile.target2, bp.length)
    elseif #healthyTargets > 0 then
        projectile.target = enemyShip:GetRoomCenter(healthyTargets[1])
    else
        projectile.target = enemyShip:GetRoomCenter(targets[math.random(1, n)])
    end
end

createAimable(artilleryButtons, 0, function()
    return Hyperspace.playerVariables['_aimable_enable_artilleries'] > 0
end, function(selectedRooms, cond)
    script.on_internal_event(Defines.InternalEvents.PROJECTILE_FIRE, function(projectile, weapon)
        if weapon.iShipId ~= 0 or not cond() or not weapon.isArtillery then
            return
        end
        local enemyShip = Hyperspace.ships.enemy
        if not (enemyShip and enemyShip._targetable.hostile) then
            return
        end
        applyTargets(enemyShip, selectedRooms, weapon.blueprint, projectile)
    end)
end, artilleryCrosshairs)

createAimable(droneButtons, 17, function()
    return Hyperspace.playerVariables['_aimable_enable_drones'] > 0
end, function(selectedRooms, cond)
    script.on_internal_event(Defines.InternalEvents.DRONE_FIRE, function(projectile, spacedrone)
        if spacedrone.iShipId ~= 0 or not cond() or not spacedrone.heading then
            return Defines.Chain.CONTINUE
        end
        local enemyShip = Hyperspace.ships.enemy
        if not (enemyShip and enemyShip._targetable.hostile) then
            return Defines.Chain.CONTINUE
        end
        applyTargets(enemyShip, selectedRooms, spacedrone.weaponBlueprint, projectile)
        projectile:ComputeHeading()
        return Defines.Chain.CONTINUE
    end)
end, droneCrosshairs)

if not mods.arsenal then
    script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipMgr)
        if shipMgr.iShipId ~= 0 then
            return
        end
        Hyperspace.playerVariables['_aimable_enable_artilleries'] = shipMgr:HasSystem(11) and 1 or 0
        Hyperspace.playerVariables['_aimable_enable_drones'] = shipMgr:HasSystem(4) and 1 or 0
    end)
end
