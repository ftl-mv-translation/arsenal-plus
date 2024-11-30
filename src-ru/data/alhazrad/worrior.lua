



local box1 = Hyperspace.Resources:CreateImagePrimitiveString('alhazrad/room_freezer1.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local box2 = Hyperspace.Resources:CreateImagePrimitiveString('alhazrad/room_freezer2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local slurm_available = 0
local defX = 592 -- 592
local defY = 310 --  310

local timerStart = false
local checkenemy = false

local function Draw() 
    
    local playerShip = Hyperspace.ships.player

    if playerShip and not (playerShip:HasAugmentation("WARRIOR_AUG") > 0) then
       return
    end    

    local cApp = Hyperspace.App

    local currentX = defX
    local currentY = defY   
     
    if playerShip then
        if not playerShip.bJumping then
           currentX = defX
           currentY = defY
        else
           currentX = 9999
           currentY = 9999
        end
    end
  
    local enemyShip = Hyperspace.ships.enemy
    local isBoss = false
    isBoss = cApp.gui.combatControl.boss_visual
    if enemyShip then 
        --print('enemyShip')
        
        if Hyperspace.ships.enemy.ship.hullIntegrity.first > 0 then
            if not isBoss then
                currentX = currentX - 150
            else 
                currentX = currentX - 200
            end 
        else
            if Hyperspace.Global.GetInstance():GetCApp().gui.event_pause then 
                if checkenemy then
                    timerStart = false
                end            
            end 

            if not timerStart and not checkenemy then
                timerStart = true
                checkenemy = true
            end

            if timerStart and checkenemy then               
                if timerStart then
                    if not Hyperspace.Global.GetInstance():GetCApp().gui.event_pause then                   
                        if not isBoss then
                            currentX = currentX - 150
                        else 
                            currentX = currentX - 200
                        end
                    else
                        currentX = defX    
                    end  
                else 
                    currentX = defX    
                end
            else
                currentX = defX 
            end
        end
    else
       
        currentX = defX       
    end
    
    slurm_available = Hyperspace.metaVariables['slurm_available']   
    if slurm_available == 0 then
        Graphics.CSurface.GL_PushMatrix()
        pcall(function()
            Graphics.CSurface.GL_Translate(currentX, currentY)
            Graphics.CSurface.GL_RenderPrimitive(box1)
        end)    
        Graphics.CSurface.GL_PopMatrix()
    else 
        Graphics.CSurface.GL_PushMatrix()
        pcall(function()
            Graphics.CSurface.GL_Translate(currentX, currentY)
            Graphics.CSurface.GL_RenderPrimitive(box2)
        end)    
        Graphics.CSurface.GL_PopMatrix()
    end    
end

local function ResetAll()  
  timerStart = false
  checkenemy = false
  
end


script.on_render_event(Defines.RenderEvents.LAYER_PLAYER, function() end, Draw)

script.on_internal_event(Defines.InternalEvents.JUMP_LEAVE, ResetAll)

