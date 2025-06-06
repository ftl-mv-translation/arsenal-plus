local gui = nil
local enemyShip = nil--Hyperspace.ships.enemy
local playerShip = nil--Hyperspace.ships.player
local GSIe = nil--Hyperspace.ShipGraph.GetShipInfo(1)
local GSIp = nil--Hyperspace.ShipGraph.GetShipInfo(0)
local world = nil--Hyperspace.App.world
local map = nil--Hyperspace.App.world.starMap
local cur_sector = nil--Hyperspace.App.world.starMap.currentSector
local pos = nil

-- луа накладывает ограничение в 200 переменных на скрипт. C# такого издевательства себе не позволял, знаете ли...
-- я ввожу массив в котором можно хранить бесконечное кол-во переменных...
-- обращаться через varr.имя_переменной
local varr = {
orchid_fleet_x = 0, 
orchid_fleet_y = 0,
count_of_R_weapons = 0,
previous_count_of_R_weapons = 0,
previous_droneSystem = 0,
mouse_inside_mem_prev2 = -1,
mouse_inside_mem2 = -1,
enemy_state_previous = 0,

color_cyanbezh = Graphics.GL_Color(0.91, 0.96, 0.9, 1.0),
color_green = Graphics.GL_Color(0.27, 0.71, 0.0, 1.0),
color_white = Graphics.GL_Color(1.0, 1.0, 1.0, 1.0),
color_red = Graphics.GL_Color(1.0, 0.2, 0.2, 1.0),
color_violet = Graphics.GL_Color(0.9, 0.0, 0.9, 1.0),
color_blue = Graphics.GL_Color(0.2, 0.2, 1.0, 1.0),
color_softyellow = Graphics.GL_Color(0.8, 0.8, 0.0, 0.5),

prepare_to_explode_hack = false,
prepare_to_switch_auto_drone_work = false,
x_offset_of_tips_artillery_system = 0,
x_offset_of_tips_drone_system = 0,

TABBED_WINDOW_is_visible = false,
prepare_to_clear_stat = false,
bMod_itbui = false,

universal_iRoom_neededheal = {[0] = 0,}, -- массив нытья экипажа, о том что в данный отсек нужен хил... [айди отсека] = 0 (не нужен), а если > 1 то нужен хил
universal_iRoom_targ = {[0] = -1,}, -- массив целеуказания для экипажа... [уникальный айди] = номер отсека-цели движения
--universal_iRoom_targ = -1,
osa_names = {'Нектар', 'Сладкий', 'Полосач', 'Шершень', 'Жужа', 'Жожо', 'Жалер', 'Жу', 'Пчёл', 'Кусь', 'Жужжак', 'Электра', 'Электрон', 'Ток', 'Матка', 'Трутень', 'Медок', 'Вжик', 'Жижа', 'Жало', 'Жужжони'},
enemy_osa_on_playership = false,

button_auto_drone_on = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_auto_drone_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_auto_drone_off = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_auto_drone_off.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_auto_drone_select2 = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_auto_drone_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_auto_drone_select3 = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_auto_drone_select3.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

micro_tick_counter8 = 0.0,
micro_tick_counter9 = 0.0,

stat_0 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/stat_0.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
stat_1 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/stat_1.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
stat_2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/stat_2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

stat_jump_panel = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/stat_jump_panel.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

}

local allowed_hack_explosion_on_cooldown = false -- change this to allow explode on hack-cooldown [imba!]

local soulreaper_b_on = {}
local soulreaper_b_off = {}
local soulreaper_b_select2 = {}
local sr_b = {}

local micro_tick_array = {}
local anim_tick_array = {}
local frame = 0
local cX = 0
local cY = 0
local nX1 = 0
local nX2 = 0
local nY1 = 0
local nY2 = 0

local offs_x = 0

local diff = ''

local button_no_tactical_pause = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/no_tactical_pause.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)

local button_confirm_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_confirm_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local button_confirm_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_confirm_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local button_confirmBox = {text_on = "", x = 895, y = 209, w = 32, h = 28}--947


local button_clearstat_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_clearstat_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local button_clearstat_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_clearstat_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local button_clearstatBox = {text_on = "", x = 847, y = 209, w = 32, h = 28}

local button_recOn_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_recOn_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local button_recOn_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_recOn_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local button_recOff_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_recOff_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local button_recOff_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_recOff_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local button_recBox = {x = 809, y = 209, w = 32, h = 28}
local sector_text_out = ''



-- функция которая может проверять дату и делать что-то связанное с ней
function define_date()
	local arr = os.date("*t")
	--print("year"..arr.year..", month"..arr.month..", day"..arr.day)
	if (tonumber(arr.month) == 3 and tonumber(arr.day) >= 25) or (tonumber(arr.month) == 4 and tonumber(arr.day) <= 25) then
		Hyperspace.playerVariables['prazdnik'] = 1
	elseif (tonumber(arr.month) == 12 and tonumber(arr.day) >= 20) or (tonumber(arr.month) == 1 and tonumber(arr.day) <= 20) then
		Hyperspace.playerVariables['prazdnik'] = 2
	else
		Hyperspace.playerVariables['prazdnik'] = 0
	end
end



-- блок запуска и воспроизведения ЛЮБЫХ анимаций в ЛЮБОЙ точке экрана
function play_anim_tick_array (key)
	-- key is "SPACE_STATUS_up" or "SPACE_STATUS" or "LAYER_BACKGROUND"
	if #anim_tick_array > 0 then
		for i = 1, #anim_tick_array do
			if anim_tick_array[i].layer == key then
				if anim_tick_array[i].time_length > 0.0 then
					if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
						anim_tick_array[i].time_length = anim_tick_array[i].time_length - 60.0*Hyperspace.FPS.SpeedFactor
					end
					if anim_tick_array[i].time_length <= 0.0 then
						anim_tick_array[i].time_length = 0.0
					else
						-- чёрная магия поиска координат в заданном анимационном листе
						frame = math.floor((anim_tick_array[i].w/anim_tick_array[i].fw) * (1.0 - (anim_tick_array[i].time_length/anim_tick_array[i].time_length_mem)))--выбираем кадр анимации (нумерация с 0)
						cX = frame*anim_tick_array[i].fw % anim_tick_array[i].w
						cY = math.floor(frame/(anim_tick_array[i].w/anim_tick_array[i].fw))*anim_tick_array[i].fh
						nX1 = cX/anim_tick_array[i].w
						nX2 = (cX + anim_tick_array[i].fw)/anim_tick_array[i].w
						nY1 = cY/anim_tick_array[i].h
						nY2 = (cY + anim_tick_array[i].fh)/anim_tick_array[i].h
						Graphics.CSurface.GL_PushMatrix()
						Graphics.CSurface.GL_Translate(anim_tick_array[i].x, anim_tick_array[i].y)
						Graphics.CSurface.GL_BlitImagePartial(anim_tick_array[i].texture, 0, 0, anim_tick_array[i].fw, anim_tick_array[i].fh, nX1, nX2, nY1, nY2, 1, varr.color_white, false)
						Graphics.CSurface.GL_PopMatrix()
					end
				end
			end
		end
	end
end


function mouseInside(box)
    local mouse = Hyperspace.Mouse.position
    return box.x <= mouse.x and mouse.x < box.x + box.w and box.y <= mouse.y and mouse.y < box.y + box.h
end

local vter = function(cvec) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec:size()
	return function()
		i = i + 1
		if i < n then return cvec[i] end
	end
end
local vter2 = function(cvec2) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec2:size()
	return function()
		i = i + 1
		if i < n then return cvec2[i] end
	end
end
local vter3 = function(cvec3) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec3:size()
	return function()
		i = i + 1
		if i < n then return cvec3[i] end
	end
end
local vter4 = function(cvec4) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec4:size()
	return function()
		i = i + 1
		if i < n then return cvec4[i] end
	end
end
local vter5 = function(cvec5) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec5:size()
	return function()
		i = i + 1
		if i < n then return cvec5[i] end
	end
end
-- local vter6 = function(cvec6) --Taken from Vertex
	-- local i = -1 -- so the first returned value is indexed at zero
	-- local n = cvec6:size()
	-- return function()
		-- i = i + 1
		-- if i < n then return cvec6[i] end
	-- end
-- end

-- автоматика, работает. описание для авторемонтов нужно, т.к. отличается от встроенного
local tip_text_replace_hidden_array = {
	["AUTO_REPAIR10"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 33%.",
	["AUTO_REPAIR20"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 66%.",
	["AUTO_REPAIR30"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 100%.",
	["AUTO_REPAIR40"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 133%.",
	["AUTO_REPAIR50"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 166%.",
	["AUTO_REPAIR60"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 200%.",
	["AUTO_REPAIR70"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 233%.",
}
local tip_img_replace_hidden_array = {}


function works_on_first_initialization_this_script()
	-- заполняет таблицу соответствия имён и описаний встраиваемых усилений
	for augs in vter2 (Hyperspace.Blueprints:GetBlueprintList("CAN_BE_HIDDEN_AUGS")) do
		tip_text_replace_hidden_array[augs] = Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.description:GetText()
		tip_img_replace_hidden_array[augs] = Hyperspace.Resources:CreateImagePrimitiveString('combatUI/icons/icon_'..augs:lower()..'.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
	end
	
	-- подгружаем графику интерфейса душегуба в массивы
	for num = 1, 13 do
		soulreaper_b_on[num] = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper_b'..num..'_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
		soulreaper_b_off[num] = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper_b'..num..'_off.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
		soulreaper_b_select2[num] = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper_b'..num..'_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
	end
	sr_b[1] = {text_on = "Уменьшить потребление энергии.", x = 997, y = 97, w = 66, h = 31}
	sr_b[2] = {text_on = "Уменьшить время перезарядки.", x = 997, y = 134, w = 66, h = 31}
	sr_b[3] = {text_on = "Увеличить количество снарядов.", x = 997, y = 171, w = 66, h = 31}
	sr_b[4] = {text_on = "Увеличить общий урон снарядов.", x = 997, y = 208, w = 66, h = 31}
	sr_b[5] = {text_on = "Увеличить системный урон снарядов.", x = 997, y = 245, w = 66, h = 31}
	sr_b[6] = {text_on = "Увеличить урон снарядов по экипажу.", x = 997, y = 282, w = 66, h = 31}
	sr_b[7] = {text_on = "Увеличить ионный урон.", x = 997, y = 319, w = 66, h = 31}
	sr_b[8] = {text_on = "Увеличить количество пробиваемых щитов.", x = 997, y = 356, w = 66, h = 31}
	sr_b[9] = {text_on = "Увеличить шанс появления пробоины.", x = 997, y = 430, w = 66, h = 31}
	sr_b[10] = {text_on = "Увеличить шанс появления возгорания.", x = 997, y = 393, w = 66, h = 31}
-- sr_b[9] = {text_on = "Увеличить шанс появления пробоины.", x = 997, y = 393, w = 66, h = 31}
-- sr_b[10] = {text_on = "Увеличить шанс появления возгорания.", x = 997, y = 430, w = 66, h = 31}
	sr_b[11] = {text_on = "Добавить эффект запирания отсеков.", x = 997, y = 467, w = 66, h = 31}
	sr_b[12] = {text_on = "Добавить эффект двойного урона при попадании в отсеки без систем.", x = 997, y = 504, w = 66, h = 31}
	sr_b[13] = {text_on = "Увеличить вместимость хранилища душ.", x = 997, y = 541, w = 66, h = 31}
	
	if Hyperspace.Blueprints:GetWeaponBlueprint("ITB_INDICATOR")~= nil and Hyperspace.Blueprints:GetWeaponBlueprint("ITB_INDICATOR").desc.cost > 0 then
		varr.bMod_itbui = true
	else-- если орудия нет в блюпринтах его стоимость = 0 по умолчанию, даже если записей об орудии нет в блюпринтах...
		varr.bMod_itbui = false
	end
	if varr.bMod_itbui == true then
		offs_x = 24
		button_clearstatBox.x = button_clearstatBox.x + 18
		button_confirmBox.x = button_confirmBox.x + 18--+18
		
		button_recBox.x = button_recBox.x + 19--+19 needed????
	else
		offs_x = 0
	end
	
	
	
end
script.on_load(works_on_first_initialization_this_script) -- срабатывает 1 раз при загрузке скрипта/игры



-- Fade screen to and from a solid color.
--local fadeOut = 1
do
	local color = nil
	local timer = 0

	local fadeIn = 1
	local hold = 1
	local fadeOut = 1
	
	
	script.on_render_event(Defines.RenderEvents.MOUSE_CONTROL, function() end, function() 
		if color then
			Graphics.CSurface.GL_DrawRect(0, 0, 1280, 720, color)
			timer = timer + time_increment_2(true)--time_increment()
			if timer < fadeIn then
				color.a = timer / fadeIn
			elseif timer < fadeIn + hold then
				color.a = 1
			elseif timer < fadeIn + hold + fadeOut then
				color.a = 1 - ((timer - fadeIn - hold) / fadeOut)
			else
				color = nil
				timer = 0
			end
		end
	end)

	function screen_fade(colorArg, fadeInArg, holdArg, fadeOutArg)
        color = colorArg
        color.a = 0;
		fadeIn = fadeInArg or 1
		hold = holdArg or 1
		fadeOut = fadeOutArg or 1
	end
end
-- Make the screen shake for a given amount of time.
do
	local shakeTime = 0
	local shakeTimeCurrent = 0
    local shakeIntensity = 0

    local function gen_shake_pos()
        if shakeTime <= 0 then return 0 end
        return shakeTimeCurrent/shakeTime*(math.random(shakeIntensity) - 1)
    end

	script.on_render_event(Defines.RenderEvents.GUI_CONTAINER, 
	function()
		if shakeTimeCurrent > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(gen_shake_pos(), gen_shake_pos())
		end
	end, function()
		if shakeTimeCurrent > 0 then
			Graphics.CSurface.GL_PopMatrix()
			shakeTimeCurrent = math.max(0, shakeTimeCurrent - time_increment())
		end
	end)

	screen_shake = function(time, intensity)
		shakeTime = time
		shakeTimeCurrent = time
        shakeIntensity = (intensity or 10) + 1
	end
end

function time_increment(useSpeed) --If useSpeed is true, the returned value will properly scale with game speed. Otherwise, the returned value will allow for timers that are independent of framerate, game speed, etc.
	if useSpeed or useSpeed == nil then
		return Hyperspace.FPS.SpeedFactor/16
	elseif Hyperspace.FPS.NumFrames ~= 0 then --At some points this may be equal to zero (such as when the game is being loaded). In such cases we wouldn't want time to pass, and we certainly would not want division by zero.
		return 1/Hyperspace.FPS.NumFrames
	else
		return 0
	end
end

function time_increment_2(useSpeed) --If useSpeed is true, the returned value will properly scale with game speed. Otherwise, the returned value will allow for timers that are independent of framerate, game speed, etc.
	if not Hyperspace.App.world.space.gamePaused and not Hyperspace.App.gui.bAutoPaused and not Hyperspace.App.gui.bPaused and not Hyperspace.App.gui.menu_pause then
		return 0
	elseif useSpeed or useSpeed == nil then
		return Hyperspace.FPS.SpeedFactor/2--4--16
	elseif Hyperspace.FPS.NumFrames ~= 0 then --At some points this may be equal to zero (such as when the game is being loaded). In such cases we wouldn't want time to pass, and we certainly would not want division by zero.
		return 1/Hyperspace.FPS.NumFrames
	else
		return 0
	end
end

script.on_game_event("EVENT_SHAKE_GAME", false, function()
	screen_shake(Hyperspace.metaVariables['game_shake_lvl']) 
end)
script.on_game_event("EVENT_FADE_GAME", false, function()
	screen_fade(Graphics.GL_Color(Hyperspace.metaVariables['game_fade_r']/255, Hyperspace.metaVariables['game_fade_g']/255, Hyperspace.metaVariables['game_fade_b']/255, Hyperspace.metaVariables['game_fade_a']/255), 1.5, 1.5, 1.5)
	--screen_fade(Graphics.GL_Color(1, 1, 1, 1), 1.5, 1.5, 1.5)
end)

script.on_game_event("START_CHECK_SOULREAPER", false, function()
	local SRb = Hyperspace.Blueprints:GetWeaponBlueprint('SOULREAPER1')
	SRb.shots = Hyperspace.playerVariables['soulreaper_shots']
	--weapon.numShots = Hyperspace.playerVariables['soulreaper_shots']
	SRb.power = Hyperspace.playerVariables['soulreaper_power']
	--weapon.requiredPower = Hyperspace.playerVariables['soulreaper_power']
	SRb.damage.iDamage = Hyperspace.playerVariables['soulreaper_iDamage']
	SRb.damage.iSystemDamage = Hyperspace.playerVariables['soulreaper_iSystemDamage']
	SRb.damage.iPersDamage = Hyperspace.playerVariables['soulreaper_iPersDamage']
	SRb.damage.iIonDamage = Hyperspace.playerVariables['soulreaper_iIonDamage']
	SRb.damage.iShieldPiercing = Hyperspace.playerVariables['soulreaper_iShieldPiercing']
	SRb.damage.breachChance = Hyperspace.playerVariables['soulreaper_breachChance']
	SRb.damage.fireChance = Hyperspace.playerVariables['soulreaper_fireChance']
	SRb.damage.bLockdown = false
	SRb.damage.bHullBuster = false
	SRb.cooldown = Hyperspace.playerVariables['soulreaper_cooldown']
end)

-- этот блок отслеживает встраивание усилений. проверяет только те, что включены в список "CAN_BE_HIDDEN_AUGS"
-- присваивает переменной значение 1, если встроено.
script.on_internal_event(Defines.InternalEvents.PRE_CREATE_CHOICEBOX, function(event)
	if event.eventName:find("STORE_INSTALL_") ~= nil then
		for augs in vter2 (Hyperspace.Blueprints:GetBlueprintList("CAN_BE_HIDDEN_AUGS")) do
			if event.eventName == "STORE_INSTALL_"..augs then
				Hyperspace.playerVariables['installed_'..augs] = 1
				--print('installation!'..augs)
			end
		end
	end
end)


function destroy_all_projectiles()
    local projectiles = Hyperspace.App.world.space.projectiles
    for i = 0, projectiles:size() - 1 do
        local projectile = projectiles[i]
        local projName = tostring(projectile.extend.name)
        if not (projName == "" or projName == "nil" or projName == "PDS_SHOT") then
			if ((projectile.damage.iDamage > 0) or (projectile.damage.iShieldPiercing > 0) or (projectile.damage.fireChance > 0.0) or(projectile.damage.breachChance > 0.0) or (projectile.damage.stunChance > 0.0) or (projectile.damage.iIonDamage > 0)or (projectile.damage.iSystemDamage > 0)or (projectile.damage.iPersDamage > 0)or (projectile.damage.bLockdown == true) or(projectile.damage.iStun > 0)) then
				Hyperspace.playerVariables['counter_projectiles_eated'] = Hyperspace.playerVariables['counter_projectiles_eated'] + 1
			end
			projectile.death_animation:Start(false)
			projectile.startedDeath = true
        end
    end
end
script.on_game_event("EVENT_DESTROY_ALL_PROJECTILES", false, destroy_all_projectiles)





script.on_internal_event(Defines.InternalEvents.GET_DODGE_FACTOR, function(ShipManager, value)
	local OtherShipManager = Hyperspace.Global.GetInstance():GetShipManager(1 - ShipManager.iShipId)
	if ShipManager then
		if(ShipManager.droneSystem) then
			local drones = ShipManager.droneSystem.drones
			if not OtherShipManager or OtherShipManager.ship.hullIntegrity.first == 0 or OtherShipManager:HasAugmentation("DEFENSE_SCRAMBLER") == 0 then
				for i = 0, drones:size() - 1 do
					if (drones[i].blueprint.droneImage == "de_drone_svch" and drones[i]:GetPowered()) then
						value = value + 10
					end
				end
			end
		end
	end
	if ShipManager and OtherShipManager then -- снижает увороты другого корабля на 10%
		if ((OtherShipManager:HasAugmentation("ACCURACY_BOOST") > 0) or (OtherShipManager:HasAugmentation("HID_ACCURACY_BOOST") > 0)) then
			value = value - 15--was 10
			if value < 0 then
				value = 0
			end
		end
	end
	return Defines.Chain.Continue, value
end)




function setAutoRepair(speed, ship)
	for system in vter(ship.vSystemList) do
		if not system.bBreached then
			system:PartialRepair(speed, true) --true means that it repairs at speed * the basic autoship repair speed, false means autoRepair * human repair speed (3 times faster than auto)
		end
	end
end
script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(ship)
	local repairAugValue = 0
	if (ship:HasAugmentation("AUTO_REPAIR") > 0 or ship:HasAugmentation("HID_AUTO_REPAIR") > 0) then
		repairAugValue = 1
	end
	repairAugValue = repairAugValue * (Hyperspace.playerVariables['autorepair_speed_multiplied_on_10']/10)--1.4 -- тут можно подкрутить скорость авторемонта 1.0 - это дефолтный ремонт беспилотников
	if repairAugValue ~= 0 then --Prevent repair progress from being "held" when repairAugValue is less than or equal to 0
		setAutoRepair(repairAugValue, ship)
	end
end)



script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(ShipManager)
	local OtherShipManager = Hyperspace.Global.GetInstance():GetShipManager(1 - ShipManager.iShipId)
	local combatdrones = ShipManager.spaceDrones
	if (ShipManager:HasAugmentation("DRONE_SPEED") > 0 or ShipManager:HasAugmentation("HID_DRONE_SPEED") > 0 or ShipManager:HasAugmentation("EXPLOSIVE_REPLICATOR_DRONE_SPEED") > 0) then 
		for combatdrone in vter(combatdrones) do
			if combatdrone and combatdrone.blueprint then
				if combatdrone.blueprint.typeName == "COMBAT" or combatdrone.blueprint.typeName == "DEFENSE" then
					if combatdrone.powered then
						if combatdrone.currentSpeed and combatdrone.weaponCooldown >= 0 then
							combatdrone.weaponCooldown = (combatdrone.weaponCooldown) - 1.0 * Hyperspace.FPS.SpeedFactor / 16.0 -- 1.0 можно регулировать, чем больше тем чаще атакует дрон
							if combatdrone.weaponCooldown <= 0 then
								combatdrone.weaponCooldown = -1
							end
						end
						combatdrone:OnLoop()
					end
				end
			end
		end
	end
	
	if OtherShipManager and OtherShipManager.bDestroyed == false then
		if (OtherShipManager:HasAugmentation("DEFENSE_SCRAMBLER") > 0 or OtherShipManager:HasAugmentation("DEFENSE_SCRAMBLER_HACKING_STUN") > 0) then
			if combatdrones then
				for combatdrone in vter(combatdrones) do
					if combatdrone.powered and combatdrone.blueprint.typeName == "SHIELD" then
						combatdrone.weaponCooldown = 5.0 -- опытным путём полученная цифра, просто дрон ходит без срабатываний эффекта
						--combatdrone.current_angle = math.random(-180,180) -- дрон движется по хаотичной траектории внутри эллипса
						if (math.random(0,1000) < 4) then -- вроде неплохо выглядит, периодически пробивает дрон электричеством
							combatdrone.ionStun = 0.1
						end
						combatdrone:OnLoop()
					end
				end
			end
		end
	end
end)

-- блок кода снизу отслеживает ситуацию когда корабль без топлива прыгает к маяку с магазином, после этого ждал, и пропадала кнопка продажи ресурсов в магазином
-- протестировал - вроде проблема ушла... по сути передача инфы о наличии на маяке магазина между событиями прибытия к магазу и последующим ожиданиям тут...
local timer_x = 0.0
local fixed_store_here = false
local memory_of_previous_beacon_event_name = ''
local memory_of_current_beacon_event_name = ''
local REQUESTER_FOR_EVENT_AFTER_JUMP = ""

local counter_meet_rebel_wave_previous_beacon = 0
--local fuel_count_previous_beacon = 0

local sCurrentJumpTypeOfSector = "CIVILIAN_SECTOR"
local sPreviousJumpTypeOfSector = "CIVILIAN_SECTOR"

local iBeginSectorCostP = 0

local costy = 0
local costy_pot = 0
local overstrong = 0
function jumped_away()
	if playerShip and playerShip.bJumping == true then -- блок фиксирует только прыжки корабля игрока
		Hyperspace.playerVariables['counter_beacon_waiting'] = 0
		Hyperspace.playerVariables['this_beacon_buy_dronesystem'] = 0
		
		if math.random(0,100) < 70 then -- шанс продвинутого ИИ у вражеских кораблей
			Hyperspace.playerVariables['enemy_has_advanced_hack_ai'] = 1
		else
			Hyperspace.playerVariables['enemy_has_advanced_hack_ai'] = 0
		end
		
		sPreviousJumpTypeOfSector = sCurrentJumpTypeOfSector
		sCurrentJumpTypeOfSector = map.currentSector.description.type
		--print(sPreviousJumpTypeOfSector)
		
		costy = 0
		costy_pot = 0
		overstrong = 0
		costy, costy_pot, overstrong = calculate_ship_cost (playerShip)
		Hyperspace.playerVariables['calc_local_strength'] = costy
		Hyperspace.playerVariables['calc_local_strength_pot'] = costy_pot
		Hyperspace.playerVariables['calc_is_player_overstrong'] = overstrong
		
		Hyperspace.playerVariables['jumps_in_current_sector'] = Hyperspace.playerVariables['jumps_in_current_sector'] + 1
		--if Hyperspace.playerVariables['counter_number_of_sector'] < 2 and Hyperspace.playerVariables['jumps_in_current_sector'] == 1 then
		if Hyperspace.playerVariables['jumps_in_current_sector'] == 1 then
			iBeginSectorCostP = costy_pot + 4
			Hyperspace.playerVariables['begin_sector_ship_cost'] = iBeginSectorCostP
			--print('remembed_begin_cost='..iBeginSectorCostP)
		end
		--print('cp'..costy_pot)
		
		fixed_store_here = false
		timer_x = 0
		micro_tick_counter4 = 0.0 -- тоже сброс после прыжка т.к. иначе вспышка может быть ранней на следующем маяке с высокой температурой
		
		Hyperspace.playerVariables['alien_appear_on_this_beacon'] = 0
		Hyperspace.playerVariables['double_reward_event_station'] = 0
		Hyperspace.playerVariables['double_reward_event_ship'] = 0
		Hyperspace.playerVariables['danger_cold'] = 0
		Hyperspace.playerVariables['danger_crystals'] = 0
		Hyperspace.playerVariables['danger_nanites'] = 0
		Hyperspace.playerVariables['danger_radiation'] = 0
		Hyperspace.playerVariables['danger_wild_drones'] = 0
		Hyperspace.playerVariables['danger_ultra_sun'] = 0
		
		Hyperspace.playerVariables['soulreaper_panel_opened'] = 0 --прыжок убирает панель душегуба
		
		counter_meet_rebel_wave_previous_beacon = Hyperspace.playerVariables['counter_meet_rebel_wave'] -- запоминаем значение в момент начала прыжка
		
		check_max_raw_victory_counter()
		
		--micro_tick_counter5 = 0.0 -- погоня орхидов сброс при прыжке
		--Hyperspace.playerVariables['bShowOrchidFleet'] = 0
		
		micro_tick_array = {} -- очистка массива запланированных событий на тики
		anim_tick_array = {}
		--modify_soulreaper()
		map = Hyperspace.App.world.starMap
		if map then
			REQUESTER_FOR_EVENT_AFTER_JUMP = ""
			memory_of_previous_beacon_event_name = memory_of_current_beacon_event_name
			if map and map.currentLoc and map.currentLoc.event then
				memory_of_current_beacon_event_name = map.currentLoc.event.eventName
				if map.currentLoc.event.eventName ~= "" then
					-- эта переменная захватывает имя корневого события маяка к которому происходит прыжок
					REQUESTER_FOR_EVENT_AFTER_JUMP = map.currentLoc.event.eventName
				end
			end
			
			if enemyShip and enemyShip._targetable.hostile == true then
				--print('achillbeback')
				--print('pj'..tostring(playerShip.bJumping))
				--print('ej'..tostring(enemyShip.bJumping))
				Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_ILLBEBACK", false)
			end
		end
		
		define_date()
		
		if playerShip and enemyShip then-- идея DarkGamer возврат за хак-дрона
			if playerShip.hackingSystem then
				if playerShip.hackingSystem.drone.bDead == false and enemyShip.ship.hullIntegrity.first > 0 and enemyShip._targetable.hostile == false then
					if playerShip:HasAugmentation('HID_DRONE_RECOVERY') + playerShip:HasAugmentation('DRONE_RECOVERY') + playerShip:HasAugmentation('FTL_JUMPER_DRONE_RECOVERY')> 0 then
						playerShip:ModifyDroneCount(1)
					end
				end
			end
		end
	end
end


function calculate_ship_cost (current_ship)
	
	--print(Hyperspace:GetSettingValues().difficulty)
	--calc player cost
	local hp_cost = 2
	if Hyperspace.playerVariables['counter_number_of_sector'] <= 3 then
		hp_cost = 2
	elseif Hyperspace.playerVariables['counter_number_of_sector'] <= 6 then
		hp_cost = 3
	else
		hp_cost = 4
	end
	local shipCost = 0
	local shipCostPotential = 0
	local shipIsOverstrong = 0 --2 сверхсильный, 1 нормальный, 0 слабый
	if current_ship then
		
		shipCost = shipCost + current_ship.ship.hullIntegrity.first*hp_cost
		
		for weap in vter(current_ship:GetWeaponList()) do
			if weap.blueprint.desc.cost ~= nil then
				--shipCost = shipCost + weap.blueprint.desc.cost
				shipCost = shipCost + math.floor(weap.blueprint.desc.cost/2)
			end
		end
		for augs in vter(current_ship:GetAugmentationList()) do
			if Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.cost ~= nil then
				--shipCost = shipCost + Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.cost
				shipCost = shipCost + math.floor(Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.cost/2)
			end
		end
		if current_ship.iShipId == 0 then-- оценка встроенных усилений
			local coia = Hyperspace.playerVariables['counter_augments_installed']
			for augs in vter(Hyperspace.Blueprints:GetBlueprintList("CAN_BE_HIDDEN_AUGS")) do
				if Hyperspace.playerVariables['installed_'..augs] == 1 then
					--shipCost = shipCost + Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.cost
					shipCost = shipCost + math.floor(Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.cost/2)
				end
			end
			--print('coia'..coia)
			if coia == 1 then shipCost = shipCost + 20
			elseif coia == 2 then shipCost = shipCost + 50
			elseif coia == 3 then shipCost = shipCost + 90
			elseif coia == 4 then shipCost = shipCost + 140
			elseif coia == 5 then shipCost = shipCost + 200
			elseif coia == 6 then shipCost = shipCost + 270
			elseif coia == 7 then shipCost = shipCost + 350
			elseif coia == 8 then shipCost = shipCost + 440
			elseif coia >= 9 then
				shipCost = shipCost + 440 + 100*(coia-8)
			end
		end
		for crew in vter(current_ship.vCrewList) do
			if crew.blueprint.desc.cost ~= nil then
				if crew.intruder == false then
					shipCost = shipCost + crew.blueprint.desc.cost
				end
			end
		end
		if current_ship.droneSystem ~= nil then
			for drone in vter(current_ship.droneSystem.drones) do
				if drone.blueprint.desc.cost ~= nil then
					--shipCost = shipCost + drone.blueprint.desc.cost
					shipCost = shipCost + math.floor(drone.blueprint.desc.cost/2)
				end
			end
		end
		for i = 1, 20 do
			if current_ship:HasSystem(i) then
				local sysnm = Hyperspace.ShipSystem.SystemIdToName(i)
				local ps = 0
				if current_ship:GetSystem(i) ~= nil then
					ps = current_ship:GetSystem(i).powerState.second
				end
				if sysnm == "reactor" then
					ps = current_ship:GetAvailablePower().first
					if ps == 1 then	shipCost = shipCost + 30
					elseif ps == 2 then	shipCost = shipCost + 60
					elseif ps == 3 then	shipCost = shipCost + 90
					elseif ps == 4 then	shipCost = shipCost + 120
					elseif ps == 5 then	shipCost = shipCost + 150
					elseif ps == 6 then	shipCost = shipCost + 170
					elseif ps == 7 then	shipCost = shipCost + 190
					elseif ps == 8 then	shipCost = shipCost + 210
					elseif ps == 9 then shipCost = shipCost + 230
					elseif ps == 10 then shipCost = shipCost + 250
					elseif ps == 11 then shipCost = shipCost + 275
					elseif ps == 12 then shipCost = shipCost + 300
					elseif ps == 13 then shipCost = shipCost + 325
					elseif ps == 14 then shipCost = shipCost + 350
					elseif ps == 15 then shipCost = shipCost + 375
					elseif ps == 16 then shipCost = shipCost + 405
					elseif ps == 17 then shipCost = shipCost + 435
					elseif ps == 18 then shipCost = shipCost + 465
					elseif ps == 19 then shipCost = shipCost + 495
					elseif ps == 20 then shipCost = shipCost + 525
					elseif ps == 21 then shipCost = shipCost + 560
					elseif ps == 22 then shipCost = shipCost + 595
					elseif ps == 23 then shipCost = shipCost + 630
					elseif ps == 24 then shipCost = shipCost + 665
					elseif ps == 25 then shipCost = shipCost + 700
					elseif ps == 26 then shipCost = shipCost + 740
					elseif ps == 27 then shipCost = shipCost + 780
					elseif ps == 28 then shipCost = shipCost + 820
					elseif ps == 29 then shipCost = shipCost + 860
					elseif ps == 30 then shipCost = shipCost + 900
					elseif ps == 31 then shipCost = shipCost + 945
					elseif ps == 32 then shipCost = shipCost + 990
					elseif ps == 33 then shipCost = shipCost + 1035
					elseif ps == 34 then shipCost = shipCost + 1080
					elseif ps == 35 then shipCost = shipCost + 1125
					elseif ps == 36 then shipCost = shipCost + 1175
					elseif ps == 37 then shipCost = shipCost + 1225
					elseif ps == 38 then shipCost = shipCost + 1275
					elseif ps == 39 then shipCost = shipCost + 1325
					elseif ps == 40 then shipCost = shipCost + 1375
					elseif ps == 41 then shipCost = shipCost + 1430
					elseif ps == 42 then shipCost = shipCost + 1485
					elseif ps == 43 then shipCost = shipCost + 1540
					elseif ps == 44 then shipCost = shipCost + 1595
					elseif ps == 45 then shipCost = shipCost + 1650
					elseif ps == 46 then shipCost = shipCost + 1710
					elseif ps == 47 then shipCost = shipCost + 1770
					elseif ps == 48 then shipCost = shipCost + 1830
					elseif ps == 49 then shipCost = shipCost + 1890
					elseif ps == 50 then shipCost = shipCost + 1950
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "temporal" then
					if ps == 1 then
						shipCost = shipCost + 40
					elseif ps == 2 then
						shipCost = shipCost + 80
					elseif ps == 3 then
						shipCost = shipCost + 160
					elseif ps == 4 then
						shipCost = shipCost + 280
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "clonebay" then
					if ps == 1 then
						shipCost = shipCost + 35
					elseif ps == 2 then
						shipCost = shipCost + 75
					elseif ps == 3 then
						shipCost = shipCost + 125
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "hacking" then
					if ps == 1 then
						shipCost = shipCost + 100
					elseif ps == 2 then
						shipCost = shipCost + 140
					elseif ps == 3 then
						shipCost = shipCost + 210
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "battery" then
					if ps == 1 then
						shipCost = shipCost + 30
					elseif ps == 2 then
						shipCost = shipCost + 80
					elseif ps == 3 then
						shipCost = shipCost + 130
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "mind" then
					if ps == 1 then
						shipCost = shipCost + 50
					elseif ps == 2 then
						shipCost = shipCost + 90
					elseif ps == 3 then
						shipCost = shipCost + 150
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "oxygen" then
					if ps == 1 then
						shipCost = shipCost + 25
					elseif ps == 2 then
						shipCost = shipCost + 45
					elseif ps == 3 then
						shipCost = shipCost + 80
					elseif ps == 4 then
						shipCost = shipCost + 155
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "teleporter" then
					if ps == 1 then
						shipCost = shipCost + 85
					elseif ps == 2 then
						shipCost = shipCost + 125
					elseif ps == 3 then
						shipCost = shipCost + 195
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "pilot" then
					if ps == 1 then
						shipCost = shipCost + 1
					elseif ps == 2 then
						shipCost = shipCost + 25
					elseif ps == 3 then
						shipCost = shipCost + 75
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "medbay" then
					if ps == 1 then
						shipCost = shipCost + 35
					elseif ps == 2 then
						shipCost = shipCost + 75
					elseif ps == 3 then
						shipCost = shipCost + 125
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "shields" then
					if ps == 1 then
						shipCost = shipCost + 120
					elseif ps == 2 then
						shipCost = shipCost + 220
					elseif ps == 3 then
						shipCost = shipCost + 230
					elseif ps == 4 then
						shipCost = shipCost + 260
					elseif ps == 5 then
						shipCost = shipCost + 300
					elseif ps == 6 then
						shipCost = shipCost + 360
					elseif ps == 7 then
						shipCost = shipCost + 440
					elseif ps == 8 then
						shipCost = shipCost + 540
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "artillery" then
					if ps == 1 then
						shipCost = shipCost + 60
					elseif ps == 2 then
						shipCost = shipCost + 100
					elseif ps == 3 then
						shipCost = shipCost + 165
					elseif ps == 4 then
						shipCost = shipCost + 265
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "engines" then
					if ps == 1 then
						shipCost = shipCost + 1
					elseif ps == 2 then
						shipCost = shipCost + 10
					elseif ps == 3 then
						shipCost = shipCost + 30
					elseif ps == 4 then
						shipCost = shipCost + 60
					elseif ps == 5 then
						shipCost = shipCost + 105
					elseif ps == 6 then
						shipCost = shipCost + 170
					elseif ps == 7 then
						shipCost = shipCost + 260
					elseif ps == 8 then
						shipCost = shipCost + 380
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "weapons" then
					if ps == 1 then
						shipCost = shipCost + 20
					elseif ps == 2 then
						shipCost = shipCost + 60
					elseif ps == 3 then
						shipCost = shipCost + 85
					elseif ps == 4 then
						shipCost = shipCost + 120
					elseif ps == 5 then
						shipCost = shipCost + 170
					elseif ps == 6 then
						shipCost = shipCost + 240
					elseif ps == 7 then
						shipCost = shipCost + 340
					elseif ps == 8 then
						shipCost = shipCost + 490
					elseif ps == 9 then
						shipCost = shipCost + 690
					elseif ps == 10 then
						shipCost = shipCost + 990
					elseif ps == 11 then
						shipCost = shipCost + 1390
					elseif ps == 12 then
						shipCost = shipCost + 1890
					elseif ps == 13 then
						shipCost = shipCost + 2490
					elseif ps == 14 then
						shipCost = shipCost + 3190
					elseif ps == 15 then
						shipCost = shipCost + 4090
					elseif ps == 16 then
						shipCost = shipCost + 5190
					elseif ps == 17 then
						shipCost = shipCost + 15190
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "drones" then
					if ps == 1 then
						shipCost = shipCost + 30
					elseif ps == 2 then
						shipCost = shipCost + 40
					elseif ps == 3 then
						shipCost = shipCost + 60
					elseif ps == 4 then
						shipCost = shipCost + 90
					elseif ps == 5 then
						shipCost = shipCost + 130
					elseif ps == 6 then
						shipCost = shipCost + 180
					elseif ps == 7 then
						shipCost = shipCost + 145
					elseif ps == 8 then
						shipCost = shipCost + 225
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "sensors" then
					if ps == 1 then
						shipCost = shipCost + 40
					elseif ps == 2 then
						shipCost = shipCost + 70
					elseif ps == 3 then
						shipCost = shipCost + 120
					else print('unknown syslvl'..sysnm..ps)
					end
				elseif sysnm == "doors" then
					if ps == 1 then
						shipCost = shipCost + 60
					elseif ps == 2 then
						shipCost = shipCost + 95
					elseif ps == 3 then
						shipCost = shipCost + 145
					else print('unknown syslvl'..sysnm..ps)
					end
				end
			end
		end
		--
		if map then
			--print(map.worldLevel)
			local sector_num = map.worldLevel + 1
			if sector_num == 1 then
				if shipCost < 800 then shipIsOverstrong = 0
				elseif shipCost < 1100 then shipIsOverstrong = 1
				else shipIsOverstrong = 2
				end
			elseif sector_num == 2 then
				if shipCost < 900 then shipIsOverstrong = 0
				elseif shipCost < 1200 then shipIsOverstrong = 1
				else shipIsOverstrong = 2
				end
			elseif sector_num == 3 then
				if shipCost < 1000 then	shipIsOverstrong = 0
				elseif shipCost < 1400 then	shipIsOverstrong = 1
				else shipIsOverstrong = 2
				end
			elseif sector_num == 4 then
				if shipCost < 1100 then	shipIsOverstrong = 0
				elseif shipCost < 1550 then shipIsOverstrong = 1
				else shipIsOverstrong = 2
				end
			elseif sector_num == 5 then
				if shipCost < 1200 then shipIsOverstrong = 0
				elseif shipCost < 1700 then	shipIsOverstrong = 1
				else shipIsOverstrong = 2
				end
			elseif sector_num == 6 then
				if shipCost < 1500 then	shipIsOverstrong = 0
				elseif shipCost < 2050 then shipIsOverstrong = 1
				else shipIsOverstrong = 2
				end
			elseif sector_num == 7 then
				if shipCost < 1800 then	shipIsOverstrong = 0
				elseif shipCost < 2450 then	shipIsOverstrong = 1
				else shipIsOverstrong = 2
				end
			elseif sector_num == 8 then
				if shipCost < 2000 then	shipIsOverstrong = 0
				elseif shipCost < 2850 then	shipIsOverstrong = 1
				else shipIsOverstrong = 2
				end
			end
		end
		shipCostPotential = shipCost
		if current_ship.iShipId == 0 then
			shipCostPotential = shipCostPotential + current_ship.currentScrap
			shipCostPotential = shipCostPotential + current_ship.fuel_count * 4
			for carg in vter2 (gui.equipScreen:GetCargoHold()) do
				--print(carg)
				if Hyperspace.Blueprints:GetWeaponBlueprint(carg).desc.cost ~= nil then
					--shipCostPotential = shipCostPotential + Hyperspace.Blueprints:GetWeaponBlueprint(carg).desc.cost
					shipCostPotential = shipCostPotential + math.floor(Hyperspace.Blueprints:GetWeaponBlueprint(carg).desc.cost/2)
				end
				if Hyperspace.Blueprints:GetDroneBlueprint(carg).desc.cost ~= nil then
					--shipCostPotential = shipCostPotential + Hyperspace.Blueprints:GetDroneBlueprint(carg).desc.cost
					shipCostPotential = shipCostPotential + math.floor(Hyperspace.Blueprints:GetDroneBlueprint(carg).desc.cost/2)
				end
			end
		end
		shipCostPotential = shipCostPotential + current_ship:GetDroneCount() * 3
		shipCostPotential = shipCostPotential + current_ship:GetMissileCount() * 2
	end
	return shipCost, shipCostPotential, shipIsOverstrong
end



script.on_internal_event(Defines.InternalEvents.JUMP_LEAVE, jumped_away)
function no_fuel_waiting()
	--print('wait!'..Hyperspace.playerVariables['in_store_now'])
	if (Hyperspace.playerVariables['in_store_now'] > 0) then
		local playerShip = Hyperspace.ships.player
		fixed_store_here = true
	else
		fixed_store_here = false
	end
	if (fixed_store_here) then
		timer_x = 5.0
	end
	Hyperspace.playerVariables['counter_beacon_waiting'] = Hyperspace.playerVariables['counter_beacon_waiting'] + 1
	if Hyperspace.playerVariables['counter_beacon_waiting'] >= 3 then
		Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_ANCHOR", false)
	end
end
script.on_internal_event(Defines.InternalEvents.ON_WAIT, no_fuel_waiting)


function jumped_arrive()

	jump_fuel_check_done = false
	
	if Hyperspace.playerVariables['curse_player_missing'] > 0.0 then
		Hyperspace.playerVariables['curse_player_missing'] = Hyperspace.playerVariables['curse_player_missing'] - 1
	end
	if Hyperspace.playerVariables['curse_enemy_hitting'] > 0.0 then
		Hyperspace.playerVariables['curse_enemy_hitting'] = Hyperspace.playerVariables['curse_enemy_hitting'] - 1
	end
	if Hyperspace.playerVariables['curse_enemy_firing'] > 0.0 then
		Hyperspace.playerVariables['curse_enemy_firing'] = Hyperspace.playerVariables['curse_enemy_firing'] - 1
	end
	if Hyperspace.playerVariables['curse_orchid_shase'] > 0.0 then
		Hyperspace.playerVariables['curse_orchid_shase'] = Hyperspace.playerVariables['curse_orchid_shase'] - 1
	end
	
	--micro_tick_counter5 = 0.0 -- погоня орхидов сброс при прыжке
	Hyperspace.playerVariables['bShowOrchidFleet'] = 0
    -- Можно использовать
end
script.on_internal_event(Defines.InternalEvents.JUMP_ARRIVE, jumped_arrive)

local orchid_fleet = Hyperspace.Resources:CreateImagePrimitiveString('ship/fleet/fleet_1_orchid.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local bShowRoomNumbers = false
script.on_render_event(Defines.RenderEvents.SHIP_SPARKS, function() end, function(ship)
	-- при нажатии на клавишу "INSERT" показывает/прячет номера отсеков кораблей
	if bShowRoomNumbers == true then
		ship = Hyperspace.ships(ship.iShipId)
		local shipGraph = Hyperspace.ShipGraph.GetShipInfo(ship.iShipId)
		for room in vter(shipGraph.rooms) do
			local shape = shipGraph:GetRoomShape(room.iRoomId)
			Graphics.CSurface.GL_SetColor(Graphics.GL_Color(0, 0, 0, 1))
			Graphics.freetype.easy_print(8, shape.x + 5, shape.y + 1, tostring(math.floor(room.iRoomId)))
			Graphics.freetype.easy_print(8, shape.x + 5, shape.y - 1, tostring(math.floor(room.iRoomId)))
			Graphics.freetype.easy_print(8, shape.x + 6, shape.y + 1, tostring(math.floor(room.iRoomId)))
			Graphics.freetype.easy_print(8, shape.x + 6, shape.y - 1, tostring(math.floor(room.iRoomId)))
			Graphics.freetype.easy_print(8, shape.x + 4, shape.y + 1, tostring(math.floor(room.iRoomId)))
			Graphics.freetype.easy_print(8, shape.x + 4, shape.y - 1, tostring(math.floor(room.iRoomId)))
			Graphics.freetype.easy_print(8, shape.x + 4, shape.y, tostring(math.floor(room.iRoomId)))
			Graphics.freetype.easy_print(8, shape.x + 6, shape.y, tostring(math.floor(room.iRoomId)))
			Graphics.CSurface.GL_SetColor(Graphics.GL_Color(0.9, 0.9, 0.9, 1))
			Graphics.freetype.easy_print(8, shape.x + 5, shape.y, tostring(math.floor(room.iRoomId)))
		end
	end
end)


local soulreaper_info = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper_info.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local soulreaper_panel = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper_panel.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local soulreaper_quit_on = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper_quit_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local soulreaper_quit_select2 = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper_quit_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local sr_quit = {text_on = "Закрыть панель управления Душегубом.", x = 1219, y = 203, w = 41, h = 41}
local bToolTipShown = false
local minishift_x = -48
local minishift_y = 6
local arr_allowed_soulbuy = {}
local current_count_of_soul = 0
local soul_percent = 0.0
local pos_y = 0.0
local heigh = 0.0

local soulreaper_on = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local soulreaper2_on = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper2_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false) 
local soulreaper_select2 = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local soulreaper2_select2 = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper2_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)

local soulreaperTipBox = {
	text = "",
	x = 1217,
	y = 621,
	w = 33,
	h = 33
}


--local weap_soulreaper = Hyperspace.Resources:CreateImagePrimitiveString('weapons/soulreaper.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local soulreaper1 = Hyperspace.Resources:GetImageId("weapons/soulreaper1.png")
local soulreaper2 = Hyperspace.Resources:GetImageId("weapons/soulreaper2.png")
local soulreaper3 = Hyperspace.Resources:GetImageId("weapons/soulreaper3.png")
local soulreaper4 = Hyperspace.Resources:GetImageId("weapons/soulreaper4.png")
local soulreaper5 = Hyperspace.Resources:GetImageId("weapons/soulreaper5.png")
local soulreaper6 = Hyperspace.Resources:GetImageId("weapons/soulreaper6.png")
local soulreaper7 = Hyperspace.Resources:GetImageId("weapons/soulreaper7.png")
local cellWidth = 50
local cellHeight = 70
local cell = 1--выбираем 1 кадр анимации орудия (нумерация с 0)
-- Calculte coordinates of the given cell
local cellX = cell*cellWidth % soulreaper1.width
local cellY = math.floor(cell/(soulreaper1.width/cellWidth))*cellHeight
-- Normalize cell coordinates
local normalX1 = cellX/soulreaper1.width
local normalX2 = (cellX + cellWidth)/soulreaper1.width
local normalY1 = cellY/soulreaper1.height
local normalY2 = (cellY + cellHeight)/soulreaper1.height

local mouse_inside_mem_prev = -1
local mouse_inside_mem = -1

function update_state_of_soulreaper()
	local pS = Hyperspace.ships.player
	if pS and gui then
		for weapon in vter(pS:GetWeaponList()) do
			if weapon.blueprint.name:find("SOULREAPER") ~= nil then
				local mem_nm = weapon.blueprint.name
				pS:RemoveItem(weapon.blueprint.name)
				local soulname = "SOULREAPER1"
				if Hyperspace.playerVariables['soulreaper_count_of_upgrades'] < 3 then
					soulname = "SOULREAPER1"
				elseif Hyperspace.playerVariables['soulreaper_count_of_upgrades'] < 6 then
					soulname = "SOULREAPER2"
				elseif Hyperspace.playerVariables['soulreaper_count_of_upgrades'] < 9 then
					soulname = "SOULREAPER3"
				elseif Hyperspace.playerVariables['soulreaper_count_of_upgrades'] < 12 then
					soulname = "SOULREAPER4"
				elseif Hyperspace.playerVariables['soulreaper_count_of_upgrades'] < 15 then
					soulname = "SOULREAPER5"
				elseif Hyperspace.playerVariables['soulreaper_count_of_upgrades'] < 19 then
					soulname = "SOULREAPER6"
				else
					soulname = "SOULREAPER7"
				end
				gui.equipScreen:AddWeapon(Hyperspace.Blueprints:GetWeaponBlueprint(soulname), true, false)
				if mem_nm ~= soulname then
					Hyperspace.Sounds:PlaySoundMix('levelup', 10, false)
					table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("soulreaper/soulreaper_upgraded.png"), time_length = 2200.0, time_length_mem = 2200.0, x = 1227, y = 105, w=192, h=19, fw=16, fh=19, layer = "SPACE_STATUS_up"})
				end
				
				break
			end
		end
	end
	
	if pS then
		for weapon in vter(pS:GetWeaponList()) do
			if weapon.blueprint.name:find("SOULREAPER") ~= nil then
				weapon.blueprint.shots = Hyperspace.playerVariables['soulreaper_shots']
				weapon.numShots = Hyperspace.playerVariables['soulreaper_shots']
				weapon.blueprint.power = Hyperspace.playerVariables['soulreaper_power']
				weapon.requiredPower = Hyperspace.playerVariables['soulreaper_power']
				weapon.blueprint.damage.iDamage = Hyperspace.playerVariables['soulreaper_iDamage']
				weapon.blueprint.damage.iSystemDamage = Hyperspace.playerVariables['soulreaper_iSystemDamage']
				weapon.blueprint.damage.iPersDamage = Hyperspace.playerVariables['soulreaper_iPersDamage']
				weapon.blueprint.damage.iIonDamage = Hyperspace.playerVariables['soulreaper_iIonDamage']
				weapon.blueprint.damage.iShieldPiercing = Hyperspace.playerVariables['soulreaper_iShieldPiercing']
				weapon.blueprint.damage.breachChance = Hyperspace.playerVariables['soulreaper_breachChance']
				weapon.blueprint.damage.fireChance = Hyperspace.playerVariables['soulreaper_fireChance']
				if Hyperspace.playerVariables['soulreaper_bLockdown'] == 1 then
					weapon.blueprint.damage.bLockdown = true--7 душ
				else
					weapon.blueprint.damage.bLockdown = false
				end				
				if Hyperspace.playerVariables['soulreaper_bHullBuster'] == 1 then
					weapon.blueprint.damage.bHullBuster = true-- 5 душ
				else
					weapon.blueprint.damage.bHullBuster = false
				end
				-- Hyperspace.playerVariables['soulreaper_capacity']
				weapon.blueprint.cooldown = Hyperspace.playerVariables['soulreaper_cooldown']
				weapon.baseCooldown = Hyperspace.playerVariables['soulreaper_cooldown']
				weapon.cooldown.second = Hyperspace.playerVariables['soulreaper_cooldown']
				weapon.cooldown.first = 0.1--безопасный сброс кулдауна на 0, иначе творится дичь))
				break
			end
		end
	end
end
function press_button(n)
	--print(n)
	if arr_allowed_soulbuy[n] ~= 1 then -- 1 = all is ok
		Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
	else
		if n == 1 then
			if Hyperspace.playerVariables['soulreaper_power'] == 2 then
				Hyperspace.playerVariables['soulreaper_power'] = 1
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 5
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_power'] == 1 then
				Hyperspace.playerVariables['soulreaper_power'] = 0
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 7
				soul_upgrade_detected()
			end
		elseif n == 2 then
			if Hyperspace.playerVariables['soulreaper_cooldown'] == 14 then
				Hyperspace.playerVariables['soulreaper_cooldown'] = 12
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 5
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 12 then
				Hyperspace.playerVariables['soulreaper_cooldown'] = 10
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 7
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 10 then
				Hyperspace.playerVariables['soulreaper_cooldown'] = 8
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 10
				soul_upgrade_detected()
			end
		elseif n == 3 then
			if Hyperspace.playerVariables['soulreaper_shots'] == 1 then
				Hyperspace.playerVariables['soulreaper_shots'] = 2
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 3
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_shots'] == 2 then
				Hyperspace.playerVariables['soulreaper_shots'] = 3
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 5
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_shots'] == 3 then
				Hyperspace.playerVariables['soulreaper_shots'] = 4
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 7
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_shots'] == 4 then
				Hyperspace.playerVariables['soulreaper_shots'] = 5
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 10
				soul_upgrade_detected()
			end
		elseif n == 4 then
			if Hyperspace.playerVariables['soulreaper_iDamage'] == 1 then
				Hyperspace.playerVariables['soulreaper_iDamage'] = 2
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 7
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_iDamage'] == 2 then
				Hyperspace.playerVariables['soulreaper_iDamage'] = 3
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 10
				soul_upgrade_detected()
			end
		elseif n == 5 then
			if Hyperspace.playerVariables['soulreaper_iSystemDamage'] == 0 then
				Hyperspace.playerVariables['soulreaper_iSystemDamage'] = 1
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 5
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_iSystemDamage'] == 1 then
				Hyperspace.playerVariables['soulreaper_iSystemDamage'] = 2
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 7
				soul_upgrade_detected()
			end
		elseif n == 6 then
			if Hyperspace.playerVariables['soulreaper_iPersDamage'] == 0 then
				Hyperspace.playerVariables['soulreaper_iPersDamage'] = 1
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 3
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_iPersDamage'] == 1 then
				Hyperspace.playerVariables['soulreaper_iPersDamage'] = 2
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 5
				soul_upgrade_detected()
			end
		elseif n == 7 then
			if Hyperspace.playerVariables['soulreaper_iIonDamage'] == 0 then
				Hyperspace.playerVariables['soulreaper_iIonDamage'] = 1
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 5
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_iIonDamage'] == 1 then
				Hyperspace.playerVariables['soulreaper_iIonDamage'] = 2
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 6
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_iIonDamage'] == 2 then
				Hyperspace.playerVariables['soulreaper_iIonDamage'] = 3
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 7
				soul_upgrade_detected()
			end
		elseif n == 8 then
			if Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 0 then
				Hyperspace.playerVariables['soulreaper_iShieldPiercing'] = 1
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 1
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 1 then
				Hyperspace.playerVariables['soulreaper_iShieldPiercing'] = 2
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 3
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 2 then
				Hyperspace.playerVariables['soulreaper_iShieldPiercing'] = 3
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 5
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 3 then
				Hyperspace.playerVariables['soulreaper_iShieldPiercing'] = 4
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 7
				soul_upgrade_detected()
			end
		elseif n == 9 then
			if Hyperspace.playerVariables['soulreaper_breachChance'] == 1 then
				Hyperspace.playerVariables['soulreaper_breachChance'] = 4
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 3
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_breachChance'] == 4 then
				Hyperspace.playerVariables['soulreaper_breachChance'] = 7
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 3
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_breachChance'] == 7 then
				Hyperspace.playerVariables['soulreaper_breachChance'] = 10
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 3
				soul_upgrade_detected()
			end
		elseif n == 10 then
			if Hyperspace.playerVariables['soulreaper_fireChance'] == 1 then
				Hyperspace.playerVariables['soulreaper_fireChance'] = 4
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 3
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_fireChance'] == 4 then
				Hyperspace.playerVariables['soulreaper_fireChance'] = 7
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 3
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_fireChance'] == 7 then
				Hyperspace.playerVariables['soulreaper_fireChance'] = 10
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 3
				soul_upgrade_detected()
			end
		elseif n == 11 then
			if Hyperspace.playerVariables['soulreaper_bLockdown'] == 0 then
				Hyperspace.playerVariables['soulreaper_bLockdown'] = 1
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 7
				soul_upgrade_detected()
			end
		elseif n == 12 then
			if Hyperspace.playerVariables['soulreaper_bHullBuster'] == 0 then
				Hyperspace.playerVariables['soulreaper_bHullBuster'] = 1
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 5
				soul_upgrade_detected()
			end
		elseif n == 13 then
			if Hyperspace.playerVariables['soulreaper_capacity'] <= 5 then
				Hyperspace.playerVariables['soulreaper_capacity'] = 7
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 2
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_capacity'] <= 7 then
				Hyperspace.playerVariables['soulreaper_capacity'] = 10
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 3
				soul_upgrade_detected()
			end
		end
	end
end
function soul_upgrade_detected()
	Hyperspace.playerVariables['soulreaper_count_of_upgrades'] = Hyperspace.playerVariables['soulreaper_count_of_upgrades'] + 1
	Hyperspace.Sounds:PlaySoundMix('upgradeSystem', 5, false)
	update_state_of_soulreaper()
end
script.on_internal_event(Defines.InternalEvents.ON_MOUSE_L_BUTTON_DOWN, function(x, y)
	if Hyperspace.playerVariables['soulreaper_in_slots'] > 0 then
		if Hyperspace.playerVariables['soulreaper_panel_opened'] == 1 then
			for i = 1, 13 do
				if mouseInside(sr_b[i]) then
					press_button(i)
					break
				end
			end
			if mouseInside(sr_quit) or mouseInside(soulreaperTipBox) then
				--Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'SWITCH_SOULREAPER_PANEL',false,-1)
				Hyperspace.playerVariables['soulreaper_panel_opened'] = 0
				Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
			end
		else
			if mouseInside(soulreaperTipBox) then
				Hyperspace.playerVariables['soulreaper_panel_opened'] = 1
				Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
			end
		end
	end
	
	if varr.TABBED_WINDOW_is_visible == true then
		if mouseInside(button_clearstatBox) then
			
			if varr.prepare_to_clear_stat == false then
				varr.prepare_to_clear_stat = true
				Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
			else
				varr.prepare_to_clear_stat = false
				Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
			end
		elseif mouseInside(button_recBox) then
			switch_rec_statistic()
		end
		
		if varr.prepare_to_clear_stat == true then
			if mouseInside(button_confirmBox) then
				ClearStat()
				Hyperspace.Sounds:PlaySoundMix('actinophrysboom1', 10, false)
				varr.prepare_to_clear_stat = false
			end
		end
		
	end
	
	if varr.prepare_to_explode_hack == true then
		if mouseInside({x = 106 + varr.x_offset_of_tips_artillery_system, y = 671, w = 22, h = 22}) and gui and gui.menu_pause == false then
			playerShip.hackingSystem:BlowHackingDrone()
			if allowed_hack_explosion_on_cooldown == true then
				playerShip.hackingSystem.iLockCount = 1
				playerShip.hackingSystem.lockTimer.running = true
				playerShip.hackingSystem.lockTimer.currTime = playerShip.hackingSystem.lockTimer.currGoal-1.0
			end
		end
	end
	
	if varr.prepare_to_switch_auto_drone_work == true then
		if mouseInside({x = 141 + varr.x_offset_of_tips_drone_system, y = 671, w = 44, h = 22}) and gui and gui.menu_pause == false then
			if Hyperspace.metaVariables['enable_auto_drone_work'] == 1 then
				Hyperspace.metaVariables['enable_auto_drone_work'] = 0
				Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
			else
				Hyperspace.metaVariables['enable_auto_drone_work'] = 1
				Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
			end
		end
	end
end)

-- Если нажать HOME выдаст в лог текущую стоимость корабля игрока (и, если есть, то врага тоже)
script.on_internal_event(Defines.InternalEvents.ON_KEY_DOWN, function(key)
	if key == Defines.SDL.KEY_HOME then
		
		local cost = 0
		local costp = 0
		if playerShip then
			cost, costp, _ = calculate_ship_cost (playerShip)
			print('player ship cost = '..cost..' ('..costp..')')
		end
		if enemyShip and enemyShip.ship.hullIntegrity.first > 0 then
			cost, costp, _ = calculate_ship_cost (enemyShip)
			print('enemy ship cost = '..cost..' ('..costp..')')
		end
	end
end)

-- Если нажать INSERT то переключит режим показывания номеров отсеков (кораблей игрока и врагов)
script.on_internal_event(Defines.InternalEvents.ON_KEY_DOWN, function(key)
	if key == Defines.SDL.KEY_INSERT then--KEY_KP0 не работает чего-то
		
		
		
		
		if (bShowRoomNumbers == true) then
			bShowRoomNumbers = false
		else
			bShowRoomNumbers = true
			--playerShip:CreateSpaceDrone(Hyperspace.Blueprints:GetDroneBlueprint("DRONE_BLINK_ATK"))
			--playerShip:CreateSpaceDrone("BOSS_HULL_STOCK")
		end
    end
end)



-- для разброса точки попадания. не используется.
-- local function randomPointRadiusK(origin, radius)
    -- local theta = 2 * math.pi * math.random()
    -- local r = math.random() + math.random()
    -- r = radius * (r > 1 and 2 - r or r)
    -- return Hyperspace.Pointf(origin.x + r * math.cos(theta), origin.y + r * math.sin(theta))
-- end

-- дрон выцеливающий слабый экипаж. выцеливает норм, но дрон резко дергается при старте движения и кружится иногда. на геймплей не влияет.
local room_target_ide = -1
local room_target_idp = -1
script.on_internal_event(Defines.InternalEvents.DRONE_FIRE, function(projectile, spacedrone)
	if not spacedrone.heading then
		return Defines.Chain.CONTINUE
	end
	
	if spacedrone.lifespan < 0.0 or (spacedrone.lifespan > 2.0 and spacedrone.lifespan < 999999) then
		print('detected strange drone:'..spacedrone.blueprint.name..', lifespan='..spacedrone.lifespan)
	end
	-- lifespan - это кол-во оставшихся атак. у временных дронов 0-1-2, у обычных - огромное число (не меняющееся)
	
	
	if (spacedrone.blueprint.name == "DE_DRONE_LIGHT_2_SMART1" or spacedrone.blueprint.name == "DE_DRONE_LIGHT_2_SMART2" or spacedrone.blueprint.name == "DE_DRONE_LIGHT_2_SMART3") then
		local chance_of_targetting = 100 --30/45/60 можно подправить
		if spacedrone.blueprint.name == "DE_DRONE_LIGHT_2_SMART1" then
			chance_of_targetting = 50
		elseif spacedrone.blueprint.name == "DE_DRONE_LIGHT_2_SMART2" then
			chance_of_targetting = 65
		elseif spacedrone.blueprint.name == "DE_DRONE_LIGHT_2_SMART3" then
			chance_of_targetting = 80
		end
		enemyShip = Hyperspace.ships.enemy
		playerShip = Hyperspace.ships.player
		GSIe = Hyperspace.ShipGraph.GetShipInfo(1)
		GSIp = Hyperspace.ShipGraph.GetShipInfo(0)
		if (math.random(0,100) < chance_of_targetting) then -- тут определяет шанс, что дрон будет выцеливать экипаж
			if spacedrone.iShipId == 0 then
				if enemyShip and enemyShip._targetable.hostile then
					--local min_crew_hp = 999999
					room_target_ide = -1
					for i = 0, enemyShip.vCrewList:size() - 1 do
						local crew = enemyShip.vCrewList[i]
						if crew.intruder == false then
							if(room_target_ide == -1)then
								room_target_ide = crew.iRoomId
							end
							if (math.random(0,100) < 33) then
								room_target_ide = crew.iRoomId
							end
						end
					end
				else
					room_target_ide = -1
				end
				if room_target_ide == -1 then
					room_target_ide = GSIe.rooms[math.random(0, GSIe.rooms:size()-1)].iRoomId
				end
				if room_target_ide == -1 then
					room_target_ide = 0
				end
				-- выцеливает норм, но дрон резко дергается при старте движения и кружится иногда. на геймплей не влияет.
				spacedrone.targetLocation = enemyShip:GetRoomCenter(room_target_ide)
			elseif spacedrone.iShipId == 1 then
				if playerShip and enemyShip and enemyShip._targetable.hostile then
					--local min_crew_hp = 999999
					room_target_idp = -1
					for i = 0, playerShip.vCrewList:size() - 1 do
						local crew = playerShip.vCrewList[i]
						if crew.intruder == false then
							if(room_target_ide == -1)then
								room_target_ide = crew.iRoomId
							end
							if (math.random(0,100) < 33) then
								room_target_ide = crew.iRoomId
							end
						end
					end
				else
					room_target_idp = -1
				end
				if room_target_idp == -1 then
					room_target_idp = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
				end
				if room_target_idp == -1 then
					room_target_idp = 0
				end
				spacedrone.targetLocation = playerShip:GetRoomCenter(room_target_idp)
			end
		else
			if spacedrone.iShipId == 0 then
				room_target_ide = GSIe.rooms[math.random(0, GSIe.rooms:size()-1)].iRoomId
				spacedrone.targetLocation = enemyShip:GetRoomCenter(room_target_ide)
			elseif spacedrone.iShipId == 1 then
				room_target_idp = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
				spacedrone.targetLocation = playerShip:GetRoomCenter(room_target_idp)
			end
		end
	end
end)




-- Эта функция позволяет отступать от присылаемой сюда точки на расстояние radius_value в случайном направлении по кругу
local shift_x = 0.0
function GetRandomPointShift(incoming_point, radius_value)
	shift_x = math.random(-radius_value, radius_value)
	incoming_point.x = incoming_point.x + shift_x
	if math.random(0,100)<50 then
		incoming_point.y = incoming_point.y + math.sqrt(radius_value*radius_value - shift_x*shift_x)
	else
		incoming_point.y = incoming_point.y - math.sqrt(radius_value*radius_value - shift_x*shift_x)
	end
	--print('x'..incoming_point.x..',y'..incoming_point.y)
	return incoming_point
end


local mini_fire_time_counter = 0.0
local neededFullVision = false
local memory_of_state_player_PE = 0
local micro_tick_counter = 0.0
local micro_tick_counter2 = 0.0
local micro_tick_counter3 = 0.0
local micro_tick_counter4 = 0.0
local micro_tick_counter5 = 0.0
local micro_tick_counter6 = 0.0
local micro_tick_counter7 = 0.0
local collected_tip_text = ""
local bRemembedStarPositions = false
local map_beacon_locations_mem_array_x = {}
local map_beacon_locations_mem_array_y = {}
local fBeacon_shaking = 1.0
local iKey = 1
local fworldlevel_memory = -1.0
local shake_amplitude = 1.0
local star_pos_change_value = 50.0
local star_pos_change_chance = 10
local indx = 0
local indx2 = 0
local indx3 = 0
local search_word = ""


function play_random_underhull_punch_sound()
	if math.random(0,100)<33 then
		Hyperspace.Sounds:PlaySoundMix('under_hull_punch1', 8, false)
	elseif math.random(0,100)<55 then
		Hyperspace.Sounds:PlaySoundMix('under_hull_punch2', 8, false)
	else
		Hyperspace.Sounds:PlaySoundMix('under_hull_punch3', 8, false)
	end
end

local playerHasSoulReaperInSlots = false
local playerHasSoulReaperInSlots_previous_tick = false
local bSoulreaperPanelStateMemory = false

function ThereIsAtLeastOneNoAlienEnemyBoarderOnPlayerShip()
	if playerShip then
		for crew in vter5(playerShip.vCrewList) do
			if crew.currentShipId == 0 and crew.intruder == true and crew.blueprint.name ~= "alien" then
				--print(crew.blueprint.name)
				return true
			end
		end
	end
	
	return false
end

local jump_fuel_check_done = false
local mem_bPlayerIsJumping = false
local mem_fuel = 0
function check_arsenal_on_tick_processes()

	if Hyperspace.App.menu.shipBuilder.bOpen == true then -- при заходе в ангар для выбора корабля включает запись статистики полётов
		Hyperspace.metaVariables['rec_sector_statistic'] = 1 -- рестарт без захода в аграр не меняет настройку записи
	end
	
	playerShip = Hyperspace.ships.player
	world = Hyperspace.App.world
	gui = Hyperspace.App.gui
	if world then
		map = world.starMap
		--print(world.currentDifficulty)
	else	
		map = nil
	end
	
	
	-- эта простая вещь отключает кнопку усилений и трюм, если мы находимся в дефолтной опасной среде или особенной опасной среде
	if gui and isReallyDangerousEnvironment() == true then
		gui.upgradeButton.bActive = false
		Hyperspace.playerVariables['is_really_safe_place'] = 0
		--varr.osa_on_playership = false
	else
		local no_osa_boarders_found = false
		local osa_boarders_found = false
		if playerShip then
			for crew in vter(playerShip.vCrewList) do
				if crew.intruder == true and crew.health.first > 0.0 then
					if crew.blueprint.name == "osa" or crew.blueprint.name == "osae" then
						osa_boarders_found = true
					else
						no_osa_boarders_found = true
					end
				end
			end
		end
		
		if osa_boarders_found == true then
			varr.enemy_osa_on_playership = true
		else
			varr.enemy_osa_on_playership = false
		end
		
		if no_osa_boarders_found == true then
			gui.upgradeButton.bActive = false
			Hyperspace.playerVariables['is_really_safe_place'] = 0
		elseif enemyShip and enemyShip._targetable.hostile == true then
			gui.upgradeButton.bActive = false
			Hyperspace.playerVariables['is_really_safe_place'] = 0
		else
			gui.upgradeButton.bActive = true
			Hyperspace.playerVariables['is_really_safe_place'] = 1
		end
	end
	
	
	if map and map.bSecretSector==true then
		Hyperspace.playerVariables['dont_remember_last_sector'] = 1
		--print(tostring(map.bSecretSector))
	end
	
	if jump_fuel_check_done == false and playerShip then
		if mem_bPlayerIsJumping == false and playerShip.bJumping == true then
			if (mem_fuel - playerShip.fuel_count) >= 5 then
				Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_LONGJUMP", false)
			end
			--print ('delta='..(mem_fuel - playerShip.fuel_count))
			jump_fuel_check_done = true
		end
		mem_bPlayerIsJumping = playerShip.bJumping
		mem_fuel = playerShip.fuel_count
	end
	

	if Hyperspace.App.menu.shipBuilder.bOpen == true or Hyperspace.App.menu.bOpen == true then -- останавливаем выполнение всех тик-процессов
		if gui then
			gui.bPaused = false -- в меню и ангаре автоматически теряется пауза игрока. для ачивки важно
		end
		-- НИЧЕГО НЕ ДЕЛАТЬ ТУТ
	else
		enemyShip = Hyperspace.ships.enemy
		GSIe = Hyperspace.ShipGraph.GetShipInfo(1)
		GSIp = Hyperspace.ShipGraph.GetShipInfo(0)
		
		if gui and gui.bPaused == true then
			Hyperspace.playerVariables['used_tactical_pause'] = 1
		end
		
		if playerShip and playerShip.bJumping == false and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			Hyperspace.playerVariables['calc_ship_hp'] = playerShip.ship.hullIntegrity.first
			--print(Hyperspace.playerVariables['calc_ship_hp'])
			
			-- если маяк к которому мы только что прыгнули имеет корневое событие с таким именем, то делаем то-то...
			-- если будут добавляться события с этими особыми средами, то они должны быть добавлены сюда ниже
			if (REQUESTER_FOR_EVENT_AFTER_JUMP == "ICE_FIELD_FIGHT") then
				Hyperspace.playerVariables['danger_crystals'] = 1
				Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'ICE_FIELD_FIGHT_BACKLOAD',false,-1) -- запуск блока движущихся на фоне кристаллов
			elseif REQUESTER_FOR_EVENT_AFTER_JUMP == "COLD_FIELD_FIGHT" or REQUESTER_FOR_EVENT_AFTER_JUMP == "COLD_FIELD_CRYSTAL_FIGHT" then
				Hyperspace.playerVariables['danger_cold'] = 1
			elseif REQUESTER_FOR_EVENT_AFTER_JUMP == "DRONE_FIELD_PIRATE" or REQUESTER_FOR_EVENT_AFTER_JUMP == "DRONE_FIELD_REBEL" or REQUESTER_FOR_EVENT_AFTER_JUMP == "DRONE_FIELD_HAL" then
				Hyperspace.playerVariables['danger_wild_drones'] = 1
			elseif REQUESTER_FOR_EVENT_AFTER_JUMP == "NANITE_FIELD_PIRATE" or REQUESTER_FOR_EVENT_AFTER_JUMP == "NANITE_FIELD_OLD_PIRATE" then
				Hyperspace.playerVariables['danger_nanites'] = 1
			elseif REQUESTER_FOR_EVENT_AFTER_JUMP == "RADIOACTIVE_MINING" then
				Hyperspace.playerVariables['danger_radiation'] = 1
			elseif REQUESTER_FOR_EVENT_AFTER_JUMP == "ULTRA_SUN_FIGHT" then
				Hyperspace.playerVariables['danger_ultra_sun'] = 1
			end
			REQUESTER_FOR_EVENT_AFTER_JUMP = ""
			
			
			
			if playerShip.ship.hullIntegrity.first <= 0 and map then
				if map.currentSector.level == 0 then
					--print('00')
					Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_BAD_BEGIN", false)
				elseif map.currentSector.level >= 6 then
					--print('df')
					Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_BAD_END", false)
				end
				--if enemyShip and enemyShip.ship.hullIntegrity.first > 0 and enemyShip.bAutomated == false then
				if enemyShip and enemyShip.ship.hullIntegrity.first > 0 then
					local nm = enemyShip.myBlueprint.blueprintName
					if nm ~= "BOSS_3_EASY_DLC" and nm ~= "BOSS_3_NORMAL_DLC" and nm ~= "BOSS_3_HARD_DLC" and nm ~= "BOSS_3_EASY" and nm ~= "BOSS_3_NORMAL" and nm ~= "BOSS_3_HARD" and nm ~= "BOSS_BLACK_WING" then
						local bHasPlayersBoarders = false
						for crew in vter(enemyShip.vCrewList) do
							if crew.intruder == true and crew.health.first > 0.0 then
								bHasPlayersBoarders = true
							end
						end
						if bHasPlayersBoarders == true then
							--print('ach new ship')
							Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_NEW_SHIP", false)
						end
					end
				end
			end
		end
		
		if enemyShip and GSIe then
			local bAllRoomCellsAreBreached = true
			local repairables = enemyShip.ship:GetHullBreaches(true)
			local ccc = 0
			for room in vter(GSIe.rooms) do
				if bAllRoomCellsAreBreached == true then
					local bThisRoomBreached = false
					for repa in vter2(repairables) do
						if repa.roomId == room.iRoomId then
							bThisRoomBreached = true
						end
					end
					if bThisRoomBreached == false then
						bAllRoomCellsAreBreached = false
					end
				end
			end
			if bAllRoomCellsAreBreached == true then
				--print ('yep ach') протестировал на беспилотниках 2 из 2 сработало. думаю всё ок тут.
				Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_BREACH_ENEMY", false)
			end
			
			
			-- блок дающий противникам возможность вести более разумное использование хак-дрона
			if Hyperspace.playerVariables['enemy_has_advanced_hack_ai'] == 1 then
				if enemyShip.hackingSystem then
					if enemyShip:GetDroneCount() >= 2 then
						if enemyShip.hackingSystem.queuedSystem ~= nil and enemyShip.hackingSystem.queuedSystem.healthState.first == 0 then
							--print('targ-dam')
							enemyShip.hackingSystem.queuedSystem = nil -- это для того чтоб не запускал дронов в уже сломанные системы. не идиот же...
						end
					
						if enemyShip.hackingSystem.drone.bDead == false and enemyShip.hackingSystem.drone.arrived == true and enemyShip.hackingSystem.currentSystem ~= nil then
							if enemyShip.hackingSystem.currentSystem.healthState.first == 0 then
								enemyShip.hackingSystem:BlowHackingDrone()
								if allowed_hack_explosion_on_cooldown == true then
									enemyShip.hackingSystem.iLockCount = 1
									enemyShip.hackingSystem.lockTimer.running = true
									enemyShip.hackingSystem.lockTimer.currTime = enemyShip.hackingSystem.lockTimer.currGoal-1.0
								end
							end
						end
					end
				end
			end
		end
		
		
		-- блок по сути дублирует работу усиления Исцеляющий телепорт, нужен чтобы корректно работал возврат экипажа с уничтоженного корабля (хил не происходил)
		if playerShip and playerShip:HasSystem(9) and (playerShip:HasAugmentation("TELEPORT_HEAL") > 0 or playerShip:HasAugmentation("HID_TELEPORT_HEAL") > 0 or playerShip:HasAugmentation("BACKUP_DNA_TELEPORT_HEAL") > 0) then
			for crew in vter(playerShip.vCrewList) do
				if crew.intruder == false and crew.crewAnim.status == 6 then
					crew:DirectModifyHealth(999)
				end
			end
		end
		if enemyShip and enemyShip:HasSystem(9) and enemyShip:HasAugmentation("TELEPORT_HEAL") > 0 then
			for crew in vter(enemyShip.vCrewList) do
				if crew.intruder == false and crew.crewAnim.status == 6 then
					crew:DirectModifyHealth(999)
				end
			end
		end
		
		mini_fire_time_counter = mini_fire_time_counter + Hyperspace.FPS.SpeedFactor
		
		-- блок позволяет переключать режим дронов игрока - авто/ручной
		if (mini_fire_time_counter >= 20.0) then
			if playerShip then
				for crew in vter(playerShip.vCrewList) do
					if crew:IsDrone() == true and crew.intruder == false then
						
						--print(crew.blueprint.name)
						
						if crew.blueprint.name ~= 'boarder_ftl_disabler' and crew.blueprint.name ~= 'repair_hal' and crew.blueprint.name ~= 'battle_hal' then
							if Hyperspace.metaVariables['enable_auto_drone_work'] == 0 then
								crew.extend:GetDefinition().noAI = true
								crew.extend:GetDefinition().controllable = true
							else
								crew.extend:GetDefinition().noAI = false
								crew.extend:GetDefinition().controllable = false
							end
						end
					end
				end
			end
			-- if enemyShip then
				-- for crew in vter(enemyShip.vCrewList) do
					-- if crew:IsDrone() == true and crew.intruder == true then
						
						-- print(crew.blueprint.name)
						
						-- if Hyperspace.metaVariables['enable_auto_drone_work'] == 0 then
							-- crew.extend:GetDefinition().noAI = true
							-- crew.extend:GetDefinition().controllable = true
							-- crew.extend:GetDefinition().selectable = true
						-- else
							-- crew.extend:GetDefinition().noAI = false
							-- crew.extend:GetDefinition().controllable = false
							-- crew.extend:GetDefinition().selectable = false
						-- end
					-- end
				-- end
			-- end
		end
		
		-- позволяет легендарному человеку ордена разжигать имеющийся огонь на любом корабле
		if (mini_fire_time_counter >= 20.0) then -- если нужна большая интенсивность разжигания огня, надо уменьшить значение.
			mini_fire_time_counter = 0.0
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				if playerShip then
					for crew in vter(playerShip.vCrewList) do
						if(crew.blueprint.name == "order_human_legendary")then
							-- print(playerShip:GetSystemInRoom(crew.iRoomId).name)
							-- print(playerShip:GetSystemInRoom(crew.iRoomId).powerState.second)
							for room2 in vter2(GSIp.rooms) do
								if room2 then
									if crew.currentShipId == 0 and crew.iRoomId == room2.iRoomId then
										local bNeededFire = false
										for doors in vter3(GSIp:GetDoors(room2.iRoomId)) do
											if doors then
												if doors.iRoom1~= -1 and doors.iRoom1 ~= room2.iRoomId and playerShip.GetFireCount(playerShip, doors.iRoom1) > 0 then
													bNeededFire = true
												end
												if doors.iRoom2~= -1 and doors.iRoom2 ~= room2.iRoomId and playerShip.GetFireCount(playerShip, doors.iRoom2) > 0 then
													bNeededFire = true
												end
												if crew.iOnFire > 0 then
													bNeededFire = true
												end
											end
										end
										if bNeededFire then
											if(crew.extend.lastRoom == crew.iRoomId) then
												if math.random(0,100)<50 then
													playerShip:StartFire(crew.iRoomId)
												end
											end
											crew.extend.lastRoom = crew.iRoomId
										end
									end
								end
							end
						end
						
					end
				end
				if enemyShip then
					for crew in vter(enemyShip.vCrewList) do
						if(crew.blueprint.name == "order_human_legendary")then
							for room in vter2(GSIe.rooms) do
								if room then
									if crew.currentShipId == 1 and crew.iRoomId == room.iRoomId then
										local bNeededFire = false
										for doors in vter3(GSIe:GetDoors(room.iRoomId)) do
											if doors then
												if doors.iRoom1~= -1 and doors.iRoom1 ~= room.iRoomId and enemyShip.GetFireCount(enemyShip, doors.iRoom1) > 0 then
													bNeededFire = true
												end
												if doors.iRoom2~= -1 and doors.iRoom2 ~= room.iRoomId and enemyShip.GetFireCount(enemyShip, doors.iRoom2) > 0 then
													bNeededFire = true
												end
												if crew.iOnFire > 0 then
													bNeededFire = true
												end
											end
										end
										if bNeededFire then
											if(crew.extend.lastRoom == crew.iRoomId) then
												if math.random(0,100)<50 then
													enemyShip:StartFire(crew.iRoomId)
												end
											end
											crew.extend.lastRoom = crew.iRoomId
										end
									end
								end
							end
						end
					end
				end
			end
		end
		
		-- код для легендарного слёрма и его способности полного обзора отсеков кораблей при любых условиях
		neededFullVision = false
		if playerShip then
			for crew in vter(playerShip.vCrewList) do
				if(neededFullVision == false and crew.intruder == false and crew.blueprint.name == "slig_legendary")then
					neededFullVision = true
				end
			end
		end
		if neededFullVision == false then
			if enemyShip then
				for crew in vter(enemyShip.vCrewList) do
					if(neededFullVision == false and crew.intruder == true and crew.blueprint.name == "slig_legendary")then
						neededFullVision = true
					end
				end
			end
		end
		if neededFullVision then
			if GSIp then
				for room in vter2(GSIp.rooms) do
					if room then
						room.bBlackedOut = false
					end
				end
			end
			if enemyShip and GSIe and enemyShip._targetable.hostile then
				for room in vter2(GSIe.rooms) do
					if room then
						room.bBlackedOut = false
					end
				end
			end
		end
		
		-- таймер. нужен для отслеживания переменной нахождения в магазине
		if (timer_x > 0.0) then
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				timer_x = timer_x - Hyperspace.FPS.SpeedFactor
				if (timer_x <= 0.0) then
					if (gui and gui.upgradeButton.bActive) then
						Hyperspace.playerVariables['in_store_now'] = 2
					else
						Hyperspace.playerVariables['in_store_now'] = 0 -- если среда стала опасной, значит магазин уничтожен на этом маяке повстанцами
					end
					timer_x = 0.0
				end
			end
		end
		
		-- это усиление демаскирует другой корабль. работает у врага и игрока
		if(enemyShip and playerShip) then
			if (playerShip:HasAugmentation("ANTICLOAK_FIELD") > 0 or playerShip:HasAugmentation("HID_ANTICLOAK_FIELD") > 0) then
				if (enemyShip:HasSystem(10)) then
					enemyShip:GetSystem(10):LockSystem(1)
				end
			end
			if (enemyShip:HasAugmentation("ANTICLOAK_FIELD") > 0) then
				if (playerShip:HasSystem(10)) then
					playerShip:GetSystem(10):LockSystem(1)
				end
			end
		end
		
		-- добавляет в FTL-JAMMER лимит = -1 на двигатель. работает у врага и игрока
		if (enemyShip and playerShip) then
			if (playerShip:HasAugmentation("FTL_JAMMER") > 0 or playerShip:HasAugmentation("HID_FTL_JAMMER") > 0 or playerShip:HasAugmentation("FTL_BOOSTER_FTL_JAMMER") > 0) then
				if (enemyShip:HasSystem(1)) then
					if enemyShip:GetSystem(1).powerState.second > 1.0 then
						enemyShip:GetSystem(1):SetPowerCap(enemyShip:GetSystem(1).powerState.second - 1)
					end
				end
			end
			if (enemyShip:HasAugmentation("FTL_JAMMER") > 0) then
				if (playerShip:HasSystem(1)) then
					if playerShip:GetSystem(1).powerState.second > 1.0 then
						playerShip:GetSystem(1):SetPowerCap(playerShip:GetSystem(1).powerState.second - 1)
					end
				end
			end
		end
		
		-- отслеживает наличие душегуба в слотах игрока
		if playerShip then
			playerHasSoulReaperInSlots = false
			local count_of_weap_3_power = 0
			for player_weap in vter(playerShip:GetWeaponList()) do
				if player_weap.blueprint.name:find("SOULREAPER") ~= nil then
					if playerHasSoulReaperInSlots == false then
						playerHasSoulReaperInSlots = true
					end
				end
				
				if player_weap.blueprint.name:find("LIGHT_PRE_IGNITER") ~= nil then
					if (playerShip:HasAugmentation("WEAPON_PREIGNITE_AUTO_COOLDOWN") + playerShip:HasAugmentation("AUTO_COOLDOWN")) >= 3 then
						Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_MAX_SPEED", false)
					end
				end
				if player_weap.requiredPower >= 3 and player_weap.powered == true then
					count_of_weap_3_power = count_of_weap_3_power + 1
				end
			end
			if count_of_weap_3_power >= 3 then
				Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_HEAVYWEAP", false)
			end
		end
		if playerHasSoulReaperInSlots ~= playerHasSoulReaperInSlots_previous_tick then
			playerHasSoulReaperInSlots_previous_tick = playerHasSoulReaperInSlots
			if playerHasSoulReaperInSlots then -- если душегуб появился в слоте, считываем параметры из переменных
				--restore_soulreaper_properties()
				update_state_of_soulreaper()
			end
		end
		if playerHasSoulReaperInSlots then
			Hyperspace.playerVariables['soulreaper_in_slots'] = 1
		else
			Hyperspace.playerVariables['soulreaper_in_slots'] = 0
			Hyperspace.playerVariables['soulreaper_panel_opened'] = 0
		end
		
		
		-- if bSoulreaperPanelStateMemory == true and Hyperspace.playerVariables['soulreaper_panel_opened'] == 0 then
			
			-- Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'CLOSE_SOULREAPER_PANEL', false, -1)
			-- --Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'SWITCH_SOULREAPER_PANEL',false,-1)
			-- if Hyperspace.playerVariables['soulreaper_panel_opened'] == 1 then
				-- bSoulreaperPanelStateMemory = true
			-- else
				-- bSoulreaperPanelStateMemory = false
			-- end
			-- --print('close')
			-- return
		-- else
			-- if Hyperspace.playerVariables['soulreaper_panel_opened'] == 1 then
				-- bSoulreaperPanelStateMemory = true
			-- else
				-- bSoulreaperPanelStateMemory = false
			-- end
		-- end
		
		
		-- отслеживает состояние врага и отражает это в переменной. 0 - нету, 1 - есть, друг, 2 - есть, враг
		if enemyShip then
			local nm = enemyShip.myBlueprint.blueprintName
			if enemyShip.ship.hullIntegrity.first == enemyShip.ship.hullIntegrity.second then
				if nm == "BOSS_1_EASY_DLC" or nm == "BOSS_1_NORMAL_DLC" or nm == "BOSS_1_HARD_DLC" or nm == "BOSS_1_EASY" or nm == "BOSS_1_NORMAL" or nm == "BOSS_1_HARD" or nm == "BOSS_BLACK_WING" then
					local count_of_plweap = 0
					local count_of_plweap2 = 0
					for playerweapons in vter(Hyperspace.Blueprints:GetShipBlueprint(playerShip.myBlueprint.blueprintName, 1).weapons) do
						count_of_plweap = count_of_plweap + 1
					end
					for weapon in vter(playerShip:GetWeaponList()) do
						count_of_plweap2 = count_of_plweap2 + 1
					end
					--print ('count_of_plweap='..count_of_plweap)
					--print ('count_of_plweap2='..count_of_plweap2)
					if count_of_plweap == count_of_plweap2 and count_of_plweap > 0 then
						local bFoundAllWeaps = true
						local bFoundCurWeaps = true
						for playerweapons in vter(Hyperspace.Blueprints:GetShipBlueprint(playerShip.myBlueprint.blueprintName, 1).weapons) do
							bFoundCurWeaps = false
							for weapon in vter2(playerShip:GetWeaponList()) do
								if weapon.blueprint.name:find(playerweapons) ~= nil then
									bFoundCurWeaps = true
								end
							end
							if bFoundCurWeaps == false then
								bFoundAllWeaps = false
								--print ('NO='..playerweapons)
							end
						end
						if bFoundAllWeaps == true then
							Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_STARTWEAPONS", false)
							--print ('worked')
						end
					end
				end
			end
			
			if enemyShip.bJumping == true then
				for crew in vter(enemyShip.vCrewList) do
					if crew.intruder == true then
						Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_JUMPEDWITH", false)
						--print('work')
					end
				end
			end
			
			if enemyShip.ship.hullIntegrity.first > 0 then
				-- if enemyShip.bAutomated == false and enemyShip:CountCrew(false) == 0 and (enemyShip:HasSystem(13) == false or enemyShip:GetSystem(13):Functioning()== false) then
					-- if enemyShip.shieldSystem.shields.power.super.first > 0 then
						-- if gui.menu_pause == false then --пауза событий
							-- print('worked')
							-- Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_SUPERSHIELDCREW", false)
						-- -- else
							-- -- if enemyShip.shieldSystem.shields.power.super.first ~= 0 then 
								-- -- enemyShip.shieldSystem.shields.power.super.first = 0
								-- -- print('bzz')
							-- -- end
						-- end
					-- end
				-- end
				
				if enemyShip._targetable.hostile then
					Hyperspace.metaVariables['enemy_state'] = 2
				else
					Hyperspace.metaVariables['enemy_state'] = 1
				end
			else
				if Hyperspace.metaVariables['enemy_state'] == 2 or Hyperspace.metaVariables['enemy_state'] == 1 then
					
					--local nm = enemyShip.myBlueprint.blueprintName
					if nm == "BOSS_BLACK_WING" then
						Hyperspace.metaVariables['was_victory'] = 1
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_BLACK_WING_BOSS_DESTROYED", false, -1)
					elseif nm == "BOSS_1_EASY_DLC" or nm == "BOSS_1_NORMAL_DLC" or nm == "BOSS_1_HARD_DLC" then
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_1_PHASE", false, -1)
					elseif nm == "BOSS_2_EASY_DLC" or nm == "BOSS_2_NORMAL_DLC" or nm == "BOSS_2_HARD_DLC" then
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_2_PHASE", false, -1)
					elseif nm == "BOSS_3_EASY_DLC" or nm == "BOSS_3_NORMAL_DLC" or nm == "BOSS_3_HARD_DLC" then
						Hyperspace.metaVariables['was_victory'] = 1
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_3_PHASE", false, -1)
						remember_sector_reward(8, 'FINAL', costy_pot - iBeginSectorCostP)
					elseif nm == "BOSS_1_EASY" or nm == "BOSS_1_NORMAL" or nm == "BOSS_1_HARD" then
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_1_PHASE", false, -1)
					elseif nm == "BOSS_2_EASY" or nm == "BOSS_2_NORMAL" or nm == "BOSS_2_HARD" then
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_2_PHASE", false, -1)
					elseif nm == "BOSS_3_EASY" or nm == "BOSS_3_NORMAL" or nm == "BOSS_3_HARD" then
						Hyperspace.metaVariables['was_victory'] = 1
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_3_PHASE", false, -1)
						remember_sector_reward(8, 'FINAL', costy_pot - iBeginSectorCostP)
					end
					
					if playerHasSoulReaperInSlots then
						if counter_meet_rebel_wave_previous_beacon ~= Hyperspace.playerVariables['counter_meet_rebel_wave'] then
							-- игрок в волне повстанцев, не даём души
						elseif nm == "BOSS_1_EASY_DLC" or nm == "BOSS_1_NORMAL_DLC" or nm == "BOSS_1_HARD_DLC" or nm == "BOSS_2_EASY_DLC" or nm == "BOSS_2_NORMAL_DLC" or nm == "BOSS_2_HARD_DLC" then
						
						elseif nm == "BOSS_1_EASY" or nm == "BOSS_1_NORMAL" or nm == "BOSS_1_HARD" or nm == "BOSS_2_EASY" or nm == "BOSS_2_NORMAL" or nm == "BOSS_2_HARD" then
							
						else
							local s_bef = Hyperspace.playerVariables['soulreaper_lvl']
							if playerShip:HasAugmentation("SOUL_MAGNIT") > 0 or playerShip:HasAugmentation("HID_SOUL_MAGNIT") > 0 then
								Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] + 2
							else
								Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] + 1
							end
							if Hyperspace.playerVariables['soulreaper_lvl'] > Hyperspace.playerVariables['soulreaper_capacity'] then
								Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_capacity']
							end
							local s_delta = Hyperspace.playerVariables['soulreaper_lvl'] - s_bef
							if s_delta == 2 then
								Hyperspace.Sounds:PlaySoundMix('soul_catch_multi', 10, false)
							elseif s_delta == 1 then
								Hyperspace.Sounds:PlaySoundMix('soul_catch_'..tostring(math.random(1,2)), 10, false)
							end
							--print ('+1 soul')
						end
					end

					if Hyperspace.metaVariables['was_victory'] == 1 then
						if playerHasSoulReaperInSlots then
							Hyperspace.metaVariables['needed_transfer_soulreaper'] = 1
						end
						if Hyperspace.playerVariables['used_tactical_pause'] == 0 then
							Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_NO_PAUSE", false)
							--print('ach')
						end
						if playerShip and playerShip.ship.hullIntegrity.first == playerShip.ship.hullIntegrity.second then
							Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_WINFULLHP", false)
						end
					end
				end
				
				Hyperspace.metaVariables['enemy_state'] = 0
			end	
		else
			Hyperspace.metaVariables['enemy_state'] = 0
		end
		
		if Hyperspace.metaVariables['enemy_state'] == 1 and varr.enemy_state_previous == 2 then
			if enemyShip.bAutomated == false and (enemyShip:HasSystem(13) == false or enemyShip:GetSystem(13):Functioning()== false) then
				if enemyShip.shieldSystem and enemyShip.shieldSystem.shields.power.super.first > 0 then
					--print('worked once')
					Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_SUPERSHIELDCREW", false)
				end
			end
		end
		varr.enemy_state_previous = Hyperspace.metaVariables['enemy_state']
		
		-- баф усиления-сканера. даёт очистку блокировки сенсоров в туманностях
		if playerShip then
			if playerShip:HasAugmentation("LIFE_SCANNER") > 0 or playerShip:HasAugmentation("HID_LIFE_SCANNER") > 0 or playerShip:HasAugmentation("ADV_SCANNERS_LIFE_SCANNER") > 0 then
				if (playerShip:HasSystem(7)) then
					playerShip:GetSystem(7):ClearStatus()
				end
			end
		end

		-- обслуживание усиления PROJECTILE_EATER
		if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			micro_tick_counter2 = micro_tick_counter2 + 60.0*Hyperspace.FPS.SpeedFactor --1
		end
		if (micro_tick_counter2 >= 1.0 and micro_tick_counter2 <= 10.0) then
			micro_tick_counter2 = 11.0
			if (playerShip) then
				if ((playerShip:HasAugmentation("PROJECTILE_EATER") > 0 or playerShip:HasAugmentation("HID_PROJECTILE_EATER") > 0) and memory_of_state_player_PE == 0) then
					memory_of_state_player_PE = 1
					Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "PROJECTILE_EATER_UPDATE", false, -1)
				elseif ((playerShip:HasAugmentation("PROJECTILE_EATER") == 0 and playerShip:HasAugmentation("HID_PROJECTILE_EATER") == 0) and memory_of_state_player_PE == 1) then
					memory_of_state_player_PE = 0
					Hyperspace.playerVariables['projectile_eater_current_level'] = 1 --потеря/продажа пожирателя приводит к сбросу его уровня на дефолт = 1
					Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "PROJECTILE_EATER_UPDATE", false, -1)
				end
			end
		end
		if (micro_tick_counter2 >= 200.0) then
			micro_tick_counter2 = 0.0
		end

		-- Этот участок заставляет маяки трястись возле своих позиций с амплитудой по косинусоиде в конкретных секторах
		if map and playerShip and playerShip.bJumping == false then
			-- if fworldlevel_memory ~= map.worldLevel then
				-- fworldlevel_memory = map.worldLevel
				-- bRemembedStarPositions = false
			-- end
			--print(fworldlevel_memory)
			if fworldlevel_memory ~= Hyperspace.playerVariables['counter_number_of_sector'] then
				local fworldlevel_memory_previous = fworldlevel_memory
				fworldlevel_memory = Hyperspace.playerVariables['counter_number_of_sector']
				bRemembedStarPositions = false
				-- это место отслеживает изменение номера сектора
				--print('changed sec num!')
				if fworldlevel_memory_previous == -1 then--это возникает при продолжении игры и обрабатывается по другому
					iBeginSectorCostP = Hyperspace.playerVariables['begin_sector_ship_cost']
				else
					if Hyperspace.playerVariables['counter_number_of_sector'] >= 2 then
						remember_sector_reward(Hyperspace.playerVariables['counter_number_of_sector'] - 1, sPreviousJumpTypeOfSector, costy_pot - iBeginSectorCostP)
						Hyperspace.playerVariables['dont_remember_last_sector'] = 0
						--_, costy_pot, _ = calculate_ship_cost (Hyperspace.ships.player)
						--iBeginSectorCostP = costy_pot
						--Hyperspace.playerVariables['begin_sector_ship_cost'] = iBeginSectorCostP
					end
					
					if Hyperspace.playerVariables['jumps_in_current_sector'] == 2 and Hyperspace.playerVariables['counter_number_of_sector'] >= 2 then
						--print('ach')
						Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_TWOJUMPS", false)
					end
					Hyperspace.playerVariables['jumps_in_current_sector'] = 0
				end
				
				-- точка замены редкости. РАБОТАЕТ ЖЕ Ш!!!
				if fworldlevel_memory > 0.0 then
					for urw in vter (Hyperspace.Blueprints:GetBlueprintList("WEAPON_CHANCE_50_RARITY_0")) do
						if math.random(0,100)<50 then
							Hyperspace.Blueprints:GetWeaponBlueprint(urw).desc.rarity = 0
							--print('we cant meet weap '..urw)
						else
							Hyperspace.Blueprints:GetWeaponBlueprint(urw).desc.rarity = Hyperspace.Blueprints:GetWeaponBlueprint(urw).desc.baseRarity
							--print('restored_rarity '..urw..'='..Hyperspace.Blueprints:GetWeaponBlueprint(urw).desc.rarity)
						end
					end
					for urw in vter (Hyperspace.Blueprints:GetBlueprintList("DRONES_CHANCE_50_RARITY_0")) do
						if math.random(0,100)<50 then
							Hyperspace.Blueprints:GetDroneBlueprint(urw).desc.rarity = 0
							--print('we cant meet weap '..urw)
						else
							Hyperspace.Blueprints:GetDroneBlueprint(urw).desc.rarity = Hyperspace.Blueprints:GetDroneBlueprint(urw).desc.baseRarity
							--print('restored_rarity '..urw..'='..Hyperspace.Blueprints:GetDroneBlueprint(urw).desc.rarity)
						end
					end
					for urw in vter (Hyperspace.Blueprints:GetBlueprintList("AUGMENTS_CHANCE_50_RARITY_0")) do
						if math.random(0,100)<50 then
							Hyperspace.Blueprints:GetAugmentBlueprint(urw).desc.rarity = 0
							--print('we cant meet weap '..urw)
						else
							Hyperspace.Blueprints:GetAugmentBlueprint(urw).desc.rarity = Hyperspace.Blueprints:GetAugmentBlueprint(urw).desc.baseRarity
							--print('restored_rarity '..urw..'='..Hyperspace.Blueprints:GetAugmentBlueprint(urw).desc.rarity)
						end
					end
				end
			end
			
			--print ('map.worldLevel='..map.worldLevel)
			--print ('vari='..Hyperspace.playerVariables['counter_number_of_sector'])
			cur_sector = Hyperspace.App.world.starMap.currentSector
			if cur_sector and (cur_sector.description.type == "UNSTABLE_SECTOR" or cur_sector.description.type == "ULTRA_UNSTABLE_SECTOR") then
				if cur_sector.description.type == "UNSTABLE_SECTOR" then
					shake_amplitude = 1.1
					star_pos_change_value = 35.0
					star_pos_change_chance = 10
				else
					shake_amplitude = 3.1
					star_pos_change_value = 53.0 --больше не надо, есть риск что маяк вылезет за край карты
					star_pos_change_chance = 13
				end
				iKey = 1
				if (bRemembedStarPositions == false) then
					map_beacon_locations_mem_array_x = {}
					map_beacon_locations_mem_array_y = {}
					for locs in vter(map.locations) do
						pos = locs.loc
						map_beacon_locations_mem_array_x[iKey] = pos.x
						map_beacon_locations_mem_array_y[iKey] = pos.y
						if (math.random(0,100)<star_pos_change_chance) then
							map_beacon_locations_mem_array_x[iKey] = map_beacon_locations_mem_array_x[iKey] + math.random(-star_pos_change_value, star_pos_change_value)
							map_beacon_locations_mem_array_y[iKey] = map_beacon_locations_mem_array_y[iKey] + math.random(-star_pos_change_value, star_pos_change_value)
						end
						iKey = iKey + 1
						bRemembedStarPositions = true
					end
				end
				if (bRemembedStarPositions == true) then
					iKey = 1
					for locs in vter2(map.locations) do
						pos = locs.loc
						micro_tick_counter3 = micro_tick_counter3 + 0.22*Hyperspace.FPS.SpeedFactor --1 --60.0
						if (micro_tick_counter3 >= 11800.0) then
							micro_tick_counter3 = 0.0
						end
						fBeacon_shaking = shake_amplitude*(0.5 + math.cos(micro_tick_counter3 * 0.012))
						--print('f'..fBeacon_shaking)
						if fBeacon_shaking<0.0 then
							fBeacon_shaking = 0.0
						end
						pos.x = pos.x + fBeacon_shaking*math.random(-1, 1)
						pos.y = pos.y + fBeacon_shaking*math.random(-1, 1)
						pos.x = (pos.x + map_beacon_locations_mem_array_x[iKey])/2.0
						pos.y = (pos.y + map_beacon_locations_mem_array_y[iKey])/2.0
						iKey = iKey + 1
					end
				end
			end
		end
		
		-- на маяках повышенной температуры периодически поджигает корабли
		if Hyperspace.playerVariables['danger_ultra_sun'] == 1 then
		--if Hyperspace.playerVariables['high_temperature_on_this_beacon'] == 1 then
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				micro_tick_counter4 = micro_tick_counter4 + 60.0*Hyperspace.FPS.SpeedFactor --1
			end
			if micro_tick_counter4 >= 14000.0 and micro_tick_counter4 <= 14090.0 then
				micro_tick_counter4 = 14091.0
				Hyperspace.Sounds:PlaySoundMix('environWarning', 3, false)
			end
			
			if micro_tick_counter4 >= 15000.0 and micro_tick_counter4 <= 15090.0 then
				micro_tick_counter4 = 15091.0
				Hyperspace.Sounds:PlaySoundMix('solarFlare', 10, false)
			end
			
			if micro_tick_counter4 >= 15900.0 and micro_tick_counter4 <= 15990.0 then
				micro_tick_counter4 = 15991.0
				screen_fade(Graphics.GL_Color(245.0/255.0, 50.0/255.0, 40.0/255.0, 125.0/255.0), 1.5, 1.5, 1.5)
			end
			if micro_tick_counter4 >= 16300.0 then
				micro_tick_counter4 = math.random(0, 3000)
				make_sun_flare()
			end
		end
		
		
		
		-- на маяках сверхнизкой температуры периодически замораживает корабли
		if Hyperspace.playerVariables['danger_cold'] == 1 then
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				micro_tick_counter4 = micro_tick_counter4 + 60.0*Hyperspace.FPS.SpeedFactor --1
			end
			if micro_tick_counter4 >= 8000.0 then -- регулировка частоты срабатываний тут
				micro_tick_counter4 = math.random(2000, 6000) -- регулировка частоты срабатываний тут
				local iRoom_to_freeze = -1
				-- if last_target_of_danger_cold == -1 then
					-- if math.random(0,100)<50 then
						-- last_target_of_danger_cold = 0
					-- else
						-- last_target_of_danger_cold = 1
					-- end
				-- end
				if math.random(0,100)<50 then
				--if last_target_of_danger_cold == 1 then
					--last_target_of_danger_cold = 0
					if GSIp and playerShip then
						iRoom_to_freeze = math.random(0, GSIp:RoomCount() - 1)
						local dam = Hyperspace.Damage()
						dam.breachChance = 5
						dam.iShieldPiercing = 10
						dam.bLockdown = true
						playerShip:DamageArea(playerShip:GetRoomCenter(iRoom_to_freeze), dam, true)
						Hyperspace.Sounds:PlaySoundMix('lockdown1', 5, false)
					end
				else
					--last_target_of_danger_cold = 1
					if GSIe and enemyShip and Hyperspace.metaVariables['enemy_state'] == 2 then
						iRoom_to_freeze = math.random(0, GSIe:RoomCount() - 1)
						local dam = Hyperspace.Damage()
						dam.breachChance = 5
						dam.iShieldPiercing = 10
						dam.bLockdown = true
						enemyShip:DamageArea(enemyShip:GetRoomCenter(iRoom_to_freeze), dam, true)
						Hyperspace.Sounds:PlaySoundMix('lockdown2', 5, false)
					end
				end
			end
		end
		
		-- на маяках с нанитными облаками периодически повреждает системы кораблей
		if Hyperspace.playerVariables['danger_nanites'] == 1 then
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				micro_tick_counter4 = micro_tick_counter4 + 60.0*Hyperspace.FPS.SpeedFactor
			end
			if micro_tick_counter4 >= 9000.0 then -- регулировка частоты срабатываний тут
				micro_tick_counter4 = math.random(0, 7000) -- регулировка частоты срабатываний тут
				-- if last_target_of_danger_nanites == -1 then
					-- if math.random(0,100)<50 then
						-- last_target_of_danger_nanites = 0
					-- else
						-- last_target_of_danger_nanites = 1
					-- end
				-- end
				if math.random(0,100)<50 then
				--if last_target_of_danger_nanites == 1 then
					--last_target_of_danger_nanites = 0
					if GSIp and playerShip then
						Hyperspace.App.world.space:CreateLaserBlast(Hyperspace.Blueprints:GetWeaponBlueprint('NANITE_GUN'),  Hyperspace.Pointf(0.0, 0.0), 0, 1, Hyperspace.ships.player:GetRandomRoomCenter(), 0, 10.0)
					end
				else
					--last_target_of_danger_nanites = 1
					if GSIe and enemyShip and Hyperspace.metaVariables['enemy_state'] == 2 then
						Hyperspace.App.world.space:CreateLaserBlast(Hyperspace.Blueprints:GetWeaponBlueprint('NANITE_GUN'),  Hyperspace.Pointf(0.0, 0.0), 1, 0, Hyperspace.ships.enemy:GetRandomRoomCenter(), 1, 10.0)
					end
				end
			end
		end

		
		-- на маяках с кристальными полями периодически запускает кристаллы в корабли
		if Hyperspace.playerVariables['danger_crystals'] == 1 then
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				micro_tick_counter4 = micro_tick_counter4 + 60.0*Hyperspace.FPS.SpeedFactor
			end
			if micro_tick_counter4 >= 5000.0 then -- регулировка частоты срабатываний тут
				micro_tick_counter4 = math.random(1500, 3500) -- регулировка частоты срабатываний тут
				if math.random(0,100)<50 then
					if playerShip then
						-- название снаряда как в анимации
						Hyperspace.App.world.space:CreateBurstProjectile(Hyperspace.Blueprints:GetWeaponBlueprint('ICE_GUN'), 'crystal_shot_4', false, GetRandomPointShift(Hyperspace.ships.player:GetRandomRoomCenter(), 450.0), 0, 1, Hyperspace.ships.player:GetRandomRoomCenter(), 0, 10.0)
					end
				else
					if enemyShip and Hyperspace.metaVariables['enemy_state'] == 2 then
						Hyperspace.App.world.space:CreateBurstProjectile(Hyperspace.Blueprints:GetWeaponBlueprint('ICE_GUN'), 'crystal_shot_4', false, GetRandomPointShift(Hyperspace.ships.enemy:GetRandomRoomCenter(), 250.0), 1, 0, Hyperspace.ships.enemy:GetRandomRoomCenter(), 1, 10.0)
					end
				end
			end
		end
		
		-- на маяках с дикими дронами периодически запускает дронов в корабли
		if Hyperspace.playerVariables['danger_wild_drones'] == 1 then
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				micro_tick_counter4 = micro_tick_counter4 + 60.0*Hyperspace.FPS.SpeedFactor
			end
			if GSIp and playerShip and GSIe and enemyShip and Hyperspace.metaVariables['enemy_state'] == 2 then
			
			else
				Hyperspace.playerVariables['danger_wild_drones'] = 0
			end
			
			if micro_tick_counter4 >= 10000.0 then -- регулировка частоты срабатываний тут
				micro_tick_counter4 = math.random(0, 4000) -- регулировка частоты срабатываний тут
				-- тут тонкое место, если хоть одного корабля не будет - запуск этих эвентов = вылет игры
				if GSIp and playerShip and GSIe and enemyShip and Hyperspace.metaVariables['enemy_state'] == 2 then
					if math.random(0,100)<50 then
						--print('try_p')
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, "DRONE_FIELD_1", false, -1)
					else
						--print('try_e')
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, "DRONE_FIELD_1E", false, -1)
					end
				else
					Hyperspace.playerVariables['danger_wild_drones'] = 0
				end
			end
		end
		
		--varr.universal_iRoom_neededheal[crew.iRoomId] = varr.universal_iRoom_neededheal[crew.iRoomId] + 4.0
		if GSIp then
			for roomy in vter2(GSIp.rooms) do
				if varr.universal_iRoom_neededheal[roomy.iRoomId] == nil then
					varr.universal_iRoom_neededheal[roomy.iRoomId] = 0.0
					--print('don-1='..roomy.iRoomId)
				end
				varr.universal_iRoom_neededheal[roomy.iRoomId] = varr.universal_iRoom_neededheal[roomy.iRoomId] - 0.2
				if varr.universal_iRoom_neededheal[roomy.iRoomId] < 0.0 then
					varr.universal_iRoom_neededheal[roomy.iRoomId] = 0.0
				end
			end
		end
		
		
		if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			varr.micro_tick_counter8 = varr.micro_tick_counter8 + 60.0*Hyperspace.FPS.SpeedFactor
			if varr.micro_tick_counter8 >= 5050.0 then
				varr.micro_tick_counter8 = 0.0
				--print('res os')
				reset_osa_activity(false) -- просто потому что периодически надо выводить из игры враждебных ос иначе нельза заабордажить враж.корабль
			end
			if varr.micro_tick_counter8 >= 5000.0 then
				varr.micro_tick_counter8 = 5049.9
				--print('res os2')
				reset_osa_activity(true) -- если не возвращать их в игру сразу же, то похоже есть риск вылета из игры при прыжке с выведенной из игры осой
			end
			
			
			-- отдельный счётчик периодически даёт осам шанс что будут шататься по кораблю
			varr.micro_tick_counter9 = varr.micro_tick_counter9 + 60.0*Hyperspace.FPS.SpeedFactor
			--print(varr.micro_tick_counter9)
			if varr.micro_tick_counter9 >= 90000.0 then
				varr.micro_tick_counter9 = math.random(0.0, 30000)
			end
		end
		
		
		
		-- ниже участок работы с ИИ экипажа
		if playerShip then
			for crew in vter(playerShip.vCrewList) do
				if crew.blueprint.name == "alien" then -- блок для прятания чужого при низких хп
					if crew.health.first > 20 then
						crew.speed_x = 0.0
						crew.crewAnim.forcedAnimation = -1
						crew.crewAnim.forcedDirection = -1
					end
					if crew.health.first <= 20 or (enemyShip and enemyShip:HasSystem(9) == true) or ThereIsAtLeastOneNoAlienEnemyBoarderOnPlayerShip() == true then
						if crew.health.first <= 0.01 then
							crew.speed_x = 0.0
							crew.crewAnim.forcedAnimation = -1
							crew.crewAnim.forcedDirection = -1
						else
							if crew.fStunTime <= 0.0 and crew.health.first > 0.01 then -- предполагается что убить чужого можно только оглушив и быстро добив
								if crew.speed_x > 585.0 then
									crew:Kill(false)
									if math.random(0,100) >= 18 then -- шанс 18% что просто пропадёт с корабля после того как сбежит в корпус
										Hyperspace.playerVariables['alien_count_inside_hull'] = Hyperspace.playerVariables['alien_count_inside_hull'] + 1.0
									end
								else
									crew.crewAnim.forcedAnimation = 6
									crew.crewAnim.forcedDirection = 0
									if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
										crew.speed_x = crew.speed_x + 60.0*Hyperspace.FPS.SpeedFactor
										-- я использовал переменную скорости движения по х для отсчёта времени смерти/прятания чужого.
										-- это явно что-то не нормальное, но последствий не выявлено и работает...
									end
									if crew.speed_x > 500.0 and crew.speed_x < 530.0 then
										crew.speed_x = 531.0
										local dam = Hyperspace.Damage()
										dam.breachChance = 10--когда прячется оставляет в текущей комнате пробоину
										playerShip:DamageArea(playerShip:GetRoomCenter(crew.iRoomId), dam, true)
										Hyperspace.Sounds:PlaySoundMix('alien_wounded', 8, false)
									end
								end
							else
								crew.speed_x = 0.0
								crew.crewAnim.forcedAnimation = -1
								crew.crewAnim.forcedDirection = -1
								crew.crewAnim:Restart()
							end
						end
					end
				elseif crew.blueprint.name == "osa" or crew.blueprint.name == "osae" then
					-- блок ИИ осы
					--print('targ='..varr.universal_iRoom_targ)
					if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
						varr.universal_iRoom_targ[crew.extend.selfId] = -1
					end
					local TS = crew.blueprint.crewNameLong
					TS.data = MakeNameIfNeeded(TS.data, crew.blueprint.name, crew)
					crew:SetName(TS, true)
					
					--crew.extend:GetDefinition().powerDefs
					--print(crew.extend:GetDefinition().damageTakenMultiplier)
					-- if (math.random(0,100)<5) then
						-- crew.extend:GetDefinition().silenced = false
					-- else
						-- crew.extend:GetDefinition().silenced = true
					-- end
					
					--print(tostring(crew.extend:GetDefinition().silenced))
					if crew.iOnFire > 0 then --этот блок даёт команду на бегство в другую комнату (без пожара), если в текущей пожар
						if crew.extend:GetDefinition().canMove == true then
							if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
								crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
								if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] and playerShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							elseif GSIp then
								varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
								if playerShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then -- проверка горит ли комната
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif playerShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then -- проверка есть ли место в комнате
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							end
						end
					else
						if crew.extend:GetDefinition().canMove == true then
							
							if playerShip:GetSystemInRoom(crew.iRoomId) == nil and varr.micro_tick_counter9 < 80000 then
								if crew.iOnFire == 0 then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
									crew.extend:GetDefinition().noAI = true -- новый фиксатор позиции
									
									-- if varr.micro_tick_counter9 >= 80000.0 then
										-- print('bzz')
										-- varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
										-- if playerShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then -- проверка горит ли комната
											-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
										-- elseif playerShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then -- проверка есть ли место в комнате
											-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
										-- end
									-- end
									
								elseif GSIp then
									varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
									if playerShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then -- проверка горит ли комната
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									elseif playerShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then -- проверка есть ли место в комнате
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									end
								end
								--crew:MoveToRoom(crew.iRoomId, 0, false)
								
							elseif varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
								crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
								if varr.micro_tick_counter9 < 80000 then
									if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then
										if playerShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]) ~= nil then
											if GSIp then
												varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
											end
										end
									end
								end
							else
								if GSIp then
									varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
									if playerShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									elseif playerShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									elseif playerShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]) ~= nil then
										if varr.micro_tick_counter9 < 80000 then
											varr.universal_iRoom_targ[crew.extend.selfId] = -1
										end
									end
								end
							end
						end
					end
				elseif crew.blueprint.name:find("magman") ~= nil then -- новый ИИ магменов
					if crew.intruder == true and crew.health.first < 28.0 and playerShip:GetFireCount(crew.iRoomId) == 0 then
						if playerShip:GetSystem(8) == nil or playerShip:GetSystem(8).powerState.first < 2 then
							if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
								varr.universal_iRoom_targ[crew.extend.selfId] = -1
							end
							if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
								if GSIp then
									crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
									if playerShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) == 0 then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									end
								end
							else
								varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
								if playerShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) == 0 then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif playerShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif playerShip.ship:GetOxygenPercentage(varr.universal_iRoom_targ[crew.extend.selfId]) < 10 then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							end
						end
					end
				elseif crew.blueprint.name:find("biopreserver") ~= nil then -- новый ИИ биохранителей
					if Hyperspace.metaVariables['enable_auto_drone_work'] == 1 then
						
						if crew.health.first + 10 < crew.health.second then
							crew.extend:GetDefinition().noAI = false
							--print('ai_on'..crew.iRoomId)
						else
							crew.extend:GetDefinition().noAI = true -- новый фиксатор позиции
							--print('ai_off'..crew.iRoomId)
						end
						--crew.extend:GetDefinition().noAI = true
						
						
						if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
							varr.universal_iRoom_targ[crew.extend.selfId] = -1
						end
						if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
							if GSIp then
								--print(varr.universal_iRoom_targ[crew.extend.selfId])
								crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
								
								if varr.universal_iRoom_neededheal[varr.universal_iRoom_targ[crew.extend.selfId]] < 1.0 then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
								
								local incurrroomraneniy = false
								local inroomsoonpreserver = false
								for crew2 in vter2(playerShip.vCrewList) do
									if crew.iRoomId == crew2.iRoomId then
										if crew2:IsDrone() == false and crew2.health.first + 6 < crew2.health.second then
											incurrroomraneniy = true
										end
									end
									if crew ~= crew2 then
										if varr.universal_iRoom_targ[crew.extend.selfId] == crew2.iRoomId and crew2.blueprint.name:find("biopreserver") ~= nil then
											inroomsoonpreserver = true
											--print ('other pres in '..varr.universal_iRoom_targ[crew.extend.selfId])
										end
									end
								end
								if incurrroomraneniy == true and inroomsoonpreserver == false then
									varr.universal_iRoom_targ[crew.extend.selfId] = crew.iRoomId
								end
								
								
								-- for crew2 in vter2(playerShip.vCrewList) do
									-- if crew ~= crew2 then
										-- if varr.universal_iRoom_targ[crew.extend.selfId] == crew2.iRoomId and crew2.blueprint.name:find("biopreserver") ~= nil then
											-- inroomsoonpreserver = true
											-- print ('other pres in '..varr.universal_iRoom_targ[crew.extend.selfId])
										-- end
									-- end
								-- end
								if inroomsoonpreserver == true then
									if varr.universal_iRoom_targ[crew.extend.selfId] == crew.iRoomId then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									end
								end
								
							end
						else
							varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
							if varr.universal_iRoom_neededheal[varr.universal_iRoom_targ[crew.extend.selfId]] < 1.0 then
								varr.universal_iRoom_targ[crew.extend.selfId] = -1
							else
								local inroomsoonpreserver = false
								for crew2 in vter2(playerShip.vCrewList) do
									if crew ~= crew2 then
										if crew2.blueprint.name:find("biopreserver") ~= nil then
											
											
											if varr.universal_iRoom_targ[crew.extend.selfId] == crew2.iRoomId then
												inroomsoonpreserver = true
											elseif varr.universal_iRoom_targ[crew2.extend.selfId] == varr.universal_iRoom_targ[crew.extend.selfId] then
												
												
												local p_targ = GSIp:GetRoomCenter(varr.universal_iRoom_targ[crew.extend.selfId])
												local path_length1 = math.sqrt((crew.x - p_targ.x)*(crew.x - p_targ.x) + (crew.y - p_targ.y)*(crew.y - p_targ.y))
												local path_length2 = math.sqrt((crew2.x - p_targ.x)*(crew2.x - p_targ.x) + (crew2.y - p_targ.y)*(crew2.y - p_targ.y))
												
												if (path_length2 + 150.0) < path_length1 then
													inroomsoonpreserver = true
													--print('win other'..crew2.iRoomId)
												elseif (path_length1 + 150.0) < path_length2 then
													varr.universal_iRoom_targ[crew2.extend.selfId] = -1
													--print('win this'..crew.iRoomId)
												else
													inroomsoonpreserver = true
												end
												--print (crew.iRoomId..'='..path_length)
												
											end
											
											
											--GSIp:FindPath(Point p1, Point p2, int shipId)
											
											--print ('other pres in '..varr.universal_iRoom_targ[crew.extend.selfId])
										end
									end
								end
								if inroomsoonpreserver == true then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							end
							
							-- if varr.universal_iRoom_targ[crew.extend.selfId] == -1 then
								-- --
								-- if crew.health.first + 10 < crew.health.second then
									-- crew.extend:GetDefinition().noAI = false
									-- print('ai_on'..crew.iRoomId)
								-- else
									-- crew.extend:GetDefinition().noAI = true -- новый фиксатор позиции
									-- print('ai_off'..crew.iRoomId)
								-- end
							-- end
						end
					end
				end
				
				if crew.intruder == false then
					
					if (crew.extend:CalculateStat(Hyperspace.CrewStat.SUFFOCATION_MODIFIER) > 0.2 and crew.health.first < 75.0) or crew.health.first < 30.0 then
					--if crew.health.first + 10 < crew.health.second then
						varr.universal_iRoom_neededheal[crew.iRoomId] = varr.universal_iRoom_neededheal[crew.iRoomId] + 2.0
						if varr.universal_iRoom_neededheal[crew.iRoomId] > 5.0 then
							varr.universal_iRoom_neededheal[crew.iRoomId] = 5.0
						end
					end
				end
			end
		end
		
		
		
		if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			micro_tick_counter = micro_tick_counter + 60.0*Hyperspace.FPS.SpeedFactor
		end
		if micro_tick_counter >= 11500.0 then
			if Hyperspace.playerVariables['alien_appear_on_this_beacon'] == 0 and Hyperspace.playerVariables['alien_count_inside_hull'] > 0 then
				if math.random(0,100)<66 then
					if gui and not gui.event_pause then
						if (enemyShip and enemyShip:HasSystem(9) == false) or enemyShip == nil then
							-- если на корабле игрока есть враги, то чужой начинает им помогать, что не по лору. поэтому если телепорта нет то респаун
							if math.random(1000,1100)<1035 then
								spawn_an_alien_from_hull()
								Hyperspace.playerVariables['alien_appear_on_this_beacon'] = 1
							else
								-- в этом случае просто не появится на этом маяке
								Hyperspace.playerVariables['alien_appear_on_this_beacon'] = 1
							end
						end
					end
				end
			end
			micro_tick_counter = math.random(0,3000)
		end
	end
	
	-- блок запуска событий запланированных на истечение тиков в массиве тиков-событий
	if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
		if #micro_tick_array > 0 and playerShip then
			for i = 1, #micro_tick_array do
				if micro_tick_array[i].time_delay > 0.0 then
					micro_tick_array[i].time_delay = micro_tick_array[i].time_delay - 60.0*Hyperspace.FPS.SpeedFactor
					if micro_tick_array[i].time_delay <= 0.0 then
						micro_tick_array[i].time_delay = 0.0
						-- если что - проверка на уход в минус лома проведена - не уходит.
						if micro_tick_array[i].ev_name == "MISSILES_DRILL_1P" then
							Hyperspace.Sounds:PlaySoundMix('gold', 10, false)
							playerShip:ModifyScrapCount(math.random(1, 2), false)
						elseif micro_tick_array[i].ev_name == "MISSILES_DRILL_1E" then
							Hyperspace.Sounds:PlaySoundMix('gold', 10, false)
							playerShip:ModifyScrapCount(math.random(-2, -1), false)
						elseif micro_tick_array[i].ev_name == "MISSILES_DRILL_2P" then
							Hyperspace.Sounds:PlaySoundMix('gold', 10, false)
							playerShip:ModifyScrapCount(math.random(2, 3), false)
						elseif micro_tick_array[i].ev_name == "MISSILES_DRILL_2E" then
							Hyperspace.Sounds:PlaySoundMix('gold', 10, false)
							playerShip:ModifyScrapCount(math.random(-3, -2), false)
						elseif micro_tick_array[i].ev_name == "MISSILES_DRILL_3P" then
							Hyperspace.Sounds:PlaySoundMix('gold', 10, false)
							playerShip:ModifyScrapCount(math.random(3, 4), false)
						elseif micro_tick_array[i].ev_name == "MISSILES_DRILL_3E" then
							Hyperspace.Sounds:PlaySoundMix('gold', 10, false)
							playerShip:ModifyScrapCount(math.random(-4, -3), false)
						elseif micro_tick_array[i].ev_name == "MISSILES_VAMPIRE_1P" then
							playerShip:DamageHull(-1, true)
						elseif micro_tick_array[i].ev_name == "MISSILES_VAMPIRE_2P" then
							playerShip:DamageHull(-2, true)
						elseif micro_tick_array[i].ev_name == "MISSILES_VAMPIRE_1E" and enemyShip and enemyShip.bDestroyed == false then
							enemyShip:DamageHull(-1, true)
						elseif micro_tick_array[i].ev_name == "MISSILES_VAMPIRE_2E" and enemyShip and enemyShip.bDestroyed == false then
							enemyShip:DamageHull(-2, true)
						elseif micro_tick_array[i].ev_name == "RICOCHET_P3" and enemyShip and enemyShip.bDestroyed == false then
							play_random_underhull_punch_sound()
							local dam = Hyperspace.Damage()
							dam.breachChance = 10
							dam.iShieldPiercing = 10
							dam.iSystemDamage = 1
							enemyShip:DamageArea(enemyShip:GetRandomRoomCenter(), dam, true)
							table.insert(micro_tick_array, {ev_name = "RICOCHET_P2", time_delay = math.random(800, 1000)})
						elseif micro_tick_array[i].ev_name == "RICOCHET_E3" and playerShip.bDestroyed == false then
							play_random_underhull_punch_sound()
							local dam = Hyperspace.Damage()
							dam.breachChance = 10
							dam.iShieldPiercing = 10
							dam.iSystemDamage = 1
							playerShip:DamageArea(playerShip:GetRandomRoomCenter(), dam, true)
							table.insert(micro_tick_array, {ev_name = "RICOCHET_E2", time_delay = math.random(800, 1000)})
						elseif micro_tick_array[i].ev_name == "RICOCHET_P2" and enemyShip and enemyShip.bDestroyed == false then
							play_random_underhull_punch_sound()
							local dam = Hyperspace.Damage()
							dam.breachChance = 10
							dam.iShieldPiercing = 10
							dam.iSystemDamage = 1
							enemyShip:DamageArea(enemyShip:GetRandomRoomCenter(), dam, true)
							table.insert(micro_tick_array, {ev_name = "RICOCHET_P1", time_delay = math.random(800, 1000)})
						elseif micro_tick_array[i].ev_name == "RICOCHET_E2" and playerShip.bDestroyed == false then
							play_random_underhull_punch_sound()
							local dam = Hyperspace.Damage()
							dam.breachChance = 10
							dam.iShieldPiercing = 10
							dam.iSystemDamage = 1
							playerShip:DamageArea(playerShip:GetRandomRoomCenter(), dam, true)
							table.insert(micro_tick_array, {ev_name = "RICOCHET_E1", time_delay = math.random(800, 1000)})
						elseif micro_tick_array[i].ev_name == "RICOCHET_P1" and enemyShip and enemyShip.bDestroyed == false then
							play_random_underhull_punch_sound()
							local dam = Hyperspace.Damage()
							dam.breachChance = 10
							dam.iShieldPiercing = 10
							dam.iSystemDamage = 1
							enemyShip:DamageArea(enemyShip:GetRandomRoomCenter(), dam, true)
						elseif micro_tick_array[i].ev_name == "RICOCHET_E1" and playerShip.bDestroyed == false then
							play_random_underhull_punch_sound()
							local dam = Hyperspace.Damage()
							dam.breachChance = 10
							dam.iShieldPiercing = 10
							dam.iSystemDamage = 1
							playerShip:DamageArea(playerShip:GetRandomRoomCenter(), dam, true)
						end
					end
				end
			end
		end
	end
	
	if Hyperspace.playerVariables['curse_orchid_shase'] > 0 then
		if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			if playerShip and playerShip.bJumping == true then
				micro_tick_counter5 = 0.0
			end
			micro_tick_counter5 = micro_tick_counter5 + 60.0*Hyperspace.FPS.SpeedFactor
			--print(micro_tick_counter5)
			if micro_tick_counter5 >= 14000.0 and micro_tick_counter5 <= 14090.0 then
				micro_tick_counter5 = 14191.0
				Hyperspace.Sounds:PlaySoundMix('jumpLeave', 4, false)--jumpLeave--jumpArrive
				varr.orchid_fleet_x = math.random(20, 200)
				varr.orchid_fleet_y = math.random(115, 550)
				table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("effects/ship_arrives.png"), time_length = 400.0, time_length_mem = 400.0, x = varr.orchid_fleet_x+10, y = varr.orchid_fleet_y-10, w=1500, h=128, fw=150, fh=128, layer = "LAYER_BACKGROUND"})
			end
			if micro_tick_counter5 >= 14400.0 and micro_tick_counter5 <= 14490.0 then
				micro_tick_counter5 = 14491.0
				Hyperspace.playerVariables['bShowOrchidFleet'] = 1
			end
			if micro_tick_counter5 >= 25900.0 and micro_tick_counter5 <= 25990.0 then
				micro_tick_counter5 = 25991.0
				Hyperspace.Sounds:PlaySoundMix('warning', 5, false)
				table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("effects/fleet_1_orchid_warning.png"), time_length = 3000.0, time_length_mem = 3000.0, x = varr.orchid_fleet_x-30, y = varr.orchid_fleet_y-40, w=1500, h=150, fw=250, fh=150, layer = "SPACE_STATUS"})
			end
			if micro_tick_counter5 >= 30000.0 and micro_tick_counter5 <= 30090.0 then
				micro_tick_counter5 = 30091.0
				if playerShip then
					Hyperspace.Sounds:PlaySoundMix('bombTeleport', 8, false)
					Hyperspace.App.world.space:CreateBomb(Hyperspace.Blueprints:GetWeaponBlueprint('BA_BOMB_CLUSTER_1'), 1, playerShip:GetRandomRoomCenter(), 0)
				end
			end
			if micro_tick_counter5 >= 31000.0 and micro_tick_counter5 <= 31090.0 then
				micro_tick_counter5 = 31091.0
				if playerShip then
					Hyperspace.Sounds:PlaySoundMix('bombTeleport', 8, false)
					Hyperspace.App.world.space:CreateBomb(Hyperspace.Blueprints:GetWeaponBlueprint('BA_BOMB_CLUSTER_1'), 1, playerShip:GetRandomRoomCenter(), 0)
				end
			end
			if micro_tick_counter5 >= 32000.0 then
				micro_tick_counter5 = math.random(14600, 17600)--кулдаун плавающий, мне кажется так веселее
				if playerShip then
					Hyperspace.Sounds:PlaySoundMix('bombTeleport', 8, false)
					Hyperspace.App.world.space:CreateBomb(Hyperspace.Blueprints:GetWeaponBlueprint('BA_BOMB_CLUSTER_1'), 1, playerShip:GetRandomRoomCenter(), 0)
				end
			end
		end
	end
	
	if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
		if micro_tick_counter6 > 0.0 then
			micro_tick_counter6 = micro_tick_counter6 - 60.0*Hyperspace.FPS.SpeedFactor -- отдельный счётчик, чтобы ограничить надписи общения живого говорящего орудия
		end
	end
	
	if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
		if micro_tick_counter7 > 0.0 then
			micro_tick_counter7 = micro_tick_counter7 - 60.0*Hyperspace.FPS.SpeedFactor -- отдельный счётчик, чтобы вызывать возгорания на кораблях от усиления
		end
	end
	
	
	
	-- if gui then
		-- print('gui'..tostring(gui.choiceBoxOpen))
	-- end
	--print ('tt'..Hyperspace.Mouse.tooltip)
	
end
script.on_internal_event(Defines.InternalEvents.ON_TICK, check_arsenal_on_tick_processes)



function MakeNameIfNeeded(str_inp, type_of_crew, crew_crew)
	if type_of_crew == "osa" or type_of_crew == "osae" then
		local found = false
		for i = 1, #varr.osa_names do
			if str_inp == varr.osa_names[i] then
				found = true
				return str_inp
			end
		end
		if found == false then
			str_inp = varr.osa_names[math.random(1, #varr.osa_names)]
		end
	end
	return str_inp
end




local iRoom_to_spawn = -1
local iRoom_to_spawn_arr = {}
function spawn_an_alien_from_hull() --функция появления чужого (чужих) из корпуса
	local GSIp2 = Hyperspace.ShipGraph.GetShipInfo(0)
	local playerShip2 = Hyperspace.ships.player
	local dam = Hyperspace.Damage()
	dam.breachChance = 10 --когда прячется оставляет в текущей комнате пробоину
	dam.iShieldPiercing = 10
	if playerShip2 and GSIp2 then
		for i = 0, Hyperspace.playerVariables['alien_count_inside_hull']-1 do
			iRoom_to_spawn_arr[i] = -1
			for room2 in vter2(GSIp2.rooms) do
				if room2.bBlackedOut == true and math.random(0,100) < 25 then --предпочитают появляться в неосвещённых комнатах корабля
					iRoom_to_spawn_arr[i] = room2.iRoomId
				end
			end
			if iRoom_to_spawn_arr[i] == -1 then -- если неосвещённых комнат нет, появится в случайной
				iRoom_to_spawn_arr[i] = math.random(0, GSIp2:RoomCount() - 1)
			end
			playerShip2:DamageArea(playerShip2:GetRoomCenter(iRoom_to_spawn_arr[i]), dam, true)
			playerShip2:AddCrewMemberFromString("Чужой", "alien", true, iRoom_to_spawn_arr[i], true, true)--вызов именно такой, т.к. иначе чужим выдаёт имена...
		end
		Hyperspace.playerVariables['alien_count_inside_hull'] = 0.0
	end
end
function spawn_an_alien() --первичный спаун на корабле без пробоины
	local GSIp2 = Hyperspace.ShipGraph.GetShipInfo(0)
	if GSIp2 then
		iRoom_to_spawn = math.random(0, GSIp2:RoomCount() - 1)
		Hyperspace.ships.player:AddCrewMemberFromString("Чужой", "alien", true, iRoom_to_spawn, true, true)
		Hyperspace.Sounds:PlaySoundMix('alien_appears', 8, false)
	end
end
script.on_game_event("SPAWN_AN_ALIEN", false, spawn_an_alien)




-- обслуживание усиления PROJECTILE_EATER
script.on_internal_event(Defines.InternalEvents.JUMP_LEAVE, function()
	Hyperspace.playerVariables['projectile_eater_charges_left'] = Hyperspace.playerVariables['projectile_eater_current_level']
	Hyperspace.playerVariables['counter_projectiles_eated'] = 0
	Hyperspace.playerVariables['projectile_eater_ready'] = 1
end)
script.on_internal_event(Defines.InternalEvents.JUMP_ARRIVE, function(ship)
	world = Hyperspace.App.world
	if world then
		Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "PROJECTILE_EATER_UPDATE", false, -1)
	end
end)
script.on_internal_event(Defines.InternalEvents.ON_KEY_DOWN, function(key)
    if key == Defines.SDL.KEY_DELETE then
		world = Hyperspace.App.world
		if world then
			if Hyperspace.App.menu.shipBuilder.bOpen == true or Hyperspace.App.menu.bOpen == true then
				-- НИЧЕГО НЕ ДЕЛАТЬ ТУТ
			else
				Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "PROJECTILE_EATER_LAUNCH", false, -1)
			end
		end
    end
end)


----------------------------
-- УПРАВЛЕНИЕ АРТИЛЛЕРИЕЙ --
----------------------------
local cooldown = 0.0
local safeMaxCooldown = 0.0
local delta = 0.0
local function artilleryManning(sys)
	local weapon = sys.projectileFactory
    if not weapon.powered or sys.iActiveManned < 1 or sys.iHackEffect > 0 then
        return
    end
    cooldown = weapon.cooldown
    safeMaxCooldown = cooldown.second - 0.001
    if safeMaxCooldown > 0 and cooldown.first < safeMaxCooldown then
		delta = 0.022 * Hyperspace.FPS.SpeedFactor -- +25%
		-- никаких объяснений как оно работает нет, но данный эмпирический коэффициент 0.022 даёт прирост скорости зарядки около +25% арте. то что было раньше давало куда больший разгон...
		cooldown.first = math.min(math.max(cooldown.first + delta, 0), safeMaxCooldown)
    end
end
local sysart_directions = {-- если интерьер отсека не будет в списке, то выдаст на выходе nil
	-- 0 вниз, 1 вправо, 2 вверх, 3 влево,
	-- ["room_artillery"] = 2,
	-- ["room_artillery_2"] = 2,
	-- ["room_artillery_3"] = 3,
	-- ["room_artillery_4"] = 3,
	-- ["room_artillery_5"] = 1,
	["room_artillery_10"] = 0,
	["room_artillery_arsenal_ship"] = 2,
	["room_artillery_Avalon"] = 2,
	["room_artillery_dlc4"] = 0,
	["room_artillery_dlc4_2"] = 2,
	["room_artillery_kanpukter"] = 0,
	["room_artillery_mushroom"] = 3,
	["room_artillery_mushroom1"] = 0,
	["room_artillery_Nemesis"] = 2,
	["room_artillery_serenity"] = 2,
	["room_artillery_warrior"] = 2,
	["room_artillery_Wormulon"] = 0,
	-- ниже для RSG-FTL
	["room_artillerym"] = 2,
	["room_artillery_2m"] = 2,
	["room_artillery_3m"] = 3,
	["room_artillery_4m"] = 3,
	["room_artillery_5m"] = 1,
}
local sysart_slots = {
	-- ["room_artillery"] = 0,
	-- ["room_artillery_2"] = 1,
	-- ["room_artillery_3"] = 0,
	-- ["room_artillery_4"] = 1,
	-- ["room_artillery_5"] = 1,
	["room_artillery_10"] = 0,
	["room_artillery_arsenal_ship"] = 0,
	["room_artillery_Avalon"] = 1,
	["room_artillery_dlc4"] = 1,
	["room_artillery_dlc4_2"] = 1,
	["room_artillery_kanpukter"] = 0,
	["room_artillery_mushroom"] = 0,
	["room_artillery_mushroom1"] = 1,
	["room_artillery_Nemesis"] = 0,
	["room_artillery_serenity"] = 1,
	["room_artillery_warrior"] = 0,
	["room_artillery_Wormulon"] = 0,
	-- ниже для RSG-FTL
	["room_artillerym"] = 0,
	["room_artillery_2m"] = 1,
	["room_artillery_3m"] = 0,
	["room_artillery_4m"] = 1,
	["room_artillery_5m"] = 1,
}
local bThereIsOtherCrewOnPult = false
local function auxManning(shipMgr)
	-- if shipMgr.bAutomated then
        -- return
    -- end
    local iShipId = shipMgr.iShipId
    local vCrewList = shipMgr.vCrewList
    for i = 0, vCrewList:size() - 1 do
        local crew = vCrewList[i]
        local sys = crew.currentSystem
		-- теперь нужен постоянный сброс принудительной анимации в дефолт состояние.
        crew.crewAnim.forcedAnimation = -1
		crew.crewAnim.forcedDirection = -1
		if sys and sys.iSystemType == 11 and (sys.iActiveManned < 1 or shipMgr.bAutomated == true) and sys.iHackEffect <= 0 then
            if iShipId == 0 then
				if not crew:IsBusy() and not crew:GetIntruder() and crew:CanMan() then
					if sysart_directions[sys.interiorImageName] ~= nil and sysart_slots[sys.interiorImageName] ~= nil then
						if sysart_slots[sys.interiorImageName] == crew.currentSlot.slotId then
							if sys:Powered() then
								-- -1 отключить, 0 ходьба, 1 удар рукой, 2 ремонт, 3 анимация смерти и она убивает циклично лол, 4 тушение,
								-- 5 невидимость полная, 6 телепорт, 7 держит пистолет, 8,9 управляет системой, 10 вылет игры
								crew.crewAnim.forcedAnimation = 8
								-- -1 отключить, 0 вниз, 1 вверх, 2 вправо, 3 влево, 4 вылет игры
								crew.crewAnim.forcedDirection = sysart_directions[sys.interiorImageName]
								crew.bActiveManning = true
								sys.iActiveManned = 1
							end
						else
							bThereIsOtherCrewOnPult = false
							for j = 0, vCrewList:size() - 1 do
								if j ~= i then
									local crew2 = vCrewList[j]
									if crew2.iRoomId == crew.iRoomId and sysart_slots[sys.interiorImageName] == crew2.currentSlot.slotId then
										bThereIsOtherCrewOnPult = true
									end
								end
							end
							if bThereIsOtherCrewOnPult == false then
								crew:MoveToRoom(sys:GetRoomId(), sysart_slots[sys.interiorImageName], true) -- если стоит в комнате с артой не в слоте пульта, то подойдёт к пульту
							end
						end
					end
                end
            elseif not crew:IsBusy() and not crew:GetIntruder() and crew:CanMan() and sys:Powered() then
                crew.bActiveManning = true
                sys.iActiveManned = 1
            end
        end
    end
end


function weaponFireBoost(ship)
	local wsys = ship.weaponSystem
	if wsys then
		for pf in vter2(wsys.weapons) do
			if not pf.powered or wsys.iHackEffect > 0 then
				return
			end
			cooldown = pf.cooldown
			safeMaxCooldown = cooldown.second - 0.001
			if safeMaxCooldown > 0 and cooldown.first < safeMaxCooldown then
				delta = 0.044 * Hyperspace.FPS.SpeedFactor -- +25% = 0.022
				cooldown.first = math.min(math.max(cooldown.first + delta, 0), safeMaxCooldown)
				--print('boosted! aaaaa')
			end
		end
	end
end


local lastArtilleryCap = -1
script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipMgr)
	if shipMgr then
		auxManning(shipMgr)
		local otherShip = Hyperspace.ships(1 - shipMgr.iShipId)
		local otherShipCloaked = otherShip and otherShip.ship.bCloaked or false
		local vSystemList = shipMgr.artillerySystems
		for i = 0, vSystemList:size() - 1 do
			if not otherShipCloaked then
				artilleryManning(vSystemList[i])
			end
		end
		
		-- это переносит блокировки с последней (самой правой) системы артиллерии на остальные, если их несколько --
		lastArtilleryCap = -1
		for i = 0, vSystemList:size() - 1 do
			lastArtilleryCap = vSystemList[vSystemList:size() - 1]:GetPowerCap()
			if lastArtilleryCap == vSystemList[i].powerState.second then
				lastArtilleryCap = 100
			end
		end
		if lastArtilleryCap ~= -1 then
			for i = 0, vSystemList:size() - 1 do
				vSystemList[i]:SetPowerCap(lastArtilleryCap)
			end
		end
		
		
		
		
		-- усиление вызывает пожары и ускоряет перезарядку орудий
		if shipMgr:HasAugmentation("WEAPONS_FIREBOOSTER") > 0 then 
			if shipMgr.fireSpreader.count > 0 then
				weaponFireBoost(shipMgr)
			end
			if shipMgr.fireSpreader.count < 8 then
				if Hyperspace.App.menu.shipBuilder.bOpen == true or Hyperspace.App.menu.bOpen == true then
				
				else
					if micro_tick_counter7 <= 0.0 then
						local dam = Hyperspace.Damage()
						dam.fireChance = 10
						dam.iShieldPiercing = 10
						shipMgr:DamageArea(shipMgr:GetRandomRoomCenter(), dam, true)
						micro_tick_counter7 = 1100.0 + math.random(0,900) + shipMgr.fireSpreader.count*110
					end
				end
			end
		end
		
		
		if shipMgr.iShipId == 0 then
			if shipMgr.fireSpreader.count > 15 then
				Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_THISISFINE", false)
			end
		end
		
		
	end
end)
local TextMeta = {
    __index = function(texts)
        return texts['']
    end,
    __call = function(texts)
        return texts[Hyperspace.Settings.language]
    end
}
local function Text(texts)
    setmetatable(texts, TextMeta)
    return texts
end

local button_dehack_on = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_dehack_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local button_dehack_off = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_dehack_off.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local button_dehack_select2 = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_dehack_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)

local manning_bar_on = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/manning_bar_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local manning_bar_off = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/manning_bar_off.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local manning_bar_ion = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/manning_bar_ion.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)

local save_a_ship = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/save_a_ship.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local save_a_station = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/save_a_station.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local curse_player_missing = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/curse_player_missing.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local curse_enemy_hitting = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/curse_enemy_hitting.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local curse_enemy_firing = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/curse_enemy_firing.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local curse_orchid_shase = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/curse_orchid_shase.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)

local danger_cold = Hyperspace.Resources:CreateImagePrimitiveString('warnings/danger_cold.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local danger_crystals = Hyperspace.Resources:CreateImagePrimitiveString('warnings/danger_crystals.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local danger_nanites = Hyperspace.Resources:CreateImagePrimitiveString('warnings/danger_nanites.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local danger_radiation = Hyperspace.Resources:CreateImagePrimitiveString('warnings/danger_radiation.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local danger_wild_drones = Hyperspace.Resources:CreateImagePrimitiveString('warnings/danger_wild_drones.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local danger_ultra_sun = Hyperspace.Resources:CreateImagePrimitiveString('warnings/danger_ultra_sun.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)

--local varr.x_offset_of_tips_artillery_system = 0
local y_offset_of_tips_artillery_system = 0
local collected_tip_art_text = ''
local SOSTipBox = {
	text = "",
	x = 332,
	y = 50,
	w = 26,
	h = 26
}
local CurseTipBox = {
	text = "",
	x = 360,
	y = 50,
	w = 26,
	h = 26
}
local dangerTipBox = {
	text = "",
	x = 650,
	y = 70,
	w = 80,
	h = 75
}


function hackDroneCanBeDestroyed()
	if playerShip and playerShip.hackingSystem and playerShip.hackingSystem.drone.bDead == false and playerShip.hackingSystem.drone.arrived == true and playerShip.hackingSystem.currentSystem ~= nil then
		if enemyShip and enemyShip.ship.hullIntegrity.first > 0 then
			if playerShip.hackingSystem.effectTimer.first == 0.0 or playerShip.hackingSystem.effectTimer.first >= playerShip.hackingSystem.effectTimer.second then
				if playerShip.hackingSystem.powerState.first > 0 then
					if allowed_hack_explosion_on_cooldown == true then
						return true
					elseif playerShip.hackingSystem:GetLocked() == false then 
						return true
					end
				end
			end
		end
	end
	return false
end

						
function playerHasControllableCrewDrone()
	if playerShip then
		for crew in vter(playerShip.vCrewList) do
			if crew:IsDrone() == true and crew.intruder == false and crew:Functional() then
				if crew.blueprint.name ~= 'boarder_ftl_disabler' and crew.blueprint.name ~= 'repair_hal' and crew.blueprint.name ~= 'battle_hal' then
					return true
				end
			end
		end
	end
	if enemyShip then
		for crew in vter(enemyShip.vCrewList) do
			if crew:IsDrone() == true and crew.intruder == true and crew:Functional() then
				if crew.blueprint.name ~= 'boarder_ftl_disabler' and crew.blueprint.name ~= 'repair_hal' and crew.blueprint.name ~= 'battle_hal' then
					return true
				end
			end
		end
	end
	return false
end
function playerHasCrewDrone()
	if playerShip then
		for crew in vter(playerShip.vCrewList) do
			if crew:IsDrone() == true and crew.intruder == false and crew:Functional() then
				return true
			end
		end
	end
	if enemyShip then
		for crew in vter(enemyShip.vCrewList) do
			if crew:IsDrone() == true and crew.intruder == true and crew:Functional() then
				return true
			end
		end
	end
	return false
end

script.on_render_event(Defines.RenderEvents.SPACE_STATUS, function() end, function(ship)--GUI_CONTAINER
	varr.prepare_to_explode_hack = false
	varr.prepare_to_switch_auto_drone_work = false
	
	if Hyperspace.FPS.speedEnabled == false then
		Graphics.CSurface.GL_SetColor(Graphics.GL_Color(0.9, 0.9, 0.9, 1))
		Graphics.freetype.easy_print(10, 620, 6, 'Ускорение отключено. Чтобы включить, нажмите `')
	end
	
	gui = Hyperspace.App.gui--.menu_pause
	playerShip = Hyperspace.ships.player
	if Hyperspace.App.menu.shipBuilder.bOpen == true or Hyperspace.App.menu.bOpen == true then -- останавливаем выполнение всех тик-процессов
		-- НИЧЕГО НЕ ДЕЛАТЬ ТУТ
	else
		varr.x_offset_of_tips_artillery_system = 0
		-- считаем сдвиг подсказки от наличия систем. телепорт и инвиз дают больший сдвиг.
		if playerShip then
			for system in vter(playerShip.vSystemList) do
				if system:GetId() == 0 or system:GetId() == 1 or system:GetId() == 2 or system:GetId() == 5 or system:GetId() == 13 then
					varr.x_offset_of_tips_artillery_system = varr.x_offset_of_tips_artillery_system + 36
				end
				if system:GetId() == 10 or system:GetId() == 9 then
					varr.x_offset_of_tips_artillery_system = varr.x_offset_of_tips_artillery_system + 54
				end
			end
			
			local vSystemList = playerShip.artillerySystems
			for i = 0, vSystemList:size() - 1 do
				local artilleryTipBox = {
					text = "",
					x = 76 + varr.x_offset_of_tips_artillery_system + i*36, -- для каждой следующей артиллерии сдвиг на +36 по Х
					y = 630,
					w = 27,
					h = 67
				}
				y_offset_of_tips_artillery_system = (vSystemList[i].powerState.second - 1) * 8
				
				-- рисуем иконку [О] над системой артиллерии
				pcall(function()
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_Translate(82 + varr.x_offset_of_tips_artillery_system + i*36, 650 - y_offset_of_tips_artillery_system)--оффсеты вида [О]
					if playerShip.bAutomated then
						if (vSystemList[i].healthState.second == vSystemList[i].healthState.first and vSystemList[i].powerState.first > 0 and vSystemList[i].bOnFire == false and vSystemList[i]:GetLocked() == false and vSystemList[i].bOccupied == false) then
						--if (vSystemList[i].healthState.second == vSystemList[i].healthState.first and vSystemList[i].bOnFire == false and vSystemList[i]:GetLocked() == false and vSystemList[i].bOccupied == false ) then
							Graphics.CSurface.GL_RenderPrimitive(manning_bar_on)
						else
							Graphics.CSurface.GL_RenderPrimitive(manning_bar_off)
						end
					else
						if vSystemList[i].bManned == true and vSystemList[i].iActiveManned > 0 then
							local vCrewList = playerShip.vCrewList
							for j = 0, vCrewList:size() - 1 do
								--local crew = vCrewList[j]
								-- ПАМЯТКА ПО СКИЛЛАМ пилот, двиг, щит, орудия, ремонт, бой - id 0,1,2,3,4,5 соответственно
								-- crew:GetSkillLevel(3) === 1.0, 2.0, 3.0
								if vCrewList[j].iRoomId == vSystemList[i]:GetRoomId() and vCrewList[j].bActiveManning == true then
									Graphics.CSurface.GL_RenderPrimitive(manning_bar_on)
								end
							end
						else
							if (vSystemList[i].healthState.second - vSystemList[i].healthState.first < 1.0) and vSystemList[i].bOnFire == false and vSystemList[i]:GetLocked() == false and vSystemList[i].bOccupied == false then
							--if (vSystemList[i].healthState.second - vSystemList[i].healthState.first < 1.0) and vSystemList[i].powerState.first > 0 and vSystemList[i].bOnFire == false and vSystemList[i]:GetLocked() == false and vSystemList[i].bOccupied == false then
								Graphics.CSurface.GL_RenderPrimitive(manning_bar_off)
							end
						end
					end
					Graphics.CSurface.GL_PopMatrix()
				end)
				
				-- ниже дописываем в окно подсказок инфу о перезарядке
				collected_tip_art_text = ''
				if mouseInside(artilleryTipBox) and gui and gui.menu_pause == false then
					Hyperspace.Mouse:InstantTooltip()
					collected_tip_art_text = Hyperspace.Mouse.tooltip
					if collected_tip_art_text ~= nil and collected_tip_art_text ~= ''  then
						if vSystemList[i].powerState.first > 0 then
							if vSystemList[i].bManned == true and vSystemList[i].iActiveManned > 0 then
								collected_tip_art_text = collected_tip_art_text..'\n\nУправляется экипажем: перезарядка быстрее на 25%'
							else
								collected_tip_art_text = collected_tip_art_text..'\n\nНе управляется экипажем: стандартная перезарядка'
							end
						end
					end
					Hyperspace.Mouse:SetTooltip(collected_tip_art_text)
				end
			end
			
			if playerShip:HasSystem(14) then
				varr.x_offset_of_tips_artillery_system = varr.x_offset_of_tips_artillery_system + 54
			end
			if playerShip.artillerySystems:size() > 0 then
				varr.x_offset_of_tips_artillery_system = varr.x_offset_of_tips_artillery_system + 36*playerShip.artillerySystems:size()
			end
			varr.x_offset_of_tips_drone_system = varr.x_offset_of_tips_artillery_system
			if playerShip.hackingSystem then
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(100 + varr.x_offset_of_tips_artillery_system, 665)
				if hackDroneCanBeDestroyed() then
					if mouseInside({x = 106 + varr.x_offset_of_tips_artillery_system, y = 671, w = 22, h = 22}) and gui and gui.menu_pause == false then
						Graphics.CSurface.GL_RenderPrimitive(button_dehack_select2)
						Hyperspace.Mouse:InstantTooltip()
						Hyperspace.Mouse:SetTooltip('Подорвать свой дрон-взломщик.')
						varr.prepare_to_explode_hack = true
					else
						Graphics.CSurface.GL_RenderPrimitive(button_dehack_on)
					end
				else
					Graphics.CSurface.GL_RenderPrimitive(button_dehack_off)
					if mouseInside({x = 106 + varr.x_offset_of_tips_artillery_system, y = 671, w = 22, h = 22}) and gui and gui.menu_pause == false then
						Hyperspace.Mouse:InstantTooltip()
						Hyperspace.Mouse:SetTooltip('Сейчас нельзя подорвать свой дрон-взломщик.')
					end
				end
				Graphics.CSurface.GL_PopMatrix()
				
				varr.x_offset_of_tips_drone_system = varr.x_offset_of_tips_drone_system + 54
			end
			
			if playerShip:HasSystem(20) then
				varr.x_offset_of_tips_drone_system = varr.x_offset_of_tips_drone_system + 54
			end
			
			if playerShip:HasSystem(3) then
				varr.x_offset_of_tips_drone_system = varr.x_offset_of_tips_drone_system + 54 + playerShip.weaponSystem.slot_count*95
			end
			if playerShip.droneSystem then
				--if playerHasCrewDrone() == true then
				if playerHasControllableCrewDrone() == true then
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_Translate(135 + varr.x_offset_of_tips_drone_system, 665)
					if mouseInside({x = 141 + varr.x_offset_of_tips_drone_system, y = 671, w = 44, h = 22}) and gui and gui.menu_pause == false then
						if Hyperspace.metaVariables['enable_auto_drone_work'] == 1 then
							Graphics.CSurface.GL_RenderPrimitive(varr.button_auto_drone_select3)
						else
							Graphics.CSurface.GL_RenderPrimitive(varr.button_auto_drone_select2)
						end
						varr.prepare_to_switch_auto_drone_work = true
						Hyperspace.Mouse:InstantTooltip()
						if Hyperspace.metaVariables['enable_auto_drone_work'] == 1 then
							Hyperspace.Mouse:SetTooltip('Переключить режим корабельных дронов.\nСейчас: [style[color:33FF33FF]]Автоматический[[/style]]')
						else
							Hyperspace.Mouse:SetTooltip('Переключить режим корабельных дронов.\nСейчас: [style[color:FFFF33FF]]Ручной[[/style]]')
						end
					else
						if Hyperspace.metaVariables['enable_auto_drone_work'] == 1 then
							Graphics.CSurface.GL_RenderPrimitive(varr.button_auto_drone_on)
						else
							Graphics.CSurface.GL_RenderPrimitive(varr.button_auto_drone_off)
						end
					end
					Graphics.CSurface.GL_PopMatrix()
				end
			end
			
			
			local mmmccc = 0
			for augs in vter(playerShip:GetAugmentationList()) do
				if Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.cost ~= nil then
					search_word = augs
					if tip_img_replace_hidden_array[search_word] == nil then
						tip_img_replace_hidden_array[search_word] = Hyperspace.Resources:CreateImagePrimitiveString('combatUI/icons/icon_'..augs:lower()..'.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
					end
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_LoadIdentity()
					Graphics.CSurface.GL_Translate(986 - mmmccc*32, 672)
					Graphics.CSurface.GL_RenderPrimitive(tip_img_replace_hidden_array[search_word])
					Graphics.CSurface.GL_PopMatrix()
					if mouseInside({x = 988 - mmmccc*32, y = 674, w = 28, h = 28}) and gui and gui.menu_pause == false then
						Hyperspace.Mouse:InstantTooltip()
						collected_tip_text = Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.title:GetText()
						if search_word == "AUTO_REPAIR" then
							search_word = "AUTO_REPAIR"..tostring(math.floor(Hyperspace.playerVariables['autorepair_speed_multiplied_on_10'])) -- преобразует 10.0 в 10
						end
						-- Дополнение подписей усилений трюма.
						if tip_text_replace_hidden_array[search_word] ~= nil then
							collected_tip_text = collected_tip_text..'\n\n'..tip_text_replace_hidden_array[search_word]
							Hyperspace.Mouse:SetTooltip(collected_tip_text)
						else
							tip_text_replace_hidden_array[search_word] = Hyperspace.Blueprints:GetAugmentBlueprint(search_word).desc.description:GetText()
						end
						Hyperspace.Mouse:SetTooltip(collected_tip_text)
					end
					mmmccc = mmmccc + 1
				end
			end
			
			mmmccc = 0
			local mmmcccx = 0
			local mmmcccy = 0
			for augs in vter(Hyperspace.Blueprints:GetBlueprintList("CAN_BE_HIDDEN_AUGS")) do
				if Hyperspace.playerVariables['installed_'..augs] == 1 then
					search_word = augs
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_LoadIdentity()
					if mmmccc > 17 then
						mmmcccy = 2
					elseif mmmccc > 8 then
						mmmcccy = 1
					else
						mmmcccy = 0
					end
					
					if (mmmccc - 9*mmmcccy)%2 == 0 then
						mmmcccx = 620 - (mmmccc - 9*mmmcccy)*16 --625 default x
					else
						mmmcccx = 620 + 16 + (mmmccc - 9*mmmcccy)*16
					end
					
					Graphics.CSurface.GL_Translate(mmmcccx, 80 + mmmcccy*32)
					Graphics.CSurface.GL_RenderPrimitive(tip_img_replace_hidden_array[search_word])
					Graphics.CSurface.GL_PopMatrix()
					if mouseInside({x = mmmcccx + 2, y = 82 + mmmcccy*32, w = 28, h = 28}) and gui and gui.menu_pause == false then
						Hyperspace.Mouse:InstantTooltip()
						collected_tip_text = 'Встроенное усиление:\n'..Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.title:GetText()
						if search_word == "AUTO_REPAIR" then
							search_word = "AUTO_REPAIR"..tostring(math.floor(Hyperspace.playerVariables['autorepair_speed_multiplied_on_10'])) -- преобразует 10.0 в 10
						end
						-- Дополнение подписей встроенных усилений.
						if tip_text_replace_hidden_array[search_word] ~= nil then
							collected_tip_text = collected_tip_text..'\n\n'..tip_text_replace_hidden_array[search_word]
							Hyperspace.Mouse:SetTooltip(collected_tip_text)
						end
						Hyperspace.Mouse:SetTooltip(collected_tip_text)
					end
					mmmccc = mmmccc + 1
				end
			end
			
		end
		
		-- подрисовывает иконку SOS-корабль/станция для особых ивентов с двойной наградой
		if Hyperspace.playerVariables['double_reward_event_ship'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(SOSTipBox.x, SOSTipBox.y)--(332, 50)
			Graphics.CSurface.GL_RenderPrimitive(save_a_ship)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(SOSTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip('Кораблю поблизости требуется помощь.')
			end
		elseif Hyperspace.playerVariables['double_reward_event_station'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(SOSTipBox.x, SOSTipBox.y)--(332, 50)
			Graphics.CSurface.GL_RenderPrimitive(save_a_station)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(SOSTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip('Станции или поселению поблизости требуется помощь.')
			end		
		end
		
		-- подрисовывает иконку проклятости текущего забега
		if Hyperspace.playerVariables['curse_player_missing'] >= 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(CurseTipBox.x, CurseTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(curse_player_missing)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(CurseTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip('Ваши орудия прокляты. Шанс попадания снижен на 50%. Осталось маяков: '..math.floor(Hyperspace.playerVariables['curse_player_missing']))
			end	
		elseif Hyperspace.playerVariables['curse_enemy_hitting'] >= 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(CurseTipBox.x, CurseTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(curse_enemy_hitting)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(CurseTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip('Ваш корабль проклят. Шанс уклонения снижен на 50%. Осталось маяков: '..math.floor(Hyperspace.playerVariables['curse_enemy_hitting']))
			end	
		elseif Hyperspace.playerVariables['curse_enemy_firing'] >= 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(CurseTipBox.x, CurseTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(curse_enemy_firing)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(CurseTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip('Любой снаряд врага, который имеет шанс поджога, вызовет поджог гарантированно. Осталось маяков: '..math.floor(Hyperspace.playerVariables['curse_enemy_firing']))
			end	
		elseif Hyperspace.playerVariables['curse_orchid_shase'] >= 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(CurseTipBox.x, CurseTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(curse_orchid_shase)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(CurseTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip('За вами устроил погоню фрегат орхидов. Осталось маяков: '..math.floor(Hyperspace.playerVariables['curse_orchid_shase']))
			end	
		end
		
		-- рисуем треугольную красную иконку сверху. опасная среда.
		if Hyperspace.playerVariables['danger_cold'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(dangerTipBox.x, dangerTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(danger_cold)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(dangerTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip('Вы находитесь в очень холодном месте. Периодически отсеки корабля будут замерзать, а обшивка получать пробоины.')
			end
		elseif Hyperspace.playerVariables['danger_crystals'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(dangerTipBox.x, dangerTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(danger_crystals)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(dangerTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip('Вы находитесь в поле кристаллов. Периодически кристаллы будут попадать в ваш корабль. Кристаллы проникают через 1 слой щита.')
			end		
		elseif Hyperspace.playerVariables['danger_nanites'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(dangerTipBox.x, dangerTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(danger_nanites)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(dangerTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip('Вы находитесь в облаке нанитов. Периодически системы корабля будут получать урон от эрозии.')
			end		
		elseif Hyperspace.playerVariables['danger_radiation'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(dangerTipBox.x, dangerTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(danger_radiation)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(dangerTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip('Вы находитесь под воздействием мощного радиационного излучения. Оборудование справляется, но последствия для экипажа могут быть непредсказуемыми...')
			end		
		elseif Hyperspace.playerVariables['danger_wild_drones'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(dangerTipBox.x, dangerTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(danger_wild_drones)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(dangerTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip('Вы находитесь рядом с группой диких дронов. Периодически они будут пытаться атаковать любые корабли поблизости.')
			end		
		elseif Hyperspace.playerVariables['danger_ultra_sun'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(dangerTipBox.x, dangerTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(danger_ultra_sun)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(dangerTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip('Вы находитесь под воздействием очень высоких температур. Возгорания на корабле практически неизбежны.')
			end		
		end
	end
	
	
	-- НИЖЕ МАССИВНЫЙ БЛОК ДУШЕГУБА
	mouse_inside_mem = -1
	if Hyperspace.playerVariables['soulreaper_in_slots'] > 0 and Hyperspace.metaVariables['enemy_state'] ~= 2 and gui and gui.upgradeButton.bActive == true then
		if enemyShip == nil or enemyShip._targetable.hostile == false then
			if isReallyDangerousEnvironment() == false then
				Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
				Graphics.freetype.easy_printCenter(6, 1233, 603, tostring(math.floor(Hyperspace.playerVariables['soulreaper_lvl'])).." / "..tostring(math.floor(Hyperspace.playerVariables['soulreaper_capacity'])))

				-- визуал кнопки панели душегуба справа снизу
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(soulreaperTipBox.x-12, soulreaperTipBox.y-12)
				if Hyperspace.playerVariables['soulreaper_panel_opened'] == 1 then
					if mouseInside(soulreaperTipBox) and gui and gui.menu_pause == false then
						mouse_inside_mem = 999
						Hyperspace.Mouse:InstantTooltip()
						Hyperspace.Mouse:SetTooltip('Вкл./выкл. панель управления Душегубом.')
						Graphics.CSurface.GL_RenderPrimitive(soulreaper2_select2)
					else
						Graphics.CSurface.GL_RenderPrimitive(soulreaper2_on)
					end
					Graphics.CSurface.GL_PopMatrix()
				else
					if mouseInside(soulreaperTipBox) and gui and gui.menu_pause == false then
						mouse_inside_mem = 999
						Hyperspace.Mouse:InstantTooltip()
						Hyperspace.Mouse:SetTooltip('Вкл./выкл. панель управления Душегубом.')
						Graphics.CSurface.GL_RenderPrimitive(soulreaper_select2)
					else
						Graphics.CSurface.GL_RenderPrimitive(soulreaper_on)
					end
					Graphics.CSurface.GL_PopMatrix()
				end
				
			end
		end
	end
	if Hyperspace.playerVariables['soulreaper_panel_opened'] == 1 then
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(641, 83)
		Graphics.CSurface.GL_RenderPrimitive(soulreaper_panel)
		Graphics.CSurface.GL_PopMatrix()
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(333, 90)
		Graphics.CSurface.GL_RenderPrimitive(soulreaper_info)
		Graphics.CSurface.GL_PopMatrix()
		
		--GL_BlitImagePartial((GL_Texture *tex, float x, float y, float size_x, float size_y, float start_x, float end_x, float start_y, float end_y, float alpha, GL_Color color, bool mirror)
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Rotate(90, 0, 0, 1.0)
		Graphics.CSurface.GL_Translate(115, -1205)
		
		if Hyperspace.playerVariables['soulreaper_count_of_upgrades'] < 3 then
			Graphics.CSurface.GL_BlitImagePartial(soulreaper1, 0, 0, cellWidth, cellHeight, normalX1, normalX2, normalY1, normalY2, 1, varr.color_white, true)
		elseif Hyperspace.playerVariables['soulreaper_count_of_upgrades'] < 6 then
			Graphics.CSurface.GL_BlitImagePartial(soulreaper2, 0, 0, cellWidth, cellHeight, normalX1, normalX2, normalY1, normalY2, 1, varr.color_white, true)
		elseif Hyperspace.playerVariables['soulreaper_count_of_upgrades'] < 9 then
			Graphics.CSurface.GL_BlitImagePartial(soulreaper3, 0, 0, cellWidth, cellHeight, normalX1, normalX2, normalY1, normalY2, 1, varr.color_white, true)
		elseif Hyperspace.playerVariables['soulreaper_count_of_upgrades'] < 12 then
			Graphics.CSurface.GL_BlitImagePartial(soulreaper4, 0, 0, cellWidth, cellHeight, normalX1, normalX2, normalY1, normalY2, 1, varr.color_white, true)
		elseif Hyperspace.playerVariables['soulreaper_count_of_upgrades'] < 15 then
			Graphics.CSurface.GL_BlitImagePartial(soulreaper5, 0, 0, cellWidth, cellHeight, normalX1, normalX2, normalY1, normalY2, 1, varr.color_white, true)
		elseif Hyperspace.playerVariables['soulreaper_count_of_upgrades'] < 19 then
			Graphics.CSurface.GL_BlitImagePartial(soulreaper6, 0, 0, cellWidth, cellHeight, normalX1, normalX2, normalY1, normalY2, 1, varr.color_white, true)
		else
			Graphics.CSurface.GL_BlitImagePartial(soulreaper7, 0, 0, cellWidth, cellHeight, normalX1, normalX2, normalY1, normalY2, 1, varr.color_white, true)
		end
		
		Graphics.CSurface.GL_PopMatrix()
		
		bToolTipShown = false
		current_count_of_soul = Hyperspace.playerVariables['soulreaper_lvl']
		for i = 1, 13 do
			arr_allowed_soulbuy[i] = 1--1 ок, 2 не хватает душ, 0 макс лвл.
			if i == 1 then
				if Hyperspace.playerVariables['soulreaper_power'] == 2 and current_count_of_soul < 5 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_power'] == 1 and current_count_of_soul < 7 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_power'] == 0 then
					arr_allowed_soulbuy[i] = 0
				end
			elseif i == 2 then
				if Hyperspace.playerVariables['soulreaper_cooldown'] == 14 and current_count_of_soul < 5 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 12 and current_count_of_soul < 7 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 10 and current_count_of_soul < 10 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 8 then
					arr_allowed_soulbuy[i] = 0
				end
			elseif i == 3 then
				if Hyperspace.playerVariables['soulreaper_shots'] == 1 and current_count_of_soul < 3 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_shots'] == 2 and current_count_of_soul < 5 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_shots'] == 3 and current_count_of_soul < 7 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_shots'] == 4 and current_count_of_soul < 10 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_shots'] == 5 then
					arr_allowed_soulbuy[i] = 0
				end
			elseif i == 4 then
				if Hyperspace.playerVariables['soulreaper_iDamage'] == 1 and current_count_of_soul < 7 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iDamage'] == 2 and current_count_of_soul < 10 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iDamage'] == 3 then
					arr_allowed_soulbuy[i] = 0
				end
			elseif i == 5 then
				if Hyperspace.playerVariables['soulreaper_iSystemDamage'] == 0 and current_count_of_soul < 5 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iSystemDamage'] == 1 and current_count_of_soul < 7 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iSystemDamage'] == 2 then
					arr_allowed_soulbuy[i] = 0
				end
			elseif i == 6 then
				if Hyperspace.playerVariables['soulreaper_iPersDamage'] == 0 and current_count_of_soul < 3 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iPersDamage'] == 1 and current_count_of_soul < 5 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iPersDamage'] == 2 then
					arr_allowed_soulbuy[i] = 0
				end
			elseif i == 7 then
				if Hyperspace.playerVariables['soulreaper_iIonDamage'] == 0 and current_count_of_soul < 5 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iIonDamage'] == 1 and current_count_of_soul < 6 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iIonDamage'] == 2 and current_count_of_soul < 7 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iIonDamage'] == 3 then
					arr_allowed_soulbuy[i] = 0
				end
			elseif i == 8 then
				if Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 0 and current_count_of_soul < 1 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 1 and current_count_of_soul < 3 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 2 and current_count_of_soul < 5 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 3 and current_count_of_soul < 7 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 4 then
					arr_allowed_soulbuy[i] = 0
				end
			elseif i == 9 then
				if Hyperspace.playerVariables['soulreaper_breachChance'] == 1 and current_count_of_soul < 3 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_breachChance'] == 4 and current_count_of_soul < 3 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_breachChance'] == 7 and current_count_of_soul < 3 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_breachChance'] == 10 then
					arr_allowed_soulbuy[i] = 0
				end
			elseif i == 10 then
				if Hyperspace.playerVariables['soulreaper_fireChance'] == 1 and current_count_of_soul < 3 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_fireChance'] == 4 and current_count_of_soul < 3 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_fireChance'] == 7 and current_count_of_soul < 3 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_fireChance'] == 10 then
					arr_allowed_soulbuy[i] = 0
				end
			elseif i == 11 then
				if Hyperspace.playerVariables['soulreaper_bLockdown'] == 0 and current_count_of_soul < 7 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_bLockdown'] == 1 then
					arr_allowed_soulbuy[i] = 0
				end
			elseif i == 12 then
				if Hyperspace.playerVariables['soulreaper_bHullBuster'] == 0 and current_count_of_soul < 5 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_bHullBuster'] == 1 then
					arr_allowed_soulbuy[i] = 0
				end
			elseif i == 13 then
				if Hyperspace.playerVariables['soulreaper_capacity'] == 5 and current_count_of_soul < 2 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_capacity'] == 7 and current_count_of_soul < 3 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_capacity'] == 10 then
					arr_allowed_soulbuy[i] = 0
				end
			end
		end
		
		for i = 1, 13 do
			if mouseInside(sr_b[i]) and bToolTipShown == false then
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(sr_b[i].x - 12, sr_b[i].y - 10)
				if arr_allowed_soulbuy[i] == 1 then
					Graphics.CSurface.GL_RenderPrimitive(soulreaper_b_select2[i])
				else
					Graphics.CSurface.GL_RenderPrimitive(soulreaper_b_off[i])
				end
				Graphics.CSurface.GL_PopMatrix()
				if gui and gui.menu_pause == false then
					Hyperspace.Mouse:InstantTooltip()
					if arr_allowed_soulbuy[i] == 1 then
						Hyperspace.Mouse:SetTooltip(sr_b[i].text_on)
					elseif arr_allowed_soulbuy[i] == 0 then
						Hyperspace.Mouse:SetTooltip(sr_b[i].text_on.."\nДостигнут предел развития.")
					else
						Hyperspace.Mouse:SetTooltip(sr_b[i].text_on.."\nНе хватает душ.")
					end
					bToolTipShown = true
					mouse_inside_mem = i
				end
			else
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(sr_b[i].x - 12, sr_b[i].y - 10)
				if arr_allowed_soulbuy[i] == 1 then
					Graphics.CSurface.GL_RenderPrimitive(soulreaper_b_on[i])
				else
					Graphics.CSurface.GL_RenderPrimitive(soulreaper_b_off[i])
				end
				Graphics.CSurface.GL_PopMatrix()
			end
		end
		if mouseInside(sr_quit) and bToolTipShown == false then
			mouse_inside_mem = 999
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(sr_quit.x - 10, sr_quit.y - 10)
			Graphics.CSurface.GL_RenderPrimitive(soulreaper_quit_select2)
			Graphics.CSurface.GL_PopMatrix()
			if gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip(sr_quit.text_on)
				bToolTipShown = true
			end
		else
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(sr_quit.x - 10, sr_quit.y - 10)
			Graphics.CSurface.GL_RenderPrimitive(soulreaper_quit_on)
			Graphics.CSurface.GL_PopMatrix()
		end
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
		Graphics.freetype.easy_printRightAlign(18, 1174, 210, tostring(math.floor(Hyperspace.playerVariables['soulreaper_lvl'])).."/"..tostring(math.floor(Hyperspace.playerVariables['soulreaper_capacity'])))
		Graphics.CSurface.GL_PopMatrix()

		soul_percent = Hyperspace.playerVariables['soulreaper_lvl']/Hyperspace.playerVariables['soulreaper_capacity']
		if soul_percent > 1.0 then
			soul_percent = 1.0
		end
		pos_y = 257.0 + (316.0*(1.0-soul_percent))
		heigh = 316.0*soul_percent
		Graphics.CSurface.GL_DrawRect(1091, pos_y, 24, heigh, varr.color_green)
		Graphics.CSurface.GL_DrawRectOutline(1091, 257, 24, 316, varr.color_green, 2)
		
		local soul_desc = ""
		local soul_desc_temp = ""
		soul_desc = soul_desc.."Это орудие пожирает души погибших кораблей. Должно быть в слоте орудий в момент взрыва (не работает в волне повстанцев). Нельзя улучшить инжекторами."
		soul_desc = soul_desc.."\n\nХарактеристики:\n"
		
		local real_fc = 100.0*Hyperspace.playerVariables['soulreaper_fireChance']/10.0
		local real_bc = (100.0 - real_fc)*(Hyperspace.playerVariables['soulreaper_breachChance']/10.0)
		local plusf_real_fc = 100.0*(Hyperspace.playerVariables['soulreaper_fireChance']+3.0)/10.0
		local plusf_real_bc = (100.0 - plusf_real_fc)*(Hyperspace.playerVariables['soulreaper_breachChance']/10.0)
		local plusb_real_fc = 100.0*Hyperspace.playerVariables['soulreaper_fireChance']/10.0
		local plusb_real_bc = (100.0 - plusb_real_fc)*((Hyperspace.playerVariables['soulreaper_breachChance']+3.0)/10.0)
		
		for i = 1, 13 do
			Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
			if i == 1 then
				if Hyperspace.playerVariables['soulreaper_power'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					soul_desc = soul_desc.."Требует энергии: 2"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 1[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_power'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					soul_desc = soul_desc.."Требует энергии: 1"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 0[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_power'] == 0 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 83, 23, varr.color_green)
					soul_desc = soul_desc.."Не требует питания"
				end
			elseif i == 2 then
				if Hyperspace.playerVariables['soulreaper_cooldown'] == 14 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nВремя зарядки: 14 сек."
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 12 сек.[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 12 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nВремя зарядки: 12 сек."
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 10 сек.[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 10 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "10")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nВремя зарядки: 10 сек."
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 8 сек.[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 8 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+114, sr_b[i].y+7, 55, 23, varr.color_green)
					soul_desc = soul_desc.."\nВремя зарядки: 8 сек."
				end
			elseif i == 3 then
				if Hyperspace.playerVariables['soulreaper_shots'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+43, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\n\nВыстрелов за заряд: 1"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 2[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_shots'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+43, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\n\nВыстрелов за заряд: 2"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 3[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_shots'] == 3 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\n\nВыстрелов за заряд: 3"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 4[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_shots'] == 4 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "10")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\n\nВыстрелов за заряд: 4"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 5[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_shots'] == 5 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+129, sr_b[i].y+7, 40, 23, varr.color_green)
					soul_desc = soul_desc.."\n\nВыстрелов за заряд: 5"
				end
			elseif i == 4 then
				if Hyperspace.playerVariables['soulreaper_iDamage'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\n\nУрон по корпусу: 1"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 2[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iDamage'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "10")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\n\nУрон по корпусу: 2"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 3[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iDamage'] == 3 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 83, 23, varr.color_green)
					soul_desc = soul_desc.."\n\nУрон по корпусу: 3"
				end
			elseif i == 5 then
				if Hyperspace.playerVariables['soulreaper_iSystemDamage'] == 0 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					local sysdam = tonumber(Hyperspace.playerVariables['soulreaper_iDamage'])
					soul_desc = soul_desc.."\nУрон по системам: "..math.floor(sysdam)
					if mouse_inside_mem == i or (mouse_inside_mem == 4 and arr_allowed_soulbuy[4] ~= 0) then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(sysdam+1).."[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iSystemDamage'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					local sysdam = tonumber(Hyperspace.playerVariables['soulreaper_iDamage'])
					soul_desc = soul_desc.."\nУрон по системам: "..math.floor(sysdam+1)
					if mouse_inside_mem == i or (mouse_inside_mem == 4 and arr_allowed_soulbuy[4] ~= 0) then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(sysdam+2).."[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iSystemDamage'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 83, 23, varr.color_green)
					local sysdam = tonumber(Hyperspace.playerVariables['soulreaper_iDamage'])
					soul_desc = soul_desc.."\nУрон по системам: "..math.floor(sysdam+2)
					if (mouse_inside_mem == 4 and arr_allowed_soulbuy[4] ~= 0) then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(sysdam+3).."[[/style]]"
					end
				end
			elseif i == 6 then
				if Hyperspace.playerVariables['soulreaper_iPersDamage'] == 0 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					local persdam = 15*tonumber(Hyperspace.playerVariables['soulreaper_iDamage'])
					soul_desc = soul_desc.."\nУрон по экипажу: "..math.floor(persdam)
					if mouse_inside_mem == i or (mouse_inside_mem == 4 and arr_allowed_soulbuy[4] ~= 0) then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(persdam+15).."[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iPersDamage'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					local persdam = 15*tonumber(Hyperspace.playerVariables['soulreaper_iDamage'])
					soul_desc = soul_desc.."\nУрон по экипажу: "..math.floor(persdam+15)
					if mouse_inside_mem == i or (mouse_inside_mem == 4 and arr_allowed_soulbuy[4] ~= 0) then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(persdam+30).."[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iPersDamage'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 83, 23, varr.color_green)
					local persdam = 15*tonumber(Hyperspace.playerVariables['soulreaper_iDamage'])
					soul_desc = soul_desc.."\nУрон по экипажу: "..math.floor(persdam+30)
					if (mouse_inside_mem == 4 and arr_allowed_soulbuy[4] ~= 0) then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(persdam+45).."[[/style]]"
					end
				end
			elseif i == 7 then
				if Hyperspace.playerVariables['soulreaper_iIonDamage'] == 0 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."\n[style[color:00FF00FF]]Ионный урон: 1[[/style]]"
					else
						soul_desc = soul_desc.."\n"
					end
				elseif Hyperspace.playerVariables['soulreaper_iIonDamage'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "6")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nИонный урон: 1"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 2[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iIonDamage'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nИонный урон: 2"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 3[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iIonDamage'] == 3 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+114, sr_b[i].y+7, 55, 23, varr.color_green)
					soul_desc = soul_desc.."\nИонный урон: 3"
				end
			elseif i == 8 then
				if Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 0 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "1")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+43, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."\n[style[color:00FF00FF]]Пробивает щитов: 1[[/style]]"
					else
						soul_desc = soul_desc.."\n"
					end
				elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+43, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nПробивает щитов: 1"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 2[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nПробивает щитов: 2"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 3[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 3 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nПробивает щитов: 3"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 4[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 4 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+129, sr_b[i].y+7, 40, 23, varr.color_green)
					soul_desc = soul_desc.."\nПробивает щитов: 4"
				end
			elseif i == 9 then
				if Hyperspace.playerVariables['soulreaper_breachChance'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc_temp = soul_desc_temp.."\nШанс пробить корпус: "..math.floor(real_bc).."%"
					if mouse_inside_mem == i then
						soul_desc_temp = soul_desc_temp.."[style[color:00FF00FF]] >> "..math.floor(plusb_real_bc).."%[[/style]]"
					elseif (mouse_inside_mem == 10 and arr_allowed_soulbuy[10] ~= 0) then
						soul_desc_temp = soul_desc_temp.."[style[color:FF0000FF]] >> "..math.floor(plusf_real_bc).."%[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_breachChance'] == 4 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc_temp = soul_desc_temp.."\nШанс пробить корпус: "..math.floor(real_bc).."%"
					if mouse_inside_mem == i then
						soul_desc_temp = soul_desc_temp.."[style[color:00FF00FF]] >> "..math.floor(plusb_real_bc).."%[[/style]]"
					elseif (mouse_inside_mem == 10 and arr_allowed_soulbuy[10] ~= 0) then
						soul_desc_temp = soul_desc_temp.."[style[color:FF0000FF]] >> "..math.floor(plusf_real_bc).."%[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_breachChance'] == 7 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc_temp = soul_desc_temp.."\nШанс пробить корпус: "..math.floor(real_bc).."%"
					if mouse_inside_mem == i then
						soul_desc_temp = soul_desc_temp.."[style[color:00FF00FF]] >> "..math.floor(plusb_real_bc).."%[[/style]]"
					elseif (mouse_inside_mem == 10 and arr_allowed_soulbuy[10] ~= 0) then
						soul_desc_temp = soul_desc_temp.."[style[color:FF0000FF]] >> "..math.floor(plusf_real_bc).."%[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_breachChance'] == 10 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+114, sr_b[i].y+7, 55, 23, varr.color_green)
					soul_desc_temp = soul_desc_temp.."\nШанс пробить корпус: "..math.floor(real_bc).."%"
					if (mouse_inside_mem == 10 and arr_allowed_soulbuy[10] ~= 0) then
						soul_desc_temp = soul_desc_temp.."[style[color:FF0000FF]] >> "..math.floor(plusf_real_bc).."%[[/style]]"
					end
				end
			elseif i == 10 then
				--soul_desc = soul_desc.."\n"
				if Hyperspace.playerVariables['soulreaper_fireChance'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nШанс возгорания: "..math.floor(real_fc).."%"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(plusf_real_fc).."%[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_fireChance'] == 4 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nШанс возгорания: "..math.floor(real_fc).."%"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(plusf_real_fc).."%[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_fireChance'] == 7 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nШанс возгорания: "..math.floor(real_fc).."%"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(plusf_real_fc).."%[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_fireChance'] == 10 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+114, sr_b[i].y+7, 55, 23, varr.color_green)
					soul_desc = soul_desc.."\nШанс возгорания: "..math.floor(real_fc).."%"
				end
				soul_desc = soul_desc..soul_desc_temp
			elseif i == 11 then
				if Hyperspace.playerVariables['soulreaper_bLockdown'] == 0 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 169, 23, varr.color_green, 2)
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."\n[style[color:00FF00FF]]Запирает отсеки[[/style]]"
					else
						soul_desc = soul_desc.."\n"
					end
				elseif Hyperspace.playerVariables['soulreaper_bLockdown'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 169, 23, varr.color_green)
					soul_desc = soul_desc.."\nЗапирает отсеки"
				end
			elseif i == 12 then
				if Hyperspace.playerVariables['soulreaper_bHullBuster'] == 0 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 169, 23, varr.color_green, 2)
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."\n[style[color:00FF00FF]]Двойной урон по отсекам без систем[[/style]]"
					else
						soul_desc = soul_desc.."\n"
					end
				elseif Hyperspace.playerVariables['soulreaper_bHullBuster'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 169, 23, varr.color_green)
					soul_desc = soul_desc.."\nДвойной урон по отсекам без систем"
				end
			elseif i == 13 then
				if Hyperspace.playerVariables['soulreaper_capacity'] == 5 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "2")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nЁмкость контейнера душ: 5"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 7[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_capacity'] == 7 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					soul_desc = soul_desc.."\nЁмкость контейнера душ: 7"
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 10[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_capacity'] == 10 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 83, 23, varr.color_green)
					soul_desc = soul_desc.."\nЁмкость контейнера душ: 10"
				end
			end
		end
		--вывод текста описания орудия
		Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
		Graphics.freetype.easy_print(14, 348, 100, "Душегуб")
		Graphics.freetype.easy_printAutoNewlines(10, 348, 135, 285, soul_desc)
		
		play_anim_tick_array ("SPACE_STATUS_up")		
	end
	if mouse_inside_mem_prev == -1 and mouse_inside_mem ~= -1 then
		Hyperspace.Sounds:PlaySoundMix('hoverBeep', 7, false)
	end
	mouse_inside_mem_prev = mouse_inside_mem
	
	
	-- was here...
	
end)


local count_of_shield = 0
local count_of_fires_needed = 5
function make_sun_flare()
	enemyShip = Hyperspace.ships.enemy
	playerShip = Hyperspace.ships.player
	GSIe = Hyperspace.ShipGraph.GetShipInfo(1)
	GSIp = Hyperspace.ShipGraph.GetShipInfo(0)
	if playerShip and playerShip.bJumping == false then
		count_of_shield = 0
		if playerShip.shieldSystem then
			count_of_shield = playerShip.shieldSystem.shields.power.first
		end
		count_of_fires_needed = 5
		count_of_fires_needed = count_of_fires_needed - count_of_shield
		if count_of_fires_needed < 0 then
			count_of_fires_needed = 0
		end
		while count_of_fires_needed > 0 do
			local iselroomid = math.random(0, GSIp:RoomCount()-1)
			playerShip:StartFire(iselroomid)
			count_of_fires_needed = count_of_fires_needed - 1
		end
	end
	if enemyShip and enemyShip.bJumping == false then
		count_of_shield = 0
		if enemyShip.shieldSystem then
			count_of_shield = enemyShip.shieldSystem.shields.power.first
		end
		count_of_fires_needed = 5
		count_of_fires_needed = count_of_fires_needed - count_of_shield
		if count_of_fires_needed < 0 then
			count_of_fires_needed = 0
		end
		while count_of_fires_needed > 0 do
			local iselroomid = math.random(0,GSIe:RoomCount()-1)
			enemyShip:StartFire(iselroomid)
			count_of_fires_needed = count_of_fires_needed - 1
		end
	end
end



------------------------------
-- БЛОК МГНОВЕННОГО ЛЕЧЕНИЯ --
------------------------------
local function selectOne(n, ...)
	return arg[n]
end
local function isShipStable(ship) --проверяет что нет огня или уничтоженной кислородной системы
	if ship.fireSpreader.count > 0 then
		return false
	end
	if ship:HasSystem(2) and ship:GetSystem(2):CompletelyDestroyed() then
		return false
	end
	return true
	--return (ship.fireSpreader.count == 0 and not (ship.oxygenSystem and ship.oxygenSystem:CompletelyDestroyed()))
end
local systemsUnbreached = true
local function isShipSuperStable(ship) --как выше, но ещё проверяет что нет систем с пробоинами
	systemsUnbreached = true
	for system in vter(ship.vSystemList) do
		if system.bBreached then
			systemsUnbreached = false
			break
		end
	end
	return (isShipStable(ship) and systemsUnbreached)
end
local function isAllCrewAnaerobic(ship) --проверяет что вся команда - анаэробы
	for crew in vter2(ship.vCrewList) do
		if crew:CanSuffocate() then
			return false
		end
	end
	return true
end
local function getMaxRoomSize(shipGraph)
	local maxRoomSize = 1
	for room in vter(shipGraph.rooms) do
		maxRoomSize = math.max(maxRoomSize, shipGraph:GetNumSlots(room.iRoomId))
	end
	return maxRoomSize
end
local function getHealingOfStatBoost(statBoost, power, shipId)
	local healAmount = 0
	local trueHealAmount = 0
	local shipGraph = Hyperspace.ShipGraph.GetShipInfo(shipId)
	if (statBoost.crewTarget == Hyperspace.StatBoostDefinition.CrewTarget.ALLIES
	or statBoost.crewTarget == Hyperspace.StatBoostDefinition.CrewTarget.ALL
	or statBoost.crewTarget == Hyperspace.StatBoostDefinition.CrewTarget.CURRENT_ALLIES
	or statBoost.crewTarget == Hyperspace.StatBoostDefinition.CrewTarget.ORIGINAL_ALLIES)
	and (statBoost.droneTarget == Hyperspace.StatBoostDefinition.DroneTarget.ALL
	or statBoost.droneTarget == Hyperspace.StatBoostDefinition.DroneTarget.CREW)
	and (statBoost.whiteList:size() + statBoost.blackList:size()) == 0
	then
		if statBoost.stat == Hyperspace.CrewStat.PASSIVE_HEAL_AMOUNT or statBoost.stat == Hyperspace.CrewStat.ACTIVE_HEAL_AMOUNT then
			healAmount = healAmount + statBoost.amount
		elseif statBoost.stat == Hyperspace.CrewStat.TRUE_PASSIVE_HEAL_AMOUNT or statBoost.stat == Hyperspace.CrewStat.TRUE_HEAL_AMOUNT then
			trueHealAmount = trueHealAmount + statBoost.amount
		elseif statBoost.stat == Hyperspace.CrewStat.HEAL_CREW_AMOUNT then
			local optimalRoomMultiplier = 1
			if statBoost.amount > 0 then
				optimalRoomMultiplier = getMaxRoomSize(shipGraph) - (statBoost.affectsSelf and 0 or 1)
			end
			healAmount = healAmount + (statBoost.amount * optimalRoomMultiplier)
		elseif statBoost.stat == Hyperspace.CrewStat.STAT_BOOST then
			for providedStatBoost in vter(statBoost.providedStatBoosts) do
				partialHealAmount, partialTrueHealAmount = getHealingOfStatBoost(providedStatBoost, power, shipId)
				healAmount = healAmount + partialHealAmount
				trueHealAmount = trueHealAmount + partialTrueHealAmount
			end
		end
	elseif statBoost.crewTarget == Hyperspace.StatBoostDefinition.CrewTarget.SELF then
		if ((statBoost.stat == Hyperspace.CrewStat.PASSIVE_HEAL_AMOUNT
		or statBoost.stat == Hyperspace.CrewStat.ACTIVE_HEAL_AMOUNT
		or statBoost.stat == Hyperspace.CrewStat.TRUE_PASSIVE_HEAL_AMOUNT
		or statBoost.stat == Hyperspace.CrewStat.TRUE_HEAL_AMOUNT)
		and statBoost.amount < 0)
		and not power.def.playerReq.minHealth.enabled then return -2000000000, -2000000000 end --for Anurak and other crew like them
		if statBoost.stat == Hyperspace.CrewStat.HEAL_CREW_AMOUNT then
			healAmount = healAmount + statBoost.amount
		end
	end
	return healAmount, trueHealAmount
end
local function getHealingOfPower(power, shipId) --Check how much HP/s a power can heal
	local totalHealAmount = 0
	local totalTrueHealAmount = 0
	totalHealAmount = totalHealAmount + power.def.tempPower.healCrewAmount.value
	totalTrueHealAmount = totalTrueHealAmount + (power.def.crewHealth / (power.powerCooldown.second + power.def.tempPower.duration))
	for statBoost in vter(power.def.statBoosts) do
		local healAmount, trueHealAmount = getHealingOfStatBoost(statBoost, power, shipId)
		totalHealAmount = totalHealAmount + healAmount
		totalTrueHealAmount = totalTrueHealAmount + trueHealAmount
	end
	for roomStatBoost in vter(power.def.roomStatBoosts) do
		local healAmount, trueHealAmount = getHealingOfStatBoost(roomStatBoost, power, shipId)
		totalHealAmount = totalHealAmount + healAmount
		totalTrueHealAmount = totalTrueHealAmount + trueHealAmount
	end
	for tempStatBoost in vter(power.def.tempPower.statBoosts) do
		local healAmount, trueHealAmount = getHealingOfStatBoost(tempStatBoost, power, shipId)
		totalHealAmount = totalHealAmount + healAmount
		totalTrueHealAmount = totalTrueHealAmount + trueHealAmount
	end
	return totalHealAmount, totalTrueHealAmount
end
function printHealingOfPowers(crew)
	if type(crew) == "string" then
		for crewmember in vter(Hyperspace.ships.player.vCrewList) do
			if crew == crewmember:GetName() or crew == crewmember:GetLongName() or crew == crewmember:GetSpecies() then
				crew = crewmember
				break
			end
		end
	end
	for power in vter(crew.extend.crewPowers) do
		print(crew:GetName())
		print(getHealingOfPower(power, 0))
		print("\nNormal Stat Boosts")
		for statBoost in vter(power.def.statBoosts) do
			print(getHealingOfStatBoost(statBoost, power, 0))
		end
		print("\nRoom Stat Boosts")
		for roomStatBoost in vter(power.def.roomStatBoosts) do
			print(getHealingOfStatBoost(roomStatBoost, power, 0))
		end
		print("\nTemp Stat Boosts")
		for tempStatBoost in vter(power.def.tempPower.statBoosts) do
			print(getHealingOfStatBoost(tempStatBoost, power, 0))
		end
	end
end
function printAllHealingOfPowers()
	for crew in vter(Hyperspace.ships.player.vCrewList) do
		printHealingOfPowers(crew)
		--print()
	end
end
local currentHealers = {}
local function getMaxHealer(ship)
	local maxHealAmount = 0
	local maxTrueHealAmount = 0
	currentHealers = {}
	currentHealers.size = 0
	if ship:HasSystem(5) and ship:GetSystem(5):GetEffectivePower() > 0 then --5 is medbay
		maxHealAmount = 6.4 * math.max(1.5 * (ship:GetSystem(5):GetEffectivePower() - 1), 1)
		currentHealers[ship:GetSystem(5)] = 6.4 * math.max(1.5 * (ship:GetSystem(5):GetEffectivePower() - 1), 1)
		currentHealers.size = currentHealers.size + 1
	end
	--Find the best healer on the ship
	for crew in vter(ship.vCrewList) do
		local maxHealingOfCrew = 0
		local maxTrueHealingOfCrew = 0
		
		if (crew:IsCrew() or crew:Functional()) then --If they're not an inactive drone
			local healCrewAmount, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_CREW_AMOUNT)
			maxHealingOfCrew = healCrewAmount
			
			local _, isSilenced = crew.extend:CalculateStat(Hyperspace.CrewStat.SILENCED)
			if not isSilenced then
				for power in vter(crew.extend.crewPowers) do
					if power.enabled and power.def.playerReq.minHealth.value < crew:GetIntegerHealth() then
						local powerHealAmount, powerTrueHealAmount = getHealingOfPower(power, ship.iShipId)
						maxHealingOfCrew = maxHealingOfCrew + powerHealAmount
						maxTrueHealingOfCrew = maxTrueHealingOfCrew + powerTrueHealAmount
					end
				end
			end
		end
		if maxHealingOfCrew > 0 or maxTrueHealingOfCrew > 0 then
			currentHealers[crew] = true
			currentHealers.size = currentHealers.size + 1
		end
		maxHealAmount = math.max(maxHealAmount, maxHealingOfCrew)
		maxTrueHealAmount = math.max(maxTrueHealAmount, maxTrueHealingOfCrew)
	end
	return maxHealAmount, maxTrueHealAmount
end
local function crewCanSurviveNoOxygen(crew)
	if (not crew:CanSuffocate()) or crew:GetSuffocationMultiplier() == 0 then return true
	else
		local healAmount, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.ACTIVE_HEAL_AMOUNT)
		local trueHealAmount, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.TRUE_HEAL_AMOUNT)
		local healSpeed, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_SPEED_MULTIPLIER)
		local suffocationModifier, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.SUFFOCATION_MODIFIER)
		
		if ((healAmount * healSpeed) + trueHealAmount) >= (6.4 * suffocationModifier) then return true end
	end
	return false
end
local function getCrewDecay(crew)
	local crewDecay = 0
	local crewDef = crew.extend:GetDefinition()
	local healSpeed, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_SPEED_MULTIPLIER)
	local potentialCrewDecay = ((crewDef.passiveHealAmount + crewDef.healAmount) * healSpeed) + crewDef.truePassiveHealAmount + crewDef.trueHealAmount
	if potentialCrewDecay < 0 then
		crewDecay = potentialCrewDecay
	end
	return crewDecay
end

--[[
local timer = 0

--Timer to prevent events before you get in a hostile environment in the beacon counting as safe
script.on_internal_event(Defines.InternalEvents.JUMP_ARRIVE, function(ship)
	timer = 1 --second
end)

--Decrement timer
script.on_internal_event(Defines.InternalEvents.ON_TICK, function()
	if timer > 0 and not Hyperspace.ships.player.bJumping then
		timer = timer - (Hyperspace.FPS.SpeedFactor / 16)
	end
end)
]]

-- ВНУТРЕННИЕ НОМЕРА СИСТЕМ ДЛЯ СПРАВКИ
-- "shields", 0
-- "engines", 1
-- "oxygen", 2
-- "weapons", 3
-- "drones", 4
-- "medbay", 5
-- "piloting", 6
-- "sensors", 7
-- "doors", 8
-- "teleporter", 9
-- "cloaking", 10
-- "artillery", 11
-- "battery", 12
-- "clonebay", 13
-- "mind", 14
-- "hacking", 15
-- "reactor", 17 - lol...
-- "temporal" --20? 
 
	
-- СКРИПТ НА ИСЦЕЛЕНИЕ
local function countOfCrewWithHealCrewAmount(ship)
	local counter_OCWHCA = 0
	for crew in vter(ship.vCrewList) do
		if (crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_CREW_AMOUNT) > 0.0) then --If they're not an inactive drone
			counter_OCWHCA = counter_OCWHCA + 1
		end
	end
	return counter_OCWHCA
end
script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(ship)
	gui = Hyperspace.App.gui
    if gui and gui.upgradeButton.bActive and not gui.event_pause and varr.enemy_osa_on_playership == false then
		if ship:HasSystem(13) and ship:GetSystem(13):GetEffectivePower() > 0 and isShipStable(ship) then -- 13 is clonebay
			--print(ship:GetSystem(13).clone.blueprint.name)
			--if crewCanSurviveNoOxygen(ship:GetSystem(13).clone) == true or ship:GetOxygenPercentage() >= 75 then
			--	ship.cloneSystem.fTimeToClone = ship.cloneSystem.fTimeGoal --если вдруг заработает обращение к блоку клонирования. сейчас возвращает nil...
			--end			
			ship.cloneSystem.fTimeToClone = ship.cloneSystem.fTimeGoal
			-- если есть усиления убирающие потерю опыта при клонировании, чтобы не душить и воскрешать просто даём хил.
			if (ship:HasAugmentation("BACKUP_DNA") > 0 or ship:HasAugmentation("HID_BACKUP_DNA") > 0  or ship:HasAugmentation("BACKUP_DNA_TELEPORT_HEAL") > 0) then 
				for crew in vter4(ship.vCrewList) do
					if crew.blueprint.name ~= "osa" then
						if (countOfCrewWithHealCrewAmount(ship) == 1 and crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_CREW_AMOUNT) > 0.0) then
							crew:DirectModifyHealth(999) --print('heal alone orchid with backup_dna and clonebay!!!')
						else
							if ((((not crew.bSuffocating) and ship:GetOxygenPercentage() >= 75 and ((ship:HasSystem(2) and ship:GetSystem(2):GetEffectivePower() > 0) or ship:HasAugmentation("O2_MASKS") > 0 or ship:HasAugmentation("HID_O2_MASKS") > 0 or ship:HasAugmentation("O2_MASKS_CREW_STIMS") > 0)) or crewCanSurviveNoOxygen(crew)) or (droneSystemPowered and crew:IsDrone())) and not crew.extend.deathTimer then
								crew:DirectModifyHealth(999)
							end
						end
					end
				end
			else
				for crew in vter4(ship.vCrewList) do
					if crew.blueprint.name ~= "osa" then
						-- для рас не теряющих опыт при клонировании, просто хил, если нет угрозы жизни.
						if crew.extend:GetDefinition().cloneLoseSkills == false then
							if ((((not crew.bSuffocating) and ship:GetOxygenPercentage() >= 75 and ((ship:HasSystem(2) and ship:GetSystem(2):GetEffectivePower() > 0) or ship:HasAugmentation("O2_MASKS") > 0 or ship:HasAugmentation("HID_O2_MASKS") > 0 or ship:HasAugmentation("O2_MASKS_CREW_STIMS") > 0)) or crewCanSurviveNoOxygen(crew)) or (droneSystemPowered and crew:IsDrone())) and not crew.extend.deathTimer then
								crew:DirectModifyHealth(999)
							end
						else
							if (countOfCrewWithHealCrewAmount(ship) == 1 and crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_CREW_AMOUNT) > 0.0) then
								--print('dont heal alone orchid!')
							else
								if ((((not crew.bSuffocating) and ship:GetOxygenPercentage() >= 75 and ((ship:HasSystem(2) and ship:GetSystem(2):GetEffectivePower() > 0) or ship:HasAugmentation("O2_MASKS") > 0 or ship:HasAugmentation("HID_O2_MASKS") > 0 or ship:HasAugmentation("O2_MASKS_CREW_STIMS") > 0)) or crewCanSurviveNoOxygen(crew)) or (droneSystemPowered and crew:IsDrone())) and not crew.extend.deathTimer then
									if (countOfCrewWithHealCrewAmount(ship) == 1 and crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_CREW_AMOUNT) == 0.0) then
										crew:DirectModifyHealth(999) -- одинокий орхид хилит других
									elseif (countOfCrewWithHealCrewAmount(ship) >= 2) then
										crew:DirectModifyHealth(999) -- орхидов 2 и более = все хилятся
									end
								end
							end
						end
					end
				end
			end
		end
		
		if ship:HasSystem(4) and ship:GetSystem(4):GetEffectivePower() > 0 and isShipStable(ship) then -- 4 is drones
			for crew in vter4(ship.vCrewList) do
				local maxHealAmount, maxTrueHealAmount = getMaxHealer(ship)				
				local healSpeed, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_SPEED_MULTIPLIER)
				if (crew:IsDrone() and crew:Functional() and not crew.extend.deathTimer) and -- дрон и нету таймера смерти
				(((maxHealAmount * healSpeed) + maxTrueHealAmount + getCrewDecay(crew)) >= 0) then -- ХП изменяются в положительную сторону по итогу сложения самохилов и разложений
					crew:DirectModifyHealth(999)
				end
			end
		end
		
		if isShipSuperStable(ship) or (isShipStable(ship) and isAllCrewAnaerobic(ship)) then
			if ship:HasSystem(5) and ship:GetSystem(5):GetEffectivePower() > 0 then -- 5 is medbay
				for crew in vter4(ship.vCrewList) do
					if crew ~= nil and ship ~= nil and crew.blueprint.name ~= "osa" then
						if (not crew:IsDrone()) then
							local maxHealAmount, maxTrueHealAmount = getMaxHealer(ship)	
							local healSpeed, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_SPEED_MULTIPLIER)
							
							if (((maxHealAmount * healSpeed) + maxTrueHealAmount + getCrewDecay(crew)) > 0 -- ХП изменяются в положительную сторону по итогу сложения самохилов и разложений
							and (((not crew.bSuffocating) and ship:GetOxygenPercentage() >= 75 and (ship:GetSystem(2):GetEffectivePower() > 0 or ship:HasAugmentation("O2_MASKS") > 0 or ship:HasAugmentation("HID_O2_MASKS") > 0 or ship:HasAugmentation("O2_MASKS_CREW_STIMS") > 0)) or crewCanSurviveNoOxygen(crew))) -- не задыхается по разным причинам

							-- (мутный участок кода. лучше не трогать.))
							and ((currentHealers.size > 1 and (getCrewDecay(crew) == 0 or (currentHealers[ship:GetSystem(5)] and currentHealers[ship:GetSystem(5)] > math.abs(getCrewDecay(crew)))
							or not currentHealers[crew])) or not currentHealers[crew])

							and not crew.extend.deathTimer then -- нету таймера смерти
								crew:DirectModifyHealth(999)
							end
						end
					end
				end
			else
				for crew in vter4(ship.vCrewList) do
					if crew:IsDrone() == false and crew.blueprint.name ~= "osa" then
						local maxHealAmount, maxTrueHealAmount = getMaxHealer(ship)	
						local healSpeed, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_SPEED_MULTIPLIER)
						
						if (((maxHealAmount * healSpeed) + maxTrueHealAmount + getCrewDecay(crew)) > 0 -- ХП изменяются в положительную сторону по итогу сложения самохилов и разложений
						and (((not crew.bSuffocating) and ship:GetOxygenPercentage() >= 75 and (ship:GetSystem(2):GetEffectivePower() > 0 or ship:HasAugmentation("O2_MASKS") > 0 or ship:HasAugmentation("HID_O2_MASKS") > 0 or ship:HasAugmentation("O2_MASKS_CREW_STIMS") > 0)) or crewCanSurviveNoOxygen(crew))) -- не задыхается по разным причинам
						and not crew.extend.deathTimer then -- нету таймера смерти
							if (countOfCrewWithHealCrewAmount(ship) == 0) then
								-- нет хилеров на корабле и медбей не работает
							elseif (countOfCrewWithHealCrewAmount(ship) == 1) then
								if (crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_CREW_AMOUNT) > 0.0) then
									-- есть 1 хилер, но себя он не хилит
								else
									crew:DirectModifyHealth(999) -- хилер хилит других
								end
							elseif(countOfCrewWithHealCrewAmount(ship) > 1) then
								crew:DirectModifyHealth(999) -- хилеров более 1, значит все могут вылечиться
							end
						end
						
						if crew.extend:CalculateStat(Hyperspace.CrewStat.PASSIVE_HEAL_AMOUNT) > 0.0
						and (((not crew.bSuffocating) and ship:GetOxygenPercentage() >= 75 and (ship:GetSystem(2):GetEffectivePower() > 0 or ship:HasAugmentation("O2_MASKS") > 0 or ship:HasAugmentation("HID_O2_MASKS") > 0 or ship:HasAugmentation("O2_MASKS_CREW_STIMS") > 0)) or crewCanSurviveNoOxygen(crew)) -- не задыхается по разным причинам
						and not crew.extend.deathTimer then
							crew:DirectModifyHealth(999) -- если есть пассивный хил, работающий через задержку тоже лечим
						end
					end
				end
			end
		end
	end
end)





script.on_internal_event(Defines.InternalEvents.DAMAGE_BEAM, function(shipManager, projectile, location, damage, realNewTile, beamHitType)
    if projectile.extend.name:find("BEAM_ANNIHILATOR") ~= nil and beamHitType == Defines.BeamHit.NEW_ROOM then
	--if projectile.extend.name == "BEAM_ANNIHILATOR" and beamHitType == Defines.BeamHit.NEW_ROOM then
        if shipManager == Hyperspace.ships.player then
			Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'EVENT_CREW_DEATH_DAMAGE_TO_ENEMY',false,-1)
		elseif shipManager == Hyperspace.ships.enemy then
			Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'EVENT_CREW_DEATH_DAMAGE_TO_PLAYER',false,-1)
		end
    end
end)


-- дополняет описания на карте маяков и обозначает "ОПАСНО!"
script.on_internal_event(Defines.InternalEvents.GET_BEACON_HAZARD, function (loc)
	if loc.event.eventName == "ICE_FIELD_FIGHT" then
		return "Обнаружено ледяное поле."
	elseif loc.event.eventName == "COLD_FIELD_FIGHT" or loc.event.eventName == "COLD_FIELD_CRYSTAL_FIGHT" then
		return "Обнаружена область сверхнизких температур."
	elseif loc.event.eventName == "DRONE_FIELD_PIRATE" or loc.event.eventName == "DRONE_FIELD_REBEL" or loc.event.eventName == "DRONE_FIELD_HAL" then
		return "Обнаружены агрессивные дроны."
	elseif loc.event.eventName == "NANITE_FIELD_PIRATE" or loc.event.eventName == "NANITE_FIELD_OLD_PIRATE" then
		return "Обнаружено нанитное облако."
	elseif loc.event.eventName == "RADIOACTIVE_MINING" then
		return "Обнаружено сильное радиоактивное излучение."
	elseif loc.event.eventName == "ULTRA_SUN_FIGHT" then
		return "Обнаружена область сверхвысоких температур."
	end
	return nil
end)


-- script.on_internal_event(Defines.InternalEvents.DAMAGE_AREA, function(shipManager, projectile, location, damage, evasion, friendlyfire) 
	-- --local playerShip = Hyperspace.ships.player
	-- print('owner'..projectile.ownerId..', sM'..shipManager.iShipId)
	-- --if playerShip:HasAugmentation("RAD_DOCKING_DRILL") > 0 and Hyperspace.playerVariables.rad_docking_drilled == 1 then
		-- --print("FORCE HIT DOCK")
	-- return Defines.Chain.CONTINUE, Defines.Evasion.HIT
	-- --end
-- end)


-- находит ID комнаты по координатам
function get_room_at_location(shipManager, location, includeWalls)
    return Hyperspace.ShipGraph.GetShipInfo(shipManager.iShipId):GetSelectedRoom(location.x, location.y, includeWalls)
end



script.on_internal_event(Defines.InternalEvents.DAMAGE_AREA_HIT, function(shipManager, projectile, location, damage, shipFriendlyFire)
    if projectile then
		
		-- print ('proj='..location.x..','..location.y)
		
		-- local drones = enemyShip.droneSystem.drones
		-- for i = 0, drones:size() - 1 do
			-- local pnt = drones[i]:GetWorldCenterPoint(drones[i])
			-- --if drones[i].currentLocation then
				-- print (drones[i].destroyedTimer..','...drones[i].currentLocation.x)
				-- --print(pnt.x..','..pnt.y..','..tostring(drones[i].bDead))
			-- --end
		-- end


		-- -- if projectile.ownerId == 0 and projectile.currentSpace == 0 then
			-- -- print('work?')
		--print('owner'..projectile.ownerId..', sM'..shipManager.iShipId)
			-- Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_HIT_CLOAKED", false)
		-- -- end
		
		if projectile.ownerId == 0 and enemyShip and enemyShip._targetable:IsCloaked() == true then
			Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_HIT_CLOAKED", false)
		end
		
		local weaponName = projectile.extend.name
		if weaponName then
			-- все дрели включая инжекторные модификации
			if weaponName:find("MISSILES_DRILL") ~= nil then
				if shipManager.iShipId == 0 then -- hit to player
					if weaponName:find("MISSILES_DRILL_2_M_UNI") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_DRILL_3E", time_delay = 1400.0})
					elseif weaponName:find("MISSILES_DRILL_2_UNI") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_DRILL_3E", time_delay = 1400.0})
					elseif weaponName:find("MISSILES_DRILL_1_M_UNI") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_DRILL_2E", time_delay = 1400.0})
					elseif weaponName:find("MISSILES_DRILL_1_UNI") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_DRILL_2E", time_delay = 1400.0})
					elseif weaponName:find("MISSILES_DRILL_1") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_DRILL_1E", time_delay = 1400.0})
					elseif weaponName:find("MISSILES_DRILL_2") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_DRILL_2E", time_delay = 1400.0})
					end
				else -- hit to enemy
					if weaponName:find("MISSILES_DRILL_2_M_UNI") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_DRILL_3P", time_delay = 1400.0})
					elseif weaponName:find("MISSILES_DRILL_2_UNI") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_DRILL_3P", time_delay = 1400.0})
					elseif weaponName:find("MISSILES_DRILL_1_M_UNI") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_DRILL_2P", time_delay = 1400.0})
					elseif weaponName:find("MISSILES_DRILL_1_UNI") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_DRILL_2P", time_delay = 1400.0})
					elseif weaponName:find("MISSILES_DRILL_1") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_DRILL_1P", time_delay = 1400.0})
					elseif weaponName:find("MISSILES_DRILL_2") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_DRILL_2P", time_delay = 1400.0})
					end
				end
			end
			-- все вампиры включая инжекторные модификации
			if weaponName:find("MISSILES_VAMPIRE") ~= nil then
				if shipManager.iShipId == 0 then -- hit to player
					if weaponName:find("MISSILES_VAMPIRE_UNI") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_VAMPIRE_2E", time_delay = 100.0})
					elseif weaponName:find("MISSILES_VAMPIRE_M_UNI") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_VAMPIRE_2E", time_delay = 100.0})
					else
						table.insert(micro_tick_array, {ev_name = "MISSILES_VAMPIRE_1E", time_delay = 100.0})
					end
				else -- hit to enemy
					if weaponName:find("MISSILES_VAMPIRE_UNI") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_VAMPIRE_2P", time_delay = 100.0})
					elseif weaponName:find("MISSILES_VAMPIRE_M_UNI") ~= nil then
						table.insert(micro_tick_array, {ev_name = "MISSILES_VAMPIRE_2P", time_delay = 100.0})
					else
						table.insert(micro_tick_array, {ev_name = "MISSILES_VAMPIRE_1P", time_delay = 100.0})
					end
				end
			end
			-- все рикошет-ганы включая инжекторные модификации
			if weaponName:find("RICOCHET_GUN") ~= nil then
				if shipManager.iShipId == 0 then -- hit to player
					if weaponName:find("RICOCHET_GUN_1") ~= nil then
						table.insert(micro_tick_array, {ev_name = "RICOCHET_E1", time_delay = math.random(800, 1000)})
					elseif weaponName:find("RICOCHET_GUN_2") ~= nil then
						table.insert(micro_tick_array, {ev_name = "RICOCHET_E2", time_delay = math.random(800, 1000)})
					elseif weaponName:find("RICOCHET_GUN_3") ~= nil then
						table.insert(micro_tick_array, {ev_name = "RICOCHET_E3", time_delay = math.random(800, 1000)})
					end
				else -- hit to enemy
					if weaponName:find("RICOCHET_GUN_1") ~= nil then
						table.insert(micro_tick_array, {ev_name = "RICOCHET_P1", time_delay = math.random(800, 1000)})
					elseif weaponName:find("RICOCHET_GUN_2") ~= nil then
						table.insert(micro_tick_array, {ev_name = "RICOCHET_P2", time_delay = math.random(800, 1000)})
					elseif weaponName:find("RICOCHET_GUN_3") ~= nil then
						table.insert(micro_tick_array, {ev_name = "RICOCHET_P3", time_delay = math.random(800, 1000)})
					end
				end
			end
			
			if weaponName:find("SOULREAPER") ~= nil then
				if Hyperspace.playerVariables['soulreaper_iIonDamage'] > 0 then
					Hyperspace.Sounds:PlaySoundMix('ionHit'..tostring(math.random(1,3)), 2, false)
				end
			end
			
			
			-- бомба принудительной телепортации, ультравеселье!
			if weaponName:find("BOMB_TELE") ~= nil then
				local iTeleId = get_room_at_location(shipManager, location, true)
				local iTargShipId = (projectile.destinationSpace+1)%2
				for crew in vter(shipManager.vCrewList) do
					if crew.iRoomId == iTeleId then
						crew.extend:InitiateTeleport(iTargShipId, -1, -1)
					end
				end
			end
			
			
			
		end
	end
end)



--playerShip:PrepareSuperBarrage() волна босса 3 фазы. жесть дикая.





-- блок очистки/встраивания инжекторов
local types_of_injectors = {[0]="_PRC",[1]="_BRC",[2]="_CLD",[3]="_FRC",[4]="_POW",[5]="_UNI",[6]="_ACC",[7]="_RDY"}
local cEvent = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
local c2Event = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
function create_choise_injector_removing(locname, event)
	local indx8 = 0
	for i = 0, 7 do
		indx8 = locname:find(types_of_injectors[i])
		if indx8 ~= nil and Hyperspace.Blueprints:GetWeaponBlueprint(locname:sub(0, indx8-1)).desc.cost > 0 then
			cEvent = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
			cEvent.text.data = "Вы удаляете инжектор из вашего орудия. Теперь в него можно установить другой инжектор."
			cEvent.stuff.removeItem = locname
			cEvent.stuff.weapon = Hyperspace.Blueprints:GetWeaponBlueprint(locname:sub(0, indx8-1))
			if types_of_injectors[i] == "_PRC" then
				event:AddChoice(cEvent, "Удалить инжектор проникновения.", Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_BRC" then
				event:AddChoice(cEvent, "Удалить инжектор пробоя.", Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_CLD" then
				event:AddChoice(cEvent, "Удалить инжектор перезарядки.", Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_FRC" then
				event:AddChoice(cEvent, "Удалить инжектор пламени.", Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_POW" then
				event:AddChoice(cEvent, "Удалить инжектор энергии.", Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_UNI" then
				event:AddChoice(cEvent, "Удалить универсальный инжектор.", Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_ACC" then
				event:AddChoice(cEvent, "Удалить инжектор точности.", Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_RDY" then
				event:AddChoice(cEvent, "Удалить инжектор разогрева.", Hyperspace.ChoiceReq(), false)
			end
			
		end
	end
end
function create_choise_injector_injecting(locname, event, type_of_inj)
	if Hyperspace.Blueprints:GetWeaponBlueprint(locname..type_of_inj).desc.cost > 0 then
		cEvent = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
		cEvent.text.data = "Вы подключаете инжектор к орудию и получаете нужный результат..."
		cEvent.stuff.removeItem = locname
		cEvent.stuff.weapon = Hyperspace.Blueprints:GetWeaponBlueprint(locname..type_of_inj)
		c2Event = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
		c2Event.text.data = "...инжектор же полностью интегрировался с орудием, освободив слот для других усилений."
		c2Event.stuff.removeItem = "INJECTOR"..type_of_inj
		c2Event.eventName = "ENJECTOR_WAS_INJECTED"
		cEvent:GetChoices()[0].event = c2Event
		event:AddChoice(cEvent, "Выбрать это орудие.", Hyperspace.ChoiceReq(), false)
	end
end

script.on_internal_event(Defines.InternalEvents.PRE_CREATE_CHOICEBOX, function(event)


	-- инжектирование/очистка
	if event.eventName == "ENJECTOR_WAS_INJECTED" then
		Hyperspace.playerVariables['counter_weapon_injected'] = Hyperspace.playerVariables['counter_weapon_injected'] + 1
		Hyperspace.playerVariables['ship_assembly_installed_aug'] = Hyperspace.playerVariables['ship_assembly_installed_aug'] - 1
	end
	for i = 0, 6 do
		if event.eventName == "INJECTOR"..types_of_injectors[i].."_MASSIVE_STORE" then
			if playerShip and gui then
				for weapon in vter(playerShip:GetWeaponList()) do
					create_choise_injector_injecting (weapon.blueprint.name, event, types_of_injectors[i])
				end
				for carg in vter (gui.equipScreen:GetCargoHold()) do
					create_choise_injector_injecting (carg, event, types_of_injectors[i])
				end
			end
		end
	end
	if event.eventName == "INJECTOR_WEAPONS_CLEAR" then
		if playerShip and gui then
			for weapon in vter(playerShip:GetWeaponList()) do
				create_choise_injector_removing(weapon.blueprint.name, event)
			end
			for carg in vter (gui.equipScreen:GetCargoHold()) do
				create_choise_injector_removing(carg, event)
			end
		end
	end

	if event.text:GetText():find('Вы совершаете выгодный обмен и, довольные, отправляетесь на торговую площадку.') ~= nil then
		Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_SHILO_MILO", false)
	end
	
	
   --event:AddChoice(locEvent, "choice text", req, false)
   
	--if event.stuff and event.stuff.weapon~=nil then
	
	
	
	-- ЭТОТ БЛОК СПОСОБЕН ПОДМЕНИТЬ ОРУДИЕ В ЧОЙЗЕ - НЕ УДАЛЯТЬ!!!!!!!!!!!!
	--if event:GetChoices()[0].event.stuff.weapon~=nil then
		--local str_arr_weapons = Hyperspace.Blueprints:GetBlueprintList("WEAPONS_AUTO")
		--event:GetChoices()[0].event.stuff.weapon = Hyperspace.Blueprints:GetWeaponBlueprint("SOULREAPER1")
		--print('weap'..event:GetChoices()[0].event.stuff.weapon.blueprint.name)
	--end
  
end)



script.on_internal_event(Defines.InternalEvents.PROJECTILE_FIRE, function(projectile, proj_factory)
--script.on_internal_event(Defines.InternalEvents.PROJECTILE_INITIALIZE, function(projectile, weaponBlueprint)
	
	if Hyperspace.playerVariables['curse_player_missing'] > 0 then
		if projectile.ownerId == 0 then --player
			projectile.extend.customDamage.accuracyMod = projectile.extend.customDamage.accuracyMod - 50
		end
	end
	if Hyperspace.playerVariables['curse_enemy_hitting'] > 0 then
		if projectile.ownerId == 1 then --enemy
			projectile.extend.customDamage.accuracyMod = projectile.extend.customDamage.accuracyMod + 50
		end
	end
	if Hyperspace.playerVariables['curse_enemy_firing'] > 0 then
		if projectile.ownerId == 1 then --enemy
			if projectile.damage.fireChance > 0 then
				projectile.damage.fireChance = 10
			end
		end
	end
	
	if proj_factory.blueprint.name:find("SOULREAPER") ~= nil then
	--if weaponBlueprint.name:find("SOULREAPER") ~= nil then
		
		local real_fc = Hyperspace.playerVariables['soulreaper_fireChance']/10.0
		local real_bc = (1.0 - real_fc)*(Hyperspace.playerVariables['soulreaper_breachChance']/10.0)
		if Hyperspace.playerVariables['soulreaper_iDamage'] == 1 then
			if Hyperspace.playerVariables['soulreaper_fireChance'] == 1 and Hyperspace.playerVariables['soulreaper_breachChance'] == 1 then
				projectile.flight_animation = Hyperspace.Animations:GetAnimation("soul_laser_1g")
			elseif real_bc > real_fc then
				projectile.flight_animation = Hyperspace.Animations:GetAnimation("soul_laser_1v")
			else
				projectile.flight_animation = Hyperspace.Animations:GetAnimation("soul_laser_1r")
			end
			if Hyperspace.playerVariables['soulreaper_iIonDamage'] > 0 then
				projectile.death_animation = Hyperspace.Animations:GetAnimation("explosion_small_ion")
			else
				--projectile.death_animation = Hyperspace.Animations:GetAnimation("explosion_random")
			end
		elseif Hyperspace.playerVariables['soulreaper_iDamage'] == 2 then
			if Hyperspace.playerVariables['soulreaper_fireChance'] == 1 and Hyperspace.playerVariables['soulreaper_breachChance'] == 1 then
				projectile.flight_animation = Hyperspace.Animations:GetAnimation("soul_laser_2g")
			elseif real_bc > real_fc then
				projectile.flight_animation = Hyperspace.Animations:GetAnimation("soul_laser_2v")
			else
				projectile.flight_animation = Hyperspace.Animations:GetAnimation("soul_laser_2r")
			end
			if Hyperspace.playerVariables['soulreaper_iIonDamage'] > 0 then
				projectile.death_animation = Hyperspace.Animations:GetAnimation("ba_explosion_ion_hit_heavy")
			else
				projectile.death_animation = Hyperspace.Animations:GetAnimation("ba_explosion_laser_hit_heavy")
			end
		elseif Hyperspace.playerVariables['soulreaper_iDamage'] == 3 then
			if Hyperspace.playerVariables['soulreaper_fireChance'] == 1 and Hyperspace.playerVariables['soulreaper_breachChance'] == 1 then
				projectile.flight_animation = Hyperspace.Animations:GetAnimation("soul_laser_3g")
			elseif real_bc > real_fc then
				projectile.flight_animation = Hyperspace.Animations:GetAnimation("soul_laser_3v")
			else
				projectile.flight_animation = Hyperspace.Animations:GetAnimation("soul_laser_3r")
			end
			if Hyperspace.playerVariables['soulreaper_iIonDamage'] > 0 then
				projectile.death_animation = Hyperspace.Animations:GetAnimation("ba_explosion_ion_hit_heavy")
			else
				projectile.death_animation = Hyperspace.Animations:GetAnimation("ba_explosion_laser_hit_heavy")
			end
		end
		
		if Hyperspace.playerVariables['soulreaper_iIonDamage'] > 0 then
			--projectile.hitSolidSound = "ionHit"..tostring(math.random(1,3))
			projectile.hitShieldSound = "ionShields"..tostring(math.random(1,3))
		end
		
		-- стандартный запуск звука убран в блюпринтах на silence. бахает отсюда...
		if Hyperspace.playerVariables['soulreaper_iDamage'] == 1 then
			Hyperspace.Sounds:PlaySoundMix('lightLaser'..tostring(math.random(1,3)), 2, false)
		else
			Hyperspace.Sounds:PlaySoundMix('heavyLaser'..tostring(math.random(1,3)), 2, false)
		end
		
		
		if Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 0 then
			projectile.speed_magnitude = 60.0--default speed
		elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 1 then
			projectile.speed_magnitude = 70.0
		elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 2 then
			projectile.speed_magnitude = 80.0
		elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 3 then
			projectile.speed_magnitude = 90.0
		elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 4 then
			projectile.speed_magnitude = 100.0
		end
		
		local px = gui.shipPosition.x + projectile.position.x
		local py = gui.shipPosition.y + projectile.position.y
		if Hyperspace.playerVariables['soulreaper_bLockdown'] == 1 and gui then
			--пусковик произвольной анимации в нужной точке экрана, аееееее. нам больше не нужны махинации vertex модуля.
			--вопрос лишь в нахождении координат на экране, остальное в анимациях берётся
			table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("effects/explosion_crystal_2.png"), time_length = 500.0, time_length_mem = 500.0, x = px-13, y = py-24, w=336, h=48, fw=48, fh=48, layer = "SPACE_STATUS"})
		end
		
		if Hyperspace.playerVariables['soulreaper_iIonDamage'] > 0 and gui then
			table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("effects/stun_computer.png"), time_length = 1000.0, time_length_mem = 1000.0, x = px-10, y = py-10, w=245, h=35, fw=35, fh=35, layer = "SPACE_STATUS"})
		end
	end
	
	if proj_factory.blueprint.name:find("ARTILLERY_PL_BOMB_TIMER") ~= nil or proj_factory.blueprint.name:find("ARTILLERY_PL_BOMB_BREACH") ~= nil then
		-- измерения снарядов:
		-- 1й <1.0
		-- 2й 1.0-2.0
		-- 3й >2.0
		if proj_factory.cooldown.first > 1.0 then 
			if proj_factory.targetId == 0 then
				projectile.target = Hyperspace.ships.player:GetRandomRoomCenter()
			else
				projectile.target = Hyperspace.ships.enemy:GetRandomRoomCenter()
			end
		end
	end
	
	-- обслуживание живого говорящего орудия
	if proj_factory.blueprint.name:find("LASER_ALIVE") ~= nil then
		if math.random(0,100) < 30 or micro_tick_counter6 > 0.0 then --шанс выстрела не туда
			if proj_factory.targetId == 0 then
				projectile.target = Hyperspace.ships.player:GetRandomRoomCenter()
			else
				projectile.target = Hyperspace.ships.enemy:GetRandomRoomCenter()
				-- анимации-фразы когда выёживается и стреляет не туда:
				-- СТРЕЛЯЮ - КУДА ХОЧУ! БЬЮ БЕЗ ПРОМАХА! ЦЕЛЬ ПЕРЕОПРЕДЕЛЕНА! СМОТРИ И УЧИСЬ! ВОТ ТАК-ТО ЛУЧШЕ! ПРИЦЕЛ ПОПРАВЛЕН! Я ЛУЧШЕ ЗНАЮ! ВОТ СЮДА БАХНУ! ДАЁШЬ БУНТ!
				if micro_tick_counter6 <= 0.0 then
					local px = gui.shipPosition.x + projectile.position.x
					local py = gui.shipPosition.y + projectile.position.y
					-- if proj_factory.mount.mirror == true then
					table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("effects/talk_weapon_"..tostring(math.random(0,7))..".png"), time_length = 1800.0, time_length_mem = 1800.0, x = px+6, y = py-45, w=250, h=50, fw=250, fh=50, layer = "SPACE_STATUS"})
					micro_tick_counter6 = 2000.0
				end
				projectile.extend.customDamage.accuracyMod = projectile.extend.customDamage.accuracyMod - 10
			end
		end
	end
	
	
	-- for sect in vter(Hyperspace.App.world.starMap.sectors) do
        -- if sect then
			-- print(sect.description.type) --даёт список секторов всех. а толку то с этого...
		-- end
	-- end

	
	
end)


-- показывает количество суперщитов у вражеских кораблей
local shieldBox = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/vanilla_shield_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local shieldBoxOff = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/vanilla_shield_off.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
script.on_render_event(Defines.RenderEvents.SHIP, function() end, function()
	if enemyShip and playerShip and not playerShip.bJumping and Hyperspace.Global.GetInstance():GetCApp().world.bStartedGame then
		if enemyShip.shieldSystem and enemyShip.shieldSystem.shields.power.super.second ~= 0 and enemyShip.ship.hullIntegrity.first > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_LoadIdentity()
			if Hyperspace.Global.GetInstance():GetCApp().gui.combatControl.boss_visual then
				Graphics.CSurface.GL_Translate(757, 109)
			else
				Graphics.CSurface.GL_Translate(882, 152)
			end
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


script.on_render_event(Defines.RenderEvents.LAYER_BACKGROUND, function() end, function(ship)
	if Hyperspace.playerVariables['bShowOrchidFleet'] == 1 then
		if varr.orchid_fleet_x == 0 and varr.orchid_fleet_y == 0 then

		else
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.orchid_fleet_x, varr.orchid_fleet_y)
			Graphics.CSurface.GL_RenderPrimitive(orchid_fleet)
			Graphics.CSurface.GL_PopMatrix()
		end
	end
	if Hyperspace.App.menu.shipBuilder.bOpen == true or Hyperspace.App.menu.bOpen == true then -- останавливаем выполнение всех тик-процессов
		-- НИЧЕГО НЕ ДЕЛАТЬ ТУТ
	else
		play_anim_tick_array ("LAYER_BACKGROUND")
	end	
end)
script.on_render_event(Defines.RenderEvents.SPACE_STATUS, function() end, function(ship)--GUI_CONTAINER
	
	--Hyperspace.metaVariables['rec_sector_statistic'] = 1
	if Hyperspace.App.menu.shipBuilder.bOpen == true or Hyperspace.App.menu.bOpen == true then -- останавливаем выполнение всех тик-процессов
		-- НИЧЕГО НЕ ДЕЛАТЬ ТУТ
	else
		play_anim_tick_array ("SPACE_STATUS")
		if Hyperspace.playerVariables['used_tactical_pause'] == 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(1267, 709)
			Graphics.CSurface.GL_RenderPrimitive(button_no_tactical_pause)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside({x = 1267, y = 709, w = 13, h = 11}) then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip("В этом полёте не использовалась тактическая пауза.")
			end
		end
	end
end)


-- script.on_internal_event(Defines.InternalEvents.DAMAGE_BEAM, function(ship, projectile, location, damage, realNewTile, beamHitType)
--    return Defines.Chain.CONTINUE, beamHitType
-- end)


-- script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipManager)

    -- --Shield image creation (very bad code, but should work)
    -- for crew in vter(shipManager.vCrewList) do
        -- if crew then
			-- print(crew:GetSpecies()..','..crew.x..','..crew.y)
		-- end
	-- end
-- end)

local sector_arr = {-- gray 828282, green 86c946, red d93130, violet a453f8, yellow-select f3f132
	{inner_name='STANDARD_SPACE', map_color='86c946'},
	{inner_name='TRUE_CIVILIAN_SECTOR', map_color='86c946'},
	{inner_name='ENGI_SECTOR', map_color='86c946'},
	{inner_name='ZOLTAN_SECTOR', map_color='86c946'},
	{inner_name='ZOLTON_SECTOR', map_color='86c946'},
	{inner_name='MORPH_SECTOR', map_color='86c946'},
	{inner_name='ORCHID_SECTOR', map_color='86c946'},
	{inner_name='TRADE_SECTOR', map_color='828282'},
	{inner_name='REBEL_SECTOR', map_color='d93130'},
	{inner_name='ORDEN_SECTOR', map_color='d93130'},
	{inner_name='HAL_SECTOR', map_color='d93130'},
	{inner_name='PIRATE_SECTOR', map_color='d93130'},
	{inner_name='MANTIS_SECTOR', map_color='d93130'},
	{inner_name='ROCK_SECTOR', map_color='d93130'},
	{inner_name='LANIUS_SECTOR', map_color='d93130'},
	{inner_name='BORDER_SECTOR', map_color='828282'},
	{inner_name='NEBULA_SECTOR', map_color='a453f8'},
	{inner_name='UNSTABLE_SECTOR', map_color='a453f8'},
	{inner_name='AVATAR_SECTOR', map_color='a453f8'},
	{inner_name='SLUG_SECTOR', map_color='a453f8'},
	{inner_name='SLURM_SECTOR', map_color='828282'},
	{inner_name='ENGI_HOME', map_color='86c946'},
	{inner_name='ZOLTAN_HOME', map_color='86c946'},
	{inner_name='ZOLTON_HOME', map_color='86c946'},
	{inner_name='MORPH_HOME', map_color='86c946'},
	{inner_name='ORCHID_HOME', map_color='86c946'},
	{inner_name='REBEL_SECTOR_MINIBOSS', map_color='d93130'},
	{inner_name='ORDEN_SECTOR_MINIBOSS', map_color='d93130'},
	{inner_name='HAL_SECTOR_HOME', map_color='d93130'},
	{inner_name='MANTIS_HOME', map_color='d93130'},
	{inner_name='ROCK_HOME', map_color='d93130'},
	{inner_name='LANIUS_SECTOR_HOME', map_color='d93130'},
	{inner_name='ULTRA_UNSTABLE_SECTOR', map_color='a453f8'},
	{inner_name='AVATAR_SECTOR_HOME', map_color='a453f8'},
	{inner_name='SLUG_HOME', map_color='a453f8'},
	{inner_name='CRYSTAL_HOME', map_color='d93130'},
	{inner_name='FINAL', map_color='d93130'}
}
--local sec_array = {}

function remember_sector_reward(sec_num, sec_type, sec_reward)
	if Hyperspace.playerVariables['dont_remember_last_sector'] == 0 then
		if sec_num == 1 then
			sec_type = 'STANDARD_SPACE'
		end
		if sec_type == 'CIVILIAN_SECTOR' then
			sec_type = 'TRUE_CIVILIAN_SECTOR'
		end
		
		if Hyperspace.metaVariables['rec_sector_statistic'] == 1 then
			if sec_reward ~= -4 then -- -4 это пролёт EXIT'ом за 1 топливо - не пишем.
				-- название обычное map.currentSector.description.name:GetText()
				-- название техническое map.currentSector.description.type
				--print(sec_num..'='..sec_type..'='..sec_reward)
				diff = tostring(math.floor(Hyperspace.Settings.difficulty))
				Hyperspace.metaVariables[sec_type..'#'..diff..'#'..tostring(math.floor(sec_num))..'rew'] = Hyperspace.metaVariables[sec_type..'#'..diff..'#'..tostring(math.floor(sec_num))..'rew']*Hyperspace.metaVariables[sec_type..'#'..diff..'#'..tostring(math.floor(sec_num))..'meet']/(Hyperspace.metaVariables[sec_type..'#'..diff..'#'..tostring(math.floor(sec_num))..'meet'] + 1) + sec_reward/(Hyperspace.metaVariables[sec_type..'#'..diff..'#'..tostring(math.floor(sec_num))..'meet'] + 1)
				Hyperspace.metaVariables[sec_type..'#'..diff..'#'..tostring(math.floor(sec_num))..'meet'] = Hyperspace.metaVariables[sec_type..'#'..diff..'#'..tostring(math.floor(sec_num))..'meet'] + 1
				--print('rew='..Hyperspace.metaVariables[sec_type..'#'..diff..'#'..tostring(math.floor(sec_num))..'rew'])
				
			end
		end
	else
		--print('sector zaporot!')
	end
end

function isReallyDangerousEnvironment()
	if Hyperspace.App.world.space:DangerousEnvironment() == true then
		return true
	end
	if Hyperspace.playerVariables['danger_crystals'] == 1 or Hyperspace.playerVariables['danger_cold'] == 1 or Hyperspace.playerVariables['danger_wild_drones'] == 1 or
	Hyperspace.playerVariables['danger_nanites'] == 1 or Hyperspace.playerVariables['danger_radiation'] == 1 or Hyperspace.playerVariables['danger_ultra_sun'] == 1 then
		return true
	end
	return false
end

function check_max_raw_victory_counter()
	if Hyperspace.metaVariables['raw_victory_counter'] > Hyperspace.metaVariables['max_raw_victory_counter'] then
		Hyperspace.metaVariables['max_raw_victory_counter'] = Hyperspace.metaVariables['raw_victory_counter']
	end
end

local bRecalculated_ship_cost = false
-- local iCurrentSelectedSectorId = 1
-- function iCurrentSelectedSectorId_right()
	-- iCurrentSelectedSectorId = iCurrentSelectedSectorId + 1
	-- if iCurrentSelectedSectorId > #sector_arr then
		-- iCurrentSelectedSectorId = 1
	-- end
-- end
-- function iCurrentSelectedSectorId_left()
	-- iCurrentSelectedSectorId = iCurrentSelectedSectorId - 1
	-- if iCurrentSelectedSectorId < 1 then
		-- iCurrentSelectedSectorId = #sector_arr
	-- end
-- end
function ClearStat()
	diff = tostring(math.floor(Hyperspace.Settings.difficulty))
	for i = 1, #sector_arr do
		for j = 1, 8 do
			Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'rew'] = 0
			Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'meet'] = 0
		end
	end
end
function switch_rec_statistic()
	if Hyperspace.metaVariables['rec_sector_statistic'] == 1 then
		Hyperspace.metaVariables['rec_sector_statistic'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['rec_sector_statistic'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function anilize_rew(rr)
	local iL = 10-#tostring(rr)
	local outS = ''
	for i = 0, iL do
		outS = outS..' '
	end
	return outS
end
local sd = ''

local previous_overfullcrew = false
script.on_render_event(Defines.RenderEvents.TABBED_WINDOW, function() end, function(current_tab_name)
	--print (current_tab_name)
	varr.mouse_inside_mem2 = -1
	
	if playerShip then
		if varr.previous_droneSystem == 0 then
			if playerShip.droneSystem ~= nil then
				--print('buy dronesys')
				Hyperspace.playerVariables['this_beacon_buy_dronesystem'] = 1
				for drone in vter(playerShip.droneSystem.drones) do
					--print('mydroneis:'..drone.blueprint.name)
					if drone.blueprint.name == "BOARDER_ION" then
						Hyperspace.playerVariables['giftdroneis_BOARDER_ION'] = 1
					else
						Hyperspace.playerVariables['giftdroneis_BOARDER_ION'] = 0
					end				
				end
			end
		end
		if playerShip.droneSystem == nil then
			varr.previous_droneSystem = 0
		else
			varr.previous_droneSystem = 1
		end
		varr.count_of_R_weapons = 0
		if playerShip.droneSystem ~= nil then
			for drone in vter(playerShip.droneSystem.drones) do
				--print(drone.blueprint.name..','..drone.blueprint.desc.cost)
				if drone.blueprint.desc.cost == 60 and drone.blueprint.name:find("_R", #drone.blueprint.name-3) ~= nil then
					--print(drone.blueprint.name:find("_R", #drone.blueprint.name-3)..','..#drone.blueprint.name)
					varr.count_of_R_weapons = varr.count_of_R_weapons + 1
				end
				if Hyperspace.playerVariables['giftdroneis_BOARDER_ION'] == 1 and drone.blueprint.name == "BOARDER_ION" then
					varr.count_of_R_weapons = varr.count_of_R_weapons + 1
				end
			end
		end
		if gui then
			for carg in vter(gui.equipScreen:GetCargoHold()) do
				if Hyperspace.Blueprints:GetDroneBlueprint(carg).desc.cost == 60 and carg:find("_R", #carg-3) ~= nil then
					--print('carg'..carg:find("_R", #carg-3)..','..#carg)
					varr.count_of_R_weapons = varr.count_of_R_weapons + 1
				end
				if Hyperspace.playerVariables['giftdroneis_BOARDER_ION'] == 1 and carg == "BOARDER_ION" then
					varr.count_of_R_weapons = varr.count_of_R_weapons + 1
				end
			end
		end
		if current_tab_name == "sell" then
			if varr.count_of_R_weapons < varr.previous_count_of_R_weapons then
				--print('selled!')
				if Hyperspace.playerVariables['this_beacon_buy_dronesystem'] == 1 then
					--print('sell in same store!')
					Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_DONTNEEDIT", false)
				end
			end
		end
		varr.previous_count_of_R_weapons = varr.count_of_R_weapons
	end
	
	if current_tab_name == "crew" then
		if playerShip then
			if previous_overfullcrew == true and Hyperspace.ships.player:IsCrewOverFull() == false then
				Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_GO_AWAY", false)
			end
			previous_overfullcrew = Hyperspace.ships.player:IsCrewOverFull()
		end
	end
	
	if current_tab_name == "statistic" then
		varr.TABBED_WINDOW_is_visible = true
		check_max_raw_victory_counter()
		Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
		if bRecalculated_ship_cost == false then
			costy, costy_pot, _ = calculate_ship_cost (Hyperspace.ships.player)
			Hyperspace.playerVariables['calc_local_strength'] = costy
			Hyperspace.playerVariables['calc_local_strength_pot'] = costy_pot
			bRecalculated_ship_cost = true
		end
		local text_out = ''
		text_out = text_out..'Боевая стоимость корабля: '..tostring(math.floor(Hyperspace.playerVariables['calc_local_strength']))..' ~'
		text_out = text_out..'\nСтоимость корабля с грузом: '..tostring(math.floor(Hyperspace.playerVariables['calc_local_strength_pot']))..' ~'
		text_out = text_out..'\nМакс. серия побед подряд: '..tostring(math.floor(Hyperspace.metaVariables['max_raw_victory_counter']))
		text_out = text_out..'\nТекущая серия побед подряд: '..tostring(math.floor(Hyperspace.metaVariables['raw_victory_counter']))
		if Hyperspace.playerVariables['jumps_in_current_sector'] == 0 then
			text_out = text_out..'\nТекущий доход за сектор: 0 ~'
		else
			text_out = text_out..'\nТекущий доход за сектор: '..tostring(math.floor(costy_pot - iBeginSectorCostP))..' ~'
		end
		Graphics.freetype.easy_print(11, 317+offs_x, 143, text_out)--12
		text_out = 'Текущий счёт:'--\n'..tostring(math.floor(Hyperspace.Score.currentScore.score))
		Graphics.freetype.easy_printCenter(11, 800+offs_x, 145, text_out)
		text_out = tostring(math.floor(Hyperspace.Score.currentScore.score))
		Graphics.freetype.easy_printCenter(16, 800+offs_x, 162, text_out)
		diff = tostring(math.floor(Hyperspace.Settings.difficulty))
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(634+offs_x, 136)
		if diff == '0' then
			Graphics.CSurface.GL_RenderPrimitive(varr.stat_0)
		elseif diff == '1' then
			Graphics.CSurface.GL_RenderPrimitive(varr.stat_1)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.stat_2)
		end
		Graphics.CSurface.GL_PopMatrix()
		if mouseInside({x = 634+offs_x, y = 136, w = 80, h = 80}) then
			Hyperspace.Mouse:InstantTooltip()
			if diff == '0' then
				Hyperspace.Mouse:SetTooltip("Статистика секторов для лёгкого режима")
			elseif diff == '1' then
				Hyperspace.Mouse:SetTooltip("Статистика секторов для нормального режима")
			else
				Hyperspace.Mouse:SetTooltip("Статистика секторов для сложного режима")
			end
		end
		for i = 1, #sector_arr do
			local start_y_off = 234
			local x_shiftt = 0
			local y_shiftt = 0
			if i > 19 then
				x_shiftt = 290
				y_shiftt = -19*15
			end
			x_shiftt = x_shiftt + offs_x
			
			if mouseInside({x = 310+x_shiftt, y = start_y_off+i*15+y_shiftt, w = 280, h = 15}) then
				
				if sector_arr[i].inner_name == map.currentSector.description.type or (i==1 and Hyperspace.playerVariables['counter_number_of_sector'] == 1) or (Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 and map.currentSector.description.type=='CIVILIAN_SECTOR' and sector_arr[i].inner_name == 'TRUE_CIVILIAN_SECTOR') then
					Graphics.freetype.easy_printCenter(11, 450+x_shiftt, start_y_off+i*15+y_shiftt, '[style[color:f3f132FF]]*'..Hyperspace.Text:GetText('sectorname_short_'..sector_arr[i].inner_name)..'*[[/style]]')
				else
					Graphics.freetype.easy_printCenter(11, 450+x_shiftt, start_y_off+i*15+y_shiftt, '[style[color:f3f132FF]]'..Hyperspace.Text:GetText('sectorname_short_'..sector_arr[i].inner_name)..'[[/style]]')
				end
				sector_text_out = '[style[color:f3f132]]'..Hyperspace.Text:GetText('sectorname_short_'..sector_arr[i].inner_name)..'[[/style]]'
				sector_text_out = sector_text_out..'\nНомер   Ср.доход   Посещено'
				if sector_arr[i].inner_name == 'FINAL' then
					local j = 8
					sd = ''
					if Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'meet'] > 0 then
						local rew = Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'rew']
						sd = sd..'\n'..j..'.           '..tostring(math.floor(rew))..' ~'..anilize_rew(rew)..'          '..tostring(math.floor(Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'meet']))
					else
						sd = sd..'\n'..j..'.           '..'нет данных...'
					end
					if j == Hyperspace.playerVariables['counter_number_of_sector'] then
						sd = '[style[color:f3f132]]'..sd..'[[/style]]'
					end
					sector_text_out = sector_text_out..sd
				elseif sector_arr[i].inner_name == 'STANDARD_SPACE' then
					local j = 1
					sd = ''
					if Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'meet'] > 0 then
						local rew = Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'rew']
						sd = sd..'\n'..j..'.           '..tostring(math.floor(rew))..' ~'..anilize_rew(rew)..'          '..tostring(math.floor(Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'meet']))
					else
						sd = sd..'\n'..j..'.           '..'нет данных...'
					end
					if j == Hyperspace.playerVariables['counter_number_of_sector'] then
						sd = '[style[color:f3f132]]'..sd..'[[/style]]'
					end
					sector_text_out = sector_text_out..sd
				else
					for j = 2, 7 do -- было 1-7
						sd = ''
						if Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'meet'] > 0 then
							local rew = Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'rew']
							sd = sd..'\n'..j..'.           '..tostring(math.floor(rew))..' ~'..anilize_rew(rew)..'          '..tostring(math.floor(Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'meet']))
						else
							sd = sd..'\n'..j..'.           '..'нет данных...'
						end
						
						if j == Hyperspace.playerVariables['counter_number_of_sector'] then
							sd = '[style[color:f3f132]]'..sd..'[[/style]]'
						end
						sector_text_out = sector_text_out..sd
					end
				end
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip(sector_text_out)
			else
				if sector_arr[i].inner_name == map.currentSector.description.type or (i==1 and Hyperspace.playerVariables['counter_number_of_sector'] == 1) or (Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 and map.currentSector.description.type=='CIVILIAN_SECTOR' and sector_arr[i].inner_name == 'TRUE_CIVILIAN_SECTOR') then
					Graphics.freetype.easy_printCenter(11, 450+x_shiftt, start_y_off+i*15+y_shiftt, '[style[color:'..sector_arr[i].map_color..'FF]]*'..Hyperspace.Text:GetText('sectorname_short_'..sector_arr[i].inner_name)..'*[[/style]]')
				else
					Graphics.freetype.easy_printCenter(11, 450+x_shiftt, start_y_off+i*15+y_shiftt, '[style[color:'..sector_arr[i].map_color..'FF]]'..Hyperspace.Text:GetText('sectorname_short_'..sector_arr[i].inner_name)..'[[/style]]')
				end
			end
		end
		-- работают цвета тут! [style[color:FF0000FF]] >> [[/style]]")
	
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(button_clearstatBox.x, button_clearstatBox.y)
		if mouseInside(button_clearstatBox) then
			varr.mouse_inside_mem2 = 999
			Graphics.CSurface.GL_RenderPrimitive(button_clearstat_select2)
			Hyperspace.Mouse:InstantTooltip()
			Hyperspace.Mouse:SetTooltip("Очистить статистику полётов")
		else
			Graphics.CSurface.GL_RenderPrimitive(button_clearstat_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		if varr.prepare_to_clear_stat == true then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(button_confirmBox.x, button_confirmBox.y)
			if mouseInside(button_confirmBox) then
				varr.mouse_inside_mem2 = 999
				Graphics.CSurface.GL_RenderPrimitive(button_confirm_select2)
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip("Подтвердить очистку статистики полётов")
			else
				Graphics.CSurface.GL_RenderPrimitive(button_confirm_on)
			end
			Graphics.CSurface.GL_PopMatrix()
		end	
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(button_recBox.x, button_recBox.y)
		if mouseInside(button_recBox) then
			varr.mouse_inside_mem2 = 999
			if Hyperspace.metaVariables['rec_sector_statistic'] == 1 then
				Graphics.CSurface.GL_RenderPrimitive(button_recOn_select2)
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip("Вкл./выкл. запись статистики доходности секторов\n[style[color:86c946]]Запись включена[[/style]]")
			else
				Graphics.CSurface.GL_RenderPrimitive(button_recOff_select2)
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip("Вкл./выкл. запись статистики доходности секторов\n[style[color:d93130]]Запись выключена[[/style]]")
			end
		else
			if Hyperspace.metaVariables['rec_sector_statistic'] == 1 then
				Graphics.CSurface.GL_RenderPrimitive(button_recOn_on)
			else
				Graphics.CSurface.GL_RenderPrimitive(button_recOff_on)
			end
		end
		Graphics.CSurface.GL_PopMatrix()
		
	else
		bRecalculated_ship_cost = false
		varr.TABBED_WINDOW_is_visible = false
	end
	
	if varr.mouse_inside_mem_prev2 == -1 and varr.mouse_inside_mem2 ~= -1 then
		Hyperspace.Sounds:PlaySoundMix('hoverBeep', 7, false)
	end
	varr.mouse_inside_mem_prev2 = varr.mouse_inside_mem2
end)

--local mini_count_arr = {[0]=0, [1]=0}
local mini_count = 0
local mini_count2 = 0
function get_sector_color(sector_type)
	for i = 1, #sector_arr do
		if sector_type == sector_arr[i].inner_name then
			return sector_arr[i].map_color
		end
	end
	return 'ffffff'
end

local ssi = {[0] = '', [1] = ''}
function short_sector_info(inner_name, j)
	if inner_name == 'CIVILIAN_SECTOR' then
		inner_name = 'TRUE_CIVILIAN_SECTOR'
	end
	ssi[mini_count2] = inner_name
	j = j+1
	diff = tostring(math.floor(Hyperspace.Settings.difficulty))
	--sd = '[style[color:f3f132FF]]'..Hyperspace.Text:GetText('sectorname_short_'..inner_name)..'[[/style]]'
	sd = '[style[color:'..get_sector_color(inner_name)..'FF]]'..Hyperspace.Text:GetText('sectorname_short_'..inner_name)..'[[/style]]'
	
	sd = sd..'\nНомер   Ср.доход   Посещено'
	if Hyperspace.metaVariables[inner_name..'#'..diff..'#'..j..'meet'] > 0 then
		local rew = Hyperspace.metaVariables[inner_name..'#'..diff..'#'..j..'rew']
		sd = sd..'\n'..j..'.           '..tostring(math.floor(rew))..' ~'..anilize_rew(rew)..'          '..tostring(math.floor(Hyperspace.metaVariables[inner_name..'#'..diff..'#'..j..'meet']))
	else
		sd = sd..'\n'..j..'.           '..'нет данных...'
	end
	--Graphics.freetype.easy_printCenter(11, 1150, 200 + mini_count2*40, sd)
	Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
	Graphics.freetype.easy_print(11, 973, 260 + mini_count2*80, sd)
	--print(ssi[0]..','..ssi[1])
	if ssi[0] ~= '' and ssi[1] ~= '' and ssi[0] == ssi[1] then
		--print('work')
		Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_HARDSELECT", false)
	end
end
script.on_render_event(Defines.RenderEvents.MOUSE_CONTROL, function() 
	if map and map.bChoosingNewSector == true then
		local number_of_cur_sec_in_row = 0
		local number_of_all_sec_in_cur_row = 0
		local number_of_all_sec_in_next_row = 0
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_LoadIdentity()
		Graphics.CSurface.GL_Translate(952, 211)
		Graphics.CSurface.GL_RenderPrimitive(varr.stat_jump_panel)
		Graphics.CSurface.GL_PopMatrix()
		
		Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
		Graphics.freetype.easy_printCenter(11, 1100, 227, "СТАТИСТИКА ПОЛЁТОВ")
		
		local lvl_cur = map.currentSector.level
		mini_count = 0
		mini_count2 = 0
		number_of_cur_sec_in_row = 0
		number_of_all_sec_in_cur_row = 0
		number_of_all_sec_in_next_row = 0
		for sect in vter(map.sectors) do
			if sect.level == lvl_cur then
				mini_count = mini_count + 1
				if map.currentSector == sect then
					number_of_cur_sec_in_row = mini_count
				end
			end
			if sect.level == lvl_cur + 1 then
				mini_count2 = mini_count2 + 1
			end
		end
		number_of_all_sec_in_cur_row = mini_count
		number_of_all_sec_in_next_row = mini_count2
		--print('nocsir'..number_of_cur_sec_in_row..'/noasicr'..number_of_all_sec_in_cur_row..',next'..number_of_all_sec_in_next_row)
		ssi = {[0] = '', [1] = ''}
		mini_count = 0
		mini_count2 = 0
		if number_of_all_sec_in_cur_row == 1 and number_of_all_sec_in_next_row == 2 then --start
			for sect in vter(map.sectors) do
				if sect.level == lvl_cur + 1 then
					mini_count = mini_count + 1
					if mini_count == 1 or mini_count == 2 then
						short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
						mini_count2 = mini_count2 + 1
					end
				end
			end
		elseif number_of_all_sec_in_next_row == 1 then --final
			for sect in vter(map.sectors) do
				if sect.level == lvl_cur + 1 then
					mini_count = mini_count + 1
					if mini_count == 1 then
						short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
						mini_count2 = mini_count2 + 1
					end
				end
			end
		elseif number_of_all_sec_in_cur_row == 2 and number_of_all_sec_in_next_row == 2 then
			if number_of_cur_sec_in_row == 1 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 1 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			elseif number_of_cur_sec_in_row == 2 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 2 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			end
		elseif number_of_all_sec_in_cur_row == 2 and number_of_all_sec_in_next_row == 3 then
			if number_of_cur_sec_in_row == 1 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 1 or mini_count == 2 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			elseif number_of_cur_sec_in_row == 2 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 2 or mini_count == 3 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			end
		elseif number_of_all_sec_in_cur_row == 3 and number_of_all_sec_in_next_row == 2 then
			if number_of_cur_sec_in_row == 1 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 1 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			elseif number_of_cur_sec_in_row == 2 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 1 or mini_count == 2 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			elseif number_of_cur_sec_in_row == 3 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 2 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			end
		elseif number_of_all_sec_in_cur_row == 2 and number_of_all_sec_in_next_row == 4 then
			if number_of_cur_sec_in_row == 1 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 1 or mini_count == 2 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			elseif number_of_cur_sec_in_row == 2 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 3 or mini_count == 4 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			end
		elseif number_of_all_sec_in_cur_row == 4 and number_of_all_sec_in_next_row == 2 then
			if number_of_cur_sec_in_row == 1 or number_of_cur_sec_in_row == 2 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 1 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			elseif number_of_cur_sec_in_row == 3 or number_of_cur_sec_in_row == 4 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 2 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			end
		elseif number_of_all_sec_in_cur_row == 3 and number_of_all_sec_in_next_row == 4 then
			if number_of_cur_sec_in_row == 1 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 1 or mini_count == 2 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			elseif number_of_cur_sec_in_row == 2 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 2 or mini_count == 3 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			elseif number_of_cur_sec_in_row == 3 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 3 or mini_count == 4 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			end
		elseif number_of_all_sec_in_cur_row == 4 and number_of_all_sec_in_next_row == 3 then
			if number_of_cur_sec_in_row == 1 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 1 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			elseif number_of_cur_sec_in_row == 2 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 1 or mini_count == 2 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			elseif number_of_cur_sec_in_row == 3 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 2 or mini_count == 3 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			elseif number_of_cur_sec_in_row == 4 then
				for sect in vter(map.sectors) do
					if sect.level == lvl_cur + 1 then
						mini_count = mini_count + 1
						if mini_count == 3 then
							short_sector_info(sect.description.type, math.floor(lvl_cur + 1))
							mini_count2 = mini_count2 + 1
						end
					end
				end
			end
		else
		
		end
		

	end
end, function() end)







-- периодически запускается из основного блока. служит для вывода из игры на 1 тик всех ос (их как бы нет в этот момент).
-- в этот момент происходит фиксация захвата корабля врага. после обязательно возвращаются в исходное состояние.
function reset_osa_activity(bOutOfGame_var)
	--print('res')
	if playerShip then
		for crew in vter(playerShip.vCrewList) do
			if crew.intruder == true then
				if crew.blueprint.name == "osa" or crew.blueprint.name == "osae" then
					crew.bOutOfGame = bOutOfGame_var
				end
			end
		end
	end
end


















