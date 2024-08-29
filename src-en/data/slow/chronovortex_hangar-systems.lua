local systemIcons = {}
do
    local function systemIcon(name)
        local tex = Hyperspace.Resources:GetImageId("icons/s_"..name.."_overlay.png")
        return Graphics.CSurface.GL_CreateImagePrimitive(tex, 0, 0, 32, 32, 0, Graphics.GL_Color(0.8, 0.3, 0.3, 0.5))
    end
    systemIcons[0]  = systemIcon("shields")
    systemIcons[1]  = systemIcon("engines")
    systemIcons[2]  = systemIcon("oxygen")
    systemIcons[3]  = systemIcon("weapons")
    systemIcons[4]  = systemIcon("drones")
    systemIcons[5]  = systemIcon("medbay")
    systemIcons[6]  = systemIcon("piloting")
    systemIcons[7]  = systemIcon("sensors")
    systemIcons[8]  = systemIcon("doors")
    systemIcons[9]  = systemIcon("teleporter")
    systemIcons[10] = systemIcon("cloaking")
    systemIcons[11] = systemIcon("artillery")
    systemIcons[12] = systemIcon("battery")
    systemIcons[13] = systemIcon("clonebay")
    systemIcons[14] = systemIcon("mind")
    systemIcons[15] = systemIcon("hacking")
    systemIcons[20] = systemIcon("temporal")
end
script.on_render_event(Defines.RenderEvents.SHIP_SPARKS, mods.arsenal.doNothingFunction, function(ship)
    if not Hyperspace.Global.GetInstance():GetCApp().world.bStartedGame then
        local shipManager = Hyperspace.Global.GetInstance():GetShipManager(ship.iShipId)
        local sysInfo = shipManager.myBlueprint.systemInfo
        local medCloneSameRoom = sysInfo:has_key(5) and sysInfo:has_key(13) and sysInfo[5].location[0] == sysInfo[13].location[0]
        for sysId = 0, 20 do -- Skip temporal
            if sysId ~= 16 then -- Skip artillery
            
                -- Special logic for medbay and clonebay
                local medicalException = false
                local skipBackground = false
                local iconRenderOffsetX = 0
                local iconRenderOffsetY = 0
                if (sysId == 5 or sysId == 13) and medCloneSameRoom then
                    if not (shipManager:HasSystem(5) or shipManager:HasSystem(13)) then
                        local sysRoomShape = Hyperspace.ShipGraph.GetShipInfo(shipManager.iShipId):GetRoomShape(sysInfo[sysId].location[0])
                        if sysRoomShape.w > 35 then
                            if sysId == 5 then
                                iconRenderOffsetX = -16
                            else
                                iconRenderOffsetX = 16
                                skipBackground = true
                            end
                        else
                            if sysId == 5 then
                                iconRenderOffsetY = -16
                            else
                                iconRenderOffsetY = 16
                                skipBackground = true
                            end
                        end
                    else
                        medicalException = true
                    end
                end
                
                -- Render the icons
                if not medicalException and not shipManager:HasSystem(sysId) and sysInfo:has_key(sysId) then
                    local sysRoomShape = Hyperspace.ShipGraph.GetShipInfo(shipManager.iShipId):GetRoomShape(sysInfo[sysId].location[0])
                    local iconRenderX = sysRoomShape.x + sysRoomShape.w//2 - 16 + iconRenderOffsetX
                    local iconRenderY = sysRoomShape.y + sysRoomShape.h//2 - 16 + iconRenderOffsetY
                    if not skipBackground then
                        local outlineSize = 2
                        Graphics.CSurface.GL_DrawRect(
                            sysRoomShape.x,
                            sysRoomShape.y,
                            sysRoomShape.w,
                            sysRoomShape.h,
                            Graphics.GL_Color(0, 0, 0, 0.3))
                        Graphics.CSurface.GL_DrawRectOutline(
                            sysRoomShape.x + outlineSize,
                            sysRoomShape.y + outlineSize,
                            sysRoomShape.w - 2*outlineSize,
                            sysRoomShape.h - 2*outlineSize,
                            Graphics.GL_Color(0.8, 0.3, 0.3, 0.5), outlineSize)
                    end
                    Graphics.CSurface.GL_PushMatrix()
                    Graphics.CSurface.GL_Translate(iconRenderX, iconRenderY)
                    Graphics.CSurface.GL_RenderPrimitive(systemIcons[sysId])
                    Graphics.CSurface.GL_PopMatrix()
                end
                
            end
        end
    end
    return Defines.Chain.CONTINUE
end)