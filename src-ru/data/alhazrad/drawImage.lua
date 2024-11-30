local textText = "Арсенал+ v1.31.1"
local draw = false
local picturePosX = 0
local picturePosY = 0
local imagePath = ''
local textFontID = 0
local textPosX = 0
local textPosY = 0


local function Init(_event, _imagePath, _picturePosX, _picturePosY, _textFontID, _textPosX, _textPosY, _textText)
    --print('Init' .. ' event=' .. _event)
    picturePosX = _picturePosX
    picturePosY = _picturePosY
    imagePath = _imagePath
    textID = _textID
    textPosX = _textPosX
    textPosY = _textPosY
    textText = _textText
    draw = true
end

local function DrawGame()
    if not draw then
        return
    end
    if imagePath ~= '' then
        local image = Hyperspace.Resources:CreateImagePrimitiveString(imagePath, 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
        Graphics.CSurface.GL_PushMatrix()
        pcall(function()
        Graphics.CSurface.GL_Translate(picturePosX, picturePosY)
        Graphics.CSurface.GL_RenderPrimitive(image)
        end)    
        Graphics.CSurface.GL_PopMatrix()
    end

   if imagePath ~= '' then
        Graphics.CSurface.GL_PushMatrix()   
        pcall(function()
        Graphics.CSurface.GL_Translate(textPosX, textPosY)
        Graphics.freetype.easy_print(51, 0, 0, textText)
        end)
        Graphics.CSurface.GL_PopMatrix()
    end

    if not Hyperspace.Global.GetInstance():GetCApp().gui.event_pause then
        draw = false
    end
end


script.on_render_event(Defines.RenderEvents.SPACE_STATUS, function() end, DrawGame)

-- Пример:    
-- script.on_game_event("EVENT_NAME", false, function() Init('EVENT_NAME','myPicturesFolder/myPictureName.png', pictureX, pictureY, textFontID, textPosX, textPosY, textText) end)

-- чтобы добавить новую картинку и подпись к ней для нового события надо скопировать пример и вбить туда свои нужные данные.

-- для сосем тупых - 
-- EVENT_NAME = имя события
-- 'EVENT_NAME' = имя события нужно если откоментить строку print
-- 'myPicturesFolder/myPictureName.png' = путь к нужной картинке. папка myPicturesFolder должна быть в папке img а myPictureName.png в папке myPicturesFolder (если оставить пустым ничего не будет выводиться)
-- picturePosX расположение картинки по X
-- picturePosY расположение картинки по Y
-- textFontID id и одновременно размер шрифта
-- textPosX расположение текста по X
-- textPosY расположение текста по Y
-- textText содержание текста (если оставить пустым ничего не будет выводиться)

-- Чтобы менять картинку и текст в одном и том же окне диалога нужно на каждый выбор (тык в ответ) делать отдельное событие с низванием.

-- Рабочий код для примера вывода картинки и текста при посещении события - стартовый маяк:
--script.on_game_event("START_BEACON", false, function() Init('START_BEACON','alhazrad/trader_portrait_3.png', 260, 154, 51, 100, 100, "ПРивет") end)
