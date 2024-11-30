local version = "Arsenal+ v1.32"
local function DrawGame()
    Graphics.CSurface.GL_PushMatrix()   
    pcall(function()
        Graphics.CSurface.GL_Translate(1130, 0)
        Graphics.freetype.easy_print(51, 0, 0, version)
    end)
     Graphics.CSurface.GL_PopMatrix()
end
script.on_render_event(Defines.RenderEvents.MOUSE_CONTROL, function() end, DrawGame)