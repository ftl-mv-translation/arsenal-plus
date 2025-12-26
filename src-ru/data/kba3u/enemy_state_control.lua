
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
local vter6 = function(cvec6) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec6:size()
	return function()
		i = i + 1
		if i < n then return cvec6[i] end
	end
end
local vter7 = function(cvec7) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec7:size()
	return function()
		i = i + 1
		if i < n then return cvec7[i] end
	end
end
local vter8 = function(cvec8) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec8:size()
	return function()
		i = i + 1
		if i < n then return cvec8[i] end
	end
end
local vter9 = function(cvec9) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec9:size()
	return function()
		i = i + 1
		if i < n then return cvec9[i] end
	end
end
local vter10 = function(cvec10) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec10:size()
	return function()
		i = i + 1
		if i < n then return cvec10[i] end
	end
end
local vter11 = function(cvec11) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec11:size()
	return function()
		i = i + 1
		if i < n then return cvec11[i] end
	end
end
local vter12 = function(cvec12) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec12:size()
	return function()
		i = i + 1
		if i < n then return cvec12[i] end
	end
end
local vter13 = function(cvec13) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec13:size()
	return function()
		i = i + 1
		if i < n then return cvec13[i] end
	end
end
local vter14 = function(cvec14) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec14:size()
	return function()
		i = i + 1
		if i < n then return cvec14[i] end
	end
end
local vter15 = function(cvec15)
	local i = -1
	local n = cvec15:size()
	return function()
		i = i + 1
		if i < n then return cvec15[i] end
	end
end
local vter99 = function(cvec99)
	local i = -1
	local n = cvec99:size()
	return function()
		i = i + 1
		if i < n then return cvec99[i] end
	end
end

local gui = nil
local enemyShip = nil--Hyperspace.ships.enemy
local playerShip = nil--Hyperspace.ships.player
local GSIe = nil--Hyperspace.ShipGraph.GetShipInfo(1)
local GSIp = nil--Hyperspace.ShipGraph.GetShipInfo(0)
local world = nil--Hyperspace.App.world
local map = nil--Hyperspace.App.world.starMap
local cur_sector = nil--Hyperspace.App.world.starMap.currentSector
local pos = nil

-- я ввожу массив для хранения переменных...
-- обращаться через varr.имя_переменной
local varr = {

--local_time = 0.0,
make_enemy_same_as_player_at_first_free_tick = false,

current_beacon_enemy_cargo_drone = "",
current_beacon_enemy_cargo_drone2 = "",

first_global_loading_completed = 0,

splash_image = nil,

orchid_fleet_x = 0, 
orchid_fleet_y = 0,
count_of_R_weapons = 0,
previous_count_of_R_weapons = 0,
previous_droneSystem = 0,
mouse_inside_mem_prev2 = -1,
mouse_inside_mem2 = -1,
enemy_state_previous = 0,

x_off = 0.0,
y_off = 0.0,
--stat+
map_bOpen_previous = false,
give_dohod_stat_me_memoryed_output = '',

bNeededIonCheck = false,
--was_ioned_enemy_hack_when_drone_fly = false,
bNeededOpenItteration = false,

saved_empty_saved_pos = nil,

found_meat_inside_delayer = 0.0,

adv_oxygen_values = {0, 0.3, 0.9, 1.8, 2.7, 4, 4, 4, 4, 4, 4, 4, 4, 4},

memory_of_previous_teleport_state_player = false,
memory_of_previous_teleport_state_enemy = false,

list_of_all_races = {[1]=""},

micro_tick_counter = 0.0,
micro_tick_counter2 = 0.0,
micro_tick_counter3 = 0.0,
micro_tick_counter4 = 0.0,
micro_tick_counter5 = 0.0,
micro_tick_counter6 = 0.0,
micro_tick_counter7 = 0.0,
micro_tick_counter8 = 0.0,
micro_tick_counter9 = 0.0,
micro_tick_counter10 = 0.0,
micro_tick_counter11 = 0.0,
micro_tick_counter12 = 0.0,
micro_tick_counter13 = 0.0,
micro_tick_counter14 = 0.0,
micro_tick_counter15 = 0.0,
micro_tick_counter16 = 0.0,
micro_tick_counter17 = 0.0,
micro_tick_counter18 = 0.0,
micro_tick_counter19 = 0.0,
micro_tick_counter20 = 0.0,
micro_tick_counter21 = 0.0,
micro_tick_counter21targ = 1700.0,
micro_tick_counter22 = 0.0,--тикалка период 2 сек
micro_tick_counter23 = 0.0,
micro_tick_counter24 = 0.0,
micro_tick_counter25 = 0.0,--тикалка период 1 сек
mindcontrol_waiter = 0.0,
micro_delayer_to_waiting_at_beacon = 0.0,

letters_eng = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'},
letters_rus = {'а','б','в','г','д','е','ё','ж','з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ц','ч','ш','щ','ы','э','ю','я'},
lettersUP_eng = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'},
lettersUP_rus = {'А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ы','Э','Ю','Я'},
--bDontRep = false,
-- bRemembedPlayerResState = false,
-- player_res_hp = 0,
-- player_res_scrap = 0,
-- player_res_missiles = 0,
-- player_res_drones = 0,
-- player_res_fuel = 0,
--doorStateOpened = nil,

--array_of_wasted_equipment = {[0]=''},
equipment_that_will_stay_on_beacon = '',
map_wasted_equipment = Hyperspace.Resources:CreateImagePrimitiveString('map/map_wasted_equipment.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
full_list_of_game_equipment = {[0]=''},
full_list_of_burst_weapon_proj_count = {['WEAPON_NAME']=1}, -- для памяти кол-ва снарядов BURST орудий
full_list_of_game_equipment_power = {['WEAPON_NAME']=4}, -- для памяти энергии требуемой для оборудования
full_list_of_game_equipment_rarity = {['WEAPON_NAME']=1}, -- для памяти редкости оборудования

micro_tick_fish_on_kruchok = 0.0,
is_enabled_monitor_to_planet = false,

color_cyanbezh = Graphics.GL_Color(0.91, 0.96, 0.9, 1.0),
color_white = Graphics.GL_Color(1.0, 1.0, 1.0, 1.0),
color_red = Graphics.GL_Color(1.0, 0.2, 0.2, 1.0),
color_opac_red = Graphics.GL_Color(1.0, 0.2, 0.2, 0.22),
color_orange = Graphics.GL_Color(1.0, 0.8, 0.0, 1.0),
color_yellow = Graphics.GL_Color(0.8, 0.8, 0.0, 1.0),
color_green = Graphics.GL_Color(0.27, 0.71, 0.0, 1.0),
color_green_nashishenniy = Graphics.GL_Color(0.0, 1.0, 0.1, 1.0),
color_cyan = Graphics.GL_Color(0.0, 1.0, 1.0, 1.0),
color_blue = Graphics.GL_Color(0.2, 0.2, 1.0, 1.0),
color_violet = Graphics.GL_Color(0.9, 0.0, 0.9, 1.0),
color_softyellow = Graphics.GL_Color(0.8, 0.8, 0.0, 0.5),
color_dark = Graphics.GL_Color(0.1, 0.1, 0.1, 1.0),
color_gray = Graphics.GL_Color(0.8, 0.8, 0.8, 0.5),

color_blue_transp = Graphics.GL_Color(0.0, 0.66, 1.0, 0.5),


prepare_to_explode_hack = false,
prepare_to_cancel_mind = false,
prepare_to_switch_auto_drone_work = false,
x_offset_of_tips_artillery_system = 0,
x_offset_of_tips_drone_system = 0,

TABBED_WINDOW_is_visible = false,
prepare_to_clear_stat = false,
bMod_itbui = false,

count_of_crew = 0,
kx = 0,
ky = 0,

previous_crew_intruder_state_arr = {[0] = false}, --массив памяти кто был в предыдущем тике интрудером
universal_iRoom_neededheal = {[0] = 0,}, -- массив нытья экипажа, о том что в данный отсек нужен хил... [айди отсека] = 0 (не нужен), а если > 1 то нужен хил
universal_iRoom_neededheal_enemy = {[0] = 0,}, -- массив нытья экипажа, о том что в данный отсек нужен хил... [айди отсека] = 0 (не нужен), а если > 1 то нужен хил
universal_iRoom_targ = {[0] = -1,}, -- массив целеуказания для экипажа... [уникальный айди] = номер отсека-цели движения

osa_names = {
Hyperspace.Text:GetText('lua_osa1'),
Hyperspace.Text:GetText('lua_osa2'),
Hyperspace.Text:GetText('lua_osa3'),
Hyperspace.Text:GetText('lua_osa4'),
Hyperspace.Text:GetText('lua_osa5'),
Hyperspace.Text:GetText('lua_osa6'),
Hyperspace.Text:GetText('lua_osa7'),
Hyperspace.Text:GetText('lua_osa8'),
Hyperspace.Text:GetText('lua_osa9'),
Hyperspace.Text:GetText('lua_osa10'),
Hyperspace.Text:GetText('lua_osa11'),
Hyperspace.Text:GetText('lua_osa12'),
Hyperspace.Text:GetText('lua_osa13'),
Hyperspace.Text:GetText('lua_osa14'),
Hyperspace.Text:GetText('lua_osa15'),
Hyperspace.Text:GetText('lua_osa16'),
Hyperspace.Text:GetText('lua_osa17'),
Hyperspace.Text:GetText('lua_osa18'),
Hyperspace.Text:GetText('lua_osa19'),
Hyperspace.Text:GetText('lua_osa20')
},
--osa_names = {'Нектар', 'Сладкий', 'Полосач', 'Шершень', 'Жужа', 'Жожо', 'Жалер', 'Жу', 'Пчёл', 'Кусь', 'Жужжак', 'Электра', 'Электрон', 'Ток', 'Матка', 'Трутень', 'Медок', 'Вжик', 'Жижа', 'Жало', 'Жужжони'},
enemy_osa_on_playership = false,
no_osa_boarders_found = false,
osa_boarders_found = false,

icon_proj = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/icon_proj.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),


button_aimtip_on = Hyperspace.Resources:CreateImagePrimitiveString('aimable/button_aimtip_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_aimtip_select2 = Hyperspace.Resources:CreateImagePrimitiveString('aimable/button_aimtip_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

button_auto_drone_on = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_auto_drone_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_auto_drone_off = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_auto_drone_off.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_auto_drone_select2 = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_auto_drone_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_auto_drone_select3 = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_auto_drone_select3.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

black_mask = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/black_mask.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

stat_0 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/stat_0.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
stat_1 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/stat_1.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
stat_2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/stat_2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

stat_jump_panel = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/stat_jump_panel.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

smart_enemy = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/smart_enemy.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
smart_enemyBox = {x = 1247, y = 113, w = 26, h = 26},

current_beacon_drillwork_chance = 100,

needed_check_tonnel = false,

glow_of_tonnel = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/glow_of_tonnel.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

--stat+
analitica = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/analitica.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
analitica_Box = {x = 728, y = 209, w = 65, h = 28},


chall_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/chall_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
chall_off = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/chall_off.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
--х 380/470/560/650/740
--у 230/280/330/380
-- ряд 1
button_nopause_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nopause_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nopause_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nopause_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nopause_Box = {x = 380, y = 230, w = 32, h = 28},
button_nopause_ready = false,
button_noeye_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_noeye_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_noeye_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_noeye_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_noeye_Box = {x = 470, y = 230, w = 32, h = 28},
button_noeye_ready = false,
button_nostor_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nostor_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nostor_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nostor_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nostor_Box = {x = 560, y = 230, w = 32, h = 28},
button_nostor_ready = false,
button_nowst_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nowst_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nowst_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nowst_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nowst_Box = {x = 650, y = 230, w = 32, h = 28},
button_nowst_ready = false,
button_nogus_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nogus_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nogus_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nogus_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nogus_Box = {x = 740, y = 230, w = 32, h = 28},
button_nogus_ready = false,
-- ряд 2
button_noscrap_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_noscrap_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_noscrap_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_noscrap_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_noscrap_Box = {x = 380, y = 280, w = 32, h = 28},
button_noscrap_ready = false,
button_nofuel_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nofuel_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nofuel_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nofuel_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nofuel_Box = {x = 470, y = 280, w = 32, h = 28},
button_nofuel_ready = false,
button_nodromis_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nodromis_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nodromis_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nodromis_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nodromis_Box = {x = 560, y = 280, w = 32, h = 28},
button_nodromis_ready = false,
button_norare_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_norare_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_norare_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_norare_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_norare_Box = {x = 650, y = 280, w = 32, h = 28},
button_norare_ready = false,
button_nogeq_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nogeq_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nogeq_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nogeq_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nogeq_Box = {x = 740, y = 280, w = 32, h = 28},
button_nogeq_ready = false,
-- ряд 3
button_nobrain_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nobrain_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nobrain_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nobrain_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nobrain_Box = {x = 380, y = 330, w = 32, h = 28},
button_nobrain_ready = false,
button_nomaxhp_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nomaxhp_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nomaxhp_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nomaxhp_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nomaxhp_Box = {x = 470, y = 330, w = 32, h = 28},
button_nomaxhp_ready = false,
button_nocont_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nocont_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nocont_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nocont_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nocont_Box = {x = 560, y = 330, w = 32, h = 28},
button_nocont_ready = false,
button_noaug_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_noaug_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_noaug_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_noaug_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_noaug_Box = {x = 650, y = 330, w = 32, h = 28},
button_noaug_ready = false,
button_noinst_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_noinst_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_noinst_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_noinst_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_noinst_Box = {x = 740, y = 330, w = 32, h = 28},
button_noinst_ready = false,
-- ряд 4
button_nohull_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nohull_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nohull_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nohull_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nohull_Box = {x = 380, y = 380, w = 32, h = 28},
button_nohull_ready = false,
button_nosysca_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nosysca_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nosysca_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nosysca_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nosysca_Box = {x = 470, y = 380, w = 32, h = 28},
button_nosysca_ready = false,
button_nozlt_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nozlt_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nozlt_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nozlt_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nozlt_Box = {x = 560, y = 380, w = 32, h = 28},
button_nozlt_ready = false,
button_noai_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_noai_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_noai_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_noai_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_noai_Box = {x = 650, y = 380, w = 32, h = 28},
button_noai_ready = false,
button_nobf_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nobf_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nobf_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_nobf_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_nobf_Box = {x = 740, y = 380, w = 32, h = 28},
button_nobf_ready = false,


waiting_mode = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/waiting_mode.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
waiting_button_on = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/waiting_button_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
waiting_button_off = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/waiting_button_off.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
waiting_button_select2 = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/waiting_button_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
waiting_button_Box = {x = 1214, y = 522, w = 39, h = 39},--отступ по 7 х,у
waiting_button_ready = false,
waiting_mode_state = false,

bEnabledDrawMode = false,
draw_off_on = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/draw_off_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
draw_off_select2 = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/draw_off_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
draw_on_on = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/draw_on_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
draw_on_select2 = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/draw_on_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
draw_Box = {x = 1207, y = 562, w = 53, h = 53},
draw_ready = false,

draw_clear_off = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/draw_clear_off.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
draw_clear_on = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/draw_clear_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
draw_clear_select2 = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/draw_clear_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
draw_clear_Box = {x = 1207, y = 609, w = 53, h = 53},
draw_clear_ready = false,

nohull_locking = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/nohull_locking.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

button_resetchall_0_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_resetchall_0_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_resetchall_1_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_resetchall_1_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_resetchall_0_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_resetchall_0_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_resetchall_1_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_resetchall_1_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_resetchall_Box = {x = 848, y = 140, w = 28, h = 33},
button_resetchall_ready = false,

button_rew_0_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_rew_0_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_rew_1_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_rew_1_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_rew_0_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_rew_0_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_rew_1_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_rew_1_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_rew_Box = {x = 848, y = 177, w = 28, h = 33},
button_rew_ready = false,

-- button_timer_0_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_timer_0_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
-- button_timer_0_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_timer_0_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
-- button_timer_1_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_timer_1_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
-- button_timer_1_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_timer_1_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
-- button_timer_2_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_timer_2_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
-- button_timer_2_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_timer_2_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
-- button_timer_Box = {x = 829, y = 142, w = 47, h = 28},--298
--button_timer_ready = false,


mini_target_r = Hyperspace.Resources:CreateImagePrimitiveString('misc/mini_target_r.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
mini_target_y = Hyperspace.Resources:CreateImagePrimitiveString('misc/mini_target_y.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
bPressedLCtrl = false,

mini_target_prism = Hyperspace.Resources:CreateImagePrimitiveString('misc/mini_target_prism.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

pentagram_glow = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/pentagram_glow.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
pentagram = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/pentagram.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
pentagram_progress = 0.0,
pentagram_x = 0,
pentagram_y = 0,

done_arrow = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/done_arrow.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

button_challengeany = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/button_challengeany.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

button_strong_0 = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/button_strong_0.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_strong_1 = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/button_strong_1.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_strong_2 = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/button_strong_2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

icon_capsule = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/icon_capsule.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

array_memory_of_scrap_decreasing = {},

-- Blueprint file paths
blueprintFiles = {"data/blueprints.xml", "data/dlcBlueprints.xml"},

artillery_auto_controllers = {[0]=false, [1]=false, [2]=false, [3]=false, [4]=false, [5]=false, [6]=false, [7]=false, [8]=false},
button_autoarty_on = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_autoarty_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_autoarty_off = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_autoarty_off.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_autoarty_select2 = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/button_autoarty_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_arty_ready = -1,

full_ingame_list_of_augs = {[0]="", [1]=""},

str_remembered_trader_weapon = "",

kust = Hyperspace.Resources:CreateImagePrimitiveString('fishing/kust.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
udochka = Hyperspace.Resources:CreateImagePrimitiveString('fishing/udochka.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
udochka_kluet = Hyperspace.Resources:CreateImagePrimitiveString('fishing/udochka_kluet.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
udochka_vverh = Hyperspace.Resources:CreateImagePrimitiveString('fishing/udochka_vverh.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
udochka_active = Hyperspace.Resources:CreateImagePrimitiveString('fishing/udochka_active.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
schkala = Hyperspace.Resources:CreateImagePrimitiveString('fishing/schkala.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
schkala_catcher = Hyperspace.Resources:CreateImagePrimitiveString('fishing/schkala_catcher.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
kruchok = Hyperspace.Resources:CreateImagePrimitiveString('fishing/kruchok.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
sunduk = Hyperspace.Resources:CreateImagePrimitiveString('fishing/sunduk.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
sunduk_y = 999,
sunduk_progress = 0.0,
--bSundukCatchedThisTime = false,
udochka_status = 1, -- 0=voda, 1=vverh, 2=riba na kruchke
off_x_fish = 0,
schkala_catcher_position = 0.0,
schkala_move_speed = 0.0,
fish_position_y = 0.0,
fish_move_speed = 0.0,
fish_progress = 0.0,
fish_agressivity = 10,
fish_agressivity_on_catch = 15,
fish_on_catch = false,
fish_crazyness = 15,
fish_crazyness_on_catch = 20,
fish_way_shift = 0.0,
fish_inversion_timer = 10000.0,
fish_inversion_cur = 0.0,
current_fish_id = 0,
fish_imgs = {}, --Hyperspace.Resources:CreateImagePrimitiveString('fishing/fish_img_0.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_fish_ready = false,
button_fish_on = Hyperspace.Resources:CreateImagePrimitiveString('fishing/button_fish_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_fish_select2 = Hyperspace.Resources:CreateImagePrimitiveString('fishing/button_fish_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_fish_Box = {x = 1041, y = 471, w = 34, h = 34},

allowed_hack_explosion_on_cooldown = false, -- change this to allow explode on hack-cooldown [imba!]

button_no_tactical_pause = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/no_tactical_pause.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

fire_M1_strip8 = Hyperspace.Resources:GetImageId("effects/fire_M1_strip8.png"),
fire_S1_strip8 = Hyperspace.Resources:GetImageId("effects/fire_S1_strip8.png"),
fire_L1_strip8 = Hyperspace.Resources:GetImageId("effects/fire_L1_strip8.png"),
firea_M1_strip8 = Hyperspace.Resources:GetImageId("effects/firea_M1_strip8.png"),
firea_S1_strip8 = Hyperspace.Resources:GetImageId("effects/firea_S1_strip8.png"),
firea_L1_strip8 = Hyperspace.Resources:GetImageId("effects/firea_L1_strip8.png"),


button_confirm_on = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_confirm_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_confirm_select2 = Hyperspace.Resources:CreateImagePrimitiveString('upgradeUI/Equipment/button_confirm_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
button_confirmBox = {text_on = "", x = 895, y = 209, w = 32, h = 28},

icon_anaerobic_projector_red = Hyperspace.Resources:CreateImagePrimitiveString('combatUI/icons/icon_anaerobic_projector_red.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
icon_call_store_red = Hyperspace.Resources:CreateImagePrimitiveString('combatUI/icons/icon_call_store_red.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

def_temp_crew,
def_skilled_crew_g,
def_skilled_crew_y,
--def_nowarn_crew,
def_fire_weakness,
def_uncontrollable,
def_mindresist,
def_temporal_crew,
def_slot_zero,
--def_marker_temp_crew,

red_wait = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/red_wait.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
red_cancel = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/red_cancel.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),
red_next_sector = Hyperspace.Resources:CreateImagePrimitiveString('systemUI/red_next_sector.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false),

}

local lastArtilleryCap = -1

local soulreaper_b_on = {}
local soulreaper_b_off = {}
local soulreaper_b_select2 = {}
local sr_b = {}

local micro_tick_array = {}
local anim_tick_array = {[1]={}, [2]={}}
local frame = 0
local cX = 0
local cY = 0
local nX1 = 0
local nX2 = 0
local nY1 = 0
local nY2 = 0

local offs_x = 0
local offs_x_panel = 0

local diff = ''




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
	--was playerVariables...
	if (tonumber(arr.month) == 3 and tonumber(arr.day) >= 25) or (tonumber(arr.month) == 4 and tonumber(arr.day) <= 25) then
		Hyperspace.metaVariables['prazdnik'] = 1
	elseif (tonumber(arr.month) == 12 and tonumber(arr.day) >= 20) or (tonumber(arr.month) == 1 and tonumber(arr.day) <= 20) then
		Hyperspace.metaVariables['prazdnik'] = 2
	else
		Hyperspace.metaVariables['prazdnik'] = 0
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
					-- чёрная магия поиска координат в заданном анимационном листе
					frame = math.floor((anim_tick_array[i].w/anim_tick_array[i].fw) * (1.0 - (anim_tick_array[i].time_length/anim_tick_array[i].time_length_mem)))--выбираем кадр анимации (нумерация с 0)
					cX = frame*anim_tick_array[i].fw % anim_tick_array[i].w
					cY = math.floor(frame/(anim_tick_array[i].w/anim_tick_array[i].fw))*anim_tick_array[i].fh
					nX1 = cX/anim_tick_array[i].w
					nX2 = (cX + anim_tick_array[i].fw)/anim_tick_array[i].w
					nY1 = cY/anim_tick_array[i].h
					nY2 = (cY + anim_tick_array[i].fh)/anim_tick_array[i].h
					--print(nX1..','..nX2..','..nY1..','..nY2)
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_Translate(anim_tick_array[i].x, anim_tick_array[i].y)
					Graphics.CSurface.GL_BlitImagePartial(anim_tick_array[i].texture, 0, 0, anim_tick_array[i].fw, anim_tick_array[i].fh, nX1, nX2, nY1, nY2, 1, varr.color_white, false)
					Graphics.CSurface.GL_PopMatrix()
				elseif anim_tick_array[i].time_length < 0.0 then
					anim_tick_array[i].time_length = 0.0
					
				end
			end
		end
	end
end


function mouseInside(box)
    local mouse = Hyperspace.Mouse.position
    return box.x <= mouse.x and mouse.x < box.x + box.w and box.y <= mouse.y and mouse.y < box.y + box.h
end



-- автоматика, работает. описание для авторемонтов нужно, т.к. отличается от встроенного
local tip_text_replace_hidden_array = {
	["AUTO_REPAIR10"] = Hyperspace.Text:GetText('lua_AUTO_REPAIR10'),
	["AUTO_REPAIR20"] = Hyperspace.Text:GetText('lua_AUTO_REPAIR20'),
	["AUTO_REPAIR30"] = Hyperspace.Text:GetText('lua_AUTO_REPAIR30'),
	["AUTO_REPAIR40"] = Hyperspace.Text:GetText('lua_AUTO_REPAIR40'),
	["AUTO_REPAIR50"] = Hyperspace.Text:GetText('lua_AUTO_REPAIR50'),
	["AUTO_REPAIR60"] = Hyperspace.Text:GetText('lua_AUTO_REPAIR60'),
	["AUTO_REPAIR70"] = Hyperspace.Text:GetText('lua_AUTO_REPAIR70'),
	
	-- ["AUTO_REPAIR10"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 33%.",
	-- ["AUTO_REPAIR20"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 66%.",
	-- ["AUTO_REPAIR30"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 100%.",
	-- ["AUTO_REPAIR40"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 133%.",
	-- ["AUTO_REPAIR50"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 166%.",
	-- ["AUTO_REPAIR60"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 200%.",
	-- ["AUTO_REPAIR70"] = "Автоматически ремонтирует повреждённые системы корабля, как это происходит на беспилотных кораблях. Скорость ремонта 233%.",
}
local tip_img_replace_hidden_array = {}

local def

function works_on_first_initialization_this_script() -- срабатывает 1 раз при загрузке скрипта/игры
	
	local numsssss = 1
	for stringy in vter2 (Hyperspace.Blueprints:GetBlueprintList("CREW_ALL")) do-- подгружаем список рас
		varr.list_of_all_races[numsssss] = stringy
		numsssss = numsssss + 1
	end
	varr.micro_tick_counter23 = math.random(0, 145000)
	varr.micro_tick_counter24 = math.random(100000, 145000)
	
	
	
	
	
	make_full_list_of_game_equipment()--лютая пробежка по всему оборудованию игры и присвоение каждому своего id

	
	-- заполняет таблицу соответствия имён и описаний встраиваемых усилений
	for augs in vter2 (Hyperspace.Blueprints:GetBlueprintList("CAN_BE_HIDDEN_AUGS")) do
		if augs:find('FISH_BUFF') == nil then
			tip_text_replace_hidden_array[augs] = Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.description:GetText()
			tip_img_replace_hidden_array[augs] = Hyperspace.Resources:CreateImagePrimitiveString('combatUI/icons/icon_'..augs:lower()..'.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
		end
	end
	tip_img_replace_hidden_array['icon_aug_slot'] = Hyperspace.Resources:CreateImagePrimitiveString('combatUI/icons/icon_aug_slot.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
	tip_img_replace_hidden_array['icon_fish_buff_all'] = Hyperspace.Resources:CreateImagePrimitiveString('combatUI/icons/icon_fish_buff_all.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
	
	for i = 0, 9 do --тут надо актуализировать если добавлять рыбу ещё
		varr.fish_imgs[i] = Hyperspace.Resources:CreateImagePrimitiveString('fishing/fish_img_'..i..'.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
	end
	
	def = Hyperspace.StatBoostDefinition()
	def.stat = Hyperspace.CrewStat.MAX_HEALTH
	def.amount = 0.5
	def.boostType = Hyperspace.StatBoostDefinition.BoostType.MULT
	def.boostSource = Hyperspace.StatBoostDefinition.BoostSource.AUGMENT
	def.shipTarget = Hyperspace.StatBoostDefinition.ShipTarget.ALL
	def.crewTarget = Hyperspace.StatBoostDefinition.CrewTarget.ALL
	def.duration = 1
	def.stackId = 444
	def.maxStacks = 1
	def.realBoostId = Hyperspace.StatBoostDefinition.statBoostDefs:size()
	Hyperspace.StatBoostDefinition.statBoostDefs:push_back(def)
	
	
	varr.def_temp_crew = Hyperspace.StatBoostDefinition()
	varr.def_temp_crew.stat = Hyperspace.CrewStat.NO_WARNING
	varr.def_temp_crew.value = true
	varr.def_temp_crew.boostAnim = "temp_crew"
	varr.def_temp_crew.boostType = Hyperspace.StatBoostDefinition.BoostType.SET
	varr.def_temp_crew.boostSource = Hyperspace.StatBoostDefinition.BoostSource.AUGMENT
	varr.def_temp_crew.shipTarget = Hyperspace.StatBoostDefinition.ShipTarget.ALL
	varr.def_temp_crew.crewTarget = Hyperspace.StatBoostDefinition.CrewTarget.ALL
	varr.def_temp_crew.duration = 1000
	varr.def_temp_crew.stackId = 323
	varr.def_temp_crew.maxStacks = 1
	varr.def_temp_crew.realBoostId = Hyperspace.StatBoostDefinition.statBoostDefs:size()
	Hyperspace.StatBoostDefinition.statBoostDefs:push_back(varr.def_temp_crew)
	
	
	varr.def_skilled_crew_g = Hyperspace.StatBoostDefinition()
	varr.def_skilled_crew_g.stat = Hyperspace.CrewStat.FIRE_DAMAGE_MULTIPLIER
	varr.def_skilled_crew_g.amount = 1.0
	varr.def_skilled_crew_g.boostAnim = "skilled_green"
	varr.def_skilled_crew_g.boostType = Hyperspace.StatBoostDefinition.BoostType.MULT
	varr.def_skilled_crew_g.boostSource = Hyperspace.StatBoostDefinition.BoostSource.AUGMENT
	varr.def_skilled_crew_g.shipTarget = Hyperspace.StatBoostDefinition.ShipTarget.ALL
	varr.def_skilled_crew_g.crewTarget = Hyperspace.StatBoostDefinition.CrewTarget.ALL
	varr.def_skilled_crew_g.duration = 1000000
	varr.def_skilled_crew_g.stackId = 771
	varr.def_skilled_crew_g.maxStacks = 1
	varr.def_skilled_crew_g.realBoostId = Hyperspace.StatBoostDefinition.statBoostDefs:size()
	Hyperspace.StatBoostDefinition.statBoostDefs:push_back(varr.def_skilled_crew_g)
	
	varr.def_skilled_crew_y = Hyperspace.StatBoostDefinition()
	varr.def_skilled_crew_y.stat = Hyperspace.CrewStat.FIRE_DAMAGE_MULTIPLIER
	varr.def_skilled_crew_y.amount = 1.0
	varr.def_skilled_crew_y.boostAnim = "skilled_yellow"
	varr.def_skilled_crew_y.boostType = Hyperspace.StatBoostDefinition.BoostType.MULT
	varr.def_skilled_crew_y.boostSource = Hyperspace.StatBoostDefinition.BoostSource.AUGMENT
	varr.def_skilled_crew_y.shipTarget = Hyperspace.StatBoostDefinition.ShipTarget.ALL
	varr.def_skilled_crew_y.crewTarget = Hyperspace.StatBoostDefinition.CrewTarget.ALL
	varr.def_skilled_crew_y.duration = 1000000
	varr.def_skilled_crew_y.stackId = 771
	varr.def_skilled_crew_y.maxStacks = 1
	varr.def_skilled_crew_y.realBoostId = Hyperspace.StatBoostDefinition.statBoostDefs:size()
	Hyperspace.StatBoostDefinition.statBoostDefs:push_back(varr.def_skilled_crew_y)
	
	
	-- varr.def_nowarn_crew = Hyperspace.StatBoostDefinition()
	-- varr.def_nowarn_crew.stat = Hyperspace.CrewStat.NO_WARNING
	-- varr.def_nowarn_crew.value = true
	-- varr.def_nowarn_crew.boostAnim = "temp_crew"
	-- varr.def_nowarn_crew.boostType = Hyperspace.StatBoostDefinition.BoostType.SET
	-- varr.def_nowarn_crew.boostSource = Hyperspace.StatBoostDefinition.BoostSource.AUGMENT
	-- varr.def_nowarn_crew.shipTarget = Hyperspace.StatBoostDefinition.ShipTarget.ALL
	-- varr.def_nowarn_crew.crewTarget = Hyperspace.StatBoostDefinition.CrewTarget.ALL
	-- varr.def_nowarn_crew.duration = 1000
	-- varr.def_nowarn_crew.stackId = 377
	-- varr.def_nowarn_crew.maxStacks = 1
	-- varr.def_nowarn_crew.realBoostId = Hyperspace.StatBoostDefinition.statBoostDefs:size()
	-- Hyperspace.StatBoostDefinition.statBoostDefs:push_back(varr.def_nowarn_crew)
	
	-- <noWarning>false</noWarning>
	
	varr.def_fire_weakness = Hyperspace.StatBoostDefinition()
	varr.def_fire_weakness.stat = Hyperspace.CrewStat.FIRE_DAMAGE_MULTIPLIER
	varr.def_fire_weakness.amount = 3.0 -- тут правится множитель повреждений экипажа на враж.корабле (было 2)
	varr.def_fire_weakness.boostType = Hyperspace.StatBoostDefinition.BoostType.MULT
	varr.def_fire_weakness.boostSource = Hyperspace.StatBoostDefinition.BoostSource.AUGMENT
	varr.def_fire_weakness.shipTarget = Hyperspace.StatBoostDefinition.ShipTarget.ALL
	varr.def_fire_weakness.crewTarget = Hyperspace.StatBoostDefinition.CrewTarget.ALL
	varr.def_fire_weakness.duration = 1
	varr.def_fire_weakness.stackId = 888
	varr.def_fire_weakness.maxStacks = 1
	varr.def_fire_weakness.realBoostId = Hyperspace.StatBoostDefinition.statBoostDefs:size()
	Hyperspace.StatBoostDefinition.statBoostDefs:push_back(varr.def_fire_weakness)
	
	varr.def_uncontrollable = Hyperspace.StatBoostDefinition()
	varr.def_uncontrollable.stat = Hyperspace.CrewStat.CONTROLLABLE
	varr.def_uncontrollable.value = false
	varr.def_uncontrollable.boostType = Hyperspace.StatBoostDefinition.BoostType.SET
	varr.def_uncontrollable.boostSource = Hyperspace.StatBoostDefinition.BoostSource.AUGMENT	
	varr.def_uncontrollable.shipTarget = Hyperspace.StatBoostDefinition.ShipTarget.ALL
	varr.def_uncontrollable.crewTarget = Hyperspace.StatBoostDefinition.CrewTarget.ALL
	varr.def_uncontrollable.duration = 1
	varr.def_uncontrollable.stackId = 987
	varr.def_uncontrollable.maxStacks = 1
	varr.def_uncontrollable.realBoostId = Hyperspace.StatBoostDefinition.statBoostDefs:size()
	Hyperspace.StatBoostDefinition.statBoostDefs:push_back(varr.def_uncontrollable)
	
	varr.def_temporal_crew = Hyperspace.StatBoostDefinition()
	varr.def_temporal_crew.stat = Hyperspace.CrewStat.NO_CLONE
	varr.def_temporal_crew.value = true
	varr.def_temporal_crew.boostType = Hyperspace.StatBoostDefinition.BoostType.SET
	varr.def_temporal_crew.boostSource = Hyperspace.StatBoostDefinition.BoostSource.AUGMENT
	varr.def_temporal_crew.shipTarget = Hyperspace.StatBoostDefinition.ShipTarget.ALL
	varr.def_temporal_crew.crewTarget = Hyperspace.StatBoostDefinition.CrewTarget.ALL
	varr.def_temporal_crew.duration = 1000
	varr.def_temporal_crew.stackId = 981
	varr.def_temporal_crew.maxStacks = 1
	varr.def_temporal_crew.realBoostId = Hyperspace.StatBoostDefinition.statBoostDefs:size()
	Hyperspace.StatBoostDefinition.statBoostDefs:push_back(varr.def_temporal_crew)

	varr.def_slot_zero = Hyperspace.StatBoostDefinition()
	varr.def_slot_zero.stat = Hyperspace.CrewStat.CREW_SLOTS
	--varr.def_slot_zero.value = true
	varr.def_slot_zero.amount = 0.0
	varr.def_slot_zero.boostType = Hyperspace.StatBoostDefinition.BoostType.SET
	varr.def_slot_zero.boostSource = Hyperspace.StatBoostDefinition.BoostSource.AUGMENT
	varr.def_slot_zero.shipTarget = Hyperspace.StatBoostDefinition.ShipTarget.ALL
	varr.def_slot_zero.crewTarget = Hyperspace.StatBoostDefinition.CrewTarget.ALL
	varr.def_slot_zero.duration = 1000
	varr.def_slot_zero.stackId = 982
	varr.def_slot_zero.maxStacks = 1
	varr.def_slot_zero.realBoostId = Hyperspace.StatBoostDefinition.statBoostDefs:size()
	Hyperspace.StatBoostDefinition.statBoostDefs:push_back(varr.def_slot_zero)
	
	
	
	
	-- varr.def_marker_temp_crew = Hyperspace.StatBoostDefinition()
	
	-- varr.def_marker_temp_crew.boostType = Hyperspace.StatBoostDefinition.BoostType.SET
	-- varr.def_marker_temp_crew.boostSource = Hyperspace.StatBoostDefinition.BoostSource.AUGMENT
	-- varr.def_marker_temp_crew.shipTarget = Hyperspace.StatBoostDefinition.ShipTarget.ALL
	-- varr.def_marker_temp_crew.crewTarget = Hyperspace.StatBoostDefinition.CrewTarget.ALL
	-- varr.def_marker_temp_crew.duration = 1000
	-- varr.def_marker_temp_crew.stackId = 983
	-- varr.def_marker_temp_crew.maxStacks = 1
	-- varr.def_marker_temp_crew.realBoostId = Hyperspace.StatBoostDefinition.statBoostDefs:size()
	-- Hyperspace.StatBoostDefinition.statBoostDefs:push_back(varr.def_marker_temp_crew)
	
	
	-- varr.def_mindresist = Hyperspace.StatBoostDefinition()
	-- varr.def_mindresist.stat = Hyperspace.CrewStat.RESISTS_MIND_CONTROL
	-- varr.def_mindresist.value = true
	-- varr.def_mindresist.boostType = Hyperspace.StatBoostDefinition.BoostType.SET
	-- varr.def_mindresist.boostSource = Hyperspace.StatBoostDefinition.BoostSource.AUGMENT
	-- varr.def_mindresist.shipTarget = Hyperspace.StatBoostDefinition.ShipTarget.ALL
	-- varr.def_mindresist.crewTarget = Hyperspace.StatBoostDefinition.CrewTarget.ALL
	-- varr.def_mindresist.duration = 1
	-- varr.def_mindresist.stackId = 986
	-- varr.def_mindresist.maxStacks = 1
	-- varr.def_mindresist.realBoostId = Hyperspace.StatBoostDefinition.statBoostDefs:size()
	-- Hyperspace.StatBoostDefinition.statBoostDefs:push_back(varr.def_mindresist)
	
	-- подгружаем графику интерфейса душегуба в массивы
	for num = 1, 13 do
		soulreaper_b_on[num] = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper_b'..num..'_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
		soulreaper_b_off[num] = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper_b'..num..'_off.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
		soulreaper_b_select2[num] = Hyperspace.Resources:CreateImagePrimitiveString('soulreaper/soulreaper_b'..num..'_select2.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
	end
	-- sr_b[1] = {text_on = "Уменьшить потребление энергии.", x = 997, y = 97, w = 66, h = 31}
	-- sr_b[2] = {text_on = "Уменьшить время перезарядки.", x = 997, y = 134, w = 66, h = 31}
	-- sr_b[3] = {text_on = "Увеличить количество снарядов.", x = 997, y = 171, w = 66, h = 31}
	-- sr_b[4] = {text_on = "Увеличить общий урон снарядов.", x = 997, y = 208, w = 66, h = 31}
	-- sr_b[5] = {text_on = "Увеличить системный урон снарядов.", x = 997, y = 245, w = 66, h = 31}
	-- sr_b[6] = {text_on = "Увеличить урон снарядов по экипажу.", x = 997, y = 282, w = 66, h = 31}
	-- sr_b[7] = {text_on = "Увеличить ионный урон.", x = 997, y = 319, w = 66, h = 31}
	-- sr_b[8] = {text_on = "Увеличить количество пробиваемых щитов.", x = 997, y = 356, w = 66, h = 31}
	-- sr_b[9] = {text_on = "Увеличить шанс появления пробоины.", x = 997, y = 430, w = 66, h = 31}
	-- sr_b[10] = {text_on = "Увеличить шанс появления возгорания.", x = 997, y = 393, w = 66, h = 31}
	-- sr_b[11] = {text_on = "Добавить эффект запирания отсеков.", x = 997, y = 467, w = 66, h = 31}
	-- sr_b[12] = {text_on = "Добавить эффект двойного урона при попадании в отсеки без систем.", x = 997, y = 504, w = 66, h = 31}
	-- sr_b[13] = {text_on = "Увеличить вместимость хранилища душ.", x = 997, y = 541, w = 66, h = 31}
	
	sr_b[1] = {text_on = Hyperspace.Text:GetText('lua_sr_b1'), x = 997, y = 97, w = 66, h = 31}
	sr_b[2] = {text_on = Hyperspace.Text:GetText('lua_sr_b2'), x = 997, y = 134, w = 66, h = 31}
	sr_b[3] = {text_on = Hyperspace.Text:GetText('lua_sr_b3'), x = 997, y = 171, w = 66, h = 31}
	sr_b[4] = {text_on = Hyperspace.Text:GetText('lua_sr_b4'), x = 997, y = 208, w = 66, h = 31}
	sr_b[5] = {text_on = Hyperspace.Text:GetText('lua_sr_b5'), x = 997, y = 245, w = 66, h = 31}
	sr_b[6] = {text_on = Hyperspace.Text:GetText('lua_sr_b6'), x = 997, y = 282, w = 66, h = 31}
	sr_b[7] = {text_on = Hyperspace.Text:GetText('lua_sr_b7'), x = 997, y = 319, w = 66, h = 31}
	sr_b[8] = {text_on = Hyperspace.Text:GetText('lua_sr_b8'), x = 997, y = 356, w = 66, h = 31}
	sr_b[9] = {text_on = Hyperspace.Text:GetText('lua_sr_b9'), x = 997, y = 430, w = 66, h = 31}
	sr_b[10] = {text_on = Hyperspace.Text:GetText('lua_sr_b10'), x = 997, y = 393, w = 66, h = 31}
	sr_b[11] = {text_on = Hyperspace.Text:GetText('lua_sr_b11'), x = 997, y = 467, w = 66, h = 31}
	sr_b[12] = {text_on = Hyperspace.Text:GetText('lua_sr_b12'), x = 997, y = 504, w = 66, h = 31}
	sr_b[13] = {text_on = Hyperspace.Text:GetText('lua_sr_b13'), x = 997, y = 541, w = 66, h = 31}
		
	--if Hyperspace.Blueprints:GetWeaponBlueprint("ITB_INDICATOR")~= nil and Hyperspace.Blueprints:GetWeaponBlueprint("ITB_INDICATOR").desc.cost > 0 then
	if Hyperspace.Blueprints:GetWeaponBlueprint("ITB_INDICATOR").desc.cost > 0 then
		varr.bMod_itbui = true
	else-- если орудия нет в блюпринтах его стоимость = 0 по умолчанию, даже если записей об орудии нет в блюпринтах...
		varr.bMod_itbui = false
	end
	if varr.bMod_itbui == true then
		offs_x = 24
		button_clearstatBox.x = button_clearstatBox.x + 18
		varr.button_confirmBox.x = varr.button_confirmBox.x + 18--+18
		button_recBox.x = button_recBox.x + 19--+19 needed????
		varr.analitica_Box.x = varr.analitica_Box.x + 21--18
	else
		offs_x = 0
	end
	
	
	if Hyperspace.Blueprints:GetWeaponBlueprint("LASER_OLD").desc.title:GetText():find("Старый") ~= nil then
		-- русская версия
		--print('rus')
	else
		--print('eng')
		-- омерзительное написание кода
		-- в английской версии идёт сдвиг панели влево на 20 пикселей.
		offs_x = offs_x - 20
		button_clearstatBox.x = button_clearstatBox.x - 20
		varr.button_confirmBox.x = varr.button_confirmBox.x - 20
		button_recBox.x = button_recBox.x - 20
		varr.analitica_Box.x = varr.analitica_Box.x - 20
		offs_x_panel = - 20
	end
	
	
	
	
	create_full_ingame_list_of_augs()
	
end
--script.on_load(works_on_first_initialization_this_script)


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
	if Hyperspace.App.world.space.gamePaused or Hyperspace.App.gui.bAutoPaused or Hyperspace.App.gui.bPaused or Hyperspace.App.gui.menu_pause then
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


-- script.on_internal_event(Defines.InternalEvents.PRE_CREATE_CHOICEBOX, function(event)
	
-- end)


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
					if (drones[i].blueprint.droneImage == "de_drone_svch" and drones[i]:GetPowered() and drones[i].hackTime == 0.0) then
						value = value + 10
					end
				end
			end
		end
	end
	if ShipManager and OtherShipManager then -- снижает увороты другого корабля на X %
		if hasAnyAugmentationOfList(OtherShipManager, {"ACCURACY_BOOST", "HID_ACCURACY_BOOST"}) == true then
			value = value - 15
			if value < 0 then
				value = 0
			end
		end
	end
	return Defines.Chain.Continue, value
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
	
	--universal_iRoom_neededheal = {[0] = 0,}
	--universal_iRoom_neededheal_enemy = {[0] = 0,}
	
	varr.current_beacon_enemy_cargo_drone = ""
	varr.current_beacon_enemy_cargo_drone2 = ""
	
	Hyperspace.metaVariables['difficulty'] = math.floor(Hyperspace.Settings.difficulty)
	
	if playerShip and playerShip.bJumping == true then -- блок фиксирует только прыжки корабля игрока
		
		if Hyperspace.metaVariables['challenge_nohull'] == 1 then
			if playerShip.ship.hullIntegrity.first > 10 then
				playerShip.ship.hullIntegrity.first = 10
			end
		end
		
		if Hyperspace.metaVariables['challenge_nostor'] == 1 then
			Hyperspace.Blueprints:GetAugmentBlueprint("CALL_STORE").desc.rarity = 0
			if playerShip:HasAugmentation('CALL_STORE') > 0 then
				playerShip:RemoveAugmentation('CALL_STORE')
			end
		end
		
		
		if map and map.currentLoc and map.currentLoc.event then
			local maxcounter = map.locations:size()
			for i=0, maxcounter - 1 do
				if map.locations[i] == map.currentLoc then
					Hyperspace.metaVariables['previous_star_id'] = Hyperspace.metaVariables['current_star_id']
					Hyperspace.metaVariables['current_star_id'] = i
					
					if varr.equipment_that_will_stay_on_beacon ~= '' then
						Hyperspace.metaVariables['beacon_'..math.floor(Hyperspace.metaVariables['previous_star_id'])] = give_unique_id_of_equipment(varr.equipment_that_will_stay_on_beacon)
						varr.equipment_that_will_stay_on_beacon = ''
					end
				end
			end
		end
		
		
		
		Hyperspace.playerVariables['counter_beacon_waiting'] = 0
		Hyperspace.playerVariables['this_beacon_buy_dronesystem'] = 0
		
		Hyperspace.playerVariables['fishing_beacon'] = 0
		varr.is_enabled_monitor_to_planet = false
		varr.udochka_status = 1
		Hyperspace.playerVariables['fishing_remaining'] = 3
		--varr.cur_anim_int = 1
		
		varr.current_beacon_drillwork_chance = 100
		
		redefine_enemy_ai_lamp()
		
		if Hyperspace.metaVariables['challenge_nofuel'] == 1 and playerShip.fuel_count > 0 then
			playerShip.fuel_count = playerShip.fuel_count - 1
		end
		
		if Hyperspace.metaVariables['challenge_nobrain'] == 1 then
			--print('aa')
			for crew in vter(playerShip.vCrewList) do
				if crew.intruder == false then
					crew:SetSkillProgress(0, 0)
					crew:SetSkillProgress(1, 0)
					crew:SetSkillProgress(2, 0)
					crew:SetSkillProgress(3, 0)
					crew:SetSkillProgress(4, 0)
					crew:SetSkillProgress(5, 0)
				end
			end
		end
		
		for crew in vter(playerShip.vCrewList) do
			if crew.blueprint.name == 'egg' and math.random(0,100) < 10 then
				if crew.extend.crewPowers[0].enabled then
					crew.extend.crewPowers[0]:ActivatePower()
				end
				if math.random(0,100)<50 then
					Hyperspace.Sounds:PlaySoundMix('egg_open1', 10, false)
				else
					Hyperspace.Sounds:PlaySoundMix('egg_open2', 10, false)
				end
				-- if crew.extend.crewPowers[1].enabled then
					-- crew.extend.crewPowers[1]:ActivatePower()
				-- end
				-- if crew.extend.crewPowers[2].enabled then
					-- crew.extend.crewPowers[2]:ActivatePower()
				-- end
				--crew:ActivatePower()
				--print('egg works!')
			end
		end
		
		
		
		if Hyperspace.metaVariables['challenge_noaug'] == 1 then
			for augs in vter(playerShip:GetAugmentationList()) do
				if Hyperspace.CustomAugmentManager.GetInstance():GetAugmentDefinition(augs).locked == false then
					playerShip:RemoveAugmentation(augs)
				end
			end
		end
		
		if Hyperspace.metaVariables['challenge_nodromis'] == 1 then
			playerShip:ModifyDroneCount(-99999)
			playerShip:ModifyMissileCount(-99999)
		end
		varr.array_memory_of_scrap_decreasing = {}
		
		sPreviousJumpTypeOfSector = sCurrentJumpTypeOfSector
		sCurrentJumpTypeOfSector = map.currentSector.description.type
		
		
		
		if Hyperspace.metaVariables['challenge_nowst'] == 1 then
			local remove_arr = {[1]=999}
			local cococore = 1
			for weap in vter(playerShip:GetWeaponList()) do
				remove_arr[cococore] = math.floor(weap.blueprint.power)
				cococore = cococore + 1
			end
			
			for weap in vter(playerShip:GetWeaponList()) do
				playerShip:RemoveItem(weap.blueprint.name, false)
			end
			if remove_arr[1]~=999 then
				for i=1, #remove_arr do
					local weapnamy = ''
					while weapnamy == '' do
						weapnamy = varr.full_list_of_game_equipment[math.random(0, #varr.full_list_of_game_equipment)]
						if varr.full_list_of_game_equipment_power[weapnamy] == nil then
							weapnamy = ''
							--print('1')
						elseif varr.full_list_of_game_equipment_power[weapnamy] ~= remove_arr[i] then
							--print('2 '..varr.full_list_of_game_equipment_power[weapnamy]..','..remove_arr[i])
							weapnamy = ''
							--print('2')
						elseif varr.full_list_of_game_equipment_rarity[weapnamy] == nil then
							weapnamy = ''
							--print('3')
						elseif varr.full_list_of_game_equipment_rarity[weapnamy] == 0 then
							weapnamy = ''
							--print('4')
						end
						if Hyperspace.Blueprints:GetWeaponBlueprint(weapnamy).desc.cost == 0 then
							weapnamy = ''
							--print('5')
						end
						
					end
					--print(weapnamy)
					gui.equipScreen:AddWeapon(Hyperspace.Blueprints:GetWeaponBlueprint(weapnamy), true, false)
				end
				for i = 0, 6 do
					playerShip.weaponSystem:IncreasePower(99, false)
				end
			--else
			--	print('noweaps')
			end
		end
		--cococore = 1
		-- for uspow in vter(playerShip.weaponSystem.repowerList) do
			-- uspow = powered_arr[cococore]
			-- cococore = cococore + 1
		-- end
		
		--print(sPreviousJumpTypeOfSector)
		
		
		-- local counter55 = 0
		-- local cargofull = {}
		-- for carg in vter (gui.equipScreen:GetCargoHold()) do
			-- cargofull[counter55] = carg
			-- counter55 = counter55 + 1
		-- end
		-- for i = 0, 55 do
			-- if cargofull[i] ~= nil then
				-- playerShip:RemoveItem(cargofull[i], true)
				-- --print('removed'..cargofull[i])
			-- end
		-- end
		
		costy = 0
		costy_pot = 0
		overstrong = 0
		costy, costy_pot, overstrong = calculate_ship_cost (playerShip)
		Hyperspace.playerVariables['calc_local_strength'] = costy
		Hyperspace.playerVariables['calc_local_strength_pot'] = costy_pot
		Hyperspace.playerVariables['calc_is_player_overstrong'] = overstrong
		
				
		Hyperspace.playerVariables['jumps_in_current_sector'] = Hyperspace.playerVariables['jumps_in_current_sector'] + 1
		if Hyperspace.playerVariables['jumps_in_current_sector'] == 1 then
			
			if Hyperspace.playerVariables['counter_number_of_sector'] == 1 then
				iBeginSectorCostP = costy_pot + 4
				Hyperspace.playerVariables['begin_sector_ship_cost'] = iBeginSectorCostP
				--print('remembed_begin_cost1='..iBeginSectorCostP)
			end
			--iBeginSectorCostP = costy_pot + 4
			--Hyperspace.playerVariables['begin_sector_ship_cost'] = iBeginSectorCostP
			--print('remembed_begin_cost='..iBeginSectorCostP)
			
			
			if Hyperspace.metaVariables['challenge_norare'] == 1 then
				change_global_rarity_rare_to_zero()
				--print('changed rar')
			end
			
			
			if Hyperspace.playerVariables['counter_number_of_sector'] == 1 then
				if Hyperspace.metaVariables['challenge_nogus'] == 1 then
					playerShip:AddCrewMemberFromString("Королева", "gusq", false, -1, false, false)
				end
			end
		end
		
		if Hyperspace.metaVariables['challenge_nogus'] == 1 then
			if count_of_gusq_on_player_ship() == 0 then
				Hyperspace.metaVariables['challenge_nogus'] = 0
			elseif playerShip.currentScrap > 0 then
				playerShip:ModifyScrapCount(-1, false)
			end
		end
		
		
		--print('cp'..costy_pot)
		
		
		
		
		
		fixed_store_here = false
		timer_x = 0.0
		varr.micro_tick_counter4 = 0.0 -- тоже сброс после прыжка т.к. иначе вспышка может быть ранней на следующем маяке с высокой температурой
		
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
		
		counter_meet_rebel_wave_previous_beacon = Hyperspace.playerVariables['counter_meet_rebel_wave'] -- запоминаем значение в конце прыжка
		
		check_max_raw_victory_counter()
		
		micro_tick_array = {} -- очистка массива запланированных событий на тики
		anim_tick_array = {[1]={}, [2]={}}
		
		map = Hyperspace.App.world.starMap
		if map then
			REQUESTER_FOR_EVENT_AFTER_JUMP = ""
			memory_of_previous_beacon_event_name = memory_of_current_beacon_event_name
			if map.currentLoc and map.currentLoc.event then
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
					if hasAnyAugmentationOfList(playerShip, {"DRONE_RECOVERY", "HID_DRONE_RECOVERY", "FTL_JUMPER_DRONE_RECOVERY"}) == true then
						playerShip:ModifyDroneCount(1)
					end
				end
			end
		end
		
		
		--удаление дронов при прыжках игрока
		remove_all_temporal_drones()
		
		
		
	end
	
	if enemyShip and enemyShip.bJumping == true then -- этот блок срабатывает когда враг упрыгивает от игрока, единожды за прыжок.
		if playerShip and playerShip.bJumping == false then --важное дополнение т.к. если враг упрыгнул, то его enemyShip.bJumping остаётся true...
			redefine_enemy_ai_lamp()
			--Hyperspace.metaVariables['enemy_has_advanced_ai'] = 0
			--print('enemy gone new')
		end
		--print('enemy gone old')
	end
	
	--Hyperspace.metaVariables['in_store_now'] = Hyperspace.metaVariables['in_store_now'] - 2
	Hyperspace.metaVariables['in_store_now'] = 0
	
	
	
	
	
	
end


function calculate_ship_cost (current_ship)
	local hp_cost = 2
	local sector_num = 1
	if map ~= nil then
		sector_num = map.worldLevel + 1
	end 
	if sector_num <= 3 then
		hp_cost = 2
	elseif sector_num <= 6 then
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
				shipCost = shipCost + math.floor(weap.blueprint.desc.cost/2)
			end
		end
		for augs in vter(current_ship:GetAugmentationList()) do
			if Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.cost ~= nil then
				shipCost = shipCost + math.floor(Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.cost/2)
			end
		end
		if current_ship.iShipId == 0 then-- оценка встроенных усилений
			local coia = Hyperspace.playerVariables['counter_augments_installed']
			for augs in vter(Hyperspace.Blueprints:GetBlueprintList("CAN_BE_HIDDEN_AUGS")) do
				if Hyperspace.playerVariables['installed_'..augs] == 1 then
					shipCost = shipCost + math.floor(Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.cost/2)
				end
			end
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
					--if crew.blueprint.name ~= "ИМЯ БЛЮПРИНТА ЭКИПАЖА КОТОРОЕ НЕ НАДО" then
						shipCost = shipCost + crew.blueprint.desc.cost
					--end
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
		
		if current_ship.artillerySystems ~= nil then
			--print('bef'..shipCost)
			local vArtSystemList = current_ship.artillerySystems
			for i = 0, vArtSystemList:size() - 1 do
				local ps = vArtSystemList[i].healthState.second
				if ps == 1 then
					shipCost = shipCost + 60
				elseif ps == 2 then
					shipCost = shipCost + 100
				elseif ps == 3 then
					shipCost = shipCost + 165
				elseif ps == 4 then
					shipCost = shipCost + 265
				else print('unknown syslvl artillery'..ps)
				end
			end
			--print('aft'..shipCost)
		end
		
		for i = 0, 20 do --was 1,20 lol, forgot shields - 0 sys
			if current_ship:HasSystem(i) then
				local sysnm = Hyperspace.ShipSystem.SystemIdToName(i)
				local ps = 0
				if current_ship:GetSystem(i) ~= nil then
					--ps = current_ship:GetSystem(i).powerState.second
					ps = current_ship:GetSystem(i).healthState.second
				end
				--print('sysnm='..sysnm..'lvl='..ps)
				if sysnm == "reactor" then
					--посчитана стоимость реактора корабля в зависимости от уровня текущей прокачки
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
				-- УБРАНА ОТСЮДА,Т.К. НЕ УНИВЕРСАЛЬНО РАБОТАЕТ
				-- elseif sysnm == "artillery" then
					-- if ps == 1 then
						-- shipCost = shipCost + 60
					-- elseif ps == 2 then
						-- shipCost = shipCost + 100
					-- elseif ps == 3 then
						-- shipCost = shipCost + 165
					-- elseif ps == 4 then
						-- shipCost = shipCost + 265
					-- else print('unknown syslvl'..sysnm..ps)
					-- end
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
				elseif sysnm == "cloaking" then
					if ps == 1 then
						shipCost = shipCost + 150
					elseif ps == 2 then
						shipCost = shipCost + 180
					elseif ps == 3 then
						shipCost = shipCost + 230
					else print('unknown syslvl'..sysnm..ps)
					end
				end
			end
		end
		--по результатам поверхностного анализа статистики Дарка за 147 полётов
		--выяснилось что статистика не считала щиты корабля значит всё псу под хвост
		local average_control_points = {
		[1]=890.0,
		[2]=1090.0,
		[3]=1315.0,
		[4]=1590.0,
		[5]=1910.0,
		[6]=2230.0,
		[7]=2600.0,
		[8]=3150.0,
		}
		if average_control_points[sector_num] ~= nil then
			if shipCost < average_control_points[sector_num]*0.8 then shipIsOverstrong = 0
			elseif shipCost < average_control_points[sector_num]*1.2 then shipIsOverstrong = 1
			else shipIsOverstrong = 2
			end
		end
		
		shipCostPotential = shipCost
		if current_ship.iShipId == 0 then
			shipCostPotential = shipCostPotential + current_ship.currentScrap
			--print(current_ship.currentScrap)
			shipCostPotential = shipCostPotential + current_ship.fuel_count * 4
			for carg in vter2 (gui.equipScreen:GetCargoHold()) do
				if Hyperspace.Blueprints:GetWeaponBlueprint(carg).desc.cost ~= nil then
					shipCostPotential = shipCostPotential + math.floor(Hyperspace.Blueprints:GetWeaponBlueprint(carg).desc.cost/2)
				end
				if Hyperspace.Blueprints:GetDroneBlueprint(carg).desc.cost ~= nil then
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
	
	-- этот маленький блок чинит работу лёгкого предзажигателя при ожидании на маяке.
	-- заряжает орудие справа от себя если оно запитано
	local bNeededPreigniteWeap = false
	for pf in vter(playerShip.weaponSystem.weapons) do
		if pf.blueprint.name == "LIGHT_PRE_IGNITER" then
			bNeededPreigniteWeap = true
		else
			if bNeededPreigniteWeap == true then
				if pf.powered == true and pf.cooldown.first < pf.cooldown.second - 0.2 then
					pf.cooldown.first = pf.cooldown.second - 0.05
				end
				bNeededPreigniteWeap = false
				--print('wait preignited='..pf.blueprint.name)
			end
		end
	end
	
	
	--print('wait!'..Hyperspace.metaVariables['in_store_now'])
	if (Hyperspace.metaVariables['in_store_now'] > 0) then
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
	
	
	
	if playerShip.fuel_count > 0 then
		varr.waiting_mode_state = false
		map:ForceWaitMessage()
		
		counter_meet_rebel_wave_previous_beacon = Hyperspace.playerVariables['counter_meet_rebel_wave']
		--varr.micro_delayer_to_waiting_at_beacon = 2000.0
		--print('fuel c')
	end
end
script.on_internal_event(Defines.InternalEvents.ON_WAIT, no_fuel_waiting)


function jumped_arrive()
	
	--НЕ починил предзажигатель у игрока. оно само...
	-- if playerShip and playerShip:HasAugmentation("WEAPON_PREIGNITE") > 0 then
		-- if playerShip.weaponSystem ~= nil then
			-- for pf in vter2(playerShip.weaponSystem.weapons) do
				-- if pf.powered == true and pf.bFiredOnce == false and pf.cooldown.second >= 1.0 and pf.cooldown.first == 0.0 then
					-- pf.cooldown.first = pf.cooldown.second - 0.05
					-- print('player preign')
				-- end
			-- end
		-- end
	-- end
	
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
	Hyperspace.playerVariables['bShowOrchidFleet'] = 0
	
	define_current_star_id()
	-- if map and map.currentLoc and map.currentLoc.event then
		-- local maxcounter = map.locations:size()
		-- for i=0, maxcounter - 1 do
			-- if map.locations[i] == map.currentLoc then
				-- Hyperspace.metaVariables['current_star_id'] = i
			-- end
		-- end
	-- end
	
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
--local sr_quit = {text_on = "Закрыть панель управления Душегубом.", x = 1219, y = 203, w = 41, h = 41}
local sr_quit = {text_on = Hyperspace.Text:GetText('lua_sr_quit'), x = 1219, y = 203, w = 41, h = 41}
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
			if Hyperspace.playerVariables['soulreaper_cooldown'] == 15 then
				Hyperspace.playerVariables['soulreaper_cooldown'] = 13
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 5
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 13 then
				Hyperspace.playerVariables['soulreaper_cooldown'] = 11
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 7
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 11 then
				Hyperspace.playerVariables['soulreaper_cooldown'] = 9
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 8
				soul_upgrade_detected()
			elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 9 then
				Hyperspace.playerVariables['soulreaper_cooldown'] = 7
				Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 10
				soul_upgrade_detected()
			end
			
			-- if Hyperspace.playerVariables['soulreaper_cooldown'] == 14 then
				-- Hyperspace.playerVariables['soulreaper_cooldown'] = 12
				-- Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 5
				-- soul_upgrade_detected()
			-- elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 12 then
				-- Hyperspace.playerVariables['soulreaper_cooldown'] = 10
				-- Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 7
				-- soul_upgrade_detected()
			-- elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 10 then
				-- Hyperspace.playerVariables['soulreaper_cooldown'] = 8
				-- Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] - 10
				-- soul_upgrade_detected()
			-- end
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
	--check_mouse_pos()
	
	if Hyperspace.playerVariables['soulreaper_in_slots'] > 0 then
		if map and map.bOpen == true then
			--на открытой карте не переключаем душегуб
		else
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
			if mouseInside(varr.button_confirmBox) then
				ClearStat()
				Hyperspace.Sounds:PlaySoundMix('actinophrysboom1', 10, false)
				varr.prepare_to_clear_stat = false
			end
		end
		
	end
	
	if varr.prepare_to_explode_hack == true then
		if mouseInside({x = 106 + varr.x_offset_of_tips_artillery_system, y = 671, w = 22, h = 22}) and gui and gui.menu_pause == false then
			playerShip.hackingSystem:BlowHackingDrone()
			if varr.allowed_hack_explosion_on_cooldown == true then
				playerShip.hackingSystem.iLockCount = 1
				playerShip.hackingSystem.lockTimer.running = true
				playerShip.hackingSystem.lockTimer.currTime = playerShip.hackingSystem.lockTimer.currGoal-1.0
			end
		end
	end
	
	if varr.prepare_to_cancel_mind == true then
		--if mouseInside({x = 106 + varr.x_offset_of_tips_artillery_system, y = 671, w = 22, h = 22}) and gui and gui.menu_pause == false then
			disable_enemy_mindcontrolling()
		--end
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
	
	if varr.button_nopause_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nopause()
		end
	end
	if varr.button_nofuel_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nofuel()
		end
	end
	if varr.button_nobrain_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nobrain()
		end
	end
	if varr.button_noaug_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_noaug()
		end
	end
	if varr.button_nomaxhp_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nomaxhp()
		end
	end
	if varr.button_noscrap_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_noscrap()
		end
	end
	if varr.button_nosysca_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nosysca()
		end
	end
	if varr.button_nodromis_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nodromis()
		end
	end
	if varr.button_nozlt_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nozlt()
		end
	end
	if varr.button_norare_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_norare()
		end
	end
	if varr.button_noeye_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_noeye()
		end
	end
	if varr.button_nocont_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nocont()
		end
	end
	if varr.button_noai_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_noai()
		end
	end
	if varr.button_nohull_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nohull()
		end
	end
	if varr.button_nogeq_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nogeq()
		end
	end
	if varr.button_nostor_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nostor()
		end
	end
	if varr.button_nowst_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nowst()
		end
	end
	if varr.button_noinst_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_noinst()
		end
	end
	if varr.button_nobf_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nobf()
		end
	end
	if varr.button_nogus_ready == true then
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		else
			press_button_nogus()
		end
	end
	
	if varr.button_resetchall_ready == true then
		press_button_resetchall()
	end
	
	if varr.button_rew_ready == true then
		press_button_rew()
	end
	
	if varr.button_arty_ready > -1 then
		press_button_arty(varr.button_arty_ready)
	end
	
	if varr.button_fish_ready == true then
		press_button_fish()
	end
	
	if varr.waiting_button_ready == true then
		press_waiting_button()
	end
	
	if varr.draw_ready == true then
		press_draw_button()
	end
	
	if varr.draw_clear_ready == true then
		clear_map_drawing()
	end
	
	--фактически отслеживание нажатия на кнопку ожидания на маяке через координаты курсора
	--измеренное попиксельно уродство, но иначе никак, т.к. нет функции НАЧАЛА ожидания, а только окончания - ON_WAIT...
	--print(Hyperspace.Mouse.position.x..','..Hyperspace.Mouse.position.y)
	if map and map.bOpen == true and map.bChoosingNewSector == false then
		
		-- фиксирует клик по карте в любом месте
		reset_osa_activity(false) -- возврат в игру всех ос. весьма вероятно что это место компенсирует баг когда игрок каким-то образом прыгает
		-- с враждебной осой в состоянии выведенности из игры (необходимо для принятия сдачи врагов периодически это делать)
		
		if varr.waiting_mode_state == true then
			if mouseInside({x = 734, y = 568, w = 127, h = 36}) then
				varr.micro_delayer_to_waiting_at_beacon = 2000.0
			end
		end
	end
	-- if varr.button_timer_ready == true then
		-- press_button_timer()
	-- end
	
end)

-- Если нажать HOME выдаст в лог текущую стоимость корабля игрока (и, если есть, то врага тоже)
script.on_internal_event(Defines.InternalEvents.ON_KEY_DOWN, function(key)
	if key == Defines.SDL.KEY_RCTRL then
		if Hyperspace.playerVariables['fishing_beacon'] == 1 and varr.is_enabled_monitor_to_planet == true then
			press_button_fish()
		end
	end
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
	if key == Defines.SDL.KEY_END then
		-- диапазоны наград
		local rew = 0.0
		local rew2 = 0.0
		local num_sec = Hyperspace.playerVariables['counter_number_of_sector']
		local stroutrew = 'sec'..math.floor(num_sec)..'. rewards: '
		num_sec = num_sec - Hyperspace.Settings.difficulty
		if num_sec < 0.0 then
			num_sec = 0.0
		end
		rew = (500.0/1000.0)*(6.0 * num_sec + 15.0)
		rew2 = (700.0/1000.0)*(6.0 * num_sec + 15.0)
		stroutrew = stroutrew..'low'..math.floor(rew)..'-'..math.ceil(rew2)..', '
		rew = (800.0/1000.0)*(6.0 * num_sec + 15.0)
		rew2 = (1300.0/1000.0)*(6.0 * num_sec + 15.0)
		stroutrew = stroutrew..'med'..math.floor(rew)..'-'..math.ceil(rew2)..', '
		rew = (1300.0/1000.0)*(6.0 * num_sec + 15.0)
		rew2 = (1500.0/1000.0)*(6.0 * num_sec + 15.0)
		stroutrew = stroutrew..'high'..math.floor(rew)..'-'..math.ceil(rew2)..', '
		rew = 6.0 * num_sec + 15.0
		stroutrew = stroutrew..'average'..math.floor(rew)
		print(stroutrew)
		--print('seed = '..tostring(math.floor(Hyperspace.Global.currentSeed)))
		--playerShip:CreateSpaceDrone(Hyperspace.Blueprints:GetDroneBlueprint('DE_DRONE_ION_3P'))
		
	end
	
	if key == Defines.SDL.KEY_PAGEDOWN then
		if Hyperspace.playerVariables['is_really_safe_place'] == 1 then
			if Hyperspace.App.menu.shipBuilder.bOpen == true or Hyperspace.App.menu.bOpen == true or Hyperspace.App.gui.event_pause == true then
				-- НИЧЕГО НЕ ДЕЛАТЬ ТУТ
			elseif not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.menu_pause then--not gui.bPaused and
				Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_CARGO_BUTTON", false, -1)
			end
		else
			--Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		end
	end
	
	if key == Defines.SDL.KEY_DELETE then
		--loading_texts()
	end
end)

script.on_internal_event(Defines.InternalEvents.DANGEROUS_ENVIRONMENT, function(bDanger)
	--кастомные опасные среды теперь действительно в бою считаются опасными средами
	--телепорт не обнуляет свою перезарядку сразу теперь
	if Hyperspace.playerVariables['danger_crystals'] == 1 or
	Hyperspace.playerVariables['danger_cold'] == 1 or
	Hyperspace.playerVariables['danger_wild_drones'] == 1 or
	Hyperspace.playerVariables['danger_nanites'] == 1 or
	Hyperspace.playerVariables['danger_radiation'] == 1 or
	Hyperspace.playerVariables['danger_ultra_sun'] == 1 then
		bDanger = true
		--print('dang')
	end
	return bDanger
end)


-- Если нажать INSERT то переключит режим показывания номеров отсеков (кораблей игрока и врагов)
script.on_internal_event(Defines.InternalEvents.ON_KEY_DOWN, function(key)
	if key == Defines.SDL.KEY_INSERT then--KEY_KP0 не работает чего-то
		if (bShowRoomNumbers == true) then
			bShowRoomNumbers = false
		else
			bShowRoomNumbers = true
		end
		
		
		
		--make_enemy_same_as_player()--test
		
		--test
		
		
		-- for i=0, #varr.full_list_of_game_equipment do
			-- local equip_name = varr.full_list_of_game_equipment[i]
			-- if Hyperspace.Blueprints:GetWeaponBlueprint(equip_name).desc.cost > 0 then
				-- print(equip_name..'='..Hyperspace.Blueprints:GetWeaponBlueprint(equip_name).desc.rarity)
			-- elseif Hyperspace.Blueprints:GetDroneBlueprint(equip_name).desc.cost > 0 then
				-- print(equip_name..'='..Hyperspace.Blueprints:GetDroneBlueprint(equip_name).desc.rarity)
			-- elseif Hyperspace.Blueprints:GetAugmentBlueprint(equip_name).desc.cost > 0 then
				-- print(equip_name..'='..Hyperspace.Blueprints:GetAugmentBlueprint(equip_name).desc.rarity)
			-- end
		
		-- end
		
		
		--constructor(CrewBlueprint blueprint, int shipId, bool intruder, CrewAnimation *animation)
		
		
		-- попытка замены визуала орудий врага. в целом успешно, но глоу остаётся старым. хз что делать.
		-- if enemyShip then
			-- for pf in vter2(enemyShip.weaponSystem.weapons) do
				-- -- print('mynameis'..pf.blueprint.name)
				-- --print(pf.weaponVisual.anim.animName) - ничего по умолчанию
				-- pf.weaponVisual.anim.mask_x_pos = 0
				-- pf.weaponVisual.anim.mask_x_size = 30
				-- pf.weaponVisual.anim.mask_y_pos = 0
				-- pf.weaponVisual.anim.mask_y_size = 91
				-- pf.weaponVisual.anim.animationStrip = Hyperspace.Resources:GetImageId("weapons/uwb_weapon.png")
				-- pf.weaponVisual.anim.primitive = nil
				-- pf.weaponVisual.anim.mirroredPrimitive = nil
				-- pf.weaponVisual.anim.info.numFrames = 9
				-- pf.weaponVisual.anim.info.imageWidth = 270
				-- pf.weaponVisual.anim.info.imageHeight = 91
				-- pf.weaponVisual.anim.info.stripStartY = 0
				-- pf.weaponVisual.anim.info.stripStartX = 0
				-- pf.weaponVisual.anim.info.frameWidth = 30
				-- pf.weaponVisual.anim.info.frameHeight = 91
				
				-- pf.weaponVisual.iChargedFrame = 4
				-- pf.weaponVisual.iFireFrame = 6
				
				-- --empty image
				-- pf.weaponVisual.boostAnim.animationStrip = Hyperspace.Resources:GetImageId("weapons/ba_effector_impact_1_strip9.png")
				-- pf.weaponVisual.boostAnim.primitive = nil
				-- pf.weaponVisual.boostAnim.mirroredPrimitive = nil
				-- -- итого осталась проблема с глоу, который наследуется с исходного орудия. хз что делать.

				-- print('don')
			-- end
		-- end
		
    end
end)

script.on_render_event(Defines.RenderEvents.MAIN_MENU, function()
	InMain()
	end,
	
	function()
	varr.needed_check_tonnel = true
end)


	-- if Hyperspace.App.menu.shipBuilder.bOpen == false then-- and Hyperspace.App.menu.bOpen == true then
		-- if varr.splash_image == nil then
			
			-- local arr = os.date("*t")
			-- local num = math.random(1,54)
			-- num = num + tonumber(arr.sec)
			-- while num > 54 do
				-- num = num - 54
			-- end
			
			-- local outnum = ''
			-- if num < 10 then
				-- outnum = '00'..tostring(num)
			-- elseif num < 100 then
				-- outnum = '0'..tostring(num)
			-- else
				-- outnum = tostring(num)
			-- end
			-- --print(outnum)
			-- varr.splash_image = Hyperspace.Resources:CreateImagePrimitiveString('main_menus/splash_'..outnum..'.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
		-- end
		-- --print('menu!')
		-- Graphics.CSurface.GL_PushMatrix()
		-- Graphics.CSurface.GL_Translate(5, 5)
		-- Graphics.CSurface.GL_RenderPrimitive(varr.splash_image)
		-- Graphics.CSurface.GL_PopMatrix()
	-- end
	
	--print('needed_check_tonnel')


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
	
	-- if spacedrone then
		-- spacedrone.weaponCooldown = 0.0
		
		-- spacedrone:SetWeaponTarget(spacedrone.weaponTarget)
		-- spacedrone:OnLoop()
		-- --spacedrone:PickTarget()
		-- --print(spacedrone.weaponCooldown..','..spacedrone.pause)
		-- spacedrone.pause = 0.0
		-- print(spacedrone.additionalPause)
		-- --spacedrone.additionalPause = 0.0
		-- spacedrone.bFire = true
		-- spacedrone.currentTargetId = 1
		-- if math.random(0,100)<50 then
			-- spacedrone.targetLocation = Hyperspace.Pointf(0.0,0.0)
		-- end
		-- --spacedrone:SetCurrentLocation(Hyperspace.Pointf(spacedrone.currentLocation.x-1.0, spacedrone.currentLocation.y))
		-- --spacedrone:UpdateAimingAngle(spacedrone:GetRandomTargettingPoint(true), 100.0, 100.0)
	-- end
	
	
	-- if spacedrone.blueprint.name == "AHC_DRONE" then
		-- projectile:Kill()
	-- end
	
	
	--if spacedrone.blueprint.name == "SHIP_REPAIR" then
	--	print(spacedrone.lifespan)
	--end
	
	-- if spacedrone.blueprint.name == "DE_DRONE_AWEAP" then
		-- if projectile.ownerId == 1 and playerShip then
			-- if playerShip.weaponSystem~=nil then
				-- for pf in vter(playerShip.weaponSystem.weapons) do
					-- --if pf.powered == true and pf.cooldown.first > 0.2 and pf.cooldown.first < pf.cooldown.second - 0.2 then
					-- if pf.cooldown.first > 0.2 then
						-- pf.cooldown.first = pf.cooldown.first * 0.66
						-- --print('en')
					-- end
				-- end
			-- end
			-- if playerShip.artillerySystems ~= nil then
				-- local vSystemList = playerShip.artillerySystems
				-- for i = 0, vSystemList:size() - 1 do
					-- if pf.cooldown.first > 0.2 then
						-- pf.cooldown.first = pf.cooldown.first * 0.66
					-- end
				-- end
			-- end
			-- --print('en work')
		-- elseif projectile.ownerId == 0 and enemyShip then
			-- if enemyShip.weaponSystem~=nil then
				-- for pf in vter(enemyShip.weaponSystem.weapons) do
					-- --if pf.powered == true and pf.cooldown.first > 0.2 and pf.cooldown.first < pf.cooldown.second - 0.2 then
					-- if pf.cooldown.first > 0.2 then				
						-- pf.cooldown.first = pf.cooldown.first * 0.66
						-- --print('pl')
					-- end
				-- end
			-- end
			-- if enemyShip.artillerySystems ~= nil then
				-- local vSystemList = enemyShip.artillerySystems
				-- for i = 0, vSystemList:size() - 1 do
					-- if pf.cooldown.first > 0.2 then
						-- pf.cooldown.first = pf.cooldown.first * 0.66
					-- end
				-- end
			-- end
			-- --print('pl work')
		-- end
	-- end
	
	
	
	-- исправление пропавшего визуально зелёного луча у хил-дрона (в блюпринте урон должен быть = 0, а тут подменяется при выстреле)
	if spacedrone.blueprint.name == "DRONE_HEALBEAM" then
		if projectile.ownerId == 0 then
			if enemyShip and gui then
				local dam = Hyperspace.Damage()
				dam.iDamage = -1
				enemyShip:DamageArea(enemyShip:GetRandomRoomCenter(), dam, true)
			end
		else
			if playerShip and gui then
				local dam = Hyperspace.Damage()
				dam.iDamage = -1
				playerShip:DamageArea(playerShip:GetRandomRoomCenter(), dam, true)
			end
		end
        --return Defines.Chain.CONTINUE
    end
	
	
	if not spacedrone.heading then
		return Defines.Chain.CONTINUE
	end
	
	
	
	if spacedrone.blueprint.name == "DRONE_SPAWNER" then
		local sdr = nil
		local inum = 0
		local dronesarr = {}
		for stringy in vter (Hyperspace.Blueprints:GetBlueprintList('DRONES_COMBAT_SMALL_SIZE')) do--DRONES_COMBAT_SMALL_SIZE--DRONES_COMBAT
			dronesarr[inum] = stringy
			inum = inum + 1
		end
		local spawndrone = dronesarr[math.random(0, #dronesarr)]
		if projectile.ownerId == 0 then
			sdr = playerShip:CreateSpaceDrone(Hyperspace.Blueprints:GetDroneBlueprint(spawndrone))
		else
			sdr = enemyShip:CreateSpaceDrone(Hyperspace.Blueprints:GetDroneBlueprint(spawndrone))
		end
		sdr:SetDeployed(true)
		sdr.powerRequired = 0
		sdr.powered = true
		sdr.lifespan = 3.0
		sdr.currentLocation = spacedrone.currentLocation
		projectile:Kill()
	end
	
	
	
	if spacedrone.blueprint.name == "DRONE_CHAFF_M2" then
		local antifreezer = 0
		if spacedrone.iShipId == 0 then 
			while spacedrone.destinationLocation.y > math.random(10, 90) and antifreezer < 15 do
				spacedrone:PickDestination()
				antifreezer = antifreezer + 1
			end
		else
			--print('bef'..spacedrone.destinationLocation.x)
			while spacedrone.destinationLocation.x < math.random(150, 350) and antifreezer < 15 do
				spacedrone:PickDestination()
				antifreezer = antifreezer + 1
			end
			--print('aft'..spacedrone.destinationLocation.x)
		end
	end

	
	-- if spacedrone.lifespan < 0.0 or (spacedrone.lifespan > 2.0 and spacedrone.lifespan < 999999) then
		-- print('detected strange drone:'..spacedrone.blueprint.name..', lifespan='..spacedrone.lifespan)
	-- end
	-- lifespan - это кол-во оставшихся атак. у временных дронов 0-1-2, у обычных - огромное число (не меняющееся)
	
	if (spacedrone.blueprint.name == "DE_DRONE_LIGHT_2_SMART1" or spacedrone.blueprint.name == "DE_DRONE_LIGHT_2_SMART2" or spacedrone.blueprint.name == "DE_DRONE_LIGHT_2_SMART3") then
		local chance_of_targetting = 100
		if spacedrone.blueprint.name == "DE_DRONE_LIGHT_2_SMART1" then
			chance_of_targetting = 50
		elseif spacedrone.blueprint.name == "DE_DRONE_LIGHT_2_SMART2" then
			chance_of_targetting = 65
		elseif spacedrone.blueprint.name == "DE_DRONE_LIGHT_2_SMART3" then
			chance_of_targetting = 80
		end
		if GSIe and GSIp and enemyShip and playerShip then
			if (math.random(0,100) < chance_of_targetting) then -- тут определяет шанс, что дрон будет выцеливать экипаж
				if spacedrone.iShipId == 0 then
					if enemyShip._targetable.hostile then
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
					if enemyShip._targetable.hostile then
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
	end
	
	
	
	-- if spacedrone.blueprint.name == "DRONE_COMANTI" then
		-- print('do1')
		-- if enemyShip.droneSystem ~= nil then
			-- print('do2')
			
			
			-- local all_drones = Hyperspace.App.world.space.drones
			-- for i = 0, all_drones:size() - 1 do
				-- print(all_drones[i].blueprint.name)
			-- end
			-- local sdr = playerShip:CreateSpaceDrone(Hyperspace.Blueprints:GetDroneBlueprint("HAL_DRONE_MISSILES_1"))
			-- sdr:SetDeployed(true)
			-- sdr.powerRequired = 0
			-- sdr.powered = true
			
			-- --all_drones:push_back(sdr)
			
			
			-- projectile:Kill()
			-- -- local drond = enemyShip.droneSystem.drones
			-- -- for i = 0, drond:size() - 1 do
				-- -- if drond[i].blueprint.typeName == "DEFENSE" or drond[i].blueprint.typeName == "SHIELD" then
					-- -- if drond[i].deployed == true then
						
						-- -- print(spacedrone.destinationLocation.x)--это работает у боевых дронов
						-- -- --print(drond[i]._targetable:GetRandomTargettingPoint(true).x)
						-- -- print(drond[i].currentLocation.x)
						-- -- --:CreateLaserBlast(WeaponBlueprint *weapon, Pointf position, int space, int ownerId, Pointf target, int targetSpace, float heading)
						-- -- local lb = Hyperspace.App.world.space:CreateLaserBlast(Hyperspace.Blueprints:GetWeaponBlueprint('DE_DRONE_LASER_HEAVY'),  spacedrone.destinationLocation, 1, 0, drond[i].pointTarget, 1, 10.0)
					-- -- end
				-- -- end
			-- -- end
		-- end
	-- end
	
	
    
	return Defines.Chain.CONTINUE
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

-- даёт ID комнаты по координатам
function GetRoomAtLocation(shipManager, location, includeWalls)
    return Hyperspace.ShipGraph.GetShipInfo(shipManager.iShipId):GetSelectedRoom(location.x, location.y, includeWalls)
end



local jump_fuel_check_done = false
local mem_bPlayerIsJumping = false
local mem_fuel = 0
function check_arsenal_on_tick_processes()
	
	--varr.local_time = varr.local_time + 1/Hyperspace.FPS.NumFrames
	--print(varr.local_time)
	--print(Hyperspace.Mouse.bSellingStuff)
	
	
	
	
	if varr.first_global_loading_completed < 1 then
		varr.first_global_loading_completed = varr.first_global_loading_completed + 1
	end
	if varr.first_global_loading_completed == 1 then
		works_on_first_initialization_this_script()
		varr.first_global_loading_completed = 2
		--print('don')
	end
	
	
	
	if varr.micro_delayer_to_waiting_at_beacon > 0.0 then
		varr.micro_delayer_to_waiting_at_beacon = varr.micro_delayer_to_waiting_at_beacon - 60.0*Hyperspace.FPS.SpeedFactor
	end
	--print(varr.micro_delayer_to_waiting_at_beacon)
	
	varr.micro_tick_counter22 = varr.micro_tick_counter22 + 60.0*Hyperspace.FPS.SpeedFactor
	if varr.micro_tick_counter22 > 2000.0 then
		varr.micro_tick_counter22 = 0.0
	end
	
	
	
	
	--не самое очевидное место для сброса отслеживалок нажатий на кнопки, но вроде работает как надо...
	varr.button_nopause_ready = false
	varr.button_nofuel_ready = false
	varr.button_nobrain_ready = false
	varr.button_noaug_ready = false
	varr.button_nomaxhp_ready = false
	varr.button_noscrap_ready = false
	varr.button_nosysca_ready = false
	varr.button_nodromis_ready = false
	varr.button_nozlt_ready = false
	varr.button_norare_ready = false
	varr.button_noeye_ready = false
	varr.button_nocont_ready = false
	varr.button_noai_ready = false
	varr.button_nohull_ready = false
	varr.button_nogeq_ready = false
	varr.button_nostor_ready = false
	varr.button_nowst_ready = false
	varr.button_noinst_ready = false
	varr.button_nobf_ready = false
	varr.button_nogus_ready = false
	varr.button_resetchall_ready = false
	varr.button_rew_ready = false
	varr.waiting_button_ready = false
	varr.draw_ready = false
	varr.draw_clear_ready = false
	
	if Hyperspace.App.menu.shipBuilder.bOpen == true then -- при заходе в ангар для выбора корабля включает запись статистики полётов
		Hyperspace.metaVariables['rec_sector_statistic'] = 1 -- рестарт без захода в ангар не меняет настройку записи
		Hyperspace.playerVariables['installed_AUG_SLOT'] = 0
		
		Hyperspace.playerVariables['fishing_beacon'] = 0
		Hyperspace.metaVariables['current_star_id'] = 999
		varr.is_enabled_monitor_to_planet = false
	end
	
	gui = Hyperspace.App.gui
	enemyShip = Hyperspace.ships.enemy
	playerShip = Hyperspace.ships.player
	GSIe = Hyperspace.ShipGraph.GetShipInfo(1)
	GSIp = Hyperspace.ShipGraph.GetShipInfo(0)
	world = Hyperspace.App.world
	
	if world then
		map = world.starMap
	else	
		map = nil
	end
	
	
	
	
	
	
	
	
	-- эта простая вещь отключает кнопку усилений и трюм, если мы находимся в дефолтной опасной среде или особенной опасной среде
	if gui then
		if isReallyDangerousEnvironment() == true then
			gui.upgradeButton.bActive = false
			Hyperspace.playerVariables['is_really_safe_place'] = 0
			--varr.osa_on_playership = false
		else
			varr.no_osa_boarders_found = false
			varr.osa_boarders_found = false
			if playerShip then
				for crew in vter(playerShip.vCrewList) do
					if crew.intruder == true and crew.health.first > 0.0 then
						if crew.blueprint.name == "osa" or crew.blueprint.name == "osae" then
							varr.osa_boarders_found = true
						else
							varr.no_osa_boarders_found = true
						end
					end
				end
			end
			
			if varr.osa_boarders_found == true then
				varr.enemy_osa_on_playership = true
			else
				varr.enemy_osa_on_playership = false
			end
			
			if varr.no_osa_boarders_found == true then
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
	
	
	
	
	-- local projectiles = Hyperspace.App.world.space.projectiles
    -- for i = 0, projectiles:size() - 1 do
        -- local projectile = projectiles[i]
        -- local projName = tostring(projectile.extend.name)
        -- if not (projName == "" or projName == "nil" or projName == "PDS_SHOT") then
			-- if ((projectile.damage.iDamage > 0) or (projectile.damage.iShieldPiercing > 0) or (projectile.damage.fireChance > 0.0) or(projectile.damage.breachChance > 0.0) or (projectile.damage.stunChance > 0.0) or (projectile.damage.iIonDamage > 0)or (projectile.damage.iSystemDamage > 0)or (projectile.damage.iPersDamage > 0)or (projectile.damage.bLockdown == true) or(projectile.damage.iStun > 0)) then
				-- Hyperspace.playerVariables['counter_projectiles_eated'] = Hyperspace.playerVariables['counter_projectiles_eated'] + 1
			-- end
			-- projectile.death_animation:Start(false)
			-- projectile.startedDeath = true
        -- end
    -- end
	
	
	
	if Hyperspace.App.menu.shipBuilder.bOpen == true or Hyperspace.App.menu.bOpen == true then -- останавливаем выполнение всех тик-процессов
		if playerShip then
			Hyperspace.metaVariables['weaponslots_count'] = Hyperspace.Blueprints:GetShipBlueprint(playerShip.myBlueprint.blueprintName, 1).weaponSlots
		end
		if gui then
			gui.bPaused = false -- в меню и ангаре автоматически теряется пауза игрока. для ачивки важно
		end
		--varr.micro_tick_counter16 = 0
		--varr.micro_tick_counter17 = 0
	else
		
		
		if varr.make_enemy_same_as_player_at_first_free_tick == true then
			--if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				if gui and gui.event_pause == false and enemyShip and enemyShip._targetable.hostile == true then
					varr.make_enemy_same_as_player_at_first_free_tick = false
					make_enemy_same_as_player()
				end
			--end
		end
		
		
		--перед блоками контроля экипажа просто вводим эти переменные и всё...
		if enemyShip then
			for crew in vter(enemyShip.vCrewList) do
				if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
					varr.universal_iRoom_targ[crew.extend.selfId] = -1
					crew_add_skill_parser(crew)
					--print('init e'..crew.extend.selfId)
				end
			end
		end
		if playerShip then
			for crew in vter(playerShip.vCrewList) do
				if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
					varr.universal_iRoom_targ[crew.extend.selfId] = -1
					crew_add_skill_parser(crew)
					--print('init p'..crew.extend.selfId)
				end
			end
		end
		
		
		
		-- if playerShip and playerShip.artillerySystems ~= nil and playerShip.artillerySystems:size() == 0 then
			-- local bNeededAddArt = false
			-- for carg in vter (gui.equipScreen:GetCargoHold()) do
				-- if carg == "ARTILLERY_SYSTEM" then
					-- playerShip:RemoveItem("ARTILLERY_SYSTEM", true)
					-- bNeededAddArt = true
				-- end
			-- end
			-- for pf in vter(playerShip.weaponSystem.weapons) do
				-- if pf.blueprint.name == "ARTILLERY_SYSTEM" then
					-- playerShip:RemoveItem("ARTILLERY_SYSTEM", true)
					-- bNeededAddArt = true
				-- end
			-- end
			-- if bNeededAddArt == true then
				-- playerShip:AddSystem(11)
			-- end
		-- else
			-- if Hyperspace.Blueprints:GetWeaponBlueprint("ARTILLERY_SYSTEM").desc.rarity ~= 0 then
				-- Hyperspace.Blueprints:GetWeaponBlueprint("ARTILLERY_SYSTEM").desc.rarity = 0
				-- print('rar=0')
			-- end
		-- end
		
		
		
		
		
		
		
		varr.micro_tick_counter25 = varr.micro_tick_counter25 + 60.0*Hyperspace.FPS.SpeedFactor
		if (varr.micro_tick_counter25 >= 920.0) then
			varr.micro_tick_counter25 = 0.0
			if enemyShip then
				for crew in vter(enemyShip.vCrewList) do
					if crew:OutOfGame() == false and crew.health.first > 0.0 and crew.extend.deathTimer ~= nil then
						Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_temp_crew), crew)
						--Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_nowarn_crew), crew)
						--print(crew.blueprint.name..'==>')
					end
				end
			end
			if playerShip then
				for crew in vter(playerShip.vCrewList) do
					if crew:OutOfGame() == false and crew.health.first > 0.0 and crew.extend.deathTimer ~= nil then
						Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_temp_crew), crew)
						--Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_nowarn_crew), crew)
						--print(crew.blueprint.name..'==>p')
					end
				end
			end
		end
		
		-- абсолютный таймер. считает реальные секунды с начала полёта
		-- if Hyperspace.FPS.speedLevel == -2 then
			-- varr.micro_tick_counter16 = varr.micro_tick_counter16 + 61.0*Hyperspace.FPS.SpeedFactor*8.13
		-- elseif Hyperspace.FPS.speedLevel == 50 then
			-- varr.micro_tick_counter16 = varr.micro_tick_counter16 + 61.0*Hyperspace.FPS.SpeedFactor/20.2
		-- else
			-- varr.micro_tick_counter16 = varr.micro_tick_counter16 + 61.0*Hyperspace.FPS.SpeedFactor
		-- end
		-- if varr.micro_tick_counter16 > 1000.0 then
			-- varr.micro_tick_counter16 = varr.micro_tick_counter16 - 1000.0
			-- Hyperspace.playerVariables['timer_absolute'] = Hyperspace.playerVariables['timer_absolute'] + 1
		-- end
		--print('ta='..Hyperspace.playerVariables['timer_absolute'])
		
		
		enemyShip = Hyperspace.ships.enemy
		GSIe = Hyperspace.ShipGraph.GetShipInfo(1)
		GSIp = Hyperspace.ShipGraph.GetShipInfo(0)
		
		if gui and gui.bPaused == true then
			if Hyperspace.metaVariables['challenge_nopause'] == 1 then
				gui.bPaused = false
				Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
			else
				Hyperspace.playerVariables['used_tactical_pause'] = 1
			end
		end
		
		--блокирует включение карты когда взломан двигатель/рубка (активный взлом)
		--звук протестирован - норм.
		if map and map.bOpen == true then 
			if playerShip then
				if playerShip:HasSystem(6) and playerShip:IsSystemHacked(6) == 2 then
					--print('hacked pilot')
					map.bOpen = false
					Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
				elseif playerShip:HasSystem(1) and playerShip:IsSystemHacked(1) == 2 then
					--print('hacked engine')
					map.bOpen = false
					Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
				end
			end
		end
		
		--stat+
		if map then
			if map.bOpen == false and varr.map_bOpen_previous == true then
				varr.give_dohod_stat_me_memoryed_output = '' --закрытие карты чистит память
			end
			varr.map_bOpen_previous = map.bOpen
		end
		
		if playerShip and playerShip.bJumping == false and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			if Hyperspace.metaVariables['current_star_id'] == 999 then
				define_current_star_id()
			end
			
			
			
			
			-- local counter55 = 0
			-- for carg in vter (gui.equipScreen:GetCargoHold()) do
				-- counter55 = counter55 + 1
			-- end
			-- if counter55 < 12 then
				-- gui.equipScreen:AddToCargo("SILV_LASER_SUPER_HEAVY_2")
			-- end
			
			
			
			--включает/выключает блок управления приоритетами целей боевых дронов
			if playerShip:HasSystem(4) == true and hasAnyAugmentationOfList(playerShip, {"AIM_DRONES", "HID_AIM_DRONES"}) == true and Hyperspace.metaVariables['enemy_state'] == 2 then
				local bfoundgoodcd = false
				for cdr in vter(playerShip.spaceDrones) do
					if cdr and cdr.blueprint and cdr.blueprint.typeName == "COMBAT" and cdr.deployed == true then --and combatdrone.powered then
						bfoundgoodcd = true
					end
				end
				if bfoundgoodcd == true then
					Hyperspace.playerVariables['_aimable_enable_drones'] = 1
				else
					Hyperspace.playerVariables['_aimable_enable_drones'] = 0
				end
			else
				Hyperspace.playerVariables['_aimable_enable_drones'] = 0
			end
			
			--stat+
			varr.give_dohod_stat_me_memoryed_output = '' --просто игра не на паузе чистит память
			
			-- игровой таймер. считает секунды игрового времени с начала полёта
			-- varr.micro_tick_counter17 = varr.micro_tick_counter17 + 61.0*Hyperspace.FPS.SpeedFactor
			-- if varr.micro_tick_counter17 > 1000.0 then
				-- varr.micro_tick_counter17 = varr.micro_tick_counter17 - 1000.0
				-- Hyperspace.playerVariables['timer_ingame'] = Hyperspace.playerVariables['timer_ingame'] + 1
			-- end
			--print('ti='..Hyperspace.playerVariables['timer_ingame'])
			
			if Hyperspace.metaVariables['challenge_nohull'] == 1 then
				if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
					if playerShip.ship.hullIntegrity.first > 10 then
						playerShip.ship.hullIntegrity.first = 10
					end
				end
			end
			
			
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
					Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_BAD_BEGIN", false)
				elseif map.currentSector.level >= 6 then
					Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_BAD_END", false)
				end
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
							Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_NEW_SHIP", false)
						end
					end
				end
			end
		end
		
		
		-- блок реализует работу дронов снижающих скорость зарядки щитов и орудий/артиллерии
		-- эффект не стакается! достаточно одного дрона.
		if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			if enemyShip and playerShip and Hyperspace.metaVariables['enemy_state'] == 2 then
				-- local bPlayerHasAweap = false
				-- local bEnemyHasAweap = false
				local bPlayerHasAshield = false
				local bEnemyHasAshield = false
				for combatdrone in vter(playerShip.spaceDrones) do
					if combatdrone and combatdrone.blueprint then
						-- if bPlayerHasAweap == false and combatdrone.blueprint.name == "DE_DRONE_AWEAP" and combatdrone.deployed == true and combatdrone.powered == true then
							-- bPlayerHasAweap = true
							-- --print('do')
						-- end
						if bPlayerHasAshield == false and combatdrone.blueprint.name == "DE_DRONE_ASHIELD" and combatdrone.deployed == true and combatdrone.powered == true  then
							bPlayerHasAshield = true
						end
					end
				end
				for combatdrone in vter(enemyShip.spaceDrones) do
					if combatdrone and combatdrone.blueprint then
						-- if bEnemyHasAweap == false and combatdrone.blueprint.name == "DE_DRONE_AWEAP" and combatdrone.deployed == true and combatdrone.powered == true  then
							-- bEnemyHasAweap = true
						-- end
						if bEnemyHasAshield == false and combatdrone.blueprint.name == "DE_DRONE_ASHIELD" and combatdrone.deployed == true and combatdrone.powered == true  then
							bEnemyHasAshield = true
						end
					end
				end
				-- if bPlayerHasAweap == true then
					-- if enemyShip.weaponSystem ~= nil then
						-- for pf in vter(enemyShip.weaponSystem.weapons) do
							-- if pf.powered == true and pf.cooldown.first > 0.2 and pf.cooldown.first < pf.cooldown.second - 0.2 then
								-- pf.cooldown.first = pf.cooldown.first - 0.015 * Hyperspace.FPS.SpeedFactor
								-- --print('en work')
							-- end
						-- end
					-- end
					-- if enemyShip.artillerySystems ~= nil then
						-- local vSystemList = enemyShip.artillerySystems
						-- for i = 0, vSystemList:size() - 1 do
							-- local pf = vSystemList[i].projectileFactory
							-- if pf.powered == true and pf.cooldown.first > 0.2 and pf.cooldown.first < pf.cooldown.second - 0.2 then
								-- pf.cooldown.first = pf.cooldown.first - 0.015 * Hyperspace.FPS.SpeedFactor
								-- --print('en work art')
							-- end
						-- end
					-- end
				-- end
				-- if bEnemyHasAweap == true then
					-- if playerShip.weaponSystem ~= nil then
						-- for pf in vter(playerShip.weaponSystem.weapons) do
							-- if pf.powered == true and pf.cooldown.first > 0.2 and pf.cooldown.first < pf.cooldown.second - 0.2 then
								-- pf.cooldown.first = pf.cooldown.first - 0.015 * Hyperspace.FPS.SpeedFactor
							-- end
						-- end
					-- end
					-- if playerShip.artillerySystems ~= nil then
						-- local vSystemList = playerShip.artillerySystems
						-- for i = 0, vSystemList:size() - 1 do
							-- local pf = vSystemList[i].projectileFactory
							-- if pf.powered == true and pf.cooldown.first > 0.2 and pf.cooldown.first < pf.cooldown.second - 0.2 then
								-- pf.cooldown.first = pf.cooldown.first - 0.015 * Hyperspace.FPS.SpeedFactor
							-- end
						-- end
					-- end
				-- end
				if bPlayerHasAshield == true then
					if enemyShip.shieldSystem ~= nil and enemyShip.shieldSystem.shields then
						if enemyShip.shieldSystem.shields.charger > 0.1 then
							enemyShip.shieldSystem.shields.charger = enemyShip.shieldSystem.shields.charger - 0.033 * Hyperspace.FPS.SpeedFactor
						end
					end
				end
				if bEnemyHasAshield == true then
					if playerShip.shieldSystem ~= nil and playerShip.shieldSystem.shields then
						if playerShip.shieldSystem.shields.charger > 0.1 then
							playerShip.shieldSystem.shields.charger = playerShip.shieldSystem.shields.charger - 0.033 * Hyperspace.FPS.SpeedFactor
						end
					end
				end
			end
		end
		
		
		
		-- этот блок для исправления поведения врагов, которые теряли свой мозг и стояли на месте. я хз, баг у меня не подтверждается
		-- и проверить что это работает не смог в итоге...
		if playerShip ~= nil then
			for crew in vter(playerShip.vCrewList) do
				if crew:IsDrone() == false and crew.crewAnim.bPlayer==false then --crew.intruder == true then
					if crew.blueprint.name ~= "osa" and crew.blueprint.name ~= "osae" and crew.blueprint.name ~= "alien" and crew.blueprint.name ~= "gus" and crew.blueprint.name ~= "gusq" and crew.blueprint.name:find("magman") == nil then
						if crew.extend:GetDefinition().noAI == true then
							crew.extend:GetDefinition().noAI = false
							--print('restored ai board')
						end
					end
				end					
			end
		end
		if Hyperspace.metaVariables['enemy_has_advanced_ai'] == 0 then
			if enemyShip ~= nil then
				for crew in vter(enemyShip.vCrewList) do
					if crew:IsDrone() == false and crew.crewAnim.bPlayer==false then --and crew.intruder == false then
						if crew.blueprint.name ~= "osa" and crew.blueprint.name ~= "osae" and crew.blueprint.name ~= "alien" and crew.blueprint.name ~= "gus" and crew.blueprint.name ~= "gusq" then
							if crew.extend:GetDefinition().noAI == true then
								crew.extend:GetDefinition().noAI = false
								--print('en restored ai board')
							end
						end
					end
				end
			end
		end
		
		
		
		if enemyShip and GSIe then
			
			--испытание даёт 4 фазу боссу - флагман чёрного крыла через тп в неизвестное место
			if Hyperspace.metaVariables['challenge_nobf'] == 1 then
				if gui and gui.event_pause == false then
					if enemyShip.ship.hullIntegrity.first <= 6 then
						if enemyShip.myBlueprint.blueprintName == "BOSS_3_HARD_DLC" or enemyShip.myBlueprint.blueprintName == "BOSS_3_NORMAL_DLC" or enemyShip.myBlueprint.blueprintName == "BOSS_3_EASY_DLC" then
							--print('added bossy')
							Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "INSTANT_ESCAPE", false, -1)
							if enemyShip.ship.hullIntegrity.first < 1 then
								enemyShip.ship.hullIntegrity.first = 1
							end
						end
					end
				end
			end
			
			--починил предзажигатель у врагов. хехех.
			if enemyShip:HasAugmentation("WEAPON_PREIGNITE") > 0 then
				if enemyShip.weaponSystem ~= nil then
					for pf in vter2(enemyShip.weaponSystem.weapons) do
						if pf.bFiredOnce == false and pf.cooldown.second >= 1.0 and pf.cooldown.first == 0.0 then
							pf.cooldown.first = pf.cooldown.second - 0.05
							--print('enemy preign')
						end
					end
				end
			end
			
			
			-- в общем-то заглушка. из-за бага взломанный контроль разума игрока
			-- если противник-беспилотник - не работает
			-- не даём направить хак-дрон в МК в этих случаях
			if enemyShip.bAutomated == true then
				if enemyShip.hackingSystem ~= nil and playerShip.mindSystem ~= nil then
					if enemyShip.hackingSystem.queuedSystem == playerShip.mindSystem then
						enemyShip.hackingSystem.queuedSystem = nil
						--print('dont hack mind!!!!!!!!')
					end
				end
			end
			
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
			
			
			--исправление поведения, в режиме невидимости враг не имея скрытых орудий стрелял в игрока из маскировки. фуу.
			if enemyShip:HasSystem(10) then
				if enemyShip:HasAugmentation("CLOAK_FIRE") == 0 then
					if enemyShip.weaponSystem then
						if enemyShip.ship.bCloaked == true then
							for pf in vter2(enemyShip.weaponSystem.weapons) do
								pf.fireWhenReady = false
							end
						else
							for pf in vter2(enemyShip.weaponSystem.weapons) do
								pf.fireWhenReady = true
							end
						end
					end
				end
			end
			
			
			
			
			
			
			
			
			
			
			
			
			if Hyperspace.metaVariables['enemy_has_advanced_ai'] == 1 then
				if Hyperspace.metaVariables['challenge_noai'] == 0 then
					if Hyperspace.Global.GetInstance():GetCApp().gui.combatControl.boss_visual == true then
						--визуал босса, значит отключаем улучш.ии
						Hyperspace.metaVariables['enemy_has_advanced_ai'] = 0
						if enemyShip:HasSystem(10) then
							enemyShip:GetSystem(10):SetPowerCap(99)
						end
						if enemyShip.hackingSystem then
							enemyShip.hackingSystem:SetPowerCap(99)
						end
						--print('disabled boss adv ai')
					end
				end
			end
			
			
			if Hyperspace.metaVariables['enemy_has_advanced_ai'] == 1 then
				
				--этот блок позволяет экипажу разбегаться от летящих в них снарядов. существенно повышает их выживаемость.
				--фактически в режиме реального времени создаёт массив привязки номеров комнат корабля врага и их уровня опасности
				--в общем-то это аналог внутреннего механизма, но тот хреново контролируется, поэтому написал свой...
				--local bRunAwaying = false
				local count_of_current_danger_player_projectiles = 0
				local room_danger_arr = {[0]=0}
				for i = 0, 30 do --подразумеваю что не будет у врага больше 30 комнат...
					room_danger_arr[i] = 0
				end
				local projs = Hyperspace.App.world.space.projectiles
				for i = 0, projs:size() - 1 do
					local projectile = projs[i]
					local projName = tostring(projectile.extend.name)
					if not (projName == "" or projName == "nil" or projName == "PDS_SHOT") then
						if projectile.ownerId == 0 then
							--print(projectile.hitTarget)
							
							if projectile.missed == false and projectile.hitTarget == false then
								
								
								if ((projectile.damage.iDamage > 0) or (projectile.damage.iShieldPiercing > 0) or (projectile.damage.fireChance > 0.0) or(projectile.damage.breachChance > 0.0) or (projectile.damage.stunChance > 0.0) or (projectile.damage.iIonDamage > 0)or (projectile.damage.iSystemDamage > 0)or (projectile.damage.iPersDamage > 0)or (projectile.damage.bLockdown == true) or(projectile.damage.iStun > 0)) then
									if projectile.speed_magnitude > 10 or (projectile.speed_magnitude <= 10 and projectile.currentSpace == 1) then
										count_of_current_danger_player_projectiles = count_of_current_danger_player_projectiles + 1
										local trid = GetRoomAtLocation(enemyShip, projectile.target, true) 
										--print('trid='..trid)
										--print(projectile.damage.iShieldPiercing)
										--print(projectile.speed_magnitude)
										if room_danger_arr[trid] == nil then
											room_danger_arr[trid] = 1
										else
											if projectile.speed_magnitude == 0.0 then-- это тип снаряда "BOMB"
												room_danger_arr[trid] = 6
												--print('trid='..trid)
											elseif enemyShip.shieldSystem == nil or enemyShip.shieldSystem.shields == nil then
												room_danger_arr[trid] = room_danger_arr[trid] + 1
											elseif projectile.damage.iShieldPiercing > enemyShip.shieldSystem.shields.power.first then
												room_danger_arr[trid] = 6
												--print('pierc-1')
											else
												room_danger_arr[trid] = room_danger_arr[trid] + 1
											end
										end
										
										if projectile.damage.iShieldPiercing >= 5 then
											room_danger_arr[trid] = 6
										end
										if enemyShip:HasSystem(6) and enemyShip:GetSystemRoom(6) == trid and enemyShip:GetSystem(6):Functioning() == true then 
											room_danger_arr[trid] = 0 --pilot room
											--print('pilot ignores...')
										end
									end
								end
							end
						end
					end
				end
				--print(count_of_current_danger_player_projectiles)
				if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
					if count_of_current_danger_player_projectiles == 0 then
						varr.micro_tick_counter21 = varr.micro_tick_counter21 + 60.0*Hyperspace.FPS.SpeedFactor
					end
					--if (varr.micro_tick_counter21 >= 1700.0) then
					if varr.micro_tick_counter21 >= varr.micro_tick_counter21targ then
						varr.micro_tick_counter21 = 0.0
						varr.micro_tick_counter21targ = math.random(300, 2400)-- 1200-2100
					end
				end
				
				for crew in vter3(playerShip.vCrewList) do
					if crew:IsDrone() == false and crew.intruder == true then
						if crew.blueprint.name ~= "osa" and crew.blueprint.name ~= "osae" and crew.blueprint.name ~= "alien" then
							--абордажники на корабле игрока ведут себя по умолчанию.
							if crew.extend:GetDefinition().noAI == true then
								crew.extend:GetDefinition().noAI = false
								--print('restored ai board')
							end
						end
					end
				end
				if count_of_current_danger_player_projectiles == 0 then -- нет опасных снарядов игрока летящих во вражеский корабль
					if isEnemyHopelessBoarded() == true and isThereMinimalSenseToEvadeBattle() == true then
						--print('hopeless mode')
						for crew in vter3(enemyShip.vCrewList) do
							if crew:IsDrone() == false and crew.intruder == false then
								-- if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
									-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
								-- end
								
								if crew.health.first < math.floor(crew.health.second/4.0) and crew.bMindControlled == false then -- < 25% хп
									if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
										--print('doshel='..varr.universal_iRoom_targ[crew.extend.selfId])
										
										if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then
											--if crew:IsBusy()==false and crew.bFighting == false then
											-- if crew.bFighting == true then
												-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
												-- --print('doshel i vse')
											-- else
											if enemyShip:GetFireCount(crew.iRoomId) > 0 and crew:CanBurn() == true then
												varr.universal_iRoom_targ[crew.extend.selfId] = -1
											elseif GSIe:GetRoomOxygen(crew.iRoomId) < 10.0 and crew:CanSuffocate() == true then
												varr.universal_iRoom_targ[crew.extend.selfId] = -1
											elseif crew.bFighting == true then
												varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
												crew.extend:GetDefinition().noAI = true
												--print('run away'..crew.blueprint.crewNameLong.data)
												--print('make targ room='..varr.universal_iRoom_targ[crew.extend.selfId])
												if varr.universal_iRoom_targ[crew.extend.selfId] == crew.iRoomId then
													varr.universal_iRoom_targ[crew.extend.selfId] = -1
												end
												for crew2 in vter4(enemyShip.vCrewList) do
													if crew2.intruder == true and crew2.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then
														varr.universal_iRoom_targ[crew.extend.selfId] = -1
														--print('enemy in rand room1')
													end
												end
											elseif varr.micro_tick_counter21 == 0.0 then
												--print(crew.blueprint.name..',mtc21 = 0.0')
												if enemyShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]) == nil then
													if crew:IsBusy()==false then
														varr.universal_iRoom_targ[crew.extend.selfId] = -1
														--print(crew.blueprint.name..'nothing to do')
													end
													--print('nosys')
												elseif enemyShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]).healthState.first == enemyShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]).healthState.second then
													if isSystemHasCompucter(enemyShip:GetSystemInRoom(crew.iRoomId):GetId()) == false or crew.bActiveManning == false then
														varr.universal_iRoom_targ[crew.extend.selfId] = -1
														--print('nocomp')
													else
														--если в текущей системе есть компьютер и система не повреждена проверяем соседние отсеки - может есть система чтобы починить в безопасных условиях
														for roomsssy in vter4(enemyShip.ship.vRoomList) do
															if roomsssy.iRoomId ~= crew.iRoomId and GSIe:IsRoomConnected(roomsssy.iRoomId, crew.iRoomId) == true then
																if enemyShip:GetSystemInRoom(roomsssy.iRoomId) ~= nil then
																	if enemyShip:GetSystemInRoom(roomsssy.iRoomId).healthState.first ~= enemyShip:GetSystemInRoom(roomsssy.iRoomId).healthState.second then
																		if enemyShip:GetSystemInRoom(roomsssy.iRoomId).bOccupied == false then
																			if enemyShip:GetSystemInRoom(roomsssy.iRoomId).bOnFire == false or crew:CanBurn() == false then
																				if GSIe:GetRoomOxygen(roomsssy.iRoomId) > 20.0 or crew:CanSuffocate() == false then
																					varr.universal_iRoom_targ[crew.extend.selfId] = roomsssy.iRoomId
																					--print('go repair sosednyaya safe room! = '..roomsssy.iRoomId)
																				end
																			end
																		end
																	end
																end
															end
														end
														
													end
												end
											end
										else
											crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
											crew.extend:GetDefinition().noAI = true
										end
									else
										--print('notarg')
										-- targ = -1
										if crew.bFighting == false then
											--не дерётся в данный момент, но ситуация безнадёжная (условно)
											
											crew.extend:GetDefinition().noAI = true
											
											if enemyShip:GetFireCount(crew.iRoomId) > 0 and crew:CanBurn() == true then
												varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
											elseif GSIe:GetRoomOxygen(crew.iRoomId) < 10.0 and crew:CanSuffocate() == true then
												varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
											elseif enemyShip:GetSystemInRoom(crew.iRoomId) ~= nil then
												if enemyShip:GetSystemInRoom(crew.iRoomId).healthState.first == enemyShip:GetSystemInRoom(crew.iRoomId).healthState.second then
													if varr.micro_tick_counter21 == 0.0 then
														if isSystemHasCompucter(enemyShip:GetSystemInRoom(crew.iRoomId).iSystemType) == false or crew.bActiveManning == false then
															varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
															ifHasSenseToResendEnemyCrewToGoodPlace(crew)
														end
													end
												else
													--текущая система повреждена. чиним.
												end
											else
												--если в комнате нет системы
												if enemyShip:GetFireCount(crew.iRoomId) > 0 and crew:CanBurn() == true then
													varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
												elseif GSIe:GetRoomOxygen(crew.iRoomId) < 10.0 and crew:CanSuffocate() == true then
													varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
												elseif crew:IsBusy()==false then
													if varr.micro_tick_counter21 == 0.0 then
														varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
														--print('test')
														ifHasSenseToResendEnemyCrewToGoodPlace(crew)
													end
												end
											end
											
											for crew2 in vter4(enemyShip.vCrewList) do
												if crew2.intruder == true and crew2.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then
													varr.universal_iRoom_targ[crew.extend.selfId] = -1
													--print('enemy in targ room2')
												end
											end
											
											--фильтры на целеуказание нового отсека
											if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
												if enemyShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 and crew:CanBurn() == true then
													varr.universal_iRoom_targ[crew.extend.selfId] = -1
													--print ('fire')
												elseif GSIe:GetRoomOxygen(varr.universal_iRoom_targ[crew.extend.selfId]) < 10.0 and crew:CanSuffocate() == true then
													varr.universal_iRoom_targ[crew.extend.selfId] = -1
													--print ('oxy')
												elseif enemyShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]) == nil then
													varr.universal_iRoom_targ[crew.extend.selfId] = -1
													--print ('no sys')
												end
											end
											
											-- if enemyShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 and crew:CanBurn() == true then
												-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
											-- elseif GSIe:GetRoomOxygen(varr.universal_iRoom_targ[crew.extend.selfId]) < 10.0 and crew:CanSuffocate() == true then
												-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
											-- end
											--print ('sit'..crew.blueprint.crewNameLong.data)
										else
											-- дерётся с врагом
											-- анализ, может стоит подраться, а не бежать?
											local room_player_hp = 0
											local room_enemy_hp = 0
											for crew2 in vter5(enemyShip.vCrewList) do
												if crew2.iRoomId == crew.iRoomId then
													local DPS, _ = crew2.extend:CalculateStat(Hyperspace.CrewStat.DAMAGE_MULTIPLIER)
													if crew2:CanFight() == false or crew2.fStunTime > 0.5 then
														DPS = 0.0
													end
													if crew2.intruder == false then
														room_enemy_hp = room_enemy_hp + crew2.health.first*DPS
													else
														room_player_hp = room_player_hp + crew2.health.first*DPS
													end
												end
											end
											if room_player_hp > room_enemy_hp + 10.0 then
												varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
												if varr.universal_iRoom_targ[crew.extend.selfId] == crew.iRoomId then
													varr.universal_iRoom_targ[crew.extend.selfId] = -1
												end
												--print('fighting. try to goaway')
												if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
													for crew2 in vter4(enemyShip.vCrewList) do
														if crew2.intruder == true and crew2.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then
															varr.universal_iRoom_targ[crew.extend.selfId] = -1
															--print('enemy in rand room3')
														end
													end
												end
											else
												--print('fighting!!!')
												varr.universal_iRoom_targ[crew.extend.selfId] = -1
												crew.extend:GetDefinition().noAI = true
											end
											
											
										end
									end
								else
									--для здоровых в этом режиме отпускаем возжи
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
									crew.extend:GetDefinition().noAI = false
								end
							end
						end
					else
						--print('free mode')
						if varr.micro_tick_counter21 == 0.0 then
							for crew in vter3(enemyShip.vCrewList) do
								if crew:IsDrone() == false and crew.intruder == false and crew.bMindControlled == false then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
									crew.extend:GetDefinition().noAI = false
									-- отпускаем возжи, отдаём персонал дефолтному управлению
								end
							end
						end
					end
				else
					--есть опасные снаряды летящие во врага!
					--print('projectile mode')
					local shield_value = 0
					if enemyShip.shieldSystem == nil or enemyShip.shieldSystem.shields == nil then
						shield_value = 0
					else
						shield_value = enemyShip.shieldSystem.shields.power.first
					end
					
					--бегство от снарядов
					for crew in vter3(enemyShip.vCrewList) do
						if crew:IsDrone() == false and crew.intruder == false and crew.bMindControlled == false and crew.blueprint.name ~= "turtle" then
							if enemyShip:GetSystemInRoom(crew.iRoomId) ~= nil and enemyShip:GetDodgeFactor() > 0.0 and enemyShip:GetSystemInRoom(crew.iRoomId):GetId()==6 and enemyShip:GetSystemInRoom(crew.iRoomId):Functioning()==true and crew.bActiveManning == true then
								--не уходим с рубки пилота если есть возможность уклонения
								crew.extend:GetDefinition().noAI = true
								varr.universal_iRoom_targ[crew.extend.selfId] = crew.iRoomId
							elseif enemyShip:GetSystemInRoom(crew.iRoomId) ~= nil and crew.health.first > 50 and enemyShip:GetDodgeFactor() > 20.0 and enemyShip:GetSystemInRoom(crew.iRoomId):GetId()==1 and enemyShip:GetSystemInRoom(crew.iRoomId):Functioning()==true and crew.bActiveManning == true then
								--не уходим с двигателя если есть значимая возможность уклонения
								crew.extend:GetDefinition().noAI = true
								varr.universal_iRoom_targ[crew.extend.selfId] = crew.iRoomId
							else
								
								-- if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
									-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
								-- end
								if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
									if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then
										if enemyShip:GetFireCount(crew.iRoomId) > 0 and crew:CanBurn() == true then
											varr.universal_iRoom_targ[crew.extend.selfId] = -1
											--print('reason2'..crew.blueprint.crewNameLong.data)
										elseif GSIe:GetRoomOxygen(crew.iRoomId) < 10.0 and crew:CanSuffocate() == true then
											varr.universal_iRoom_targ[crew.extend.selfId] = -1
											--print('reason1'..crew.blueprint.crewNameLong.data)
										elseif room_danger_arr[crew.iRoomId] > shield_value and varr.micro_tick_counter21 == 0.0 then --and count_of_current_danger_player_projectiles > 0 then
											varr.universal_iRoom_targ[crew.extend.selfId] = -1
											--print('dang'..crew.blueprint.crewNameLong.data)
										elseif crew.bFighting == false and varr.micro_tick_counter21 == 0.0 then
											varr.universal_iRoom_targ[crew.extend.selfId] = -1
											--print('doshel i vse'..crew.blueprint.crewNameLong.data)
										end
									else
										--print('test2')
										crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
									end
								else
									--print('targ = -1'..crew.blueprint.crewNameLong.data)
									if room_danger_arr[crew.iRoomId] > shield_value then
										if crew:GetMoveSpeedMultiplier() > 0.55 then --нет смысла бежать из отсека если у тебя скорость ниже рока
											-- рок=0,6, человек=1,0, мантис=1,2
											varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
											if varr.universal_iRoom_targ[crew.extend.selfId] == crew.iRoomId then
												varr.universal_iRoom_targ[crew.extend.selfId] = -1
											end
											if room_danger_arr[varr.universal_iRoom_targ[crew.extend.selfId]] ~= nil and room_danger_arr[crew.iRoomId] ~= nil then
												if room_danger_arr[varr.universal_iRoom_targ[crew.extend.selfId]] >= room_danger_arr[crew.iRoomId] then
													varr.universal_iRoom_targ[crew.extend.selfId] = -1
													--print('тоже опасная комната же, че бежать туда?')
												end
											end
											if enemyShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 and crew:CanBurn() == true then
												varr.universal_iRoom_targ[crew.extend.selfId] = -1
												--print('нет смысла туда бежать, там огонь')
											end
											if GSIe:GetRoomOxygen(varr.universal_iRoom_targ[crew.extend.selfId]) < 10.0 and crew:CanSuffocate() == true then
												varr.universal_iRoom_targ[crew.extend.selfId] = -1
												--print('там нет кислорода')
											end 
										end
									end
								end

								
								if varr.universal_iRoom_targ[crew.extend.selfId] == -1 then
									crew.extend:GetDefinition().noAI = false
								else
									crew.extend:GetDefinition().noAI = true
								end
							end
							
							
							
						end
					end
				end
								
				
				--ИИ обучен защитному контролю разума. если МС некоторое время не может найти цель и готов к работе,
				--то будет искать цель на своём корабле и корабле игрока - снимать МС со СВОЕГО ЭКИПАЖА.
				if enemyShip.mindSystem and playerShip.mindSystem then
					if enemyShip.mindSystem:Functioning() == true and enemyShip.mindSystem:GetLocked() == false then
						local bFoundTargetToMind = false
						for crrrrr in vter(enemyShip.mindSystem.queuedCrew) do
							--print('mc='..crrrrr.blueprint.name)
							bFoundTargetToMind = true
						end
						if bFoundTargetToMind == true then
							varr.mindcontrol_waiter = 0.0
						else
							varr.mindcontrol_waiter = varr.mindcontrol_waiter + 60.0*Hyperspace.FPS.SpeedFactor
						end
						if varr.mindcontrol_waiter > 1000.0 then
							--print ('1.0sec cant find targ to MC. try defense MC!')
							for crew in vter(enemyShip.vCrewList) do
								if crew:IsDrone()==false and crew.health.first > 0.0 and crew.crewAnim.bPlayer==false and not crew.extend.deathTimer and crew.bMindControlled == true then
									--enemyShip.mindSystem.queuedCrew:push_back(crew)
									--crew.bMindControlled = false
									--Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_mindresist), crew)
									playerShip.mindSystem.controlTimer.first = playerShip.mindSystem.controlTimer.second - 0.01
									enemyShip.mindSystem:LockSystem(4)
									varr.mindcontrol_waiter = 0.0
									--crew:ForceMindControl(true)
									--print(crew.blueprint.name..'=deMC')
								end
							end
						end
						if varr.mindcontrol_waiter > 1000.0 then
							for crew in vter(playerShip.vCrewList) do
								if crew:IsDrone()==false and crew.health.first > 0.0 and crew.crewAnim.bPlayer==false and not crew.extend.deathTimer and crew.bMindControlled == true then
									playerShip.mindSystem.controlTimer.first = playerShip.mindSystem.controlTimer.second - 0.01
									enemyShip.mindSystem:LockSystem(4)
									varr.mindcontrol_waiter = 0.0
								end
							end
						end
					end
				end
					
				-- блок даёт/не даёт врагам использовать маскировку после некоторого анализа ситуации
				if enemyShip.myBlueprint.blueprintName:find('MOTILEK') == nil then
					if enemyShip:HasSystem(10) then
						local needed_cloak_blocking = true -- по дефолту блокируем маскировку
						
						-- не блокируем маскировку если корабль не враждебен
						if enemyShip._targetable.hostile == false then
							needed_cloak_blocking = false
						end
						
						-- если уже ушёл в маскировку не блокируем процесс
						if enemyShip.ship.bCloaked == true then
							needed_cloak_blocking = false
						end

						-- вкл. маскировки по кд если у игрока только бомбы и лучи и есть запитанные орудия вообще
						local beam_shield_pierce_max_calculated = 0--столько щитов могут пробить лучи (хоть один из них)
						local has_at_least_one_beam_prepared = false
						if needed_cloak_blocking == true then
							if playerShip.weaponSystem ~= nil then
								local only_beams_or_bombs = true
								local count_of_powered_weapons = 0
								for pf in vter2(playerShip.weaponSystem.weapons) do
									if pf.powered == true then
										count_of_powered_weapons = count_of_powered_weapons + 1
										if pf.blueprint.typeName ~= "BEAM" and pf.blueprint.typeName ~= "BOMB" then
											only_beams_or_bombs = false
										end
										if pf.blueprint.typeName == "BEAM" then
											if math.abs(pf.cooldown.second - pf.cooldown.first) < 0.08 then
												has_at_least_one_beam_prepared = true
												--print('beam ready!')
												local mymaxsp = pf.blueprint.damage.iDamage + pf.blueprint.damage.iShieldPiercing - 1
												--print(pf.blueprint.name..','..mymaxsp..','..pf.blueprint.damage.iDamage)
												if beam_shield_pierce_max_calculated < mymaxsp then
													beam_shield_pierce_max_calculated = mymaxsp
												end
												
											end
										end
									end
								end
								if only_beams_or_bombs == true and count_of_powered_weapons > 0 then
									needed_cloak_blocking = false
								else
									if has_at_least_one_beam_prepared == true then
										if enemyShip.shieldSystem == nil or enemyShip.shieldSystem.shields == nil or enemyShip.shieldSystem.shields.power.first == 0 then
											needed_cloak_blocking = false
										elseif enemyShip.shieldSystem.shields.power.first <= beam_shield_pierce_max_calculated then
											needed_cloak_blocking = false
											--print('sp beams!')
										end
									end
								end
							end
						end
						--print('max sp beam'..beam_shield_pierce_max_calculated)
						
						--включение маскировки на приближение внешнего дрона к точке выстрела
						if needed_cloak_blocking == true then
							if playerShip.droneSystem ~= nil then
								for drone in vter(playerShip.spaceDrones) do
									if drone.powered == true and drone.blueprint.typeName == "COMBAT" then
										if drone.powerRequired >= 2 then
											if math.abs(drone.currentLocation.x - drone.destinationLocation.x) < 45.0 then
												if math.abs(drone.currentLocation.y - drone.destinationLocation.y) < 45.0 then
													needed_cloak_blocking = false
													--print('drone panic')
													--print(drone.currentLocation.x..','..drone.destinationLocation.x)
												end
											end
										end
									end
								end
							end
						end
						
						--тут мы проверяем наличие быстрых снарядов где угодно и медленных - на экране врага.
						--если делать не так, то маскировка может быть преждевременной для медленных миномётных снарядов.
						if needed_cloak_blocking == true then
							local count_of_players_projectiles = 0
							local projectiles = Hyperspace.App.world.space.projectiles
							for i = 0, projectiles:size() - 1 do
								local projectile = projectiles[i]
								local projName = tostring(projectile.extend.name)
								if not (projName == "" or projName == "nil" or projName == "PDS_SHOT") then
									if projectile.ownerId == 0 then
										if projectile.missed == false and projectile.hitTarget == false then
											if ((projectile.damage.iDamage > 0) or (projectile.damage.iShieldPiercing > 0) or (projectile.damage.fireChance > 0.0) or(projectile.damage.breachChance > 0.0) or (projectile.damage.stunChance > 0.0) or (projectile.damage.iIonDamage > 0)or (projectile.damage.iSystemDamage > 0)or (projectile.damage.iPersDamage > 0)or (projectile.damage.bLockdown == true) or(projectile.damage.iStun > 0)) then
												if projectile.speed_magnitude > 20 or (projectile.speed_magnitude <= 20 and projectile.currentSpace == 1) then
													count_of_players_projectiles = count_of_players_projectiles + 1
													-- если что ракеты имеют projectile.damage.iShieldPiercing == 5
													if enemyShip.shieldSystem == nil then
														needed_cloak_blocking = false
													elseif projectile.damage.iShieldPiercing >= enemyShip.shieldSystem.shields.power.first then
														needed_cloak_blocking = false
													end
												end
											end
										end
									end
								end
							end
							--если нет щитов то любой снаряд (опасный) вызывает маскировку
							if enemyShip.shieldSystem == nil or enemyShip.shieldSystem.shields.power.first == 0 then
								--print('1')
								if count_of_players_projectiles > 0 or has_at_least_one_beam_prepared == true then
									needed_cloak_blocking = false
								end
							elseif count_of_players_projectiles > enemyShip.shieldSystem.shields.power.first then
								--print('2')
								needed_cloak_blocking = false
							elseif has_at_least_one_beam_prepared == true then
								if count_of_players_projectiles + beam_shield_pierce_max_calculated >= enemyShip.shieldSystem.shields.power.first then
									needed_cloak_blocking = false
									--print('nash slu4ai'..count_of_players_projectiles..','..beam_shield_pierce_max_calculated)
								end
							end
						end
						
						--если хак-дрон игрока летит в отсек невидимости - уход по возможности в невидимость СРАЗУ
						if needed_cloak_blocking == true then
							if playerShip.hackingSystem and playerShip.hackingSystem.currentSystem ~= nil then
								if playerShip.hackingSystem.currentSystem == enemyShip.cloakSystem and enemyShip:IsSystemHacked(10) == 0 then
									if varr.micro_tick_counter22 > 1000.0 then
										needed_cloak_blocking = false
										--print('that situation when hack fly to cloak')
									end
								end
							end
						end
						
						if needed_cloak_blocking == true then
							enemyShip:GetSystem(10):SetPowerCap(0)
						else
							enemyShip:GetSystem(10):SetPowerCap(99)
						end
					end
				end
				
				-- воровство подконтрольных разумом экипажей игрока. крадёт, ворует
				if enemyShip.teleportSystem and varr.micro_tick_counter22 > 1600.0 then
					--if enemyShip.mindSystem or (playerShip.mindSystem and enemyShip.hackingSystem and enemyShip.hackingSystem.currentSystem == playerShip.mindSystem) then
						
						--тут были условия типа хитрого использования воровства, убрано... воруем как можно чаще теперь
						--if playerShip.teleportSystem == nil or (enemyShip:GetOxygenPercentage() < 10 and hasAnyAugmentationOfList(playerShip, {"O2_MASKS", "HID_O2_MASKS", "O2_MASKS_CREW_STIMS"})==false) then
							if enemyShip.teleportSystem:GetLocked() == false then
								local iFoundMindControlledTargRoom = -1
								for crew in vter(playerShip.vCrewList) do
									if crew:IsDrone()==false and crew.health.first > 0.0 and crew.crewAnim.bPlayer==true and not crew.extend.deathTimer and crew.bMindControlled == true then
										if playerShip.teleportSystem == nil or crew:CanSuffocate() == true then
											iFoundMindControlledTargRoom = crew.iRoomId
										end
									end
								end
								--LANIUS_X_1, BOSS_BLACK_WING - стабильно делают это с лампой
								if iFoundMindControlledTargRoom ~= -1 then
									
									for crew in vter(playerShip.vCrewList) do
										if crew:IsDrone()==false and crew.health.first > 0.0 and ((crew.crewAnim.bPlayer==false and crew.bMindControlled==false) or (crew.crewAnim.bPlayer==true and crew.bMindControlled==true)) then
											crew.extend:InitiateTeleport(1, enemyShip.teleportSystem:GetRoomId(), -1)
										end
									end
									
									if enemyShip.teleportSystem.powerState.first == 1 then
										enemyShip.teleportSystem:LockSystem(4)
									elseif enemyShip.teleportSystem.powerState.first == 2 then
										enemyShip.teleportSystem:LockSystem(3)
									elseif enemyShip.teleportSystem.powerState.first == 3 then
										enemyShip.teleportSystem:LockSystem(2)
									else
										enemyShip.teleportSystem:LockSystem(2)
									end
									
									--print('adv ai steal crew')
								end
							end
						--end
					--end
				end
				
				-- блок дающий противникам возможность вести более разумное использование хак-дрона
				if enemyShip.hackingSystem then
					-- если есть части дронов, взорвёт и перезапустит хак-дрона в другой отсек если хакнутая система доломана до нуля.
					if enemyShip:GetDroneCount() >= 2 then
						local bNeedDestroySelfHackDrone = false
						
						
						
						
						
						
						if enemyShip.hackingSystem.queuedSystem ~= nil then
							if enemyShip.hackingSystem.queuedSystem:CompletelyDestroyed()==true then
								--print('changed targ'..tostring(enemyShip.hackingSystem.queuedSystem))
								--print(tostring(enemyShip.hackingSystem.queuedSystem:GetName()))
								enemyShip.hackingSystem.queuedSystem = nil -- это для того чтоб не запускал дронов в уже сломанные системы. не идиот же...
							end
							
							-- проверка имеет ли смысл вообще взламывать щиты игрока
							if enemyShip.hackingSystem.queuedSystem == playerShip.shieldSystem then
								local bThereIsSenseToHackPlayerShields = false
								if bThereIsSenseToHackPlayerShields == false then
									if isReallyDangerousEnvironment() == true then --имеются внешние угрозы, есть смысл
										if Hyperspace.playerVariables['danger_cold'] == 0 and Hyperspace.playerVariables['danger_nanites'] == 0 then--кроме этих, они игнорируют щиты
											bThereIsSenseToHackPlayerShields = true
										end
									end
								end
								if bThereIsSenseToHackPlayerShields == false then
									if enemyShip.weaponSystem then
										for pf in vter2(enemyShip.weaponSystem.weapons) do
											if bThereIsSenseToHackPlayerShields == false then
												if pf.blueprint.typeName == "MISSILES" or pf.blueprint.typeName == "BOMB" then
													--no sense
												elseif pf.blueprint.typeName == "LASER" then
													if pf.blueprint.damage.iShieldPiercing < math.floor(enemyShip.shieldSystem.healthState.second/2) then
														bThereIsSenseToHackPlayerShields = true
														--print('sense='..pf.blueprint.name)
													end
												else
													if pf.blueprint.damage.iDamage + pf.blueprint.damage.iShieldPiercing <= math.floor(enemyShip.shieldSystem.healthState.second/2) then
														bThereIsSenseToHackPlayerShields = true
														--print('sense='..pf.blueprint.name)
													end
												end
											end
										end
									end
								end
								if bThereIsSenseToHackPlayerShields == false then
									if enemyShip.artillerySystems ~= nil then
										local vSystemList = enemyShip.artillerySystems
										for i = 0, vSystemList:size() - 1 do
											local pf = vSystemList[i].projectileFactory
											if bThereIsSenseToHackPlayerShields == false then
												if pf.blueprint.typeName == "MISSILES" or pf.blueprint.typeName == "BOMB" then
													--no sense
												elseif pf.blueprint.typeName == "LASER" then
													if pf.blueprint.damage.iShieldPiercing < math.floor(enemyShip.shieldSystem.healthState.second/2) then
														bThereIsSenseToHackPlayerShields = true
														--print('sense='..pf.blueprint.name)
													end
												else
													if pf.blueprint.damage.iDamage + pf.blueprint.damage.iShieldPiercing <= math.floor(enemyShip.shieldSystem.healthState.second/2) then
														bThereIsSenseToHackPlayerShields = true
														--print('sense='..pf.blueprint.name)
													end
												end
											end
										end
									end
								end
								if bThereIsSenseToHackPlayerShields == false then
									if enemyShip.droneSystem ~= nil then
										local drones = enemyShip.droneSystem.drones
										for i = 0, drones:size() - 1 do
											if bThereIsSenseToHackPlayerShields == false then
												if drones[i].blueprint.typeName == "COMBAT" then
													bThereIsSenseToHackPlayerShields = true
													--print('sense='..drones[i].blueprint.name)
												end
											end
										end
									end
								end
								if bThereIsSenseToHackPlayerShields == false then
									enemyShip.hackingSystem.queuedSystem = nil
									--print('no sense to hack player shields')
								end
							end
						end
						
						if enemyShip.hackingSystem.drone.bDead == false and enemyShip.hackingSystem.drone.arrived == true and enemyShip.hackingSystem.currentSystem ~= nil then
							if enemyShip.hackingSystem.currentSystem:CompletelyDestroyed()==true then
								bNeedDestroySelfHackDrone = true
							end
						end
						
						if bNeedDestroySelfHackDrone == true then
							enemyShip.hackingSystem:BlowHackingDrone()
							if varr.allowed_hack_explosion_on_cooldown == true then
								enemyShip.hackingSystem.iLockCount = 1
								enemyShip.hackingSystem.lockTimer.running = true
								enemyShip.hackingSystem.lockTimer.currTime = enemyShip.hackingSystem.lockTimer.currGoal-1.0
							end
						end
						
					end
					
					if enemyShip.hackingSystem.currentSystem == nil then
						enemyShip.hackingSystem:SetPowerCap(99)
					else
						local id_of_hacked_sys = enemyShip.hackingSystem.currentSystem:GetId()
						
						
						
						if id_of_hacked_sys == 8 then
							-- улучшенный ИИ при хаке в двери будет открывать их все.
							-- при условии что вообще есть внешние шлюзы
							if playerShip:HasSystem(8) and isThereAnyCrewNoDroneCanSuffocate(playerShip)==true then
								
								if playerShip:IsSystemHacked(8) == 2 then --статус именно активного взлома отсека
									local count_of_airlocks = 0
									varr.bNeededOpenItteration = true
									for doory in vter2(playerShip.ship.vOuterAirlocks) do
										doory:ApplyDamage(0.5)
										count_of_airlocks = count_of_airlocks + 1
									end
									if count_of_airlocks > 0 then
										for doory in vter2(playerShip.ship.vDoorList) do
											doory:ApplyDamage(0.5) --по факту это поломка, но визуально ровно то же самое что и открытие выходит ^_^
										end
									end
								elseif playerShip:IsSystemHacked(8) == 1 then --статус взлома неактивного. просто хак висит на отсеке.
									if varr.bNeededOpenItteration == true then
										varr.bNeededOpenItteration = false
										for doory in vter2(playerShip.ship.vOuterAirlocks) do
											doory.bOpen = true
										end
										for doory in vter2(playerShip.ship.vDoorList) do
											doory.bOpen = true
										end
										--print('final open airlocks and innerdoors')
									end
								else
									varr.bNeededOpenItteration = false
								end
							end
						elseif id_of_hacked_sys == 10 then
							-- включает взлом, когда игрок использует маскировку
							-- когда игрок не в маскировке, отключает хак систему
							-- как следствие двери маскировки игрока не блокируются. побочка, - считаю приемлимой.
							if playerShip:HasSystem(10) then--зацеп хак-дрона на систему невидимости игрока
								if playerShip.ship.bCloaked == true then
									enemyShip.hackingSystem:SetPowerCap(99)
								elseif playerShip:IsSystemHacked(10) ~= 2 and enemyShip.hackingSystem.drone.arrived == true then
									enemyShip.hackingSystem:SetPowerCap(0)
									--print('deion')
									if varr.bNeededIonCheck == true then
										enemyShip.hackingSystem:LockSystem(0)
										varr.bNeededIonCheck = false
									end
								else
									enemyShip.hackingSystem:SetPowerCap(99)
								end
							end
						elseif id_of_hacked_sys == 9 then
							--возврат абордажников игрока
							if playerShip:HasSystem(9) then--зацеп хак-дрона на систему телепорта игрока
								if isThereAnyBoardersNoDrone(enemyShip) == true then
									enemyShip.hackingSystem:SetPowerCap(99)
								elseif playerShip:IsSystemHacked(9) ~= 2 and enemyShip.hackingSystem.drone.arrived == true then
									enemyShip.hackingSystem:SetPowerCap(0)
									--print('deion')
									if varr.bNeededIonCheck == true then
										enemyShip.hackingSystem:LockSystem(0)
										varr.bNeededIonCheck = false
									end
									--тут есть ньюанс, если враг имеет золт.щит, а у нас байпасс - возврат не идёт.
									--будем считать что взлом байпаса не делается же поэтому и не работает.
								else
									enemyShip.hackingSystem:SetPowerCap(99)
								end
							end
						elseif id_of_hacked_sys == 5 then
							--фактически устраивает ловушку в мед.отсеке, поджидая когда жертва зайдёт
							--по тестам даже мантис на феромонах не пробегает
							if playerShip:HasSystem(5) and GSIp then--зацеп хак-дрона на медотсек игрока
								local found_meat_inside = false
								for crew in vter2(playerShip.vCrewList) do
									if crew:IsDrone()==false and crew.intruder == false then
										if crew.iRoomId == playerShip:GetSystemRoom(5) then
											--учёт нестандартных комнат типа 3х2 из генератора кораблей сделан...
											local catch_square_w = (GSIp:GetRoomShape(crew.iRoomId).w/2.0) - 12.0--12 это фактически отступ от стен отсека
											local catch_square_h = (GSIp:GetRoomShape(crew.iRoomId).h/2.0) - 12.0
											--print(playerShip:GetRoomCenter(crew.iRoomId).x..','..playerShip:GetRoomCenter(crew.iRoomId).y..'crew='..crew.x..','..crew.y)
											--if math.abs(playerShip:GetRoomCenter(crew.iRoomId).x - crew.x) <= 20 and math.abs(playerShip:GetRoomCenter(crew.iRoomId).y - crew.y) <= 20 then
											if math.abs(playerShip:GetRoomCenter(crew.iRoomId).x - crew.x) <= catch_square_w and math.abs(playerShip:GetRoomCenter(crew.iRoomId).y - crew.y) <= catch_square_h then
												--квадрат ловушки от центра комнаты
												found_meat_inside = true
												--if crew.extend:CalculateStat(Hyperspace.CrewStat.CAN_PHASE_THROUGH_DOORS) > 0.0
												--print('do!')
												
											end
											--print(GSIp:GetRoomShape(crew.iRoomId).w..','..GSIp:GetRoomShape(crew.iRoomId).h..'==>'..catch_square_w..','..catch_square_h)
											--70х35, 70х70,  
										end
									end
								end
								if found_meat_inside == true then
									if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
										varr.found_meat_inside_delayer = varr.found_meat_inside_delayer + 60.0*Hyperspace.FPS.SpeedFactor
									end
									if varr.found_meat_inside_delayer > 5.0 then --опытно полученная оптимальная (?) задержка -- was 280
										enemyShip.hackingSystem:SetPowerCap(99)
									end
								elseif playerShip:IsSystemHacked(5) ~= 2 and enemyShip.hackingSystem.drone.arrived == true then
									enemyShip.hackingSystem:SetPowerCap(0)
									varr.found_meat_inside_delayer = 0.0
									if varr.bNeededIonCheck == true then
										--print('deion')
										if varr.bNeededIonCheck == true then
											enemyShip.hackingSystem:LockSystem(0)
											varr.bNeededIonCheck = false
										end
									end
								else
									enemyShip.hackingSystem:SetPowerCap(99)
									varr.found_meat_inside_delayer = 0.0
								end
							end
						elseif id_of_hacked_sys == 13 then
							if playerShip:HasSystem(13) then--зацеп хак-дрона на клон-отсек игрока
								-- также проведена проверка работы с BACKUP_DNA, это усиление не позволяет убить членов экипажа и хаком тоже.
								-- логика работы хака против игрока с этим усилением в итоге не отличается от обычной.
								if playerShip.cloneSystem.fTimeToClone > 0.05 then
									enemyShip.hackingSystem:SetPowerCap(99)
								elseif playerShip:IsSystemHacked(13) ~= 2 and enemyShip.hackingSystem.drone.arrived == true then
									enemyShip.hackingSystem:SetPowerCap(0)
									--print('deion')
									if varr.bNeededIonCheck == true then
										enemyShip.hackingSystem:LockSystem(0)
										varr.bNeededIonCheck = false
									end
								else
									enemyShip.hackingSystem:SetPowerCap(99)
								end
							end
						end
						
						if enemyShip and enemyShip.hackingSystem and enemyShip.hackingSystem.drone and enemyShip.hackingSystem.drone.arrived == false then
							varr.bNeededIonCheck = true -- хак летит - нужна будет деионизация хаксистемы по контакту
						end
						
					end
				end
				
				-- этот блок даёт врагам возможность разумно использовать лучи и не стрелять ими в щиты игрока когда в этом нет смысла
				if diff == '2' or Hyperspace.metaVariables['challenge_noai'] == 1 then --and Hyperspace.Global.GetInstance():GetCApp().gui.combatControl.boss_visual == false then
					for enweap in vter(enemyShip:GetWeaponList()) do
						if enweap and enweap.blueprint.typeName == "BEAM" then
							if playerShip.shieldSystem then
								if enweap.blueprint.damage.iShieldPiercing + enweap.blueprint.damage.iDamage > playerShip.shieldSystem.shields.power.first then
									enweap.fireWhenReady = true
								elseif enweap.blueprint.damage.iIonDamage > 0 then
									enweap.fireWhenReady = true
								elseif playerShip.shieldSystem.shields.power.super.first ~= 0 then
									enweap.fireWhenReady = true
								elseif playerShip.shieldSystem.shields.power.first == 0 then
									enweap.fireWhenReady = true
								else
									enweap.fireWhenReady = false
								end
							else
								enweap.fireWhenReady = true
							end
						end
					end
				end
			end
		end
		
		-- механизм возврата экипажа с корабля противника
		if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			varr.micro_tick_counter10 = varr.micro_tick_counter10 + 60.0*Hyperspace.FPS.SpeedFactor
		end
		if (varr.micro_tick_counter10 >= 4000.0) then
			varr.micro_tick_counter10 = 0.0
			if enemyShip and Hyperspace.metaVariables['enemy_state'] == 1 then
				if playerShip and playerShip.teleportSystem == nil then
					local bOnereturned = false
					for crew in vter2(enemyShip.vCrewList) do
						if crew:IsDrone() == false and crew.health.first > 0.0 and not crew.extend.deathTimer and crew.bMindControlled == false then
							local _, telemove = crew.extend:CalculateStat(Hyperspace.CrewStat.TELEPORT_MOVE_OTHER_SHIP)
							-- если экипаж может сам вернуться на корабль - не возвращаем через ивент
							--print (telemove)
							if telemove == false then
								if crew.extend.customTele.teleporting == false then
									if crew.bOutOfGame == false and crew.intruder == true and crew.health.first > 0.0 then
										crew.extend:InitiateTeleport(0, -1, -1)
										bOnereturned = true
									end
								end
							end
						end
					end
					if bOnereturned == true then
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, "EVENT_RETURNING_TEAM", false, -1)
					end
				end
			end
		end
		
		
		if playerShip and hasAnyAugmentationOfList(playerShip, {"RADIOACTIVE", "MARKER_RADIOACTIVE", "HID_RADIOACTIVE"}) == true then
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				varr.micro_tick_counter23 = varr.micro_tick_counter23 + 60.0*Hyperspace.FPS.SpeedFactor
			end
			if (varr.micro_tick_counter23 >= 150000.0) then
				varr.micro_tick_counter23 = math.random(0, 145000)
				radioactivity_itteration(0)
			end
		end
		if enemyShip and hasAnyAugmentationOfList(enemyShip, {"RADIOACTIVE", "MARKER_RADIOACTIVE", "HID_RADIOACTIVE"}) == true then
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				varr.micro_tick_counter24 = varr.micro_tick_counter24 + 60.0*Hyperspace.FPS.SpeedFactor
			end
			if (varr.micro_tick_counter24 >= 150000.0) then
				varr.micro_tick_counter24 = math.random(100000, 145000)
				radioactivity_itteration(1)
			end
		end
		
		

		if playerShip and hasAnyAugmentationOfList(playerShip, {"ANAEROBIC_PROJECTOR", "HID_ANAEROBIC_PROJECTOR"}) == true then
			if Hyperspace.playerVariables['enable_fire_weakness'] == 1 then
				if playerShip.bJumping == false then
					if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
						varr.micro_tick_counter15 = varr.micro_tick_counter15 + 60.0*Hyperspace.FPS.SpeedFactor
					end
					if (varr.micro_tick_counter15 >= 920.0) then
						varr.micro_tick_counter15 = 0.0
						-- принцип работы: каждые 0.9 секунд включает временный антибуст экипажа игрока длительностью 1 сек (x2 наложение заблокировано махстак-ом)
						if enemyShip then
							for crew in vter(enemyShip.vCrewList) do
								if crew:IsDrone() == false then
									if crew:OutOfGame() == false and crew.health.first > 0.0 then
										Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_fire_weakness), crew)
									end
								end
							end
						end
					end
				end
			end
			-- это блокирует получение урона от догорания системы
			-- при этом уничтожение саботажем - урон в корпус идёт
			if enemyShip then
				for i = 0, 15 do -- кол-во возможных айди систем.
					if enemyShip:HasSystem(i)==true then
						if enemyShip:GetSystem(i).bExploded == true then
							enemyShip:GetSystem(i).bExploded = false
							--print('deexp')
						end
					end
					if enemyShip:HasSystem(20)==true then
						if enemyShip:GetSystem(20).bExploded == true then
							enemyShip:GetSystem(20).bExploded = false
							--print('deexp')
						end
					end
				end
			end
		end
		if enemyShip and enemyShip:HasAugmentation('ANAEROBIC_PROJECTOR')>0 then
			if playerShip then
				for i = 0, 15 do -- кол-во возможных айди систем.
					if playerShip:HasSystem(i)==true then
						if playerShip:GetSystem(i).bExploded == true then
							playerShip:GetSystem(i).bExploded = false
							--print('deexp')
						end
					end
				end
				if playerShip:HasSystem(20)==true then
					if playerShip:GetSystem(20).bExploded == true then
						playerShip:GetSystem(20).bExploded = false
						--print('deexp')
					end
				end
			end
		end
		
		-- этот блок меняет внешний вид языков пламени в зависимости от их остаточной силы. привет безумному Валере.
		if enemyShip then --and enemyShip.fireSpreader.count > 0 then
			local bAnaerobicFires = false
			if playerShip and playerShip.ship.hullIntegrity.first > 0 and hasAnyAugmentationOfList(playerShip, {"ANAEROBIC_PROJECTOR", "HID_ANAEROBIC_PROJECTOR"}) == true then
				bAnaerobicFires = true
			end
			for room in vter14(enemyShip.ship.vRoomList) do
				local shape = room.rect
				local startX = shape.x // 35
				local startY = shape.y // 35
				local endX = startX + (shape.w // 35) - 1
				local endY = startY + (shape.h // 35) - 1
				for x = startX, endX do
					for y = startY, endY do
						local fire = enemyShip:GetFire(x, y)
						if fire.bWasOnFire == true then
							--print('on enemy ship'..tostring(bAnaerobicFires))
							fire_universal_definer(fire, bAnaerobicFires)
						end
					end
				end
			end
		end
		if playerShip and playerShip.fireSpreader.count > 0 then
			local bAnaerobicFires = false
			if enemyShip and enemyShip.ship.hullIntegrity.first > 0 and enemyShip:HasAugmentation("ANAEROBIC_PROJECTOR") > 0 then
				bAnaerobicFires = true
			end
			for room in vter14(playerShip.ship.vRoomList) do
				local shape = room.rect
				local startX = shape.x // 35
				local startY = shape.y // 35
				local endX = startX + (shape.w // 35) - 1
				local endY = startY + (shape.h // 35) - 1
				for x = startX, endX do
					for y = startY, endY do
						local fire = playerShip:GetFire(x, y)
						if fire.bWasOnFire == true then
							--print('on player ship'..tostring(bAnaerobicFires))
							fire_universal_definer(fire, bAnaerobicFires)
						end
					end
				end
			end
		end
		
		
		
		-- if playerShip then
			-- playerShip.ship:EmptySlots(math.random(0,10))
			-- print('dodo')
		-- end
		
		--продлевает длительность работы контроля разума
		if playerShip and hasAnyAugmentationOfList(playerShip, {"MIND_ORDER", "HID_MIND_ORDER"}) == true then
			if playerShip.mindSystem ~= nil and playerShip.mindSystem.controlTimer then
				if playerShip.mindSystem.controlTimer.first > 1.0 and playerShip.mindSystem.controlTimer.first ~= playerShip.mindSystem.controlTimer.second then
					if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
						if playerShip.mindSystem:Functioning() == true then
							playerShip.mindSystem.controlTimer.first = playerShip.mindSystem.controlTimer.first - 0.021*Hyperspace.FPS.SpeedFactor
							-- 0.021 после тестов даёт увеличение длительности контроля разума на 1.53 раза где-то на моём компе.
						end
					end
				end
			end
		end
		if enemyShip and enemyShip:HasAugmentation("MIND_ORDER") > 0 then
			if enemyShip.mindSystem ~= nil and enemyShip.mindSystem.controlTimer then
				if enemyShip.mindSystem.controlTimer.first > 1.0 and enemyShip.mindSystem.controlTimer.first ~= enemyShip.mindSystem.controlTimer.second then
					if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
						if enemyShip.mindSystem:Functioning() == true then
							enemyShip.mindSystem.controlTimer.first = enemyShip.mindSystem.controlTimer.first - 0.021*Hyperspace.FPS.SpeedFactor
							--print('enemy works'..enemyShip.mindSystem.controlTimer.first)
							-- 0.021 после тестов даёт увеличение длительности контроля разума на 1.53 раза где-то на моём компе.
						end
					end
				end
			end
		end
		
		
		
		if Hyperspace.metaVariables['challenge_nomaxhp'] == 1 then
			-- устанавливает максимум хп на половину от обычного значения всему экипажу игрока
			if playerShip and playerShip.bJumping == false then
				if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
					varr.micro_tick_counter11 = varr.micro_tick_counter11 + 60.0*Hyperspace.FPS.SpeedFactor
				end
				if (varr.micro_tick_counter11 >= 920.0) then
					varr.micro_tick_counter11 = 0.0
					-- принцип работы: каждые 0.9 секунд включает временный антибуст экипажа игрока длительностью 1 сек (x2 наложение заблокировано махстак-ом)
					if playerShip then
						for crew in vter(playerShip.vCrewList) do
							if crew:IsDrone() == false and crew.intruder == false then
								if crew:OutOfGame() == false and crew.health.first > 0.0 then
									Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(def), crew)
								end
							end
						end
					end
				end
			end
		end
		
		
		if playerShip and playerShip.bJumping == false and Hyperspace.metaVariables['enemy_state'] ~= 2 then
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				varr.micro_tick_counter19 = varr.micro_tick_counter19 + 60.0*Hyperspace.FPS.SpeedFactor
			end
			if (varr.micro_tick_counter19 >= 920.0) then
				varr.micro_tick_counter19 = 0.0
				
				local we_name = varr.full_list_of_game_equipment[Hyperspace.metaVariables['beacon_'..math.floor(Hyperspace.metaVariables['current_star_id'])]]
				if we_name ~= '' then
					if gui.event_pause == false then
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'EVENT_RETURN_EQUIPMENT',false,-1)
						if Hyperspace.Blueprints:GetWeaponBlueprint(we_name).desc.cost > 0 then
							gui.equipScreen:AddWeapon(Hyperspace.Blueprints:GetWeaponBlueprint(we_name), true, false)
						elseif Hyperspace.Blueprints:GetDroneBlueprint(we_name).desc.cost > 0 then
							gui.equipScreen:AddDrone(Hyperspace.Blueprints:GetDroneBlueprint(we_name), true, false)
						elseif Hyperspace.Blueprints:GetAugmentBlueprint(we_name).desc.cost > 0 then
							gui.equipScreen:AddAugment(Hyperspace.Blueprints:GetAugmentBlueprint(we_name), true, false)
						end
						--varr.array_of_wasted_equipment[Hyperspace.metaVariables['current_star_id']] = ''
						Hyperspace.metaVariables['beacon_'..math.floor(Hyperspace.metaVariables['current_star_id'])] = 0
						--print('returned')
					end
				end	
				-- if varr.array_of_wasted_equipment[Hyperspace.metaVariables['current_star_id']] ~= nil and varr.array_of_wasted_equipment[Hyperspace.metaVariables['current_star_id']] ~= '' then
					-- if gui.event_pause == false then
						-- Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'EVENT_RETURN_EQUIPMENT',false,-1)
						-- if Hyperspace.Blueprints:GetWeaponBlueprint(varr.array_of_wasted_equipment[Hyperspace.metaVariables['current_star_id']]).desc.cost > 0 then
							-- gui.equipScreen:AddWeapon(Hyperspace.Blueprints:GetWeaponBlueprint(varr.array_of_wasted_equipment[Hyperspace.metaVariables['current_star_id']]), true, false)
						-- elseif Hyperspace.Blueprints:GetDroneBlueprint(varr.array_of_wasted_equipment[Hyperspace.metaVariables['current_star_id']]).desc.cost > 0 then
							-- gui.equipScreen:AddDrone(Hyperspace.Blueprints:GetDroneBlueprint(varr.array_of_wasted_equipment[Hyperspace.metaVariables['current_star_id']]), true, false)
						-- elseif Hyperspace.Blueprints:GetAugmentBlueprint(varr.array_of_wasted_equipment[Hyperspace.metaVariables['current_star_id']]).desc.cost > 0 then
							-- gui.equipScreen:AddAugment(Hyperspace.Blueprints:GetAugmentBlueprint(varr.array_of_wasted_equipment[Hyperspace.metaVariables['current_star_id']]), true, false)
						-- end
						-- varr.array_of_wasted_equipment[Hyperspace.metaVariables['current_star_id']] = ''
						-- --print('returned')
					-- end
				-- end
				
				-- if map and map.currentLoc and map.currentLoc.event then
					-- for i = 0, map.locations:size() - 1 do
						-- if map.locations[i] == map.currentLoc then
							-- Hyperspace.metaVariables['current_star_id'] = i
						-- end
					-- end
				-- end
			end
		end
		
		
		if Hyperspace.metaVariables['challenge_nocont'] == 1 then
			if playerShip and playerShip.bJumping == false then
				if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
					varr.micro_tick_counter18 = varr.micro_tick_counter18 + 60.0*Hyperspace.FPS.SpeedFactor
				end
				if (varr.micro_tick_counter18 >= 920.0) then
					varr.micro_tick_counter18 = 0.0
					-- принцип работы: каждые 0.9 секунд включает временный антибуст экипажа игрока длительностью 1 сек (x2 наложение заблокировано махстак-ом)
					for crew in vter(playerShip.vCrewList) do
						if crew:IsDrone() == false and crew.intruder == false then
							if crew:OutOfGame() == false and crew.health.first > 0.0 then
								Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_uncontrollable), crew)
								
								--сброс сохранённых позиций экипажа в состояние текущего расположения, это немного дурь, но работает...
								crew:SavePosition()
							end
						end
					end
					if enemyShip then
						for crew in vter(enemyShip.vCrewList) do
							if crew:IsDrone() == false and crew.intruder == true then
								if crew:OutOfGame() == false and crew.health.first > 0.0 then
									Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_uncontrollable), crew)
								end
							end
						end
					end
				end
			end
		end
		
		-- блок по сути дублирует работу усиления Исцеляющий телепорт, нужен чтобы корректно работал возврат экипажа с уничтоженного корабля (хил не происходил)
		if playerShip and playerShip:HasSystem(9) and (hasAnyAugmentationOfList(playerShip, {"TELEPORT_HEAL", "HID_TELEPORT_HEAL", "BACKUP_DNA_TELEPORT_HEAL"}) == true) then
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
					if crew:IsDrone() == true then
						if crew.crewAnim.bPlayer == true and crew.intruder == false and crew.currentShipId == 0 then
							if check_is_inside_list('UNCONTROLLABLE_DRONES', crew.blueprint.name) == false then
								if Hyperspace.metaVariables['enable_auto_drone_work'] == 0 then
									crew.extend:GetDefinition().controllable = true
									crew.extend:GetDefinition().selectable = true
								else
									crew.extend:GetDefinition().controllable = false
									crew.extend:GetDefinition().selectable = false
								end
							end
						end
					end
				end
			end
			if enemyShip then
				for crew in vter(enemyShip.vCrewList) do
					if crew:IsDrone() == true then
						if crew.crewAnim.bPlayer == true and crew.intruder == true and crew.currentShipId == 1 then
							if check_is_inside_list('UNCONTROLLABLE_DRONES', crew.blueprint.name) == false then
								if Hyperspace.metaVariables['enable_auto_drone_work'] == 0 then
									crew.extend:GetDefinition().controllable = true
									crew.extend:GetDefinition().selectable = true
								else
									crew.extend:GetDefinition().controllable = false
									crew.extend:GetDefinition().selectable = false
								end
							end
						end
					end
				end
			end
		end
		
		-- позволяет легендарному человеку ордена разжигать имеющийся огонь на любом корабле
		if (mini_fire_time_counter >= 20.0) then -- если нужна большая интенсивность разжигания огня, надо уменьшить значение.
			mini_fire_time_counter = 0.0
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				if playerShip then
					for crew in vter(playerShip.vCrewList) do
						if(crew.blueprint.name == "order_human_legendary")then
							for room2 in vter2(GSIp.rooms) do
								if room2 then
									if crew.currentShipId == 0 and crew.iRoomId == room2.iRoomId then
										local bNeededFire = false
										for doors in vter3(GSIp:GetDoors(room2.iRoomId)) do
											if doors then
												if doors.iRoom1~= -1 and doors.iRoom1 ~= room2.iRoomId and playerShip:GetFireCount(doors.iRoom1) > 0 then
													bNeededFire = true
												end
												if doors.iRoom2~= -1 and doors.iRoom2 ~= room2.iRoomId and playerShip:GetFireCount(doors.iRoom2) > 0 then
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
												if doors.iRoom1~= -1 and doors.iRoom1 ~= room.iRoomId and enemyShip:GetFireCount(doors.iRoom1) > 0 then
													bNeededFire = true
												end
												if doors.iRoom2~= -1 and doors.iRoom2 ~= room.iRoomId and enemyShip:GetFireCount(doors.iRoom2) > 0 then
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
						Hyperspace.metaVariables['in_store_now'] = 2
					else
						Hyperspace.metaVariables['in_store_now'] = 0 -- если среда стала опасной, значит магазин уничтожен на этом маяке повстанцами
					end
					timer_x = 0.0
				end
			end
		end
		
		-- это усиление демаскирует другой корабль. работает у врага и игрока
		if(enemyShip and playerShip) then
			if hasAnyAugmentationOfList(playerShip, {"ANTICLOAK_FIELD", "HID_ANTICLOAK_FIELD"}) == true then
				if (enemyShip:HasSystem(10)) then
					enemyShip:GetSystem(10):LockSystem(1)
				end
			end
			if (enemyShip:HasAugmentation("ANTICLOAK_FIELD") > 0 and enemyShip.ship.hullIntegrity.first > 0 and enemyShip._targetable.hostile == true) then
				if (playerShip:HasSystem(10)) then
					playerShip:GetSystem(10):LockSystem(1)
				end
			end
		end
		
		-- добавляет в FTL-JAMMER лимит = -1 на двигатель. работает у врага и игрока
		if (enemyShip and playerShip) then
			if hasAnyAugmentationOfList(playerShip, {"FTL_JAMMER", "HID_FTL_JAMMER", "FTL_BOOSTER_FTL_JAMMER"}) == true then
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

		-- отслеживает состояние врага и отражает это в переменной. 0 - нету, 1 - есть, друг, 2 - есть, враг
		if enemyShip then
			local nm = enemyShip.myBlueprint.blueprintName
			if enemyShip.ship.hullIntegrity.first == enemyShip.ship.hullIntegrity.second then
				
				-- если можно добавляет усиление титановое покрытие
				if Hyperspace.metaVariables['challenge_nosysca'] == 1 then
					--if ship_local.iShipId == 1 then
						if enemyShip:HasAugmentation('SYSTEM_CASING') == 0 and enemyShip:GetAugmentationCount() < 3 then
							enemyShip:AddAugmentation('SYSTEM_CASING')
							--print('added')
						end
					--end
				end
				-- если можно добавляет усиление золтанский щит
				if Hyperspace.metaVariables['challenge_nozlt'] == 1 then
					--if ship_local.iShipId == 1 then
						if enemyShip:HasAugmentation('ENERGY_SHIELD') == 0 and enemyShip:GetAugmentationCount() < 3 then
							enemyShip:AddAugmentation('ENERGY_SHIELD')
							--print('added')
						end
					--end
				end
				
				
				if nm == "BOSS_1_HARD_DLC" or nm == "BOSS_2_HARD_DLC" or nm == "BOSS_3_HARD_DLC" or nm == "BOSS_4_PHASE" then
					if Hyperspace.metaVariables['additional_flagship_augment'] ~= 0 then
						local aug_boss_name = varr.full_list_of_game_equipment[math.floor(Hyperspace.metaVariables['additional_flagship_augment'])]
						if Hyperspace.Blueprints:GetAugmentBlueprint(aug_boss_name).desc.cost == 0 then
							define_additional_flagship_augment()
							print('boss aug redefined from...'..tostring(aug_boss_name))--заглушка на случай если босс не получит почему-то аугмент. хоть причину узнаем если вылезет...
							aug_boss_name = varr.full_list_of_game_equipment[math.floor(Hyperspace.metaVariables['additional_flagship_augment'])]							
						end
						if enemyShip:HasAugmentation(aug_boss_name) == 0 then
							enemyShip:AddAugmentation(aug_boss_name)
							--print('added='..aug_boss_name)
						end
					else
						--у босса сбросило на 0 переменную доп.усиления. чиним...
						define_additional_flagship_augment()
						print('boss aug redefined from 0..')--заглушка
					end
				end
				
				if nm == "BOSS_1_EASY_DLC" or nm == "BOSS_1_NORMAL_DLC" or nm == "BOSS_1_HARD_DLC" or nm == "BOSS_BLACK_WING" then
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
						if gui and gui.event_pause == false then
							Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_BLACK_WING_BOSS_DESTROYED", false, -1)
						end
					elseif nm == "BOSS_1_EASY_DLC" or nm == "BOSS_1_NORMAL_DLC" or nm == "BOSS_1_HARD_DLC" then
						if gui and gui.event_pause == false then
							Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_1_PHASE", false, -1)
						end
					elseif nm == "BOSS_2_EASY_DLC" or nm == "BOSS_2_NORMAL_DLC" or nm == "BOSS_2_HARD_DLC" then
						if gui and gui.event_pause == false then
							Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_2_PHASE", false, -1)
						end
					elseif nm == "BOSS_3_EASY_DLC" or nm == "BOSS_3_NORMAL_DLC" or nm == "BOSS_3_HARD_DLC" then
						if Hyperspace.metaVariables['challenge_nobf'] == 0 then
							Hyperspace.metaVariables['was_victory'] = 1
						end
						if gui and gui.event_pause == false then
							Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_3_PHASE", false, -1)
						end
						remember_sector_reward(8, 'FINAL', costy_pot - iBeginSectorCostP)
					elseif nm == "BOSS_1_EASY" or nm == "BOSS_1_NORMAL" or nm == "BOSS_1_HARD" then
						if gui and gui.event_pause == false then
							Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_1_PHASE", false, -1)
						end
					elseif nm == "BOSS_2_EASY" or nm == "BOSS_2_NORMAL" or nm == "BOSS_2_HARD" then
						if gui and gui.event_pause == false then
							Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_2_PHASE", false, -1)
						end
					elseif nm == "BOSS_3_EASY" or nm == "BOSS_3_NORMAL" or nm == "BOSS_3_HARD" then
						if Hyperspace.metaVariables['challenge_nobf'] == 0 then
							Hyperspace.metaVariables['was_victory'] = 1
						end
						remember_sector_reward(8, 'FINAL', costy_pot - iBeginSectorCostP)
						if gui and gui.event_pause == false then
							Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_3_PHASE", false, -1)
						end
					elseif nm == "BOSS_4_PHASE" then
						Hyperspace.metaVariables['was_victory'] = 1
						remember_sector_reward(8, 'FINAL', costy_pot - iBeginSectorCostP)
						if gui and gui.event_pause == false then
							Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REBEL_BOSS_DESTROYED_4_PHASE", false, -1)
						end
					end
					
					if playerHasSoulReaperInSlots then
						if counter_meet_rebel_wave_previous_beacon ~= Hyperspace.playerVariables['counter_meet_rebel_wave'] then
							-- игрок в волне повстанцев, не даём души
						elseif map and map.currentLoc and map.currentLoc.event.eventName == "FLEET_EASY_DLC_OLD" or map.currentLoc.event.eventName == "ELITE_DANGEROUS_1" or map.currentLoc.event.eventName == "NO_FUEL_FLEET_DLC" then
							--print('no soul in wave!')
						--REBEL_SKINNY_ELITE
						elseif nm == "BOSS_1_EASY_DLC" or nm == "BOSS_1_NORMAL_DLC" or nm == "BOSS_1_HARD_DLC" or nm == "BOSS_2_EASY_DLC" or nm == "BOSS_2_NORMAL_DLC" or nm == "BOSS_2_HARD_DLC" then
						
						elseif nm == "BOSS_1_EASY" or nm == "BOSS_1_NORMAL" or nm == "BOSS_1_HARD" or nm == "BOSS_2_EASY" or nm == "BOSS_2_NORMAL" or nm == "BOSS_2_HARD" then
							
						else
							local s_bef = Hyperspace.playerVariables['soulreaper_lvl']
							if hasAnyAugmentationOfList(playerShip, {"SOUL_MAGNIT", "HID_SOUL_MAGNIT"}) == true then
								Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] + 2
								--print('+2')
							else
								Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_lvl'] + 1
								--print('+1')
							end
							if Hyperspace.playerVariables['soulreaper_lvl'] > Hyperspace.playerVariables['soulreaper_capacity'] then
								Hyperspace.playerVariables['soulreaper_lvl'] = Hyperspace.playerVariables['soulreaper_capacity']
								--print('max souls')
							end
							local s_delta = Hyperspace.playerVariables['soulreaper_lvl'] - s_bef
							if s_delta == 2 then
								Hyperspace.Sounds:PlaySoundMix('soul_catch_multi', 10, false)
							elseif s_delta == 1 then
								Hyperspace.Sounds:PlaySoundMix('soul_catch_'..tostring(math.random(1,2)), 10, false)
							end
						end
					end

					if Hyperspace.metaVariables['was_victory'] == 1 then
						if playerHasSoulReaperInSlots then
							Hyperspace.metaVariables['needed_transfer_soulreaper'] = 1
						end
						if Hyperspace.playerVariables['used_tactical_pause'] == 0 then
							Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_NO_PAUSE", false)
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
		
		--print(varr.enemy_state_previous)
		if Hyperspace.metaVariables['enemy_state'] == 1 and varr.enemy_state_previous == 2 then
			if enemyShip.bAutomated == false and (enemyShip:HasSystem(13) == false or enemyShip:GetSystem(13):Functioning()== false) then
				if enemyShip.shieldSystem and enemyShip.shieldSystem.shields.power.super.first > 0 then
					--if gui and gui.event_pause == false then
						--print('worked once')
						Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_SUPERSHIELDCREW", false)
					--end
				end
			end
			
			--фиксация факта захвата
			remove_all_temporal_drones()
			if map and map.currentLoc then
				map.currentLoc.known = true--немного ссыкотно это использовать, но вроде сработало... надеюсь без последствий, протестировано на обычных маяках и в волне 
			end
		end
		
		
		
		
		varr.enemy_state_previous = Hyperspace.metaVariables['enemy_state']
		
		
		-- баф усиления-сканера. даёт очистку блокировки сенсоров в туманностях
		if playerShip then
			if hasAnyAugmentationOfList(playerShip, {"LIFE_SCANNER", "HID_LIFE_SCANNER", "ADV_SCANNERS_LIFE_SCANNER"}) == true then
				if (playerShip:HasSystem(7)) then
					playerShip:GetSystem(7):ClearStatus()
				end
			end
		end

		-- обслуживание усиления PROJECTILE_EATER
		if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			varr.micro_tick_counter2 = varr.micro_tick_counter2 + 60.0*Hyperspace.FPS.SpeedFactor --1
		end
		if (varr.micro_tick_counter2 >= 1.0 and varr.micro_tick_counter2 <= 10.0) then
			varr.micro_tick_counter2 = 11.0
			if playerShip then
				if (hasAnyAugmentationOfList(playerShip, {"PROJECTILE_EATER", "HID_PROJECTILE_EATER"}) == true and memory_of_state_player_PE == 0) then
					memory_of_state_player_PE = 1
					Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "PROJECTILE_EATER_UPDATE", false, -1)
				elseif (hasAnyAugmentationOfList(playerShip, {"PROJECTILE_EATER", "HID_PROJECTILE_EATER"}) == false and memory_of_state_player_PE == 1) then
					memory_of_state_player_PE = 0
					Hyperspace.playerVariables['projectile_eater_current_level'] = 1 --потеря/продажа пожирателя приводит к сбросу его уровня на дефолт = 1
					Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "PROJECTILE_EATER_UPDATE", false, -1)
				end
			end
		end
		if (varr.micro_tick_counter2 >= 200.0) then
			varr.micro_tick_counter2 = 0.0
		end

		-- Этот участок заставляет маяки трястись возле своих позиций с амплитудой по косинусоиде в конкретных секторах
		if map and playerShip and playerShip.bJumping == false then
			
			if varr.needed_check_tonnel == true then
				-- ЭТОТ УЧАСТОК СРАБАТЫВАЕТ 1 РАЗ ВСЕГДА ПРИ ПЕРЕХОДЕ ИЗ МЕНЮ В ПРОДОЛЖЕНИЕ ИГРЫ
				check_unique_inner_sector_tonnel()
				
				if Hyperspace.playerVariables['counter_number_of_sector'] == 0 and Hyperspace.playerVariables['jumps_in_current_sector'] == 0 then
					-- это срабатывает непосредственно в самом начале полёта на стартовом маяке. сектор нихрена не 0, но тут вот так.
					--print('clear eq')
					for k = 0, 40 do--чистим память брошенного оборудования
						Hyperspace.metaVariables['beacon_'..k] = 0
					end
					
					Hyperspace.metaVariables['current_run_all_sector_reward'] = 0
					--print('clear cur rew')
					
					make_global_rarity_filtration()
					
					clear_map_drawing()
					
					--хаха, печатаем невидимым шрифтом в лог
					print('[style[color:FFFFFF00]]seed = '..tostring(math.floor(Hyperspace.Global.currentSeed))..'[[/style]]')
					
				else
					restore_aug_state_of_player_by_metavariables()
				end
				
				costy, costy_pot, overstrong = calculate_ship_cost (Hyperspace.ships.player)
				Hyperspace.playerVariables['calc_local_strength'] = costy
				Hyperspace.playerVariables['calc_local_strength_pot'] = costy_pot
				Hyperspace.playerVariables['calc_is_player_overstrong'] = overstrong
				--print ('calc')
			end
			
			if fworldlevel_memory ~= Hyperspace.playerVariables['counter_number_of_sector'] then
				local fworldlevel_memory_previous = fworldlevel_memory
				fworldlevel_memory = Hyperspace.playerVariables['counter_number_of_sector']
				bRemembedStarPositions = false
				-- это место отслеживает изменение номера сектора
				if fworldlevel_memory_previous == -1 then--это возникает при продолжении игры и обрабатывается по другому
					iBeginSectorCostP = Hyperspace.playerVariables['begin_sector_ship_cost']
				else
					if Hyperspace.playerVariables['counter_number_of_sector'] >= 2 then
						remember_sector_reward(Hyperspace.playerVariables['counter_number_of_sector'] - 1, sPreviousJumpTypeOfSector, costy_pot - iBeginSectorCostP)
						Hyperspace.playerVariables['dont_remember_last_sector'] = 0
						
						-- при переходе из второго в третий сектор определяем id аугмента для флагмана
						-- т.е. до 3 сектора НЕ ОПРЕДЕЛЕНО КАКОЕ ДОПОЛНИТЕЛЬНОЕ УСИЛЕНИЕ БУДЕТ У БОССА
						if Hyperspace.playerVariables['counter_number_of_sector'] == 2 or Hyperspace.playerVariables['counter_number_of_sector'] == 3 then
							define_additional_flagship_augment()
						end
						
						if Hyperspace.metaVariables['challenge_nogeq'] == 1 then
							local equip_name_to_remove = ''
							local max_cost_eq = 0
							if playerShip.weaponSystem ~= nil then
								for pf in vter2(playerShip.weaponSystem.weapons) do
									if pf.blueprint.desc.cost ~= nil then
										if pf.blueprint.desc.cost > max_cost_eq then
											equip_name_to_remove = pf.blueprint.name
											max_cost_eq = pf.blueprint.desc.cost
										end
									end
								end
							end
							if playerShip.droneSystem ~= nil then
								for drone in vter(playerShip.droneSystem.drones) do
									if drone.blueprint.desc.cost ~= nil then
										if drone.blueprint.desc.cost > max_cost_eq then
											equip_name_to_remove = drone.blueprint.name
											max_cost_eq = drone.blueprint.desc.cost
										end
									end
								end
							end
							for carg in vter (gui.equipScreen:GetCargoHold()) do
								if Hyperspace.Blueprints:GetWeaponBlueprint(carg).desc.cost ~= nil then
									if Hyperspace.Blueprints:GetWeaponBlueprint(carg).desc.cost > max_cost_eq then
										equip_name_to_remove = carg
										max_cost_eq = Hyperspace.Blueprints:GetWeaponBlueprint(carg).desc.cost
									end
								end
								if Hyperspace.Blueprints:GetDroneBlueprint(carg).desc.cost ~= nil then
									if Hyperspace.Blueprints:GetDroneBlueprint(carg).desc.cost > max_cost_eq then
										equip_name_to_remove = carg
										max_cost_eq = Hyperspace.Blueprints:GetDroneBlueprint(carg).desc.cost
									end
								end
							end
							if max_cost_eq > 0 and equip_name_to_remove ~= '' then
								playerShip:RemoveItem(equip_name_to_remove, true)
								--print('removed='..equip_name_to_remove..','..max_cost_eq)
							end
						end
						
					end
					if Hyperspace.playerVariables['jumps_in_current_sector'] == 2 and Hyperspace.playerVariables['counter_number_of_sector'] >= 2 then
						Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_TWOJUMPS", false)
					end
					Hyperspace.playerVariables['jumps_in_current_sector'] = 0
					Hyperspace.playerVariables['connected_beacon1'] = -1
					Hyperspace.playerVariables['connected_beacon2'] = -1
					Hyperspace.playerVariables['enable_fire_weakness'] = 0--сброс в дефолт в начале сектора
					
					
					if Hyperspace.playerVariables['counter_number_of_sector'] >= 2 then
						costy = 0
						costy_pot = 0
						overstrong = 0
						costy, costy_pot, overstrong = calculate_ship_cost (playerShip)
						Hyperspace.playerVariables['calc_local_strength'] = costy
						Hyperspace.playerVariables['calc_local_strength_pot'] = costy_pot
						Hyperspace.playerVariables['calc_is_player_overstrong'] = overstrong
						
						iBeginSectorCostP = costy_pot-- + 4
						Hyperspace.playerVariables['begin_sector_ship_cost'] = iBeginSectorCostP
						--print('remembed_begin_cost2='..iBeginSectorCostP)
					end
					
					--varr.array_of_wasted_equipment = {} --забываем всё брошенное в секторе оборудование прошлого сектора
					for k = 0, 40 do
						Hyperspace.metaVariables['beacon_'..k] = 0
					end
					Hyperspace.metaVariables['current_star_id'] = 999
					
					
					
					
					
				end
				
				-- точка замены редкости. РАБОТАЕТ ЖЕ Ш!!!
				if fworldlevel_memory > 0.0 then
					for urw in vter (Hyperspace.Blueprints:GetBlueprintList("WEAPON_CHANCE_50_RARITY_0")) do
						if math.random(0,100)<50 then
							Hyperspace.Blueprints:GetWeaponBlueprint(urw).desc.rarity = 0
						else
							Hyperspace.Blueprints:GetWeaponBlueprint(urw).desc.rarity = Hyperspace.Blueprints:GetWeaponBlueprint(urw).desc.baseRarity
						end
					end
					for urw in vter (Hyperspace.Blueprints:GetBlueprintList("DRONES_CHANCE_50_RARITY_0")) do
						if math.random(0,100)<50 then
							Hyperspace.Blueprints:GetDroneBlueprint(urw).desc.rarity = 0
						else
							Hyperspace.Blueprints:GetDroneBlueprint(urw).desc.rarity = Hyperspace.Blueprints:GetDroneBlueprint(urw).desc.baseRarity
						end
					end
					for urw in vter (Hyperspace.Blueprints:GetBlueprintList("AUGMENTS_CHANCE_50_RARITY_0")) do
						if math.random(0,100)<50 then
							Hyperspace.Blueprints:GetAugmentBlueprint(urw).desc.rarity = 0
						else
							Hyperspace.Blueprints:GetAugmentBlueprint(urw).desc.rarity = Hyperspace.Blueprints:GetAugmentBlueprint(urw).desc.baseRarity
						end
					end
					
					
					set_filtration()
					
					make_allowed_ultrarare_injected_weapons()
					
					clear_map_drawing()
				end
			end
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
					if map and map.bOpen == true then 
						map_beacon_locations_mem_array_x = {}
						map_beacon_locations_mem_array_y = {}
						--print('reset coordinates')
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
				end
				if (bRemembedStarPositions == true) then
					if map and map.bOpen == true then 
						iKey = 1
						for locs in vter2(map.locations) do
							pos = locs.loc
							varr.micro_tick_counter3 = varr.micro_tick_counter3 + 0.22*Hyperspace.FPS.SpeedFactor --1 --60.0
							if (varr.micro_tick_counter3 >= 11800.0) then
								varr.micro_tick_counter3 = 0.0
							end
							fBeacon_shaking = shake_amplitude*(0.5 + math.cos(varr.micro_tick_counter3 * 0.012))
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
		end
		
		-- на маяках повышенной температуры периодически поджигает корабли
		if Hyperspace.playerVariables['danger_ultra_sun'] == 1 then
		--if Hyperspace.playerVariables['high_temperature_on_this_beacon'] == 1 then
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				varr.micro_tick_counter4 = varr.micro_tick_counter4 + 60.0*Hyperspace.FPS.SpeedFactor --1
			end
			if varr.micro_tick_counter4 >= 14000.0 and varr.micro_tick_counter4 <= 14090.0 then
				varr.micro_tick_counter4 = 14091.0
				Hyperspace.Sounds:PlaySoundMix('environWarning', 3, false)
			end
			
			if varr.micro_tick_counter4 >= 15000.0 and varr.micro_tick_counter4 <= 15090.0 then
				varr.micro_tick_counter4 = 15091.0
				Hyperspace.Sounds:PlaySoundMix('solarFlare', 10, false)
			end
			
			if varr.micro_tick_counter4 >= 15900.0 and varr.micro_tick_counter4 <= 15990.0 then
				varr.micro_tick_counter4 = 15991.0
				screen_fade(Graphics.GL_Color(245.0/255.0, 50.0/255.0, 40.0/255.0, 125.0/255.0), 1.5, 1.5, 1.5)
			end
			if varr.micro_tick_counter4 >= 16300.0 then
				varr.micro_tick_counter4 = math.random(0, 3000)
				make_sun_flare()
			end
		end
		
		
		
		-- на маяках сверхнизкой температуры периодически замораживает корабли
		if Hyperspace.playerVariables['danger_cold'] == 1 then
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				varr.micro_tick_counter4 = varr.micro_tick_counter4 + 60.0*Hyperspace.FPS.SpeedFactor --1
			end
			if varr.micro_tick_counter4 >= 8000.0 then -- регулировка частоты срабатываний тут
				varr.micro_tick_counter4 = math.random(2000, 6000) -- регулировка частоты срабатываний тут
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
				varr.micro_tick_counter4 = varr.micro_tick_counter4 + 60.0*Hyperspace.FPS.SpeedFactor
			end
			if varr.micro_tick_counter4 >= 9000.0 then -- регулировка частоты срабатываний тут
				varr.micro_tick_counter4 = math.random(0, 7000) -- регулировка частоты срабатываний тут
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
				varr.micro_tick_counter4 = varr.micro_tick_counter4 + 60.0*Hyperspace.FPS.SpeedFactor
			end
			if varr.micro_tick_counter4 >= 5000.0 then -- регулировка частоты срабатываний тут
				varr.micro_tick_counter4 = math.random(1500, 3500) -- регулировка частоты срабатываний тут
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
				varr.micro_tick_counter4 = varr.micro_tick_counter4 + 60.0*Hyperspace.FPS.SpeedFactor
			end
			if GSIp and playerShip and GSIe and enemyShip and Hyperspace.metaVariables['enemy_state'] == 2 then
			
			else
				Hyperspace.playerVariables['danger_wild_drones'] = 0
			end
			
			if varr.micro_tick_counter4 >= 10000.0 then -- регулировка частоты срабатываний тут
				varr.micro_tick_counter4 = math.random(0, 4000) -- регулировка частоты срабатываний тут
				-- тут тонкое место, если хоть одного корабля не будет - запуск этих эвентов = вылет игры
				if GSIp and playerShip and GSIe and enemyShip and Hyperspace.metaVariables['enemy_state'] == 2 then
					if math.random(0,100)<50 then
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, "DRONE_FIELD_1", false, -1)
					else
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, "DRONE_FIELD_1E", false, -1)
					end
				else
					Hyperspace.playerVariables['danger_wild_drones'] = 0
				end
			end
		end
		
		if GSIp then
			for roomy in vter2(GSIp.rooms) do
				if varr.universal_iRoom_neededheal[roomy.iRoomId] == nil then
					varr.universal_iRoom_neededheal[roomy.iRoomId] = 0.0
				end
				varr.universal_iRoom_neededheal[roomy.iRoomId] = varr.universal_iRoom_neededheal[roomy.iRoomId] - 0.2
				if varr.universal_iRoom_neededheal[roomy.iRoomId] < 0.0 then
					varr.universal_iRoom_neededheal[roomy.iRoomId] = 0.0
				end
			end
		end
		if GSIe then
			for roomy in vter2(GSIe.rooms) do
				if varr.universal_iRoom_neededheal_enemy[roomy.iRoomId] == nil then
					varr.universal_iRoom_neededheal_enemy[roomy.iRoomId] = 0.0
				end
				varr.universal_iRoom_neededheal_enemy[roomy.iRoomId] = varr.universal_iRoom_neededheal_enemy[roomy.iRoomId] - 0.2
				if varr.universal_iRoom_neededheal_enemy[roomy.iRoomId] < 0.0 then
					varr.universal_iRoom_neededheal_enemy[roomy.iRoomId] = 0.0
				end
			end
		end
		
		if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			--if playerShip.bJumping == false
			varr.micro_tick_counter8 = varr.micro_tick_counter8 + 60.0*Hyperspace.FPS.SpeedFactor
			if varr.micro_tick_counter8 >= 5050.0 then
				varr.micro_tick_counter8 = 0.0
				reset_osa_activity(false) -- просто потому что периодически надо выводить из игры враждебных ос иначе нельзя заабордажить враж.корабль
			end
			if varr.micro_tick_counter8 >= 5000.0 then
				varr.micro_tick_counter8 = 5049.9
				--varr.micro_tick_counter8 = 0.2
				
				reset_osa_activity(true) -- если не возвращать их в игру сразу же, то похоже есть риск вылета из игры при прыжке с выведенной из игры осой
			end
		end
		
		
		if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then	
			-- отдельный счётчик периодически даёт осам шанс что будут шататься по кораблю
			varr.micro_tick_counter9 = varr.micro_tick_counter9 + 60.0*Hyperspace.FPS.SpeedFactor
			if varr.micro_tick_counter9 >= 90000.0 then
				varr.micro_tick_counter9 = math.random(0.0, 30000)
			end
		end
		
		
		-- сохраняет состояние усилений игрока в метапеременные 
		-- раз в 1 секунду... возможно если игроки уроды и будут как-то абузить это через продажу в магаз и выходом в меню, потом обратно стоит снизить таймер...
		-- у меня абуз не вышел этот, хотя в теории должен работать...
		varr.micro_tick_counter12 = varr.micro_tick_counter12 + 60.0*Hyperspace.FPS.SpeedFactor
		if varr.micro_tick_counter12 >= 1000.0 then 
			varr.micro_tick_counter12 = 0.0
			save_in_metavariables_aug_state_of_player()
			--save_in_metavariables_weapcargo_state_of_player()
		end
		
		
		
		
		-- ниже участок работы с ИИ экипажа
		if enemyShip then
			-- нужно чтобы если чужой каким-то хреном окажется на корабле врага, его сразу убрать в переменную.
			for crew in vter(enemyShip.vCrewList) do
				if crew.blueprint.name == "alien" and crew.intruder == false then
					crew:Kill(true)
					Hyperspace.playerVariables['alien_count_inside_hull'] = Hyperspace.playerVariables['alien_count_inside_hull'] + 1.0
				end
				
				if crew.blueprint.name:find("magman") ~= nil then -- ИИ магменов на корабле врага (авто-переключение режимов только тепло-холод)
					if crew.crewAnim.bPlayer==false then
						if crew.bFighting == true and enemyShip:GetSystemInRoom(crew.iRoomId) == nil then 
							if crew.blueprint.name == "magman_b" then--cold
								crew:ActivatePower()
								--print('en cold-->hot')
							end
						else
							if crew.blueprint.name == "magman_a" then--hot
								--я понимаю, что оно сделано через одно место, но там внутри что-то не в порядке, поэтому просто прокликиваем
								--по всем способностям магмена для переключения в другой режим...
								--поджог всё равно всегда на кулдауне по факту, поэтому методика без последствий...
								if crew.extend.crewPowers[0].enabled then
									crew.extend.crewPowers[0]:ActivatePower()
								end
								if crew.extend.crewPowers[1].enabled then
									crew.extend.crewPowers[1]:ActivatePower()
								end
								if crew.extend.crewPowers[2].enabled then
									crew.extend.crewPowers[2]:ActivatePower()
								end
								--print('en hot-->cold')
							end
						end
					end
				end
				
				
				if crew.blueprint.name:find("lady_legendary") ~= nil then -- ИИ лег.человека на корабле врага
					if crew.crewAnim.bPlayer==false and crew.extend.customTele.teleporting == false then
						if crew.extend.crewPowers[0].enabled and (crew.extend.crewPowers[0].powerCooldown.second - crew.extend.crewPowers[0].powerCooldown.first) < 2.0 then
							--print('abil ready')
							local target_idr = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
							if playerShip:GetSystemInRoom(target_idr) ~= nil and playerShip:GetSystemInRoom(target_idr):CompletelyDestroyed() == false then
								crew.extend:InitiateTeleport(0, target_idr, -1)
							end
						end
					end
				end
				
				
				if crew.blueprint.name == "osa" or crew.blueprint.name == "osae" then
					-- блок ИИ осы НА ВРАЖЕСКОМ КОРАБЛЕ
					
					-- блок ИИ осы на корабле игрока
					local TS = crew.blueprint.crewNameLong
					local changed = false
					TS.data, changed = MakeNameIfNeeded(TS.data, crew.blueprint.name, crew)
					if changed == true then
						crew:SetName(TS, true)
						--print('name changed!')
					end
					if crew.extend:GetDefinition().noAI == false then
						crew.extend:GetDefinition().noAI = true --полностью забираем контроль над осами в луа
					end
					-- если видит цель в своём отсеке первым приоритетом атакует её
					if crew.fStunTime <= 0.0 then
						local bTargetInMyRoom = false
						for crewww in vter2(enemyShip.vCrewList) do
							if crewww ~= crew and crew.iRoomId == crewww.iRoomId then
								if crewww.health.first > 0.0 then
									if crewww.intruder ~= crew.intruder or crewww.bMindControlled == true then
										bTargetInMyRoom = true
									end
								end
							end
						end
						if bTargetInMyRoom == true and math.random(0,1000)<8 then -- чтобы не в первый тик реагировала
							if crew.extend.crewPowers[0].enabled then
								crew.extend.crewPowers[0].powerCooldown.first = crew.extend.crewPowers[0].powerCooldown.second
								--crew.extend.crewPowers[0].powerCooldown.first) < 2.0 then
							end
							if crew.extend.crewPowers[1].enabled then
								crew.extend.crewPowers[1].powerCooldown.first = crew.extend.crewPowers[1].powerCooldown.second
							end
						end
					end
					--print (varr.micro_tick_counter9)
					if crew.extend:GetDefinition().canMove == true then
						if crew.iOnFire > 0 then --этот блок даёт команду на бегство в другую комнату (без пожара), если в текущей пожар
							if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
								crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
								if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then -- дошла до цели
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
								if enemyShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then -- целевая комната горит
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							elseif GSIe then
								varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
								if enemyShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then -- проверка горит ли целевая комната
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif enemyShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then -- проверка есть ли место в целевой комнате
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							end
						else
							if varr.micro_tick_counter9 < 80000 and crew.health.first > 10.0 then --нормальный режим ос
								--print('targ'..varr.universal_iRoom_targ[crew.extend.selfId])
								if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
									crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
									if enemyShip:GetSystemInRoom(crew.iRoomId) == nil then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									elseif crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then -- дошла до цели
										varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
									end
								else
									if enemyShip:GetSystemInRoom(crew.iRoomId) == nil then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									else
										varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
									end
								end
							else --режим бесилова по кораблю.
								--print('targ-free'..varr.universal_iRoom_targ[crew.extend.selfId])
								if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
									crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
									if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then -- дошла до цели
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									end
								else
									if math.random(0,10000)<11 then
										varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
										--print('belka ukusila'..varr.universal_iRoom_targ[crew.extend.selfId])
									end
								end
							end
						end
					end
				elseif crew.blueprint.name == "gus" or crew.blueprint.name == "gusq" then
					-- блок ИИ гусеницы НА ВРАЖЕСКОМ КОРАБЛЕ
					--print('targ='..varr.universal_iRoom_targ)
					-- if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
						-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
					-- end
					
					if crew.iOnFire > 0 or crew.bSuffocating == true then --этот блок даёт команду на бегство в другую комнату (без пожара), если в текущей пожар
						if crew.extend:GetDefinition().canMove == true then
							if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
								crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
								if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] and enemyShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							elseif GSIe then
								varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
								if enemyShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then -- проверка горит ли комната
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif enemyShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then -- проверка есть ли место в комнате
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif GSIe:GetRoomOxygen(varr.universal_iRoom_targ[crew.extend.selfId]) < 10.0 then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							end
						end
					else
						if crew.extend:GetDefinition().canMove == true then
							if enemyShip:GetSystemInRoom(crew.iRoomId) == nil and varr.micro_tick_counter9 < 80000 then
								if crew.iOnFire == 0 then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
									crew.extend:GetDefinition().noAI = true -- новый фиксатор позиции
									for crewww in vter2(enemyShip.vCrewList) do
										if crewww ~= crew and crewww.intruder == false and crew.iRoomId == crewww.iRoomId and crewww.bMindControlled == true then
											--print('in my room mindcontrolled ass')
											varr.micro_tick_counter9 = 81000
										end
									end
								elseif GSIe then
									varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
									if enemyShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then -- проверка горит ли комната
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									elseif enemyShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then -- проверка есть ли место в комнате
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									end
								end
							elseif varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
								crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
								if varr.micro_tick_counter9 < 80000 then
									if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then
										--if enemyShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]) ~= nil then
											if GSIe then
												varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
											end
										--end
									end
								end
							else
								if GSIe then
									varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
									if enemyShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									elseif enemyShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									elseif varr.micro_tick_counter9 < 80000 then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									end
								end
							end
						end
					end
				end
				
				
				
				if crew.blueprint.name:find("biopreserver") ~= nil then -- новый ИИ биохранителей на враж.корабле
					if crew.health.first + 10 < crew.health.second then
						crew.extend:GetDefinition().noAI = false
					else
						crew.extend:GetDefinition().noAI = true -- новый фиксатор позиции
					end
					if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
						if GSIe then
							crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
							if varr.universal_iRoom_neededheal_enemy[varr.universal_iRoom_targ[crew.extend.selfId]] < 1.0 then
								varr.universal_iRoom_targ[crew.extend.selfId] = -1
							end
							local incurrroomraneniy = false
							local inroomsoonpreserver = false
							for crew2 in vter2(enemyShip.vCrewList) do
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
							if inroomsoonpreserver == true then
								if varr.universal_iRoom_targ[crew.extend.selfId] == crew.iRoomId then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							end
						end
					else
						varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
						if varr.universal_iRoom_neededheal_enemy[varr.universal_iRoom_targ[crew.extend.selfId]] < 1.0 then
							varr.universal_iRoom_targ[crew.extend.selfId] = -1
						else
							local inroomsoonpreserver = false
							for crew2 in vter2(enemyShip.vCrewList) do
								if crew ~= crew2 then
									if crew2.blueprint.name:find("biopreserver") ~= nil then
										if varr.universal_iRoom_targ[crew.extend.selfId] == crew2.iRoomId then
											inroomsoonpreserver = true
										elseif varr.universal_iRoom_targ[crew2.extend.selfId] == varr.universal_iRoom_targ[crew.extend.selfId] then
											local p_targ = GSIe:GetRoomCenter(varr.universal_iRoom_targ[crew.extend.selfId])
											local path_length1 = math.sqrt((crew.x - p_targ.x)*(crew.x - p_targ.x) + (crew.y - p_targ.y)*(crew.y - p_targ.y))
											local path_length2 = math.sqrt((crew2.x - p_targ.x)*(crew2.x - p_targ.x) + (crew2.y - p_targ.y)*(crew2.y - p_targ.y))
											if (path_length2 + 150.0) < path_length1 then
												inroomsoonpreserver = true
											elseif (path_length1 + 150.0) < path_length2 then
												varr.universal_iRoom_targ[crew2.extend.selfId] = -1
											else
												inroomsoonpreserver = true
											end
										end
									end
								end
							end
							if inroomsoonpreserver == true then
								varr.universal_iRoom_targ[crew.extend.selfId] = -1
							end
						end
					end
				end
				
				
				
				if crew.blueprint.name == "depleter" then
					if crew.intruder == true and crew.crewAnim.bPlayer == true and crew.extend:GetDefinition().controllable == false and GSIe ~= nil then
						if crew.extend:GetDefinition().noAI == false then
							crew.extend:GetDefinition().noAI = true --полностью забираем контроль над этим дроном в луа
						end
						--print(crew.blueprint.name)
						-- if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
							-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
						-- end
						if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
							crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
							if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then
								varr.universal_iRoom_targ[crew.extend.selfId] = -1
							end
						else
							local bFightttttt = false
							for crew2 in vter2(enemyShip.vCrewList) do
								if crew ~= crew2 and crew2.iRoomId == crew.iRoomId and crew2.intruder == false and crew2:CanFight() == true then
									bFightttttt = true
								end
							end
							local sysy = enemyShip:GetSystemInRoom(crew.iRoomId)
							
							
							if math.random(0,2500)<1 then
								--print('misli drona: zasku4al ya 4to to mozhet poidu pogulyau?')
								bFightttttt = true
							end
							--print(tostring(crew:CheckFighting()))
							if bFightttttt == true or sysy == nil or (sysy ~= nil and (sysy:GetLocked() == true or sysy:CompletelyDestroyed() == true)) then -- or Hyperspace.ShipSystem.IsSubsystem(sysy:GetId()) == true)) then
								
								varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIe:RoomCount() - 1)
								if enemyShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]) == nil then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif enemyShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]):CompletelyDestroyed()==true then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif enemyShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							end
						end
					end
				end
			
				if crew.intruder == false and crew:IsDrone()==false then
					if (crew.extend:CalculateStat(Hyperspace.CrewStat.SUFFOCATION_MODIFIER) > 0.2 and crew.health.first < 75.0) or crew.health.first < 30.0 then
						if varr.universal_iRoom_neededheal_enemy[crew.iRoomId] == nil then
							varr.universal_iRoom_neededheal_enemy[crew.iRoomId] = 0.0
						end
						varr.universal_iRoom_neededheal_enemy[crew.iRoomId] = varr.universal_iRoom_neededheal_enemy[crew.iRoomId] + 2.0
						if varr.universal_iRoom_neededheal_enemy[crew.iRoomId] > 5.0 then
							varr.universal_iRoom_neededheal_enemy[crew.iRoomId] = 5.0
						end
					end
				end
				
			end
			
			-- участок для исправления поведения врагов не телепортирующихся при золтанском щите игрока и байпасе у врага
			if Hyperspace.metaVariables['enemy_state'] == 2 then --только в режиме боя. тут был баг.
				if playerShip and GSIp and playerShip.shieldSystem and playerShip.shieldSystem.shields.power.super.second ~= 0 then
					if enemyShip:HasAugmentation('ZOLTAN_BYPASS') > 0 and enemyShip.teleportSystem and enemyShip.teleportSystem:GetLocked() == false then
						for crew in vter(enemyShip.vCrewList) do
							if crew.blueprint.name ~= "alien" and crew.intruder == false then
								if crew.bActiveManning == false and crew:Repairing() == false and crew.bFighting == false then
									crew:MoveToRoom(enemyShip.teleportSystem:GetRoomId(), 0, false)
								end
							end
						end
						if enemyShip.teleportSystem:CanSend() == true then
							local id_tele = enemyShip.teleportSystem:GetRoomId()
							local target_idr = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
							--print(id_tele..'==>'..target_idr)
							local bSended = false
							for crew in vter2(enemyShip.vCrewList) do
								if crew.extend.customTele.teleporting == false then
									if crew:IsDrone() == false and crew.iShipId == 1 then
										if crew.iRoomId == id_tele then
											crew.extend:InitiateTeleport(0, target_idr, -1)
											bSended = true
											crew.extend:GetDefinition().noAI = false
										end
									end
								end
							end
							if bSended == true then
								--print('ioned')
								if enemyShip.teleportSystem.powerState.first == 1 then
									enemyShip.teleportSystem:LockSystem(4)
								elseif enemyShip.teleportSystem.powerState.first == 2 then
									enemyShip.teleportSystem:LockSystem(3)
								elseif enemyShip.teleportSystem.powerState.first == 3 then
									enemyShip.teleportSystem:LockSystem(2)
								else
									enemyShip.teleportSystem:LockSystem(2)
								end
							end
						end
					end
				end
			end
		end
		if playerShip then
			varr.count_of_crew = 0
			
			for crew in vter(playerShip.vCrewList) do		
				
				if crew.blueprint.name:find("lady_legendary") ~= nil then -- ИИ лег.человека на корабле врага
					if crew.crewAnim.bPlayer==false and crew.extend.customTele.teleporting == false then
						if crew.extend.crewPowers[0].enabled and (crew.extend.crewPowers[0].powerCooldown.second - crew.extend.crewPowers[0].powerCooldown.first) < 2.0 then
							--print('soon bomb')
						else
							crew.extend:InitiateTeleport(1, -1, -1)
						end
					end
				end
				
				
				if crew.blueprint.name == "alien" then -- блок для прятания чужого при низких хп
					if crew.health.first <= 20 or (enemyShip and enemyShip:HasSystem(9) == true) or ThereIsAtLeastOneNoAlienEnemyBoarderOnPlayerShip() == true then
						if crew.fStunTime <= 0.0 and crew.health.first > 0.01 then -- предполагается что убить чужого можно только оглушив и быстро добив
							
							if math.random(0,100) >= 18 then -- шанс 18% что просто пропадёт с корабля после того как сбежит в корпус
								Hyperspace.playerVariables['alien_count_inside_hull'] = Hyperspace.playerVariables['alien_count_inside_hull'] + 1.0
							end
							local px2 = gui.shipPosition.x + crew.x - 17
							local py2 = gui.shipPosition.y + crew.y - 17
							table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("people/alien_gone.png"), time_length = 1000.0, time_length_mem = 1000.0, x = px2, y = py2, w=280, h=35, fw=35, fh=35, layer = "SPACE_STATUS"})
							
							local roomshape = GSIp:GetRoomShape(crew.iRoomId)
							varr.x_off, varr.y_off = GetXYOffsetsForSlotWH(crew.currentSlot.slotId, roomshape.w, roomshape.h)
							--print(varr.x_off..','..varr.y_off)
							-- прожигает дыру в отсеке ровно в той клетке где находится чужой
							playerShip.ship:BreachSpecificHull((roomshape.x//35)+varr.x_off, (roomshape.y//35)+varr.y_off)
							
							crew:Kill(true)
							-- local dam = Hyperspace.Damage()
							-- dam.breachChance = 10--когда прячется оставляет в текущей комнате пробоину
							-- playerShip:DamageArea(playerShip:GetRoomCenter(crew.iRoomId), dam, true)
							-- Hyperspace.Sounds:PlaySoundMix('alien_wounded', 8, false)
						end
					end
				elseif crew.blueprint.name == "osa" or crew.blueprint.name == "osae" then
					-- блок ИИ осы на корабле игрока
					local TS = crew.blueprint.crewNameLong
					local changed = false
					TS.data, changed = MakeNameIfNeeded(TS.data, crew.blueprint.name, crew)
					if changed == true then
						crew:SetName(TS, true)
						--print('name changed!')
					end
					if crew.extend:GetDefinition().noAI == false then
						crew.extend:GetDefinition().noAI = true --полностью забираем контроль над осами в луа
					end
					-- если видит цель в своём отсеке первым приоритетом атакует её
					if crew.fStunTime <= 0.0 then
						local bTargetInMyRoom = false
						for crewww in vter2(playerShip.vCrewList) do
							if crewww ~= crew and crew.iRoomId == crewww.iRoomId then
								if crewww.health.first > 0.0 then
									if crewww.intruder ~= crew.intruder or crewww.bMindControlled == true then
										bTargetInMyRoom = true
									end
								end
							end
						end
						if bTargetInMyRoom == true and math.random(0,1000)<8 then -- чтобы не в первый тик реагировала
							if crew.extend.crewPowers[0].enabled then
								crew.extend.crewPowers[0].powerCooldown.first = crew.extend.crewPowers[0].powerCooldown.second
								--crew.extend.crewPowers[0].powerCooldown.first) < 2.0 then
							end
							if crew.extend.crewPowers[1].enabled then
								crew.extend.crewPowers[1].powerCooldown.first = crew.extend.crewPowers[1].powerCooldown.second
							end
						end
					end
					--print (varr.micro_tick_counter9)
					if crew.extend:GetDefinition().canMove == true then
						if crew.iOnFire > 0 then --этот блок даёт команду на бегство в другую комнату (без пожара), если в текущей пожар
							if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
								crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
								if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then -- дошла до цели
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
								if playerShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then -- целевая комната горит
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							elseif GSIp then
								varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
								if playerShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then -- проверка горит ли целевая комната
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif playerShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then -- проверка есть ли место в целевой комнате
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							end
						else
							if varr.micro_tick_counter9 < 80000 and crew.health.first > 10.0 then --нормальный режим ос
								--print('targ'..varr.universal_iRoom_targ[crew.extend.selfId])
								if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
									crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
									if playerShip:GetSystemInRoom(crew.iRoomId) == nil then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									elseif crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then -- дошла до цели
										varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
									end
								else
									if playerShip:GetSystemInRoom(crew.iRoomId) == nil then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									else
										varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
									end
								end
							else --режим бесилова по кораблю.
								--print('targ-free'..varr.universal_iRoom_targ[crew.extend.selfId])
								if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
									crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
									if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then -- дошла до цели
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									end
								else
									if math.random(0,10000)<11 then
										varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
										--print('belka ukusila'..varr.universal_iRoom_targ[crew.extend.selfId])
									end
								end
							end
						end
					end
				elseif crew.blueprint.name:find("magman") ~= nil then -- новый ИИ магменов на корабле игрока
					if crew.intruder == true then
						if crew.blueprint.name == "magman_b" then--cold
							crew:ActivatePower()
							--print('cold-->hot')
						end
						if crew.health.first < 28.0 and playerShip:GetFireCount(crew.iRoomId) == 0 then
							if playerShip:GetSystem(8) == nil or playerShip:GetSystem(8).powerState.first < 2 then
								-- if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
									-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
								-- end
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
					end
				elseif crew.blueprint.name:find("biopreserver") ~= nil then -- новый ИИ биохранителей
					if Hyperspace.metaVariables['enable_auto_drone_work'] == 1 then
						if crew.health.first + 10 < crew.health.second then
							crew.extend:GetDefinition().noAI = false
						else
							crew.extend:GetDefinition().noAI = true -- новый фиксатор позиции
						end
						if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
							if GSIp then
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
												elseif (path_length1 + 150.0) < path_length2 then
													varr.universal_iRoom_targ[crew2.extend.selfId] = -1
												else
													inroomsoonpreserver = true
												end
											end
										end
									end
								end
								if inroomsoonpreserver == true then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							end
						end
					end
				elseif crew.blueprint:GetNameShort() == 'Ионный абордажник' or crew.blueprint.name == 'boarder_ionfire' then --именно такое обращение чтобы вычленить именно этот тип абордажника, спасибо subset'ам видимо
					-- отдельный ИИ для него, т.к. он бывало залипал в отсеке, теперь любит погулять по кораблю игрока...
					if crew.intruder == true and crew.crewAnim.bPlayer == false and GSIp ~= nil then
						-- if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
							-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
						-- end
						if crew.extend:GetDefinition().noAI == false then
							crew.extend:GetDefinition().noAI = true--полностью отбираем у этого дрона родной ИИ
						end
						if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
							crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
							if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then
								varr.universal_iRoom_targ[crew.extend.selfId] = -1
							end
							local sysy = playerShip:GetSystemInRoom(crew.iRoomId)
							if sysy ~= nil and (sysy:GetLocked() == false and sysy:CompletelyDestroyed()==false) then
								varr.universal_iRoom_targ[crew.extend.selfId] = crew.iRoomId
							end
						else
							local sysy = playerShip:GetSystemInRoom(crew.iRoomId)
							if (sysy ~= nil and ((sysy.iLockCount > 2 and varr.micro_tick_counter22 > 1800.0) or sysy:CompletelyDestroyed() == true)) or sysy == nil then
								varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
								if playerShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]) == nil then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif playerShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]):CompletelyDestroyed()==true then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif playerShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]):GetLocked() == true then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif playerShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
								--print('new targ'..varr.universal_iRoom_targ[crew.extend.selfId])
							end
						end
					end
				elseif crew.blueprint.name == "depleter" then
					if crew.intruder == true and crew.crewAnim.bPlayer == false and GSIp ~= nil then
						if crew.extend:GetDefinition().noAI == false then
							crew.extend:GetDefinition().noAI = true --полностью забираем контроль над этим дроном в луа
						end
						--print(crew.blueprint.name)
						-- if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
							-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
						-- end
						if varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
							crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
							if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then
								varr.universal_iRoom_targ[crew.extend.selfId] = -1
							end
						else
							local bFightttttt = false
							for crew2 in vter2(playerShip.vCrewList) do
								if crew ~= crew2 and crew2.iRoomId == crew.iRoomId and crew2.intruder == false and crew2:CanFight() == true then
									bFightttttt = true
								end
							end
							local sysy = playerShip:GetSystemInRoom(crew.iRoomId)
							
							
							if math.random(0,2500)<1 then
								--print('misli drona: zasku4al ya 4to to mozhet poidu pogulyau?')
								bFightttttt = true
							end
							--print(tostring(crew:CheckFighting()))
							if bFightttttt == true or sysy == nil or (sysy ~= nil and (sysy:GetLocked() == true or sysy:CompletelyDestroyed() == true)) then -- or Hyperspace.ShipSystem.IsSubsystem(sysy:GetId()) == true)) then
								
								varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
								if playerShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]) == nil then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif playerShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]):CompletelyDestroyed()==true then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								elseif playerShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then
									varr.universal_iRoom_targ[crew.extend.selfId] = -1
								end
							end
						end
					end
				elseif crew.blueprint.name == "gus" or crew.blueprint.name == "gusq" then
					-- блок ИИ гусеницы
					--print('targ='..varr.universal_iRoom_targ)
					-- if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
						-- varr.universal_iRoom_targ[crew.extend.selfId] = -1
					-- end
					
					if crew.iOnFire > 0 or crew.bSuffocating == true then --этот блок даёт команду на бегство в другую комнату (без пожара), если в текущей пожар
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
								elseif GSIp:GetRoomOxygen(varr.universal_iRoom_targ[crew.extend.selfId]) < 10.0 then
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
									for crewww in vter2(playerShip.vCrewList) do
										if crewww ~= crew and crewww.intruder == false and crew.iRoomId == crewww.iRoomId and crewww.bMindControlled == true then
											--print('in my room mindcontrolled ass')
											varr.micro_tick_counter9 = 81000
										end
									end
								elseif GSIp then
									varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
									if playerShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then -- проверка горит ли комната
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									elseif playerShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then -- проверка есть ли место в комнате
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									end
								end
							elseif varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
								crew:MoveToRoom(varr.universal_iRoom_targ[crew.extend.selfId], 0, false)
								if varr.micro_tick_counter9 < 80000 then
									if crew.iRoomId == varr.universal_iRoom_targ[crew.extend.selfId] then
										--if playerShip:GetSystemInRoom(varr.universal_iRoom_targ[crew.extend.selfId]) ~= nil then
											if GSIp then
												varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
											end
										--end
									end
								end
							else
								if GSIp then
									varr.universal_iRoom_targ[crew.extend.selfId] = math.random(0, GSIp:RoomCount() - 1)
									if playerShip:GetFireCount(varr.universal_iRoom_targ[crew.extend.selfId]) > 0 then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									elseif playerShip.ship:FullRoom(varr.universal_iRoom_targ[crew.extend.selfId], crew.intruder) == true then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									elseif varr.micro_tick_counter9 < 80000 then
										varr.universal_iRoom_targ[crew.extend.selfId] = -1
									end
								end
							end
						end
					end
				end
								
				if crew.intruder == false and crew:IsDrone()==false then
					if (crew.extend:CalculateStat(Hyperspace.CrewStat.SUFFOCATION_MODIFIER) > 0.2 and crew.health.first < 75.0) or crew.health.first < 30.0 then
						if varr.universal_iRoom_neededheal[crew.iRoomId] == nil then
							varr.universal_iRoom_neededheal[crew.iRoomId] = 0.0
						end
						varr.universal_iRoom_neededheal[crew.iRoomId] = varr.universal_iRoom_neededheal[crew.iRoomId] + 2.0
						if varr.universal_iRoom_neededheal[crew.iRoomId] > 5.0 then
							varr.universal_iRoom_neededheal[crew.iRoomId] = 5.0
						end
					end
					varr.count_of_crew = varr.count_of_crew + 1
				end
			end
			
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				local found_conditions = false
				if Hyperspace.playerVariables['ritual_is_done'] == 0 then
					if varr.count_of_crew >= 5 then
						for crew in vter(playerShip.vCrewList) do		
							--if crew.blueprint.name == "keeper" then
							if found_conditions == false then
								varr.kx = crew:GetPosition().x
								varr.ky = crew:GetPosition().y
								if thereIsCrewAtPosition(varr.kx + 70.0, varr.ky - 35.0, "any") == true and
									thereIsCrewAtPosition(varr.kx + 140.0, varr.ky, "any") == true and
									thereIsCrewAtPosition(varr.kx + 35.0, varr.ky + 105.0, "any") == true and
									thereIsCrewAtPosition(varr.kx + 105.0, varr.ky + 105.0, "any") == true then
									varr.pentagram_progress = varr.pentagram_progress + 1.2*Hyperspace.FPS.SpeedFactor --was 1.5
									found_conditions = true
									varr.pentagram_x = varr.kx
									varr.pentagram_y = varr.ky
									if math.random(0,100)<4 then
										Hyperspace.Sounds:PlaySoundMix('rockStomp1', 4, false)
									end
								end
							end
						end
					end
				end
				if found_conditions == false then
					--varr.pentagram_progress = 0.0
					varr.pentagram_progress = varr.pentagram_progress - 1.2*Hyperspace.FPS.SpeedFactor --was 1.5
					if varr.pentagram_progress < 0.0 then
						varr.pentagram_progress = 0.0
					end
				end
			end
		end
		
		
		
		if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			varr.micro_tick_counter = varr.micro_tick_counter + 60.0*Hyperspace.FPS.SpeedFactor
		end
		if varr.micro_tick_counter >= 11500.0 then
			if Hyperspace.playerVariables['alien_appear_on_this_beacon'] == 0 and Hyperspace.playerVariables['alien_count_inside_hull'] > 0 then
				if math.random(0,100)<66 then
					if gui and not gui.event_pause then
						if (enemyShip and enemyShip:HasSystem(9) == false) or enemyShip == nil then
							if ThereIsAtLeastOneNoAlienEnemyBoarderOnPlayerShip() == false then
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
			end
			varr.micro_tick_counter = math.random(0,3000)
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
				varr.micro_tick_counter5 = 0.0
			end
			varr.micro_tick_counter5 = varr.micro_tick_counter5 + 60.0*Hyperspace.FPS.SpeedFactor
			--print(varr.micro_tick_counter5)
			if varr.micro_tick_counter5 >= 14000.0 and varr.micro_tick_counter5 <= 14090.0 then
				varr.micro_tick_counter5 = 14191.0
				Hyperspace.Sounds:PlaySoundMix('jumpLeave', 4, false)--jumpLeave--jumpArrive
				varr.orchid_fleet_x = math.random(20, 200)
				varr.orchid_fleet_y = math.random(115, 550)
				table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("effects/ship_arrives.png"), time_length = 400.0, time_length_mem = 400.0, x = varr.orchid_fleet_x+10, y = varr.orchid_fleet_y-10, w=1500, h=128, fw=150, fh=128, layer = "LAYER_BACKGROUND"})
			end
			if varr.micro_tick_counter5 >= 14400.0 and varr.micro_tick_counter5 <= 14490.0 then
				varr.micro_tick_counter5 = 14491.0
				Hyperspace.playerVariables['bShowOrchidFleet'] = 1
			end
			if varr.micro_tick_counter5 >= 25900.0 and varr.micro_tick_counter5 <= 25990.0 then
				varr.micro_tick_counter5 = 25991.0
				Hyperspace.Sounds:PlaySoundMix('warning', 5, false)
				table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("effects/fleet_1_orchid_warning.png"), time_length = 3000.0, time_length_mem = 3000.0, x = varr.orchid_fleet_x-30, y = varr.orchid_fleet_y-40, w=1500, h=150, fw=250, fh=150, layer = "SPACE_STATUS"})
			end
			if varr.micro_tick_counter5 >= 30000.0 and varr.micro_tick_counter5 <= 30090.0 then
				varr.micro_tick_counter5 = 30091.0
				if playerShip then
					Hyperspace.Sounds:PlaySoundMix('bombTeleport', 8, false)
					Hyperspace.App.world.space:CreateBomb(Hyperspace.Blueprints:GetWeaponBlueprint('BA_BOMB_CLUSTER_1'), 1, playerShip:GetRandomRoomCenter(), 0)
				end
			end
			if varr.micro_tick_counter5 >= 31000.0 and varr.micro_tick_counter5 <= 31090.0 then
				varr.micro_tick_counter5 = 31091.0
				if playerShip then
					Hyperspace.Sounds:PlaySoundMix('bombTeleport', 8, false)
					Hyperspace.App.world.space:CreateBomb(Hyperspace.Blueprints:GetWeaponBlueprint('BA_BOMB_CLUSTER_1'), 1, playerShip:GetRandomRoomCenter(), 0)
				end
			end
			if varr.micro_tick_counter5 >= 32000.0 then
				varr.micro_tick_counter5 = math.random(14600, 17600)--кулдаун плавающий, мне кажется так веселее
				if playerShip then
					Hyperspace.Sounds:PlaySoundMix('bombTeleport', 8, false)
					Hyperspace.App.world.space:CreateBomb(Hyperspace.Blueprints:GetWeaponBlueprint('BA_BOMB_CLUSTER_1'), 1, playerShip:GetRandomRoomCenter(), 0)
				end
			end
		end
	end
	
	if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
		if varr.micro_tick_counter6 > 0.0 then
			varr.micro_tick_counter6 = varr.micro_tick_counter6 - 60.0*Hyperspace.FPS.SpeedFactor -- отдельный счётчик, чтобы ограничить надписи общения живого говорящего орудия
		end
		
		if varr.micro_tick_counter7 > 0.0 then
			varr.micro_tick_counter7 = varr.micro_tick_counter7 - 60.0*Hyperspace.FPS.SpeedFactor -- отдельный счётчик, чтобы вызывать возгорания на кораблях от усиления
		end
	end
	
	
end
script.on_internal_event(Defines.InternalEvents.ON_TICK, check_arsenal_on_tick_processes)





function MakeNameIfNeeded(str_inp, type_of_crew, crew_crew)
	if type_of_crew == "osa" or type_of_crew == "osae" then
		local found = false
		for i = 1, #varr.osa_names do
			if str_inp == varr.osa_names[i] then
				found = true
				return str_inp, false -- false значит не изменено имя
			end
		end
		if found == false then
			str_inp = varr.osa_names[math.random(1, #varr.osa_names)]
			return str_inp, true -- true значит изменено имя
		end
	end
	return str_inp, false
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
			--playerShip2:AddCrewMemberFromString("Чужой", "alien", true, iRoom_to_spawn_arr[i], true, true)--вызов именно такой, т.к. иначе чужим выдаёт имена...
			playerShip2:AddCrewMemberFromString(Hyperspace.Text:GetText('lua_alien'), "alien", true, iRoom_to_spawn_arr[i], true, true)--вызов именно такой, т.к. иначе чужим выдаёт имена...
		end
		Hyperspace.playerVariables['alien_count_inside_hull'] = 0.0
	end
end
function spawn_an_alien() --первичный спаун на корабле без пробоины
	local GSIp2 = Hyperspace.ShipGraph.GetShipInfo(0)
	if GSIp2 then
		iRoom_to_spawn = math.random(0, GSIp2:RoomCount() - 1)
		--Hyperspace.ships.player:AddCrewMemberFromString("Чужой", "alien", true, iRoom_to_spawn, true, true)
		Hyperspace.ships.player:AddCrewMemberFromString(Hyperspace.Text:GetText('lua_alien'), "alien", true, iRoom_to_spawn, true, true)
		Hyperspace.Sounds:PlaySoundMix('alien_appears', 8, false)
	end
end
script.on_game_event("SPAWN_AN_ALIEN", false, spawn_an_alien)


function one_egg()
	local GSIp2 = Hyperspace.ShipGraph.GetShipInfo(0)
	if GSIp2 and playerShip then
		local antifreez22 = 0
		local newiRoom_to_spawn = GetRoomAtLocation(playerShip, playerShip:GetRandomRoomCenter(), true)
		while playerShip:GetSystemInRoom(newiRoom_to_spawn) ~= nil and antifreez22 < 25 do
			--newiRoom_to_spawn = math.random(0, GSIp2:RoomCount() - 1)
			newiRoom_to_spawn = GetRoomAtLocation(playerShip, playerShip:GetRandomRoomCenter(), true)
			antifreez22 = antifreez22 + 1
		end
		playerShip:AddCrewMemberFromString('', 'egg', false, newiRoom_to_spawn, false, true)
		Hyperspace.Sounds:PlaySoundMix('egg_appears', 10, false)
	end
end
script.on_game_event("ONE_EGG", false, one_egg)


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
			if Hyperspace.App.menu.shipBuilder.bOpen == true or Hyperspace.App.menu.bOpen == true or Hyperspace.App.gui.event_pause == true then
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
    local vCrewList = shipMgr.vCrewList
    for i = 0, vCrewList:size() - 1 do
        local crew = vCrewList[i]
        local sys = crew.currentSystem
		-- теперь нужен постоянный сброс принудительной анимации в дефолт состояние.
        crew.crewAnim.forcedAnimation = -1
		crew.crewAnim.forcedDirection = -1
		if sys and sys.iSystemType == 11 and (sys.iActiveManned < 1 or shipMgr.bAutomated == true) and sys.iHackEffect <= 0 then
            if crew.health.first > 0.0 then
				if shipMgr.iShipId == 0 then
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
end


function weaponFireBoost(shipppyx)
	local wsys = shipppyx.weaponSystem
	if wsys then
		for pf in vter13(wsys.weapons) do
			if pf.powered == true and wsys.iHackEffect == 0 then
				local safeMaxCooldown2 = pf.cooldown.second - 0.001
				if safeMaxCooldown2 > 0 and pf.cooldown.first < safeMaxCooldown2 then
					pf.cooldown.first = math.min(math.max(pf.cooldown.first + 0.044 * Hyperspace.FPS.SpeedFactor, 0), safeMaxCooldown2)
					--print(pf.blueprint.name..'-boosted!')
				end
			end
		end
	end
end


-- что это за мусор снизу и зачем он?...
-- вызовов этих функций я не нашёл, временно закомментирую...
-- local TextMeta = {
    -- __index = function(texts)
        -- return texts['']
    -- end,
    -- __call = function(texts)
        -- return texts[Hyperspace.Settings.language]
    -- end
-- }
-- local function Text(texts)
    -- setmetatable(texts, TextMeta)
    -- return texts
-- end



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
					if varr.allowed_hack_explosion_on_cooldown == true then
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

script.on_render_event(Defines.RenderEvents.SHIP_STATUS, function() end, function()--над слоем UI хп корабля
	if Hyperspace.metaVariables['challenge_nohull'] == 1 then
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(130, 15)
		Graphics.CSurface.GL_RenderPrimitive(varr.nohull_locking)
		Graphics.CSurface.GL_PopMatrix()
	end
end)

script.on_render_event(Defines.RenderEvents.SPACE_STATUS, function() end, function(ship)--GUI_CONTAINER
	varr.prepare_to_explode_hack = false
	varr.prepare_to_switch_auto_drone_work = false
	varr.prepare_to_cancel_mind = false
	
	
	
	
	
	--Hyperspace.TutorialArrow(Hyperspace.Pointf(100.0,math.random(-200.0,200.0)), 0.0)
	
	
	if Hyperspace.FPS.speedEnabled == false then
		Graphics.CSurface.GL_SetColor(Graphics.GL_Color(0.9, 0.9, 0.9, 1))
		--Graphics.freetype.easy_print(10, 620, 6, 'Ускорение отключено. Чтобы включить, нажмите `')
		Graphics.freetype.easy_print(10, 620, 6, Hyperspace.Text:GetText('lua_speed_disabled'))
	end
	
	--gui = Hyperspace.App.gui
	--playerShip = Hyperspace.ships.player
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
			
			varr.button_arty_ready = -1
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
				
				
				--кнопки переключения автоматизации артиллерии
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(92 + varr.x_offset_of_tips_artillery_system + i*36, 688)
				if mouseInside({x = 92 + varr.x_offset_of_tips_artillery_system + i*36, y = 688, w = 17, h = 15}) then
					Graphics.CSurface.GL_RenderPrimitive(varr.button_autoarty_select2)
					varr.button_arty_ready = i
					if varr.artillery_auto_controllers[i] == true then
						Hyperspace.Mouse:InstantTooltip()
						Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_arty_tip_auto'))
					else
						Hyperspace.Mouse:InstantTooltip()
						Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_arty_tip_hand'))
					end
				else
					if varr.artillery_auto_controllers[i] == true then
						Graphics.CSurface.GL_RenderPrimitive(varr.button_autoarty_on)
					else
						Graphics.CSurface.GL_RenderPrimitive(varr.button_autoarty_off)
					end
				end
				Graphics.CSurface.GL_PopMatrix()
				
				
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
								--collected_tip_art_text = collected_tip_art_text..'\n\nУправляется экипажем: перезарядка быстрее на 25%'
								collected_tip_art_text = collected_tip_art_text..'\n\n'..Hyperspace.Text:GetText('lua_controlled_by_crew')
							else
								collected_tip_art_text = collected_tip_art_text..'\n\n'..Hyperspace.Text:GetText('lua_notcontrolled_by_crew')
							end
						end
					end
					Hyperspace.Mouse:SetTooltip(collected_tip_art_text)
				end
			end
			
			
			if playerShip.artillerySystems:size() > 0 then
				varr.x_offset_of_tips_artillery_system = varr.x_offset_of_tips_artillery_system + 36*playerShip.artillerySystems:size()
			end
			
			if playerShip:HasSystem(14) then --mindcontrol
				-- позволяет отменять контроль разума			
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(100 + varr.x_offset_of_tips_artillery_system, 665)
				if thereIsAtLeastOneMindcontrolledEnemy() then
					if mouseInside({x = 106 + varr.x_offset_of_tips_artillery_system, y = 671, w = 22, h = 22}) and gui and gui.menu_pause == false then
						Graphics.CSurface.GL_RenderPrimitive(button_dehack_select2)
						Hyperspace.Mouse:InstantTooltip()
						--Hyperspace.Mouse:SetTooltip('Отменить действие контроля разума.')
						Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_cancel_mindcontrol'))
						varr.prepare_to_cancel_mind = true
					else
						Graphics.CSurface.GL_RenderPrimitive(button_dehack_on)
					end
				else
					Graphics.CSurface.GL_RenderPrimitive(button_dehack_off)
					if mouseInside({x = 106 + varr.x_offset_of_tips_artillery_system, y = 671, w = 22, h = 22}) and gui and gui.menu_pause == false then
						Hyperspace.Mouse:InstantTooltip()
						--Hyperspace.Mouse:SetTooltip('Сейчас нельзя отменить действие контроля разума.')
						Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_nocancel_mindcontrol'))
					end
				end
				Graphics.CSurface.GL_PopMatrix()
				
				varr.x_offset_of_tips_artillery_system = varr.x_offset_of_tips_artillery_system + 54
			end
			
			varr.x_offset_of_tips_drone_system = varr.x_offset_of_tips_artillery_system
			if playerShip.hackingSystem then
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(100 + varr.x_offset_of_tips_artillery_system, 665)
				if hackDroneCanBeDestroyed() then
					if mouseInside({x = 106 + varr.x_offset_of_tips_artillery_system, y = 671, w = 22, h = 22}) and gui and gui.menu_pause == false then
						Graphics.CSurface.GL_RenderPrimitive(button_dehack_select2)
						Hyperspace.Mouse:InstantTooltip()
						--Hyperspace.Mouse:SetTooltip('Подорвать свой дрон-взломщик.')
						Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_explode_hackdrone'))
						varr.prepare_to_explode_hack = true
					else
						Graphics.CSurface.GL_RenderPrimitive(button_dehack_on)
					end
				else
					Graphics.CSurface.GL_RenderPrimitive(button_dehack_off)
					if mouseInside({x = 106 + varr.x_offset_of_tips_artillery_system, y = 671, w = 22, h = 22}) and gui and gui.menu_pause == false then
						Hyperspace.Mouse:InstantTooltip()
						--Hyperspace.Mouse:SetTooltip('Сейчас нельзя подорвать свой дрон-взломщик.')
						Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_notexplode_hackdrone'))
					end
				end
				Graphics.CSurface.GL_PopMatrix()
				
				varr.x_offset_of_tips_drone_system = varr.x_offset_of_tips_drone_system + 54
			end
			
			if playerShip:HasSystem(20) then
				varr.x_offset_of_tips_drone_system = varr.x_offset_of_tips_drone_system + 54
			end
			
			if playerShip:HasSystem(3) then --weapons system
				-- блок кода даёт отображение количества выстреливаемых снарядов рядом с панелью орудий
				local i_nnn = 0
				for pf in vter2(playerShip.weaponSystem.weapons) do
					local numynumy = -1
					if pf.blueprint.typeName ~= "BEAM" and pf.blueprint.typeName ~= "BURST" then
						-- if pf.blueprint.name:find("SOULREAPER") ~= nil then
							-- numynumy = Hyperspace.playerVariables['soulreaper_shots']
						-- else
						if pf.blueprint.chargeLevels > 1 then
							numynumy = pf.blueprint.chargeLevels
						else
							numynumy = pf.numShots
						end
					elseif pf.blueprint.typeName == "BURST" then
						if varr.full_list_of_burst_weapon_proj_count[pf.blueprint.name] ~= nil then
							if varr.full_list_of_burst_weapon_proj_count[pf.blueprint.name] > 0 then
								numynumy = varr.full_list_of_burst_weapon_proj_count[pf.blueprint.name]
							end
						end
					end
					if numynumy > 0 then
						if pf.blueprint.typeName == "BURST" and pf.blueprint.chargeLevels > 1 then
							numynumy = numynumy*pf.blueprint.chargeLevels
						end
						
						local width_sqrt = 11
						if numynumy < 10 then
							width_sqrt = 11
						elseif numynumy < 100 then
							width_sqrt = 16
						else
							width_sqrt = 21
						end
						local str_oooo = tostring(math.floor(numynumy))
						if pf.blueprint.chargeLevels > 1 then
							width_sqrt = width_sqrt+4
							if pf.blueprint.typeName == "BURST" then
								str_oooo = tostring(math.floor(pf.chargeLevel*varr.full_list_of_burst_weapon_proj_count[pf.blueprint.name]))..'/'..str_oooo
								if pf.chargeLevel*varr.full_list_of_burst_weapon_proj_count[pf.blueprint.name] < 10 then
									width_sqrt = width_sqrt+8
								elseif pf.chargeLevel*varr.full_list_of_burst_weapon_proj_count[pf.blueprint.name] < 100 then
									width_sqrt = width_sqrt+13
								else
									width_sqrt = width_sqrt+18
								end
							else
								str_oooo = tostring(math.floor(pf.chargeLevel))..'/'..str_oooo
								if pf.chargeLevel < 10 then
									width_sqrt = width_sqrt+8
								elseif pf.chargeLevel < 100 then
									width_sqrt = width_sqrt+13
								else
									width_sqrt = width_sqrt+18
								end
							end
						end
						if pf.powered == true then-- -126
							Graphics.CSurface.GL_PushMatrix()
							Graphics.CSurface.GL_Translate(varr.x_offset_of_tips_drone_system + 106 + 97*i_nnn, 604)
							Graphics.CSurface.GL_RenderPrimitiveWithAlpha(varr.icon_proj, 1.0)
							Graphics.CSurface.GL_PopMatrix()
							
							Graphics.CSurface.GL_DrawRectOutline(varr.x_offset_of_tips_drone_system + 110 + 97*i_nnn, 604, width_sqrt, 11, varr.color_cyanbezh, 1)
							Graphics.freetype.easy_print(6, varr.x_offset_of_tips_drone_system + 113 + 97*i_nnn, 601, '[style[color:FFFFFFDD]]'..str_oooo..'[[/style]]')
						else
							Graphics.CSurface.GL_PushMatrix()
							Graphics.CSurface.GL_Translate(varr.x_offset_of_tips_drone_system + 106 + 97*i_nnn, 604)
							Graphics.CSurface.GL_RenderPrimitiveWithAlpha(varr.icon_proj, 0.5)
							Graphics.CSurface.GL_PopMatrix()
							
							Graphics.CSurface.GL_DrawRectOutline(varr.x_offset_of_tips_drone_system + 110 + 97*i_nnn, 604, width_sqrt, 11, varr.color_gray, 1)
							Graphics.freetype.easy_print(6, varr.x_offset_of_tips_drone_system + 113 + 97*i_nnn, 601, '[style[color:A0A0A0AA]]'..str_oooo..'[[/style]]')
						end
					end
					i_nnn = i_nnn + 1
				end
				
				
				
				
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
						-- if Hyperspace.metaVariables['enable_auto_drone_work'] == 1 then
							-- Hyperspace.Mouse:SetTooltip('Переключить режим корабельных дронов.\nСейчас: [style[color:33FF33FF]]Автоматический[[/style]]')
						-- else
							-- Hyperspace.Mouse:SetTooltip('Переключить режим корабельных дронов.\nСейчас: [style[color:FFFF33FF]]Ручной[[/style]]')
						-- end
						if Hyperspace.metaVariables['enable_auto_drone_work'] == 1 then
							Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_switch_dronemode_on'))
						else
							Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_switch_dronemode_off'))
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
		end
		
		if Hyperspace.playerVariables['_aimable_enable_drones'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(852, 573)
			if mouseInside({x = 852, y = 573, w = 25, h = 25}) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_tip_aim_drones'))
				Graphics.CSurface.GL_RenderPrimitive(varr.button_aimtip_select2)
			else
				Graphics.CSurface.GL_RenderPrimitive(varr.button_aimtip_on)
			end
			Graphics.CSurface.GL_PopMatrix()
		end
		
		-- подрисовывает иконку SOS-корабль/станция для особых ивентов с двойной наградой
		if Hyperspace.playerVariables['double_reward_event_ship'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(SOSTipBox.x, SOSTipBox.y)--(332, 50)
			Graphics.CSurface.GL_RenderPrimitive(save_a_ship)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(SOSTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip('Кораблю поблизости требуется помощь.')
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_needed_help_ship'))
			end
		elseif Hyperspace.playerVariables['double_reward_event_station'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(SOSTipBox.x, SOSTipBox.y)--(332, 50)
			Graphics.CSurface.GL_RenderPrimitive(save_a_station)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(SOSTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip('Станции или поселению поблизости требуется помощь.')
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_needed_help_station'))
			end		
		end
		
		if Hyperspace.metaVariables['enemy_has_advanced_ai'] == 1 and gui then
			--if Hyperspace.Global.GetInstance():GetCApp().gui.combatControl.boss_visual == false then
				if enemyShip and enemyShip.ship.hullIntegrity.first > 0 and enemyShip.bJumping == false then
					if playerShip and playerShip.bJumping == false then
						Graphics.CSurface.GL_PushMatrix()
						if Hyperspace.Global.GetInstance():GetCApp().gui.combatControl.boss_visual == true then
							Graphics.CSurface.GL_Translate(varr.smart_enemyBox.x-7, varr.smart_enemyBox.y-66)
							if mouseInside({x = varr.smart_enemyBox.x-7, y = varr.smart_enemyBox.y-66, w = varr.smart_enemyBox.w, h = varr.smart_enemyBox.h}) and gui.menu_pause == false then
								Hyperspace.Mouse:InstantTooltip()
								Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_advanced_ai'))
							end
						else
							Graphics.CSurface.GL_Translate(varr.smart_enemyBox.x, varr.smart_enemyBox.y)
							if mouseInside(varr.smart_enemyBox) and gui.menu_pause == false then
								Hyperspace.Mouse:InstantTooltip()
								Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_advanced_ai'))
							end
						end
						Graphics.CSurface.GL_RenderPrimitive(varr.smart_enemy)
						Graphics.CSurface.GL_PopMatrix()
						
					end
				end
			--end
		end
		
		-- подрисовывает иконку проклятости текущего забега
		if Hyperspace.playerVariables['curse_player_missing'] >= 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(CurseTipBox.x, CurseTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(curse_player_missing)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(CurseTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip('Ваши орудия прокляты. Шанс попадания снижен на 50%. Осталось маяков: '..math.floor(Hyperspace.playerVariables['curse_player_missing']))
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_curse_player_missing')..' '..math.floor(Hyperspace.playerVariables['curse_player_missing']))
			end	
		elseif Hyperspace.playerVariables['curse_enemy_hitting'] >= 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(CurseTipBox.x, CurseTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(curse_enemy_hitting)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(CurseTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip('Ваш корабль проклят. Шанс уклонения снижен на 50%. Осталось маяков: '..math.floor(Hyperspace.playerVariables['curse_enemy_hitting']))
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_curse_enemy_hitting')..' '..math.floor(Hyperspace.playerVariables['curse_enemy_hitting']))
			end	
		elseif Hyperspace.playerVariables['curse_enemy_firing'] >= 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(CurseTipBox.x, CurseTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(curse_enemy_firing)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(CurseTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip('Любой снаряд врага, который имеет шанс поджога, вызовет поджог гарантированно. Осталось маяков: '..math.floor(Hyperspace.playerVariables['curse_enemy_firing']))
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_curse_enemy_firing')..' '..math.floor(Hyperspace.playerVariables['curse_enemy_firing']))
			end	
		elseif Hyperspace.playerVariables['curse_orchid_shase'] >= 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(CurseTipBox.x, CurseTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(curse_orchid_shase)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(CurseTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip('За вами устроил погоню фрегат орхидов. Осталось маяков: '..math.floor(Hyperspace.playerVariables['curse_orchid_shase']))
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_curse_orchid_shase')..' '..math.floor(Hyperspace.playerVariables['curse_orchid_shase']))
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
				--Hyperspace.Mouse:SetTooltip('Вы находитесь в очень холодном месте. Периодически отсеки корабля будут замерзать, а обшивка получать пробоины.')
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_danger_cold'))
			end
		elseif Hyperspace.playerVariables['danger_crystals'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(dangerTipBox.x, dangerTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(danger_crystals)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(dangerTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip('Вы находитесь в поле кристаллов. Периодически кристаллы будут попадать в ваш корабль. Кристаллы проникают через 1 слой щита.')
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_danger_crystals'))
			end		
		elseif Hyperspace.playerVariables['danger_nanites'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(dangerTipBox.x, dangerTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(danger_nanites)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(dangerTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip('Вы находитесь в облаке нанитов. Периодически системы корабля будут получать урон от эрозии.')
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_danger_nanites'))
			end		
		elseif Hyperspace.playerVariables['danger_radiation'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(dangerTipBox.x, dangerTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(danger_radiation)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(dangerTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip('Вы находитесь под воздействием мощного радиационного излучения. Оборудование справляется, но последствия для экипажа могут быть непредсказуемыми...')
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_danger_radiation'))
			end		
		elseif Hyperspace.playerVariables['danger_wild_drones'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(dangerTipBox.x, dangerTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(danger_wild_drones)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(dangerTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip('Вы находитесь рядом с группой диких дронов. Периодически они будут пытаться атаковать любые корабли поблизости.')
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_danger_wild_drones'))
			end		
		elseif Hyperspace.playerVariables['danger_ultra_sun'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(dangerTipBox.x, dangerTipBox.y)
			Graphics.CSurface.GL_RenderPrimitive(danger_ultra_sun)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside(dangerTipBox) and gui and gui.menu_pause == false then
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip('Вы находитесь под воздействием очень высоких температур. Возгорания на корабле практически неизбежны.')
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_danger_ultra_sun'))
			end		
		end
	end
	
	
	-- НИЖЕ МАССИВНЫЙ БЛОК ДУШЕГУБА
	mouse_inside_mem = -1
	if Hyperspace.playerVariables['soulreaper_in_slots'] > 0 and Hyperspace.metaVariables['enemy_state'] ~= 2 and gui and gui.upgradeButton.bActive == true then
		if enemyShip == nil or enemyShip._targetable.hostile == false then
			if isReallyDangerousEnvironment() == false then
				
				if Hyperspace.playerVariables['soulreaper_lvl'] == Hyperspace.playerVariables['soulreaper_capacity'] then
					if varr.micro_tick_counter22 > 1000.0 then
						Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
					else
						Graphics.CSurface.GL_SetColor(varr.color_green)
					end
				else
					Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
				end
				--Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
				Graphics.freetype.easy_printCenter(6, 1233, 603, tostring(math.floor(Hyperspace.playerVariables['soulreaper_lvl'])).." / "..tostring(math.floor(Hyperspace.playerVariables['soulreaper_capacity'])))
				
				
				Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
				-- визуал кнопки панели душегуба справа снизу
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(soulreaperTipBox.x-12, soulreaperTipBox.y-12)
				if Hyperspace.playerVariables['soulreaper_panel_opened'] == 1 then
					if mouseInside(soulreaperTipBox) and gui and gui.menu_pause == false then
						mouse_inside_mem = 999
						Hyperspace.Mouse:InstantTooltip()
						--Hyperspace.Mouse:SetTooltip('Вкл./выкл. панель управления Душегубом.')
						Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_onoff_soulreaper_panel'))
						Graphics.CSurface.GL_RenderPrimitive(soulreaper2_select2)
					else
						Graphics.CSurface.GL_RenderPrimitive(soulreaper2_on)
					end
					Graphics.CSurface.GL_PopMatrix()
				else
					if mouseInside(soulreaperTipBox) and gui and gui.menu_pause == false then
						mouse_inside_mem = 999
						Hyperspace.Mouse:InstantTooltip()
						--Hyperspace.Mouse:SetTooltip('Вкл./выкл. панель управления Душегубом.')
						Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_onoff_soulreaper_panel'))
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
				if Hyperspace.playerVariables['soulreaper_cooldown'] == 15 and current_count_of_soul < 5 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 13 and current_count_of_soul < 7 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 11 and current_count_of_soul < 8 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 9 and current_count_of_soul < 10 then
					arr_allowed_soulbuy[i] = 2
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 7 then
					arr_allowed_soulbuy[i] = 0
				end
				
				-- if Hyperspace.playerVariables['soulreaper_cooldown'] == 14 and current_count_of_soul < 5 then
					-- arr_allowed_soulbuy[i] = 2
				-- elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 12 and current_count_of_soul < 7 then
					-- arr_allowed_soulbuy[i] = 2
				-- elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 10 and current_count_of_soul < 10 then
					-- arr_allowed_soulbuy[i] = 2
				-- elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 8 then
					-- arr_allowed_soulbuy[i] = 0
				-- end
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
						--Hyperspace.Mouse:SetTooltip(sr_b[i].text_on.."\nДостигнут предел развития.")
						Hyperspace.Mouse:SetTooltip(sr_b[i].text_on..'\n'..Hyperspace.Text:GetText('lua_sr_up_limit'))
					else
						--Hyperspace.Mouse:SetTooltip(sr_b[i].text_on.."\nНе хватает душ.")
						Hyperspace.Mouse:SetTooltip(sr_b[i].text_on..'\n'..Hyperspace.Text:GetText('lua_sr_no_soul'))
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
		--soul_desc = soul_desc.."Это орудие пожирает души погибших кораблей. Должно быть в слоте орудий в момент взрыва (не работает в волне повстанцев). Нельзя улучшить инжекторами."
		soul_desc = soul_desc..Hyperspace.Text:GetText('lua_sr_desc')
		
		--soul_desc = soul_desc.."\n\nХарактеристики:\n"
		soul_desc = soul_desc..'\n\n'..Hyperspace.Text:GetText('lua_sr_charact')..'\n'
		
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
					--soul_desc = soul_desc.."Требует энергии: 2"
					soul_desc = soul_desc..Hyperspace.Text:GetText('lua_sr_req_pow')..' 2'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 1[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_power'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."Требует энергии: 1"
					soul_desc = soul_desc..Hyperspace.Text:GetText('lua_sr_req_pow')..' 1'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 0[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_power'] == 0 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 83, 23, varr.color_green)
					--soul_desc = soul_desc.."Не требует питания"
					soul_desc = soul_desc..Hyperspace.Text:GetText('lua_sr_noreq_pow')
				end
			elseif i == 2 then
				
				--5-7-8-10)Согласен на 15-13-11-9-7. ок. сделаю.
				if Hyperspace.playerVariables['soulreaper_cooldown'] == 15 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+43, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					
					-- Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					-- Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					-- Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."\nВремя зарядки: 15 сек."
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_cooldown')..' 15 '..Hyperspace.Text:GetText('lua_sr_sec')
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 13 сек.[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 13 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+43, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					
					-- Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					-- Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					-- Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."\nВремя зарядки: 13 сек."
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_cooldown')..' 13 '..Hyperspace.Text:GetText('lua_sr_sec')
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 11 сек.[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 11 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "8")
					
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					
					-- Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					-- Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					-- Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."\nВремя зарядки: 11 сек."
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_cooldown')..' 11 '..Hyperspace.Text:GetText('lua_sr_sec')
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 9 сек.[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 9 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "10")
					
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					
					-- Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					-- Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					-- Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."\nВремя зарядки: 9 сек."
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_cooldown')..' 9 '..Hyperspace.Text:GetText('lua_sr_sec')
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 7 сек.[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 7 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+129, sr_b[i].y+7, 40, 23, varr.color_green)
					
					
					-- Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					-- Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					-- Graphics.CSurface.GL_DrawRect(684+114, sr_b[i].y+7, 55, 23, varr.color_green)
					--soul_desc = soul_desc.."\nВремя зарядки: 7 сек."
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_cooldown')..' 7 '..Hyperspace.Text:GetText('lua_sr_sec')
				end
				
				
				-- if Hyperspace.playerVariables['soulreaper_cooldown'] == 14 then
					-- Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					-- Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					-- Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					-- Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					-- --soul_desc = soul_desc.."\nВремя зарядки: 14 сек."
					-- soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_cooldown')..' 14 '..Hyperspace.Text:GetText('lua_sr_sec')
					-- if mouse_inside_mem == i then
						-- soul_desc = soul_desc.."[style[color:00FF00FF]] >> 12 сек.[[/style]]"
					-- end
				-- elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 12 then
					-- Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					-- Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					-- Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					-- Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					-- --soul_desc = soul_desc.."\nВремя зарядки: 12 сек."
					-- soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_cooldown')..' 12 '..Hyperspace.Text:GetText('lua_sr_sec')
					-- if mouse_inside_mem == i then
						-- soul_desc = soul_desc.."[style[color:00FF00FF]] >> 10 сек.[[/style]]"
					-- end
				-- elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 10 then
					-- Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "10")
					-- Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					-- Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					-- Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					-- --soul_desc = soul_desc.."\nВремя зарядки: 10 сек."
					-- soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_cooldown')..' 10 '..Hyperspace.Text:GetText('lua_sr_sec')
					-- if mouse_inside_mem == i then
						-- soul_desc = soul_desc.."[style[color:00FF00FF]] >> 8 сек.[[/style]]"
					-- end
				-- elseif Hyperspace.playerVariables['soulreaper_cooldown'] == 8 then
					-- Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					-- Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					-- Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					-- Graphics.CSurface.GL_DrawRect(684+114, sr_b[i].y+7, 55, 23, varr.color_green)
					-- --soul_desc = soul_desc.."\nВремя зарядки: 8 сек."
					-- soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_cooldown')..' 8 '..Hyperspace.Text:GetText('lua_sr_sec')
				-- end
			elseif i == 3 then
				if Hyperspace.playerVariables['soulreaper_shots'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+43, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."\n\nВыстрелов за заряд: 1"
					soul_desc = soul_desc..'\n\n'..Hyperspace.Text:GetText('lua_sr_shots')..' 1'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 2[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_shots'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+43, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."\n\nВыстрелов за заряд: 2"
					soul_desc = soul_desc..'\n\n'..Hyperspace.Text:GetText('lua_sr_shots')..' 2'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 3[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_shots'] == 3 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."\n\nВыстрелов за заряд: 3"
					soul_desc = soul_desc..'\n\n'..Hyperspace.Text:GetText('lua_sr_shots')..' 3'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 4[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_shots'] == 4 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "10")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."\n\nВыстрелов за заряд: 4"
					soul_desc = soul_desc..'\n\n'..Hyperspace.Text:GetText('lua_sr_shots')..' 4'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 5[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_shots'] == 5 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+129, sr_b[i].y+7, 40, 23, varr.color_green)
					--soul_desc = soul_desc.."\n\nВыстрелов за заряд: 5"
					soul_desc = soul_desc..'\n\n'..Hyperspace.Text:GetText('lua_sr_shots')..' 5'
				end
			elseif i == 4 then
				if Hyperspace.playerVariables['soulreaper_iDamage'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."\n\nУрон по корпусу: 1"
					soul_desc = soul_desc..'\n\n'..Hyperspace.Text:GetText('lua_sr_damagehull')..' 1'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 2[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iDamage'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "10")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."\n\nУрон по корпусу: 2"
					soul_desc = soul_desc..'\n\n'..Hyperspace.Text:GetText('lua_sr_damagehull')..' 2'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 3[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iDamage'] == 3 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 83, 23, varr.color_green)
					--soul_desc = soul_desc.."\n\nУрон по корпусу: 3"
					soul_desc = soul_desc..'\n\n'..Hyperspace.Text:GetText('lua_sr_damagehull')..' 3'
				end
			elseif i == 5 then
				if Hyperspace.playerVariables['soulreaper_iSystemDamage'] == 0 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					local sysdam = tonumber(Hyperspace.playerVariables['soulreaper_iDamage'])
					--soul_desc = soul_desc.."\nУрон по системам: "..math.floor(sysdam)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_damagesys')..' '..math.floor(sysdam)
					if mouse_inside_mem == i or (mouse_inside_mem == 4 and arr_allowed_soulbuy[4] ~= 0) then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(sysdam+1).."[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iSystemDamage'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					local sysdam = tonumber(Hyperspace.playerVariables['soulreaper_iDamage'])
					--soul_desc = soul_desc.."\nУрон по системам: "..math.floor(sysdam+1)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_damagesys')..' '..math.floor(sysdam+1)
					if mouse_inside_mem == i or (mouse_inside_mem == 4 and arr_allowed_soulbuy[4] ~= 0) then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(sysdam+2).."[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iSystemDamage'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 83, 23, varr.color_green)
					local sysdam = tonumber(Hyperspace.playerVariables['soulreaper_iDamage'])
					--soul_desc = soul_desc.."\nУрон по системам: "..math.floor(sysdam+2)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_damagesys')..' '..math.floor(sysdam+2)
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
					--soul_desc = soul_desc.."\nУрон по экипажу: "..math.floor(persdam)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_damagecrew')..' '..math.floor(persdam)
					if mouse_inside_mem == i or (mouse_inside_mem == 4 and arr_allowed_soulbuy[4] ~= 0) then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(persdam+15).."[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iPersDamage'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					local persdam = 15*tonumber(Hyperspace.playerVariables['soulreaper_iDamage'])
					--soul_desc = soul_desc.."\nУрон по экипажу: "..math.floor(persdam+15)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_damagecrew')..' '..math.floor(persdam+15)
					if mouse_inside_mem == i or (mouse_inside_mem == 4 and arr_allowed_soulbuy[4] ~= 0) then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(persdam+30).."[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iPersDamage'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 83, 23, varr.color_green)
					local persdam = 15*tonumber(Hyperspace.playerVariables['soulreaper_iDamage'])
					--soul_desc = soul_desc.."\nУрон по экипажу: "..math.floor(persdam+30)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_damagecrew')..' '..math.floor(persdam+30)
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
						--soul_desc = soul_desc.."\n[style[color:00FF00FF]]Ионный урон: 1[[/style]]"
						soul_desc = soul_desc..'\n[style[color:00FF00FF]]'..Hyperspace.Text:GetText('lua_sr_damageion')..' 1[[/style]]'
					else
						soul_desc = soul_desc.."\n"
					end
				elseif Hyperspace.playerVariables['soulreaper_iIonDamage'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "6")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."\nИонный урон: 1"
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_damageion')..' 1'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 2[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iIonDamage'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					--soul_desc = soul_desc.."\nИонный урон: 2"
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_damageion')..' 2'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 3[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iIonDamage'] == 3 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+114, sr_b[i].y+7, 55, 23, varr.color_green)
					--soul_desc = soul_desc.."\nИонный урон: 3"
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_damageion')..' 3'
				end
			elseif i == 8 then
				if Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 0 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "1")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+43, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					if mouse_inside_mem == i then
						--soul_desc = soul_desc.."\n[style[color:00FF00FF]]Пробивает щитов: 1[[/style]]"
						soul_desc = soul_desc..'\n[style[color:00FF00FF]]'..Hyperspace.Text:GetText('lua_sr_spierce')..' 1[[/style]]'
					else
						soul_desc = soul_desc.."\n"
					end
				elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+43, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_spierce')..' 1'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 2[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 2 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_spierce')..' 2'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 3[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 3 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+129, sr_b[i].y+7, 40, 23, varr.color_green, 2)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_spierce')..' 3'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 4[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_iShieldPiercing'] == 4 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+43, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 40, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+129, sr_b[i].y+7, 40, 23, varr.color_green)
					--soul_desc = soul_desc..'\nПробивает щитов: 4'
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_spierce')..' 4'
				end
			elseif i == 9 then
				if Hyperspace.playerVariables['soulreaper_breachChance'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc_temp = soul_desc_temp..'\n'..Hyperspace.Text:GetText('lua_sr_bc')..' '..math.floor(real_bc)..'%'
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
					soul_desc_temp = soul_desc_temp..'\n'..Hyperspace.Text:GetText('lua_sr_bc')..' '..math.floor(real_bc)..'%'
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
					soul_desc_temp = soul_desc_temp..'\n'..Hyperspace.Text:GetText('lua_sr_bc')..' '..math.floor(real_bc)..'%'
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
					soul_desc_temp = soul_desc_temp..'\n'..Hyperspace.Text:GetText('lua_sr_bc')..' '..math.floor(real_bc)..'%'
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
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_fc')..' '..math.floor(real_fc)..'%'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(plusf_real_fc).."%[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_fireChance'] == 4 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+57, sr_b[i].y+7, 54, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_fc')..' '..math.floor(real_fc)..'%'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(plusf_real_fc).."%[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_fireChance'] == 7 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+114, sr_b[i].y+7, 55, 23, varr.color_green, 2)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_fc')..' '..math.floor(real_fc)..'%'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> "..math.floor(plusf_real_fc).."%[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_fireChance'] == 10 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+57, sr_b[i].y+7, 54, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+114, sr_b[i].y+7, 55, 23, varr.color_green)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_fc')..' '..math.floor(real_fc)..'%'
				end
				soul_desc = soul_desc..soul_desc_temp
			elseif i == 11 then
				if Hyperspace.playerVariables['soulreaper_bLockdown'] == 0 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "7")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 169, 23, varr.color_green, 2)
					if mouse_inside_mem == i then
						soul_desc = soul_desc..'\n[style[color:00FF00FF]]'..Hyperspace.Text:GetText('lua_sr_lockroom')..'[[/style]]'
					else
						soul_desc = soul_desc.."\n"
					end
				elseif Hyperspace.playerVariables['soulreaper_bLockdown'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 169, 23, varr.color_green)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_lockroom')
				end
			elseif i == 12 then
				if Hyperspace.playerVariables['soulreaper_bHullBuster'] == 0 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "5")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 169, 23, varr.color_green, 2)
					if mouse_inside_mem == i then
						soul_desc = soul_desc..'\n[style[color:00FF00FF]]'..Hyperspace.Text:GetText('lua_sr_ddnosysroom')..'[[/style]]'
					else
						soul_desc = soul_desc.."\n"
					end
				elseif Hyperspace.playerVariables['soulreaper_bHullBuster'] == 1 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 169, 23, varr.color_green)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_ddnosysroom')
				end
			elseif i == 13 then
				if Hyperspace.playerVariables['soulreaper_capacity'] == 5 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "2")
					Graphics.CSurface.GL_DrawRectOutline(684, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_capacity')..' 5'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 7[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_capacity'] == 7 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "3")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRectOutline(684+86, sr_b[i].y+7, 83, 23, varr.color_green, 2)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_capacity')..' 7'
					if mouse_inside_mem == i then
						soul_desc = soul_desc.."[style[color:00FF00FF]] >> 10[[/style]]"
					end
				elseif Hyperspace.playerVariables['soulreaper_capacity'] == 10 then
					Graphics.freetype.easy_printRightAlign(18, sr_b[i].x + minishift_x, sr_b[i].y + minishift_y, "MAX")
					Graphics.CSurface.GL_DrawRect(684, sr_b[i].y+7, 83, 23, varr.color_green)
					Graphics.CSurface.GL_DrawRect(684+86, sr_b[i].y+7, 83, 23, varr.color_green)
					soul_desc = soul_desc..'\n'..Hyperspace.Text:GetText('lua_sr_capacity')..' 10'
				end
			end
		end
		--вывод текста описания орудия
		Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
		--Graphics.freetype.easy_print(14, 348, 100, "Душегуб")
		Graphics.freetype.easy_print(14, 348, 100, Hyperspace.Text:GetText('lua_sr_soulreapername'))
		Graphics.freetype.easy_printAutoNewlines(10, 348, 135, 285, soul_desc)

				
	end
	
	
	
	-- /////////////////////////////////
	-- ///////РЫБНЫЙ УЧАСТОК////////////
	-- /////////////////////////////////
	-- внимание, эвент рыбалки отключён на первом маяке сектора. для тестов прыгните куда-нибудь
	varr.button_fish_ready = false
	if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 then
		if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			varr.micro_tick_counter13 = varr.micro_tick_counter13 + 60.0*Hyperspace.FPS.SpeedFactor
			if varr.micro_tick_counter13 >= 980.0 then 
				varr.micro_tick_counter13 = 0.0
				if Hyperspace.playerVariables['fishing_beacon'] == 1 then
					table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("fishing/fishing_window.png"), time_length = 1000.0, time_length_mem = 1000.0, x = 1040, y = 150, w=960, h=360, fw=240, fh=360, layer = "SPACE_STATUS"})
					varr.is_enabled_monitor_to_planet = true
				end
			end
		end
		if Hyperspace.playerVariables['fishing_beacon'] == 1 and varr.is_enabled_monitor_to_planet == true then
			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				
				varr.micro_tick_counter14 = varr.micro_tick_counter14 + 60.0*Hyperspace.FPS.SpeedFactor
				if varr.udochka_status == 0 then
					if varr.micro_tick_counter14 >= 12500.0 then 
						varr.micro_tick_counter14 = math.random(0, 7000)
						if Hyperspace.playerVariables['fishing_remaining'] > 0 then
							table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("fishing/waves.png"), time_length = 1000.0, time_length_mem = 1000.0, x = 1120, y = 465, w=125, h=14, fw=20, fh=14, layer = "SPACE_STATUS_up"})
							varr.micro_tick_fish_on_kruchok = 1200.0
							Hyperspace.playerVariables['fishing_remaining'] = Hyperspace.playerVariables['fishing_remaining'] - 1
							
							if math.random(0,100) < 50 then
								Hyperspace.Sounds:PlaySoundMix('fishing_kluet_1', 10, false)
							else
								Hyperspace.Sounds:PlaySoundMix('fishing_kluet_2', 10, false)
							end
						end
					end
					if varr.micro_tick_fish_on_kruchok > 0.0 then 
						varr.micro_tick_fish_on_kruchok = varr.micro_tick_fish_on_kruchok - 60.0*Hyperspace.FPS.SpeedFactor
					end
				else
					varr.micro_tick_counter14 = 0
					varr.micro_tick_fish_on_kruchok = 0.0
				end
			end

			if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
				if varr.udochka_status == 2 then
					if math.random(0,100) < 3 then
						varr.off_x_fish = varr.off_x_fish + math.random(-1,1)
						if varr.off_x_fish > 3 then
							varr.off_x_fish = 3
						elseif varr.off_x_fish < -3 then
							varr.off_x_fish = -3
						end
					end
				end
			end
			
			if playerShip.vCrewList:size() > 0 then
				local crewybpname = ''--playerShip.vCrewList[0]
				for crew in vter(playerShip.vCrewList) do
					if crewybpname == '' and crew.intruder == false and crew.health.first > 0.0 and crew.bOutOfGame == false then
						crewybpname = crew.blueprint.name
					end
				end
				if crewybpname ~= '' then
					--print(crewy.blueprint.name)
					local textmp = Hyperspace.Resources:GetImageId('people/'..crewybpname..'_base.png')
					if textmp ~= nil then
						Graphics.CSurface.GL_PushMatrix()
						Graphics.CSurface.GL_Translate(1170+varr.off_x_fish, 408)
						Graphics.CSurface.GL_BlitImagePartial(textmp, 0, 0, 35, 35, 0, 35.0/textmp.width, 0, 35.0/textmp.height, 1, varr.color_white, false)
						Graphics.CSurface.GL_PopMatrix()
					end
				end
			end
			
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(1166, 412)
			Graphics.CSurface.GL_RenderPrimitive(varr.kust)
			Graphics.CSurface.GL_PopMatrix()
			
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(1117+varr.off_x_fish, 360)
			if varr.udochka_status == 0 then
				if varr.micro_tick_fish_on_kruchok > 0.0 then
					Graphics.CSurface.GL_RenderPrimitive(varr.udochka_kluet)
				else
					Graphics.CSurface.GL_RenderPrimitive(varr.udochka)
				end
			elseif varr.udochka_status == 1 then
				Graphics.CSurface.GL_RenderPrimitive(varr.udochka_vverh)
			elseif varr.udochka_status == 2 then
				Graphics.CSurface.GL_RenderPrimitive(varr.udochka_active)
			end
			Graphics.CSurface.GL_PopMatrix()
			
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_fish_Box.x, varr.button_fish_Box.y)
			if mouseInside(varr.button_fish_Box) then
				Graphics.CSurface.GL_RenderPrimitive(varr.button_fish_select2)
				
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_fish_tip'))
				
				varr.button_fish_ready = true
				mouse_inside_mem = 999
			else
				Graphics.CSurface.GL_RenderPrimitive(varr.button_fish_on)
			end
			Graphics.CSurface.GL_PopMatrix()
			
			
			if varr.udochka_status == 2 then
				if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
					varr.schkala_move_speed = varr.schkala_move_speed + 1.2*Hyperspace.FPS.SpeedFactor
					if varr.schkala_move_speed > 20.0 then
						varr.schkala_move_speed = 20.0
					elseif varr.schkala_move_speed < -20.0 then
						varr.schkala_move_speed = -20.0
					end
					--varr.schkala_catcher_position = varr.schkala_catcher_position + 1.0*Hyperspace.FPS.SpeedFactor
					varr.schkala_catcher_position = varr.schkala_catcher_position + varr.schkala_move_speed*Hyperspace.FPS.SpeedFactor
					if varr.schkala_catcher_position > 200 then
						varr.schkala_catcher_position = 200
						varr.schkala_move_speed = -0.7 * varr.schkala_move_speed
					elseif varr.schkala_catcher_position < -20.0 then
						varr.schkala_catcher_position = -20.0
						varr.schkala_move_speed = -0.35 * varr.schkala_move_speed --рикошет от верхнего края заметно меньше, чем от нижнего. так комфортнее играется.
					end
					
					-- fish_logic
					if varr.fish_on_catch == false then
						if math.random(0,1000) < varr.fish_crazyness then--15 then
							varr.fish_move_speed = varr.fish_move_speed + math.random(-varr.fish_agressivity, varr.fish_agressivity)/10.0 + varr.fish_way_shift--math.random(-1.0, 1.0)
						end
					else
						if math.random(0,1000) < varr.fish_crazyness_on_catch then--15 then
							varr.fish_move_speed = varr.fish_move_speed + math.random(-varr.fish_agressivity_on_catch, varr.fish_agressivity_on_catch)/10.0 + varr.fish_way_shift--math.random(-1.0, 1.0)
						end
					end
					
					varr.fish_inversion_cur = varr.fish_inversion_cur - 60.0*Hyperspace.FPS.SpeedFactor
					if varr.fish_inversion_cur < 0.0 then
						varr.fish_inversion_cur = varr.fish_inversion_timer
						varr.fish_move_speed = -varr.fish_move_speed
						--print('inv')
					end
					
					
					if varr.fish_move_speed > 22.0 then
						varr.fish_move_speed = 22.0
					elseif varr.fish_move_speed < -22.0 then
						varr.fish_move_speed = -22.0
					end
					varr.fish_position_y = varr.fish_position_y + varr.fish_move_speed*Hyperspace.FPS.SpeedFactor
					if varr.fish_position_y > 240 then
						varr.fish_position_y = 240
						varr.fish_move_speed = -0.2 * varr.fish_move_speed
					elseif varr.fish_position_y < -20.0 then
						varr.fish_position_y = -20.0
						varr.fish_move_speed = -0.2 * varr.fish_move_speed
					end
					
					if varr.fish_position_y > 240 then
						varr.fish_position_y = 240
					elseif varr.fish_position_y < -20.0 then
						varr.fish_position_y = -20.0
					end
					
					
					if varr.fish_progress < 100.0 then
						--print(varr.fish_position_y..','..varr.schkala_catcher_position)
						if math.abs(varr.fish_position_y - varr.schkala_catcher_position - 23) <= 33 then
							varr.fish_progress = varr.fish_progress + 0.6*Hyperspace.FPS.SpeedFactor
							varr.fish_on_catch = true
						else
							varr.fish_progress = varr.fish_progress - 0.5*Hyperspace.FPS.SpeedFactor
							varr.fish_on_catch = false
						end
					end
					
					if varr.fish_progress < 0.0 then
						varr.fish_progress = 0
						varr.udochka_status = 1
						Hyperspace.Sounds:PlaySoundMix('fishing_fish_gone', 10, false)
					end
					if varr.fish_progress > 100.0 then
						varr.fish_progress = 100.0
						varr.udochka_status = 1
						Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'EVENT_CATCH_FISH_'..tostring(math.floor(varr.current_fish_id)),false,-1)
						Hyperspace.Sounds:PlaySoundMix('fishing_fish_catch', 10, false)
					end
				end
				
				-- visual part
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(992, 150)
				Graphics.CSurface.GL_RenderPrimitive(varr.schkala)
				Graphics.CSurface.GL_PopMatrix()
				
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(1004, 197 + varr.schkala_catcher_position)
				Graphics.CSurface.GL_RenderPrimitive(varr.schkala_catcher)
				Graphics.CSurface.GL_PopMatrix()
				
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(1004, 197 + varr.fish_position_y)
				Graphics.CSurface.GL_RenderPrimitive(varr.fish_imgs[varr.current_fish_id])
				Graphics.CSurface.GL_PopMatrix()
				
				local color_loc
				
				if varr.sunduk_y ~= 999 then
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_Translate(1006, 197 + varr.sunduk_y)
					Graphics.CSurface.GL_RenderPrimitive(varr.sunduk)
					Graphics.CSurface.GL_PopMatrix()
					
					if varr.sunduk_progress < 100.0 then
						if math.abs(varr.sunduk_y - varr.schkala_catcher_position - 23) <= 33 then
							varr.sunduk_progress = varr.sunduk_progress + 1.4*Hyperspace.FPS.SpeedFactor
						else
							varr.sunduk_progress = varr.sunduk_progress - 1.1*Hyperspace.FPS.SpeedFactor
						end
					end
					
					if varr.sunduk_progress < 0.0 then
						varr.sunduk_progress = 0.0
					end
					if varr.sunduk_progress > 100.0 then
						varr.sunduk_progress = 100.0
						table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("fishing/sunduk_catched.png"), time_length = 500.0, time_length_mem = 500.0, x = 1006, y = 197 + varr.sunduk_y, w=320, h=36, fw=32, fh=36, layer = "SPACE_STATUS_up"})
						varr.sunduk_y = 999
						--varr.bSundukCatchedThisTime = true
						Hyperspace.playerVariables['fishing_sunduk_reward'] = 1
						Hyperspace.Sounds:PlaySoundMix('fishing_sunduk_done', 10, false)
					end
					
					if varr.sunduk_progress < 33 then
						color_loc = varr.color_red
					elseif varr.sunduk_progress < 66 then
						color_loc = varr.color_yellow
					else
						color_loc = varr.color_green
					end
					Graphics.CSurface.GL_DrawRect(1008, 197 + varr.sunduk_y+36, (varr.sunduk_progress/100.0)*32.0, 4, color_loc)
					Graphics.CSurface.GL_DrawRectOutline(1008, 197 + varr.sunduk_y+36, 32, 4, varr.color_dark, 1)
					
				end
				
				
				
				if varr.fish_progress < 33 then
					color_loc = varr.color_red
				elseif varr.fish_progress < 66 then
					color_loc = varr.color_yellow
				else
					color_loc = varr.color_green
				end
				Graphics.CSurface.GL_DrawRect(996, 159+340, 4, -(varr.fish_progress/100.0)*340.0, color_loc)
				--Graphics.CSurface.GL_DrawRectOutline(996, 159+340, 4, -340, varr.color_dark, 1)
			end
			Graphics.CSurface.GL_SetColor(Graphics.GL_Color(0.1, 0.1, 0.1, 1.0))
			Graphics.freetype.easy_print(12, 1055, 190, math.floor(Hyperspace.playerVariables['fishing_remaining']))
			
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(1057, 192)
			Graphics.CSurface.GL_RenderPrimitive(varr.kruchok)
			Graphics.CSurface.GL_PopMatrix()
		end
	end
	
	
	play_anim_tick_array ("SPACE_STATUS_up")
	
	if mouse_inside_mem_prev == -1 and mouse_inside_mem ~= -1 then
		Hyperspace.Sounds:PlaySoundMix('hoverBeep', 7, false)
	end
	mouse_inside_mem_prev = mouse_inside_mem
end)

-- function press_button_timer()
	-- if Hyperspace.metaVariables['show_timer'] == 0 then
		-- Hyperspace.metaVariables['show_timer'] = 1
	-- elseif Hyperspace.metaVariables['show_timer'] == 1 then
		-- Hyperspace.metaVariables['show_timer'] = 2
	-- else
		-- Hyperspace.metaVariables['show_timer'] = 0
	-- end
-- end
function press_waiting_button()
	if isAllowedWaitingWithFuel() == false then
		Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
	else
		if varr.waiting_mode_state == true then
			if map and map.bOpen == true and map.bChoosingNewSector == false then
				map:ForceWaitMessage()
				varr.waiting_mode_state = false
			end
		else
			if map and map.bOpen == true and map.bChoosingNewSector == false then
				map:ForceWaitMessage(varr.waiting_mode)
				varr.waiting_mode_state = true
			end
		end
	end
	--print('pressed')
end


function press_draw_button()
	if varr.bEnabledDrawMode == true then
		varr.bEnabledDrawMode = false
	else
		varr.bEnabledDrawMode = true
	end
end

function press_button_fish()
	
	--сброс ускорений/замедлений
	Hyperspace.FPS.speedLevel=0
	Hyperspace.playerVariables['speed_control_slow_set'] = 1
	Hyperspace.playerVariables['speed_control_norm_set'] = 0
	Hyperspace.playerVariables['speed_control_fast_set'] = 1
	
	if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
		if varr.udochka_status == 0 then
			if varr.micro_tick_fish_on_kruchok > 0.0 then
				-- подсекаем тут!
				
				varr.udochka_status = 2
				varr.fish_progress = 40.0
				varr.fish_move_speed = 0.0
				varr.fish_position_y = math.random(-20.0, 240.0)
				varr.schkala_catcher_position = 200.0
				varr.schkala_move_speed = 0.0
				--print(#varr.fish_imgs)
				
				--varr.bSundukCatchedThisTime = false
				if math.random(0,100) < 15 then--100 then--15
					varr.sunduk_y = math.random(-10.0, 230.0)
					varr.sunduk_progress = 0.0
					Hyperspace.Sounds:PlaySoundMix('fishing_sunduk_appear', 10, false)
				else
					varr.sunduk_y = 999
					varr.sunduk_progress = 0.0
				end
				Hyperspace.playerVariables['fishing_sunduk_reward'] = 0
				
				varr.current_fish_id = math.random(0, #varr.fish_imgs)
				local antifreez = 0
				while Hyperspace.playerVariables['installed_FISH_BUFF_'..math.floor(varr.current_fish_id)] > 0 and antifreez < 50 do
					varr.current_fish_id = math.random(0, #varr.fish_imgs)
					antifreez = antifreez + 1
					--print('redo_fish='..varr.current_fish_id)
				end
				
				varr.fish_inversion_timer = 60000.0
				varr.fish_inversion_cur = 0.0
				if varr.current_fish_id == 0 then--голавль
					varr.fish_agressivity = 6
					varr.fish_agressivity_on_catch = 15
					varr.fish_crazyness = 10
					varr.fish_crazyness_on_catch = 20
					varr.fish_way_shift = 0.0
				elseif varr.current_fish_id == 1 then--дорада
					varr.fish_agressivity = 3
					varr.fish_agressivity_on_catch = 10
					varr.fish_crazyness = 15
					varr.fish_crazyness_on_catch = 30
					varr.fish_way_shift = 0.05
					varr.fish_inversion_timer = 3000.0
				elseif varr.current_fish_id == 2 then--альбакор
					varr.fish_agressivity = 11
					varr.fish_agressivity_on_catch = 35
					varr.fish_crazyness = 10
					varr.fish_crazyness_on_catch = 35
					varr.fish_way_shift = 0.0
				elseif varr.current_fish_id == 3 then--скорпионовый карп
					varr.fish_agressivity = 9
					varr.fish_agressivity_on_catch = 18
					varr.fish_crazyness = 15
					varr.fish_crazyness_on_catch = 30
					varr.fish_way_shift = 0.05 -- если положительное, то стремится на дно сильнее
				elseif varr.current_fish_id == 4 then--тигровая форель
					varr.fish_agressivity = 10
					varr.fish_agressivity_on_catch = 30
					varr.fish_crazyness = 5
					varr.fish_crazyness_on_catch = 38
					varr.fish_way_shift = -0.05
				elseif varr.current_fish_id == 5 then--сомик
					varr.fish_agressivity = 1
					varr.fish_agressivity_on_catch = 45
					varr.fish_crazyness = 1
					varr.fish_crazyness_on_catch = 40
					varr.fish_way_shift = 0.1
				elseif varr.current_fish_id == 6 then--тиляпия
					varr.fish_agressivity = 15
					varr.fish_agressivity_on_catch = 15
					varr.fish_crazyness = 5
					varr.fish_crazyness_on_catch = 30
					varr.fish_way_shift = 0.0
				elseif varr.current_fish_id == 7 then--щука
					varr.fish_agressivity = 25
					varr.fish_agressivity_on_catch = 30
					varr.fish_crazyness = 10
					varr.fish_crazyness_on_catch = 15
					varr.fish_way_shift = 0.0
					varr.fish_inversion_timer = 5000.0
				elseif varr.current_fish_id == 8 then--барабулька
					varr.fish_agressivity = 17
					varr.fish_agressivity_on_catch = 5
					varr.fish_crazyness = 27
					varr.fish_crazyness_on_catch = 5
					varr.fish_way_shift = 0.0
				elseif varr.current_fish_id == 9 then--солнечник
					varr.fish_agressivity = 20
					varr.fish_agressivity_on_catch = 25
					varr.fish_crazyness = 10
					varr.fish_crazyness_on_catch = 15
					varr.fish_way_shift = 0.0
					varr.fish_inversion_timer = 1000.0
				else
					--default
					varr.fish_agressivity = 10
					varr.fish_agressivity_on_catch = 12
					varr.fish_crazyness = 15
					varr.fish_crazyness_on_catch = 20
					varr.fish_way_shift = 0.0
				end
			else
				varr.udochka_status = 1
				Hyperspace.Sounds:PlaySoundMix('fishing_udochka_up', 7, false)
			end
		elseif varr.udochka_status == 1 then
			varr.off_x_fish = 0
			varr.udochka_status = 0 --падение в воду, вызываем анимацию круговых волн
			table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("fishing/waves.png"), time_length = 1000.0, time_length_mem = 1000.0, x = 1120, y = 465, w=125, h=14, fw=20, fh=14, layer = "SPACE_STATUS_up"})
			Hyperspace.Sounds:PlaySoundMix('fishing_bulp_1', 10, false)
		elseif varr.udochka_status == 2 then
			varr.schkala_move_speed = varr.schkala_move_speed - 6.5
			Hyperspace.Sounds:PlaySoundMix('fishing_udochka_works', 7, false)--was 10 too loud!
		end
	end
end

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
-- local function getHealingOfStatBoost(statBoost, power, shipId)
	-- local healAmount = 0
	-- local trueHealAmount = 0
	-- local shipGraph = Hyperspace.ShipGraph.GetShipInfo(shipId)
	-- if (statBoost.crewTarget == Hyperspace.StatBoostDefinition.CrewTarget.ALLIES
	-- or statBoost.crewTarget == Hyperspace.StatBoostDefinition.CrewTarget.ALL
	-- or statBoost.crewTarget == Hyperspace.StatBoostDefinition.CrewTarget.CURRENT_ALLIES
	-- or statBoost.crewTarget == Hyperspace.StatBoostDefinition.CrewTarget.ORIGINAL_ALLIES)
	-- and (statBoost.droneTarget == Hyperspace.StatBoostDefinition.DroneTarget.ALL
	-- or statBoost.droneTarget == Hyperspace.StatBoostDefinition.DroneTarget.CREW)
	-- and (statBoost.whiteList:size() + statBoost.blackList:size()) == 0
	-- then
		-- if statBoost.stat == Hyperspace.CrewStat.PASSIVE_HEAL_AMOUNT or statBoost.stat == Hyperspace.CrewStat.ACTIVE_HEAL_AMOUNT then
			-- healAmount = healAmount + statBoost.amount
		-- elseif statBoost.stat == Hyperspace.CrewStat.TRUE_PASSIVE_HEAL_AMOUNT or statBoost.stat == Hyperspace.CrewStat.TRUE_HEAL_AMOUNT then
			-- trueHealAmount = trueHealAmount + statBoost.amount
		-- elseif statBoost.stat == Hyperspace.CrewStat.HEAL_CREW_AMOUNT then
			-- local optimalRoomMultiplier = 1
			-- if statBoost.amount > 0 then
				-- optimalRoomMultiplier = getMaxRoomSize(shipGraph) - (statBoost.affectsSelf and 0 or 1)
			-- end
			-- healAmount = healAmount + (statBoost.amount * optimalRoomMultiplier)
		-- elseif statBoost.stat == Hyperspace.CrewStat.STAT_BOOST then
			-- for providedStatBoost in vter(statBoost.providedStatBoosts) do
				-- partialHealAmount, partialTrueHealAmount = getHealingOfStatBoost(providedStatBoost, power, shipId)
				-- healAmount = healAmount + partialHealAmount
				-- trueHealAmount = trueHealAmount + partialTrueHealAmount
			-- end
		-- end
	-- elseif statBoost.crewTarget == Hyperspace.StatBoostDefinition.CrewTarget.SELF then
		-- if ((statBoost.stat == Hyperspace.CrewStat.PASSIVE_HEAL_AMOUNT
		-- or statBoost.stat == Hyperspace.CrewStat.ACTIVE_HEAL_AMOUNT
		-- or statBoost.stat == Hyperspace.CrewStat.TRUE_PASSIVE_HEAL_AMOUNT
		-- or statBoost.stat == Hyperspace.CrewStat.TRUE_HEAL_AMOUNT)
		-- and statBoost.amount < 0)
		-- and not power.def.playerReq.minHealth.enabled then return -2000000000, -2000000000 end --for Anurak and other crew like them
		-- if statBoost.stat == Hyperspace.CrewStat.HEAL_CREW_AMOUNT then
			-- healAmount = healAmount + statBoost.amount
		-- end
	-- end
	-- return healAmount, trueHealAmount
-- end
-- local function getHealingOfPower(power, shipId) --Check how much HP/s a power can heal
	-- local totalHealAmount = 0
	-- local totalTrueHealAmount = 0
	-- totalHealAmount = totalHealAmount + power.def.tempPower.healCrewAmount.value
	-- totalTrueHealAmount = totalTrueHealAmount + (power.def.crewHealth / (power.powerCooldown.second + power.def.tempPower.duration))
	-- for statBoost in vter(power.def.statBoosts) do
		-- local healAmount, trueHealAmount = getHealingOfStatBoost(statBoost, power, shipId)
		-- totalHealAmount = totalHealAmount + healAmount
		-- totalTrueHealAmount = totalTrueHealAmount + trueHealAmount
	-- end
	-- for roomStatBoost in vter(power.def.roomStatBoosts) do
		-- local healAmount, trueHealAmount = getHealingOfStatBoost(roomStatBoost, power, shipId)
		-- totalHealAmount = totalHealAmount + healAmount
		-- totalTrueHealAmount = totalTrueHealAmount + trueHealAmount
	-- end
	-- for tempStatBoost in vter(power.def.tempPower.statBoosts) do
		-- local healAmount, trueHealAmount = getHealingOfStatBoost(tempStatBoost, power, shipId)
		-- totalHealAmount = totalHealAmount + healAmount
		-- totalTrueHealAmount = totalTrueHealAmount + trueHealAmount
	-- end
	-- return totalHealAmount, totalTrueHealAmount
-- end
-- function printHealingOfPowers(crew)
	-- if type(crew) == "string" then
		-- for crewmember in vter(Hyperspace.ships.player.vCrewList) do
			-- if crew == crewmember:GetName() or crew == crewmember:GetLongName() or crew == crewmember:GetSpecies() then
				-- crew = crewmember
				-- break
			-- end
		-- end
	-- end
	-- for power in vter(crew.extend.crewPowers) do
		-- print(crew:GetName())
		-- print(getHealingOfPower(power, 0))
		-- print("\nNormal Stat Boosts")
		-- for statBoost in vter(power.def.statBoosts) do
			-- print(getHealingOfStatBoost(statBoost, power, 0))
		-- end
		-- print("\nRoom Stat Boosts")
		-- for roomStatBoost in vter(power.def.roomStatBoosts) do
			-- print(getHealingOfStatBoost(roomStatBoost, power, 0))
		-- end
		-- print("\nTemp Stat Boosts")
		-- for tempStatBoost in vter(power.def.tempPower.statBoosts) do
			-- print(getHealingOfStatBoost(tempStatBoost, power, 0))
		-- end
	-- end
-- end
-- function printAllHealingOfPowers()
	-- for crew in vter(Hyperspace.ships.player.vCrewList) do
		-- printHealingOfPowers(crew)
		-- --print()
	-- end
-- end
--local currentHealers = {}
-- local function getMaxHealer(ship)
	-- local maxHealAmount = 0
	-- local maxTrueHealAmount = 0
	-- currentHealers = {}
	-- currentHealers.size = 0
	-- if ship:HasSystem(5) and ship:GetSystem(5):GetEffectivePower() > 0 then --5 is medbay
		-- maxHealAmount = 6.4 * math.max(1.5 * (ship:GetSystem(5):GetEffectivePower() - 1), 1)
		-- currentHealers[ship:GetSystem(5)] = 6.4 * math.max(1.5 * (ship:GetSystem(5):GetEffectivePower() - 1), 1)
		-- currentHealers.size = currentHealers.size + 1
	-- end
	-- --Find the best healer on the ship
	-- for crew in vter(ship.vCrewList) do
		-- local maxHealingOfCrew = 0
		-- local maxTrueHealingOfCrew = 0
		
		-- if (crew:IsCrew() or crew:Functional()) then --If they're not an inactive drone
			-- local healCrewAmount, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_CREW_AMOUNT)
			-- maxHealingOfCrew = healCrewAmount
			
			-- if crew.blueprint.name:find('orchid')~=nil then
				-- maxHealingOfCrew = 0.5
			-- end
			
			-- local _, isSilenced = crew.extend:CalculateStat(Hyperspace.CrewStat.SILENCED)
			-- if not isSilenced then
				-- for power in vter(crew.extend.crewPowers) do
					-- if power.enabled and power.def.playerReq.minHealth.value < crew:GetIntegerHealth() then
						-- local powerHealAmount, powerTrueHealAmount = getHealingOfPower(power, ship.iShipId)
						-- maxHealingOfCrew = maxHealingOfCrew + powerHealAmount
						-- maxTrueHealingOfCrew = maxTrueHealingOfCrew + powerTrueHealAmount
					-- end
				-- end
			-- end
		-- end
		-- if maxHealingOfCrew > 0 or maxTrueHealingOfCrew > 0 then
			-- currentHealers[crew] = true
			-- currentHealers.size = currentHealers.size + 1
		-- end
		-- maxHealAmount = math.max(maxHealAmount, maxHealingOfCrew)
		-- maxTrueHealAmount = math.max(maxTrueHealAmount, maxTrueHealingOfCrew)
	-- end
	-- return maxHealAmount, maxTrueHealAmount
-- end
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
-- local function getCrewDecay(crew)
	-- local crewDecay = 0
	-- local crewDef = crew.extend:GetDefinition()
	-- local healSpeed, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_SPEED_MULTIPLIER)
	-- local potentialCrewDecay = ((crewDef.passiveHealAmount + crewDef.healAmount) * healSpeed) + crewDef.truePassiveHealAmount + crewDef.trueHealAmount
	-- if potentialCrewDecay < 0 then
		-- crewDecay = potentialCrewDecay
	-- end
	-- return crewDecay
-- end

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
function isHealerOfOther(crewbluename)
	if crewbluename:find('orchid') ~= nil then
		return true
	end
	if crewbluename:find('biopreserver') ~= nil then
		return true
	end
	return false
end
local function countOfCrewHealerOfOther(ship) --количество экипажа которые могут лечить других
	local counter_OCWHCA = 0
	for crew in vter8(ship.vCrewList) do
		-- if (crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_CREW_AMOUNT) > 0.0) then --If they're not an inactive drone
			-- counter_OCWHCA = counter_OCWHCA + 1
		-- end
		if crew.blueprint.name:find('orchid') ~= nil then -- учитывает обычных и лег.орхидов
			counter_OCWHCA = counter_OCWHCA + 1 
		end
		if crew.blueprint.name:find('biopreserver') ~= nil then --био-хранитель
			if crew:Functional() == true then
				counter_OCWHCA = counter_OCWHCA + 1
			end
		end
		
	end
	return counter_OCWHCA
end
script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipMgr)
	-- этот блок пробегания корабельных циклов не работает на паузе если что...
	
	if shipMgr then
		local otherShip = Hyperspace.Global.GetInstance():GetShipManager(1 - shipMgr.iShipId)--Hyperspace.ships(1 - shipMgr.iShipId)
		
		--управление артиллерией экипажем
		auxManning(shipMgr)
		local otherShipCloaked = otherShip and otherShip.ship.bCloaked or false
		local vSystemList = shipMgr.artillerySystems
		for i = 0, vSystemList:size() - 1 do
			if not otherShipCloaked then
				artilleryManning(vSystemList[i])
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
					if varr.micro_tick_counter7 <= 0.0 then
						local dam = Hyperspace.Damage()
						dam.fireChance = 10
						dam.iShieldPiercing = 10
						shipMgr:DamageArea(shipMgr:GetRandomRoomCenter(), dam, true)
						varr.micro_tick_counter7 = 1100.0 + math.random(0,900) + shipMgr.fireSpreader.count*110
					end
				end
			end
		end
		
		-- исправление проблемы когда враг имеющий скрытые орудия всё равно не стрелял, а ждал отключения своей невидимости. заставляем стрелять.
		if shipMgr.iShipId == 1 then
			if shipMgr:HasAugmentation("CLOAK_FIRE") > 0 then
				if shipMgr:HasSystem(10) == true then
					local wsys = shipMgr.weaponSystem
					if shipMgr._targetable:IsCloaked() == true then
						if wsys then
							for pf in vter2(wsys.weapons) do
								--if pf.blueprint.typeName == "LASER" or pf.blueprint.typeName == "BURST" then--убраны фильтры.
									if pf.cooldown.first >= pf.cooldown.second then
										pf:Fire(give_me_target_vectors(pf, 1), 0)--принуждаем к стрельбе тут
										pf.fireWhenReady = true
									end
								--end
							end
						end
					end
					if wsys then
						for pf in vter2(wsys.weapons) do
							if pf.blueprint.chargeLevels > 1 then--это проверка на многозарядность орудия
								-- вот это место призвано исправлять ванильный баг
								-- когда зарядное орудие в итоге не стреляло зарядившись полностью
								if pf.cooldown.first >= pf.cooldown.second - 0.1 then
									pf:Fire(give_me_target_vectors(pf, 1), 0)--принуждаем к стрельбе тут
									pf.fireWhenReady = true
								end
								-- тема выстраданная, в итоге работает стрельбой по 1 как автолазеры. иначе в конце концов виснет.
							end
						end
					end
				end
			end
		end
		
		
		-- свойство оружейки и артиллерии ПОЧТИ не терять заряд если орудие отключено
		if hasAnyAugmentationOfList(shipMgr, {"BATTERY_BOOSTER", "HID_BATTERY_BOOSTER", "FLEET_DISTRACTION_BATTERY_BOOSTER"}) == true then
			local wsys = shipMgr.weaponSystem
			if wsys then
				for pf in vter2(wsys.weapons) do
					if pf.powered == false and pf.cooldown.first > 0.1 then
						safeMaxCooldown = pf.cooldown.second - 0.001
						if safeMaxCooldown > 0 and pf.cooldown.first < safeMaxCooldown then
							delta = 0.373 * Hyperspace.FPS.SpeedFactor
							-- 0.38 даёт медленный прирост кд на выкл. орудии
							-- 0.373 медленный спуск на 0.1 за 4 сек.
							pf.cooldown.first = math.min(math.max(pf.cooldown.first + delta, 0), safeMaxCooldown)
							--print('works_weaps!')
						end
					end
				end
			end
			if shipMgr.artillerySystems then
				local vSystemList = shipMgr.artillerySystems
				for i = 0, vSystemList:size() - 1 do
					local pf = vSystemList[i].projectileFactory
					if pf.powered == false and pf.cooldown.first > 0.1 then
						safeMaxCooldown = pf.cooldown.second - 0.001
						if safeMaxCooldown > 0 and pf.cooldown.first < safeMaxCooldown then
							delta = 0.373 * Hyperspace.FPS.SpeedFactor
							pf.cooldown.first = math.min(math.max(pf.cooldown.first + delta, 0), safeMaxCooldown)
							--print('works_art!')
						end
					end
				end
			end
		end
		
		if shipMgr.iShipId == 0 then
			if shipMgr.fireSpreader.count > 15 then
				Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_THISISFINE", false)
			end
			
			--автоматическая работа артиллерии
			for i = 0, vSystemList:size() - 1 do
				local pf_0 = vSystemList[i].projectileFactory
				if pf_0.cooldown.first == pf_0.cooldown.second and enemyShip and enemyShip.ship.hullIntegrity.first > 0 then
					if enemyShip._targetable.hostile == true then
						if varr.artillery_auto_controllers[i] == true then
							pf_0:Fire(give_me_target_vectors(pf_0, 0), 1)
						end
					end
				end
				
				-- не даёт выбрать прицеливание артиллерией если вкючён режим АВТО и издаёт божественный звук
				if gui and gui.combatControl and gui.combatControl.weapControl and gui.combatControl.weapControl.armedWeapon then
					if gui.combatControl.weapControl.armedWeapon.isArtillery == true then
						if gui.combatControl.weapControl.armedWeapon == pf_0 then
							if varr.artillery_auto_controllers[i] == true then
								gui.combatControl.weapControl.armedWeapon = nil
								--print('disabled2'..gui.combatControl.weapControl.armedWeapon.blueprint.name)
								Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
							end
						end
					end
				end
			end
			
			
			
			
			-- это переносит блокировки с последней (самой правой) системы артиллерии на остальные (если несколько артиллерий)
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
		end
		
		--ускоряет движение атакующих космических дронов
		if hasAnyAugmentationOfList(shipMgr, {"DRONE_SPEED", "HID_DRONE_SPEED", "EXPLOSIVE_REPLICATOR_DRONE_SPEED"}) == true then
			for combatdrone in vter(shipMgr.spaceDrones) do
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
		
		
		-- увеличивает многократно количество блёсток выстреливаемых
		for combatdrone in vter(shipMgr.spaceDrones) do
			if combatdrone and combatdrone.blueprint then
				if combatdrone.blueprint.droneImage == "de_drone_svch" then
					if combatdrone.powered then
						--print(combatdrone.bFire)
						if shipMgr.iShipId == 0 then
							if math.random(0,100)<20 and there_is_projectiles_with_id(1) == true then--11 -- точка регулировки силы работы свч-дронов. чем выше тем больше блёсток
								combatdrone.targetLocation = Hyperspace.Pointf(0.0,math.random(0,500))
								combatdrone.targetSpeed = Hyperspace.Pointf(10.0,10.0)
							end
						else
							if math.random(0,100)<18 and there_is_projectiles_with_id(0) == true then--10
								combatdrone.targetLocation = Hyperspace.Pointf(math.random(100,150),400.0)
								combatdrone.targetSpeed = Hyperspace.Pointf(10.0,10.0)
							end
						end
					end
				end
			end
		end
		
		-- for combatdrone in vter(shipMgr.spaceDrones) do
			-- if combatdrone and combatdrone.blueprint then
				-- if combatdrone.blueprint.name == "AHC_DRONE" then
					-- if combatdrone.powered then
						-- --print(combatdrone.bFire)
						-- if shipMgr.iShipId == 0 then
							-- if combatdrone.weaponCooldown <= 0.3 then
								-- --print('cd up')
								-- local targpoint = -1
								-- for crew in vter(playerShip.vCrewList) do
									-- if targpoint == -1 then
										-- if crew.intruder == true then
											-- targpoint = crew.iRoomId
										-- end
									-- end
								-- end
								-- if targpoint ~= -1 then
									-- Hyperspace.App.world.space:CreateBomb(Hyperspace.Blueprints:GetWeaponBlueprint('BA_BOMB_BIO'), 0, playerShip:GetRoomCenter(targpoint), 0)
									-- combatdrone.weaponCooldown = 4.99
								-- else
									-- combatdrone.weaponCooldown = 0.3
								-- end
								-- --:CreateBomb(WeaponBlueprint *weapon, int ownerId, Pointf target, int targetSpace)
							-- end
						-- else
							-- if combatdrone.weaponCooldown <= 0.3 then
								-- --print('cd up')
								-- local targpoint = -1
								-- for crew in vter(enemyShip.vCrewList) do
									-- if targpoint == -1 then
										-- if crew.intruder == true then
											-- targpoint = crew.iRoomId
										-- end
									-- end
								-- end
								-- if targpoint ~= -1 then
									-- Hyperspace.App.world.space:CreateBomb(Hyperspace.Blueprints:GetWeaponBlueprint('BA_BOMB_BIO'), 1, enemyShip:GetRoomCenter(targpoint), 1)
									-- combatdrone.weaponCooldown = 4.99
								-- else
									-- combatdrone.weaponCooldown = 0.3
								-- end
								-- --:CreateBomb(WeaponBlueprint *weapon, int ownerId, Pointf target, int targetSpace)
							-- end
						-- end
					-- end
				-- end
			-- end
		-- end
		
		
		
		--не даём работать щитовым дронам если генератор помех у враж.корабля
		if otherShip and otherShip.bDestroyed == false then
			if hasAnyAugmentationOfList(otherShip, {"DEFENSE_SCRAMBLER", "HID_DEFENSE_SCRAMBLER", "DEFENSE_SCRAMBLER_HACKING_STUN"}) == true then
				for combatdrone in vter(shipMgr.spaceDrones) do
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
		
		--авторемонт как у беспилотников
		if hasAnyAugmentationOfList(shipMgr, {"AUTO_REPAIR", "HID_AUTO_REPAIR"}) == true then
			local repairAugValue = 1.0 * (Hyperspace.playerVariables['autorepair_speed_multiplied_on_10']/10)--1.4 -- тут можно подкрутить скорость авторемонта 1.0 - это дефолтный ремонт беспилотников
			if repairAugValue > 0 then
				setAutoRepair(repairAugValue, shipMgr)
			end
		end
		
		-- откачка кислорода из комнат с пожарами
		if hasAnyAugmentationOfList(shipMgr, {"ADV_OXYGEN", "HID_ADV_OXYGEN"}) == true then
			for room in vter(shipMgr.ship.vRoomList) do
				if shipMgr:GetFireCount(room.iRoomId) > 0 then
					local o2sys = shipMgr.oxygenSystem
					if o2sys ~= nil then
						o2sys:ModifyRoomOxygen(room.iRoomId, -varr.adv_oxygen_values[o2sys:GetEffectivePower() + 1] * 0.8 )--mult
					end
				end
			end
		end
		
		
		
		
		--АВТО ИСЦЕЛЕНИЕ
		if not Hyperspace.App.world.space.gamePaused and not gui.bAutoPaused and not gui.bPaused and not gui.menu_pause then
			varr.micro_tick_counter20 = varr.micro_tick_counter20 + 60.0*Hyperspace.FPS.SpeedFactor
		end
		if (varr.micro_tick_counter20 >= 700.0) then--период исполнения проверки скрипта авто-лечения в миллисекундах
			varr.micro_tick_counter20 = 0.0
			
			-- блок авто-лечения экипажа игрока
			if shipMgr.iShipId == 0 and gui and gui.upgradeButton.bActive and not gui.event_pause and varr.enemy_osa_on_playership == false then
				
				local oxy_contition = hasAnyAugmentationOfList(shipMgr, {"O2_MASKS", "HID_O2_MASKS", "O2_MASKS_CREW_STIMS"})--чтоб не спрашивать много раз ввёл переменную
				local oxygen_percentage = shipMgr:GetOxygenPercentage()
				--if crew.blueprint.name:find('ghost') == nil then
											
				if shipMgr:HasSystem(13) and shipMgr:GetSystem(13):GetEffectivePower() > 0 and isShipStable(shipMgr) then -- 13 is clonebay
					shipMgr.cloneSystem.fTimeToClone = shipMgr.cloneSystem.fTimeGoal
					-- если есть усиления убирающие потерю опыта при клонировании, чтобы не душить и воскрешать просто даём хил.
					if hasAnyAugmentationOfList(shipMgr, {"BACKUP_DNA", "HID_BACKUP_DNA", "BACKUP_DNA_TELEPORT_HEAL"}) == true then
						for crew in vter4(shipMgr.vCrewList) do
							if crew.blueprint.name ~= "osa" and crew.blueprint.name ~= "gus" and crew.blueprint.name ~= "gusq" and crew.blueprint.name:find('ghost') == nil then
								if crew:IsDrone() == false then
									if ((((not crew.bSuffocating) and oxygen_percentage >= 75 and (countOfCrewHealerOfOther(shipMgr) > 0 or shipMgr:GetSystem(2):GetEffectivePower() > 0 or oxy_contition == true)) or crewCanSurviveNoOxygen(crew))) and not crew.extend.deathTimer then
										crew:DirectModifyHealth(999)
									end
								end
							end
						end
					else
						for crew in vter4(shipMgr.vCrewList) do
							if crew.blueprint.name ~= "osa" and crew.blueprint.name ~= "gus" and crew.blueprint.name ~= "gusq" and crew.blueprint.name:find('ghost') == nil then
								-- для рас не теряющих опыт при клонировании, просто хил, если нет угрозы жизни.
								if crew:IsDrone() == false then
									if crew.extend:GetDefinition().cloneLoseSkills == false then
										if ((((not crew.bSuffocating) and oxygen_percentage >= 75 and (countOfCrewHealerOfOther(shipMgr) > 0 or shipMgr:GetSystem(2):GetEffectivePower() > 0 or oxy_contition == true)) or crewCanSurviveNoOxygen(crew))) and not crew.extend.deathTimer then
											crew:DirectModifyHealth(999)
										end
									end
								end
							end
						end
					end
				end
				
				--лечение через орхидов, био-хранителей
				if isShipSuperStable(shipMgr) or (isShipStable(shipMgr) and isAllCrewAnaerobic(shipMgr)) then
					if countOfCrewHealerOfOther(shipMgr) == 1 then
						for crew in vter4(shipMgr.vCrewList) do
							if isHealerOfOther(crew.blueprint.name) == false then
								if crew:IsDrone() == false then
									if ((((not crew.bSuffocating) and oxygen_percentage >= 75 and (countOfCrewHealerOfOther(shipMgr) > 0 or shipMgr:GetSystem(2):GetEffectivePower() > 0 or oxy_contition == true)) or crewCanSurviveNoOxygen(crew))) and not crew.extend.deathTimer then
										crew:DirectModifyHealth(999)
									end
								end
							end
						end
					elseif countOfCrewHealerOfOther(shipMgr) >= 2 then
						for crew in vter4(shipMgr.vCrewList) do
							if crew:IsDrone() == false then
								if ((((not crew.bSuffocating) and oxygen_percentage >= 75 and (countOfCrewHealerOfOther(shipMgr) > 0 or shipMgr:GetSystem(2):GetEffectivePower() > 0 or oxy_contition == true)) or crewCanSurviveNoOxygen(crew))) and not crew.extend.deathTimer then
									crew:DirectModifyHealth(999) -- лекарей 2 и более = все хилятся
								end
							end
						end
					end
				end
				
				--авто-лечение дронов
				if shipMgr:HasSystem(4) and isShipStable(shipMgr) then -- 4 is drones
					for crew in vter4(shipMgr.vCrewList) do
						if crew:IsDrone() == true then
							if shipMgr:GetSystem(4):CompletelyDestroyed() == false then
								if shipMgr:GetSystem(4):GetEffectivePower() > 0 or crew.blueprint.name ~= 'repair_hal' or crew.blueprint.name ~= 'battle_hal' then
									if crew:Functional()==true and not crew.extend.deathTimer then
										crew:DirectModifyHealth(999)
									end
									
									
									-- local maxHealAmount, maxTrueHealAmount = getMaxHealer(shipMgr)				
									-- local healSpeed, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_SPEED_MULTIPLIER)
									-- if (crew:Functional() and not crew.extend.deathTimer) and -- дрон и нету таймера смерти
									-- (((maxHealAmount * healSpeed) + maxTrueHealAmount + getCrewDecay(crew)) >= 0) then -- ХП изменяются в положительную сторону по итогу сложения самохилов и разложений
										-- crew:DirectModifyHealth(999)
										-- --print(crew.blueprint.name..'!')
									-- end
								end
							end
						end
					end
				end
				
				
				if isShipSuperStable(shipMgr) or (isShipStable(shipMgr) and isAllCrewAnaerobic(shipMgr)) then
					if shipMgr:HasSystem(5) and shipMgr:GetSystem(5):GetEffectivePower() > 0 then -- 5 is medbay
						for crew in vter4(shipMgr.vCrewList) do
							if crew.blueprint.name ~= "osa" and crew.blueprint.name ~= "gus" and crew.blueprint.name ~= "gusq" then
								if crew:IsDrone() == false then
									if ((((not crew.bSuffocating) and oxygen_percentage >= 75 and (shipMgr:GetSystem(2):GetEffectivePower() > 0 or oxy_contition == true)) or crewCanSurviveNoOxygen(crew))) and not crew.extend.deathTimer then
										crew:DirectModifyHealth(999)
									end
								end
								
								-- if (not crew:IsDrone()) then
									-- local maxHealAmount, maxTrueHealAmount = getMaxHealer(shipMgr)	
									-- local healSpeed, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_SPEED_MULTIPLIER)
									
									-- if (((maxHealAmount * healSpeed) + maxTrueHealAmount + getCrewDecay(crew)) > 0 -- ХП изменяются в положительную сторону по итогу сложения самохилов и разложений
									-- and (((not crew.bSuffocating) and oxygen_percentage >= 75 and (countOfCrewHealerOfOther(shipMgr) > 0 or shipMgr:GetSystem(2):GetEffectivePower() > 0 or oxy_contition == true)) or crewCanSurviveNoOxygen(crew))) -- не задыхается по разным причинам

									-- -- мутный участок кода. лучше не трогать
									-- and ((currentHealers.size > 1 and (getCrewDecay(crew) == 0 or (currentHealers[shipMgr:GetSystem(5)] and currentHealers[shipMgr:GetSystem(5)] > math.abs(getCrewDecay(crew)))
									-- or not currentHealers[crew])) or not currentHealers[crew])

									-- and not crew.extend.deathTimer then -- нету таймера смерти
										-- crew:DirectModifyHealth(999)
									-- end
								-- end
							end
						end
					-- else
						-- for crew in vter4(shipMgr.vCrewList) do
							-- if crew:IsDrone() == false and crew.blueprint.name ~= "osa" and crew.blueprint.name ~= "gus" and crew.blueprint.name ~= "gusq" then
								-- local maxHealAmount, maxTrueHealAmount = getMaxHealer(shipMgr)	
								-- local healSpeed, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_SPEED_MULTIPLIER)
								
								-- if (((maxHealAmount * healSpeed) + maxTrueHealAmount + getCrewDecay(crew)) > 0 -- ХП изменяются в положительную сторону по итогу сложения самохилов и разложений
								-- and (((not crew.bSuffocating) and oxygen_percentage >= 75 and (countOfCrewHealerOfOther(shipMgr) > 0 or shipMgr:GetSystem(2):GetEffectivePower() > 0 or oxy_contition == true)) or crewCanSurviveNoOxygen(crew))) -- не задыхается по разным причинам
								-- and not crew.extend.deathTimer then -- нету таймера смерти
									-- if (countOfCrewHealerOfOther(shipMgr) == 0) then
										-- --print('0')
										-- -- нет хилеров на корабле и медбей не работает
									-- elseif (countOfCrewHealerOfOther(shipMgr) == 1) then
										-- --print('1')
										-- if ((crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_CREW_AMOUNT) > 0.0 or crew.blueprint.name:find('orchid') ~= nil)) then
											-- -- есть 1 хилер, но себя он не хилит
										-- else
											-- crew:DirectModifyHealth(999) -- хилер хилит других
										-- end
									-- elseif(countOfCrewHealerOfOther(shipMgr) > 1) then
										-- --print('2')
										-- crew:DirectModifyHealth(999) -- хилеров более 1, значит все могут вылечиться
									-- end
								-- end
								
								-- if crew.extend:CalculateStat(Hyperspace.CrewStat.PASSIVE_HEAL_AMOUNT) > 0.0
								-- and (((not crew.bSuffocating) and oxygen_percentage >= 75 and (countOfCrewHealerOfOther(shipMgr) > 0 or shipMgr:GetSystem(2):GetEffectivePower() > 0 or oxy_contition == true)) or crewCanSurviveNoOxygen(crew)) -- не задыхается по разным причинам
								-- and not crew.extend.deathTimer then
									-- crew:DirectModifyHealth(999) -- если есть пассивный хил, работающий через задержку тоже лечим
								-- end
							-- end
						-- end
					end
				end
			end
		end
	end
end)





script.on_internal_event(Defines.InternalEvents.DAMAGE_BEAM, function(shipManager, projectile, location, damage, realNewTile, beamHitType)
    if projectile.extend.name:find("BEAM_ANNIHILATOR") ~= nil and beamHitType == Defines.BeamHit.NEW_ROOM then
	--if projectile.extend.name == "BEAM_ANNIHILATOR" and beamHitType == Defines.BeamHit.NEW_ROOM then
        if gui and gui.event_pause == false then
			if shipManager == Hyperspace.ships.player then
				Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'EVENT_CREW_DEATH_DAMAGE_TO_ENEMY',false,-1)
			elseif shipManager == Hyperspace.ships.enemy then
				Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'EVENT_CREW_DEATH_DAMAGE_TO_PLAYER',false,-1)
			end
		end
    end
	
	
	if projectile.extend.name:find("BA_BEAM_PRISM_BLUE") ~= nil and beamHitType == Defines.BeamHit.NEW_ROOM then
		local dam = Hyperspace.Damage()
		dam.breachChance = 0
		dam.iShieldPiercing = 10
		dam.bLockdown = true
		if shipManager ~= nil then
			shipManager:DamageArea(location, dam, true)
			Hyperspace.Sounds:PlaySoundMix('lockdown1', 5, false)
			--print('tst')
		end
	end
end)


-- дополняет описания на карте маяков и обозначает "ОПАСНО!"
script.on_internal_event(Defines.InternalEvents.GET_BEACON_HAZARD, function (loc)
	if loc.event.eventName == "ICE_FIELD_FIGHT" then
		return Hyperspace.Text:GetText('lua_det_danger_crystals')--"Обнаружено ледяное поле."
	elseif loc.event.eventName == "COLD_FIELD_FIGHT" or loc.event.eventName == "COLD_FIELD_CRYSTAL_FIGHT" then
		return Hyperspace.Text:GetText('lua_det_danger_cold')--"Обнаружена область сверхнизких температур."
	elseif loc.event.eventName == "DRONE_FIELD_PIRATE" or loc.event.eventName == "DRONE_FIELD_REBEL" or loc.event.eventName == "DRONE_FIELD_HAL" then
		return Hyperspace.Text:GetText('lua_det_danger_wild_drones')--"Обнаружены агрессивные дроны."
	elseif loc.event.eventName == "NANITE_FIELD_PIRATE" or loc.event.eventName == "NANITE_FIELD_OLD_PIRATE" then
		return Hyperspace.Text:GetText('lua_det_danger_nanites')--"Обнаружено нанитное облако."
	elseif loc.event.eventName == "RADIOACTIVE_MINING" then
		return Hyperspace.Text:GetText('lua_det_danger_radiation')--"Обнаружено сильное радиоактивное излучение."
	elseif loc.event.eventName == "ULTRA_SUN_FIGHT" then
		return Hyperspace.Text:GetText('lua_det_danger_ultra_sun')--"Обнаружена область сверхвысоких температур."
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
		if projectile.ownerId == 0 and enemyShip and enemyShip._targetable:IsCloaked() == true then
			Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_HIT_CLOAKED", false)
		end
		
		if damage.iDamage > 0 then
			if shipManager.iShipId == 0 then -- hit to player
				if hasAnyAugmentationOfList(shipManager, {"RADIOACTIVE", "MARKER_RADIOACTIVE", "HID_RADIOACTIVE"}) == true then
					radioactivity_firedamage(1)
				end
			else -- hit to enemy
				if hasAnyAugmentationOfList(shipManager, {"RADIOACTIVE", "MARKER_RADIOACTIVE", "HID_RADIOACTIVE"}) == true then
					radioactivity_firedamage(0)
				end
			end
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
					if math.random(0,100) < varr.current_beacon_drillwork_chance then
						varr.current_beacon_drillwork_chance = varr.current_beacon_drillwork_chance - 10
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
				--фикс учитывает что у целевого корабля может быть золт.щит и отправит народ со своего туда только если есть обход золт.щита
				local bWillWork = true
				if shipManager.iShipId == projectile.ownerId then
					local otherShipManager = Hyperspace.Global.GetInstance():GetShipManager(1-shipManager.iShipId)
					--print(otherShipManager.shieldSystem.shields.power.super.first)
					if otherShipManager and otherShipManager.shieldSystem ~= nil and otherShipManager.shieldSystem.shields.power.super.first > 0 then
						if hasAnyAugmentationOfList(shipManager, {"ZOLTAN_BYPASS", "ENERGY_SHIELD_ZOLTAN_BYPASS"}) == false then
							bWillWork = false
						end
					end
				end
				if bWillWork == true then
					for crew in vter(shipManager.vCrewList) do
						if crew.iRoomId == iTeleId then
							crew.extend:InitiateTeleport(iTargShipId, -1, -1)
						end
					end
				else
					Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
					--print('no no no')
				end
			end
			
			
			
			
			
			if weaponName:find("BA_MISSILES_ASIN") ~= nil then
				for crew in vter(shipManager.vCrewList) do
					if crew:IsDrone() == true or crew.blueprint.name:find("engi") ~= nil or crew.blueprint.name:find("ghost") ~= nil then
						if crew.health.first > 0.0 and crew.bOutOfGame == false then
							crew:DirectModifyHealth(-30)
							crew.fStunTime = crew.fStunTime + 3.0
						end
					end
				end
				Hyperspace.Sounds:PlaySoundMix('ionHit1', 2, false)
			end
			if weaponName:find("BA_MISSILES_TAU") ~= nil then
				if shipManager:HasSystem(6) then
					shipManager:GetSystem(6):IonDamage(1)
					--print('.iLockCount'..shipManager:GetSystem(6).iLockCount)
					Hyperspace.Sounds:PlaySoundMix('ionHit1', 2, false)
					for crew in vter(shipManager.vCrewList) do
						if crew.iRoomId == shipManager:GetSystem(6):GetRoomId() then
							if crew.health.first > 0.0 and crew.bOutOfGame == false then
								crew.fStunTime = crew.fStunTime + 3.0
							end
						end
					end
				end
			end
			
		end
	end
end)



--playerShip:PrepareSuperBarrage() волна босса 3 фазы. жесть дикая.




--local cEvent = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
--local c2Event = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
-- блок очистки/встраивания инжекторов
local types_of_injectors = {[0]="_PRC",[1]="_BRC",[2]="_CLD",[3]="_FRC",[4]="_POW",[5]="_UNI",[6]="_ACC",[7]="_RDY"}
function create_choise_injector_removing(locname, event)
	local indx8 = 0
	local cEvent = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
	local c2Event = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
	for i = 0, 7 do
		indx8 = locname:find(types_of_injectors[i])
		if indx8 ~= nil and Hyperspace.Blueprints:GetWeaponBlueprint(locname:sub(0, indx8-1)).desc.cost > 0 then
			cEvent = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
			--cEvent.text.data = "Вы удаляете инжектор из вашего орудия. Теперь в него можно установить другой инжектор."
			cEvent.text.data = Hyperspace.Text:GetText('lua_remove_inj')
			cEvent.stuff.removeItem = locname
			cEvent.stuff.weapon = Hyperspace.Blueprints:GetWeaponBlueprint(locname:sub(0, indx8-1))
			if types_of_injectors[i] == "_PRC" then
				event:AddChoice(cEvent, Hyperspace.Text:GetText('lua_remove_inj_PRC'), Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_BRC" then
				event:AddChoice(cEvent, Hyperspace.Text:GetText('lua_remove_inj_BRC'), Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_CLD" then
				event:AddChoice(cEvent, Hyperspace.Text:GetText('lua_remove_inj_CLD'), Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_FRC" then
				event:AddChoice(cEvent, Hyperspace.Text:GetText('lua_remove_inj_FRC'), Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_POW" then
				event:AddChoice(cEvent, Hyperspace.Text:GetText('lua_remove_inj_POW'), Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_UNI" then
				event:AddChoice(cEvent, Hyperspace.Text:GetText('lua_remove_inj_UNI'), Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_ACC" then
				event:AddChoice(cEvent, Hyperspace.Text:GetText('lua_remove_inj_ACC'), Hyperspace.ChoiceReq(), false)
			elseif types_of_injectors[i] == "_RDY" then
				event:AddChoice(cEvent, Hyperspace.Text:GetText('lua_remove_inj_RDY'), Hyperspace.ChoiceReq(), false)
			end
		end
	end
end
function create_choise_injector_injecting(locname, event, type_of_inj)
	if Hyperspace.Blueprints:GetWeaponBlueprint(locname..type_of_inj).desc.cost > 0 then
		local cEvent = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
		cEvent.text.data = Hyperspace.Text:GetText('lua_inj_add1')
		cEvent.stuff.removeItem = locname
		cEvent.stuff.weapon = Hyperspace.Blueprints:GetWeaponBlueprint(locname..type_of_inj)
		c2Event = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
		cEvent.text.data = Hyperspace.Text:GetText('lua_inj_add2')
		c2Event.stuff.removeItem = "INJECTOR"..type_of_inj
		c2Event.eventName = "ENJECTOR_WAS_INJECTED"
		cEvent:GetChoices()[0].event = c2Event
		event:AddChoice(cEvent, Hyperspace.Text:GetText('lua_inj_sel'), Hyperspace.ChoiceReq(), false)
	end
end

script.on_internal_event(Defines.InternalEvents.PRE_CREATE_CHOICEBOX, function(event)

	-- этот блок отслеживает встраивание усилений. проверяет только те, что включены в список "CAN_BE_HIDDEN_AUGS"
	-- присваивает переменной значение 1, если встроено.
	if event.eventName:find("STORE_INSTALL_") ~= nil then
		for augs in vter2 (Hyperspace.Blueprints:GetBlueprintList("CAN_BE_HIDDEN_AUGS")) do
			if event.eventName == "STORE_INSTALL_"..augs then
				Hyperspace.playerVariables['installed_'..augs] = 1
				--print('installation!'..augs)
			end
		end
	end
	if event.eventName == "ADD_AUG_SLOT" then
		Hyperspace.playerVariables['installed_AUG_SLOT'] = Hyperspace.playerVariables['installed_AUG_SLOT'] + 1
		--print('installation!'..augs)
	end

	if Hyperspace.metaVariables['challenge_noinst'] == 1 then
		if event.eventName == "EVENT_CARGO_BUTTON" then
			for i = 0, event:GetChoices():size()-1 do
				local cho = event:GetChoices()[i]
				if cho ~= nil and cho.event ~= nil and cho.text.data:find('в конструкции') ~= nil then
					event:RemoveChoice(i)
					--print('done')
					break
				end
			end
		end
	end
	-- <choice hidden="false" req="CAN_BE_HIDDEN_AUGS" blue="false">
		-- <text color="violet">Встроить усиление в конструкции корабля, освободив слот для других усилений. Недоступно для усилений, которые можно хранить в нескольких экземплярах, сдвоенных усилений и для усилений, которые могут быть улучшены.</text>
		-- <event><queueEvent>EVENT_CARGO_INST</queueEvent></event>
	-- </choice><!-- 1.33 -->

	if event.eventName == "STALEMATE_SURRENDER" and enemyShip and enemyShip.myBlueprint.blueprintName:find("INVISIBLE_SHIP")~=nil then
		event.text.data = Hyperspace.Text:GetText('lua_engi_monster_text_replacer')
		for i = 0, event:GetChoices():size()-1 do
			local cho = event:GetChoices()[i]
			if cho ~= nil and cho.event ~= nil and cho.text.data:find('одолеть') ~= nil then
				event:RemoveChoice(i)
				--print('done')
				break
			end
		end
	end
	
	
	
	if event.eventName == "EVENT_KIZDOS_INFO" or event.eventName == "EVENT_KIZDOS_INFO2" then
		if event.text.data:find("Ультранасосы")~=nil then
			local str_inp44 = varr.full_list_of_game_equipment[math.floor(Hyperspace.metaVariables['additional_flagship_augment'])]
			--print(str_inp44)
			if Hyperspace.Blueprints:GetAugmentBlueprint(str_inp44).desc.title ~= nil then --.cost ~= nil then
				if str_inp44 == "SLUG_GEL" then
					event.text.data = string.gsub(event.text.data,"Ультранасосы", Hyperspace.Blueprints:GetAugmentBlueprint(str_inp44).desc.title:GetText())
					event.text.data = string.gsub(event.text.data,"и гель слизней ", "") 
				elseif str_inp44 == "DRONE_SPEED" then
					event.text.data = string.gsub(event.text.data,"Ультранасосы", Hyperspace.Blueprints:GetAugmentBlueprint(str_inp44).desc.title:GetText())
					event.text.data = string.gsub(event.text.data,"ускоритель дронов и ", "")
				else
					event.text.data = string.gsub(event.text.data,"Ультранасосы", Hyperspace.Blueprints:GetAugmentBlueprint(str_inp44).desc.title:GetText())
				end
				
				if Hyperspace.metaVariables['challenge_nobf'] == 1 then
					event.text.data = string.gsub(event.text.data,"на последней", "на последних двух из четырёх фаз")
				end
			end
			
		end
	end

	if event.eventName == "CIVILIAN_COREWORLD_STATION" then
		if event.text.data:find("отходы")~=nil then
			local rep_text = '\n'
			for i = 0, 14 do
				if Hyperspace.metaVariables['unallowed_eq'..tostring(i)] ~= 0 then
					local equip_name2 = varr.full_list_of_game_equipment[Hyperspace.metaVariables['unallowed_eq'..tostring(i)]]
					if Hyperspace.Blueprints:GetWeaponBlueprint(equip_name2).desc.cost > 0 then
						rep_text = rep_text..Hyperspace.Blueprints:GetWeaponBlueprint(equip_name2):GetNameLong()
					elseif Hyperspace.Blueprints:GetDroneBlueprint(equip_name2).desc.cost > 0 then
						rep_text = rep_text..Hyperspace.Blueprints:GetDroneBlueprint(equip_name2):GetNameLong()
					elseif Hyperspace.Blueprints:GetAugmentBlueprint(equip_name2).desc.cost > 0 then
						rep_text = rep_text..Hyperspace.Blueprints:GetAugmentBlueprint(equip_name2):GetNameLong()
					end
					if i == 14 then
						rep_text = rep_text..'.'
					else
						rep_text = rep_text..', '
					end
					--print('set 0 to =='..equip_name)
				end
			end
			event.text.data = string.gsub(event.text.data,"отходы", rep_text)
		end
	end
	
	
	
	if event.eventName == "SHIP_BOSS_4_PHASE_1" or event.eventName == "SHIP_BOSS_4_PHASE_4" then
		if event.text.data:find("Кестрел")~=nil then
			event.text.data = string.gsub(event.text.data,"Кестрел", tostring(Hyperspace.Blueprints:GetShipBlueprint(playerShip.myBlueprint.blueprintName, 1).shipClass.data))
		end
	end
	--print(Hyperspace.Blueprints:GetShipBlueprint(playerShip.myBlueprint.blueprintName, 1).shipClass.data)
	--print(Hyperspace.Blueprints:GetShipBlueprint(playerShip.myBlueprint.blueprintName, 1).name.data)
	
	
	
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

	--if event.text:GetText():find('Вы совершаете выгодный обмен и, довольные, отправляетесь на торговую площадку.') ~= nil then
	if event.text:GetText():find(Hyperspace.Text:GetText('lua_marker_phrase_to_ach')) ~= nil then
		Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_SHILO_MILO", false)
	end
	
	
	if event.eventName == "EVENT_REMOVE_ALL_GUS1" then
		if event.stuff then
			if event.stuff.scrap >= 1.0 and event.stuff.scrap <= 4.0 then --в общем-то параноидальное условие... боюсь что краны сделают чёрное дело...
				local gus_cost = 0
				if playerShip then
					for crew in vter(playerShip.vCrewList) do
						if crew.intruder == false and crew.health.first > 0.0 and crew.bOutOfGame == false then
							if crew.blueprint.name == "gus" then
								crew:Kill(true)
								gus_cost = gus_cost + 25
							end
						end
					end
				end
				event.stuff.scrap = gus_cost
			end
		end
	elseif event.eventName == "EVENT_REMOVE_ALL_GUS2" then
		if event.stuff then
			if event.stuff.scrap >= 1.0 and event.stuff.scrap <= 4.0 then
				local gus_cost = 0
				if playerShip then
					for crew in vter(playerShip.vCrewList) do
						if crew.intruder == false and crew.health.first > 0.0 and crew.bOutOfGame == false then
							if crew.blueprint.name == "gus" then
								crew:Kill(true)
								gus_cost = gus_cost + 40
							end
						end
					end
				end
				event.stuff.scrap = gus_cost
			end
		end
	end
	
	
	
	--event:AddChoice(locEvent, "choice text", req, false)
	
	
	if Hyperspace.metaVariables['challenge_noscrap'] == 1 then
		-- снижает приход лома в событиях
		if event.stuff and Hyperspace.metaVariables['in_store_now'] ~= 2 then
			if event.stuff.scrap > 1.0 then
				if varr.array_memory_of_scrap_decreasing [event.eventName] ~= 1 then
					event.stuff.scrap = math.floor(event.stuff.scrap * 0.5)
					--print(event.eventName..'eve to'..event.stuff.scrap)
					varr.array_memory_of_scrap_decreasing [event.eventName] = 1
				end
			end
			for i = 0, event:GetChoices():size()-1 do
				local cho = event:GetChoices()[i]
				if cho ~= nil and cho.event ~= nil then
					if varr.array_memory_of_scrap_decreasing [cho.event.eventName] ~= 1 then
						if cho.event.stuff.scrap > 1.0 then
							cho.event.stuff.scrap = math.floor(cho.event.stuff.scrap * 0.5)
							--print(cho.event.eventName..'cho to'..cho.event.stuff.scrap)
							varr.array_memory_of_scrap_decreasing [cho.event.eventName] = 1
						end
					end
				end
			end
		end
	end
	
	
	-- блоки ниже запоминают в событиях какие орудия предлагал торговец и при его последующем захвате даст именно эти пушки в награду.
	if event.eventName == "NEBULA_WEAPONS_TRADER_NORMAL" or event.eventName == "NEBULA_WEAPONS_TRADER_SKIDKA" or event.eventName == "NEBULA_WEAPONS_TRADER_BEZSKIDKI" then
		varr.str_remembered_trader_weapon = ""
		for i = 0, event:GetChoices():size()-1 do
			local cho = event:GetChoices()[i]
			if cho ~= nil and cho.event ~= nil then
				if cho.event.stuff.weapon ~= nil then
					varr.str_remembered_trader_weapon = cho.event.stuff.weapon.name
					--print('remembered='..varr.str_remembered_trader_weapon)
				end
			end
		end
	end
	if event.eventName == "NEIZ_END_NORMAL" then
		if event.stuff.weapon ~= nil and varr.str_remembered_trader_weapon ~= "" then
			event.stuff.weapon = Hyperspace.Blueprints:GetWeaponBlueprint(varr.str_remembered_trader_weapon)
			--print('replaced back')
		end
	end
	
	
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
	
	--ауг повышение точности артиллерии. у врага/игрока работает
	if proj_factory.isArtillery == true then
		if projectile.ownerId == 1 and enemyShip and enemyShip:HasAugmentation("ART_ACCURACY")>0 then
			projectile.extend.customDamage.accuracyMod = projectile.extend.customDamage.accuracyMod + 100
			--print('en work')
		elseif projectile.ownerId == 0 and playerShip and hasAnyAugmentationOfList(playerShip, {"ART_ACCURACY", "HID_ART_ACCURACY"})==true then
			projectile.extend.customDamage.accuracyMod = projectile.extend.customDamage.accuracyMod + 100
			--print('pl work')
		end
	end
	
	
	if proj_factory.blueprint.name:find("SOULREAPER") ~= nil then
			
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
	
	if proj_factory.blueprint.name:find("ARTILLERY_PL_BOMB_TIMER") ~= nil or
	proj_factory.blueprint.name:find("FR_PLAYER_BOMB") ~= nil or
	proj_factory.blueprint.name:find("ARTILLERY_PL_BOMB_BREACH") ~= nil then
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

	if projectile.ownerId == 1 then
		diff = tostring(math.floor(Hyperspace.Settings.difficulty))
		--улучшенное целеуказание для нелучевых орудий
		if Hyperspace.metaVariables['enemy_has_advanced_ai'] == 1 then
			if proj_factory.blueprint.typeName ~= "BEAM" then --с лучами сложно, не лезем в целеуказание
				if diff == '2' and GSIp and playerShip.ship.hullIntegrity.first >= 12 and math.random(0,100) < 70 then
					local targ_id1 = -1
					
					-- выцеливает клон-отсек если там кто-то есть =(o\_/o)=
					if targ_id1 == -1 and playerShip:HasSystem(13) and playerShip:GetSystem(13):CompletelyDestroyed() == false and math.random(0,100) < 30 then
						if projectile.damage.iDamage > 0 or projectile.damage.iIonDamage > 0 or projectile.damage.iSystemDamage > 0 then
							if playerShip.cloneSystem.fTimeToClone > 0.05 then
								targ_id1 = playerShip:GetSystemRoom(13) -- clonebay
								--print('targ clonebay')
							end
						end
					end
					
					-- выцеливаем экипаж игрока с малыми хп
					if targ_id1 == -1 then
						if projectile.damage.iDamage > 0 or projectile.damage.breachChance > 0.0 or projectile.damage.fireChance > 0.0 or projectile.damage.iPersDamage > 0 or projectile.damage.iStun > 0 or projectile.damage.stunChance > 0.0 then
							if playerShip then
								for crew in vter(playerShip.vCrewList) do
									if crew.intruder == false and crew.blueprint.name ~= "alien" and crew.blueprint.name ~= "osae" then
										if crew.health.first > 0.0 and crew.health.first < 40.0 and math.random(0,100) < 10 then
											targ_id1 = crew.iRoomId
											--print('targ weak hp')
										end
									end
								end
							end
						end
					end
					
					
					if targ_id1 == -1 and playerShip:HasSystem(0) and playerShip:GetSystem(0).shields and playerShip:GetSystem(0).shields.power.first >= 1 and math.random(0,100) < 45 then--50
						targ_id1 = playerShip:GetSystemRoom(0) -- shields
					end
					if targ_id1 == -1 and playerShip:HasSystem(1) and playerShip:GetSystem(1).healthState.first > 2 and math.random(0,100) < 40 then--45
						targ_id1 = playerShip:GetSystemRoom(1) -- engines
					end
					if targ_id1 == -1 and playerShip.weaponSystem and playerShip.weaponSystem.healthState.first > 2 and math.random(0,100) < 39 then--45
						targ_id1 = playerShip:GetSystemRoom(3) -- weapons
					end
					
					if targ_id1 == -1 then
						targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
					end
					
					--если орудие имеет ионный урон и целевой отсек не имеет системы пытаемся переопределить цель на отсек с системой.
					if projectile.damage.iIonDamage > 0 then
						if playerShip:GetSystemInRoom(targ_id1) == nil then
							targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
							if playerShip:GetSystemInRoom(targ_id1) == nil then
								targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
								if playerShip:GetSystemInRoom(targ_id1) == nil then
									targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
									if playerShip:GetSystemInRoom(targ_id1) == nil then
										targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
									end
								end
							end
						end
					end
					
					--бомбами по пустым отсекам стараемся не стрелять
					if proj_factory.blueprint.typeName == "BOMB" then
						if playerShip:GetSystemInRoom(targ_id1) == nil then
							targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
							if playerShip:GetSystemInRoom(targ_id1) == nil then
								targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
								if playerShip:GetSystemInRoom(targ_id1) == nil then
									targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
									if playerShip:GetSystemInRoom(targ_id1) == nil then
										targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
									end
								end
							end
						end
					end
					
					--если орудие имеет модификатор х2 урона по пустым отсекам - наоборот пытается переопределить цель в пустой отсек
					if projectile.damage.iDamage > 0 and projectile.damage.bHullBuster == true then
						if math.random(0,100) < 85 then --лёгкий нерф способности выцеливать пустые, а то плакать будут...
							--print('hb redefined')
							if playerShip:GetSystemInRoom(targ_id1) ~= nil then
								targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
								if playerShip:GetSystemInRoom(targ_id1) ~= nil then
									targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
									if playerShip:GetSystemInRoom(targ_id1) ~= nil then
										targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
										if playerShip:GetSystemInRoom(targ_id1) ~= nil then
											targ_id1 = GSIp.rooms[math.random(0, GSIp.rooms:size()-1)].iRoomId
										end
									end
								end
							end
						end
					end
					
					projectile.target = playerShip:GetRoomCenter(targ_id1)
				end
			end
		end
	end
	
	
	-- обслуживание живого говорящего орудия
	if proj_factory.blueprint.name:find("LASER_ALIVE") ~= nil then
		if math.random(0,100) < 30 or varr.micro_tick_counter6 > 0.0 then --шанс выстрела не туда
			if proj_factory.targetId == 0 then
				projectile.target = Hyperspace.ships.player:GetRandomRoomCenter()
			else
				projectile.target = Hyperspace.ships.enemy:GetRandomRoomCenter()
				-- анимации-фразы когда выёживается и стреляет не туда:
				-- СТРЕЛЯЮ - КУДА ХОЧУ! БЬЮ БЕЗ ПРОМАХА! ЦЕЛЬ ПЕРЕОПРЕДЕЛЕНА! СМОТРИ И УЧИСЬ! ВОТ ТАК-ТО ЛУЧШЕ! ПРИЦЕЛ ПОПРАВЛЕН! Я ЛУЧШЕ ЗНАЮ! ВОТ СЮДА БАХНУ! ДАЁШЬ БУНТ!
				if varr.micro_tick_counter6 <= 0.0 then
					local px = gui.shipPosition.x + projectile.position.x
					local py = gui.shipPosition.y + projectile.position.y
					-- if proj_factory.mount.mirror == true then
					table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("effects/talk_weapon_"..tostring(math.random(0,7))..".png"), time_length = 1800.0, time_length_mem = 1800.0, x = px+6, y = py-45, w=250, h=50, fw=250, fh=50, layer = "SPACE_STATUS"})
					varr.micro_tick_counter6 = 2000.0
				end
				projectile.extend.customDamage.accuracyMod = projectile.extend.customDamage.accuracyMod - 10
			end
		end
	end
	
	
	if proj_factory.blueprint.name:find("DRONE_LAUNCHER") ~= nil then
		if projectile.ownerId == 0 then
			--игрок стреляет
			if enemyShip and enemyShip.ship.hullIntegrity.first > 0 and player_cargo_has_combat_drone()==true then
				local sdr = nil
				local inum = 0
				local dronesarr = {}
				for carg in vter(gui.equipScreen:GetCargoHold()) do
					if Hyperspace.Blueprints:GetDroneBlueprint(carg).desc.cost > 0 then
						if Hyperspace.Blueprints:GetDroneBlueprint(carg).typeName == "COMBAT" then
							dronesarr[inum] = carg
							inum = inum + 1
						end
					end
				end
				local spawndrone = dronesarr[math.random(0, #dronesarr)]
				sdr = playerShip:CreateSpaceDrone(Hyperspace.Blueprints:GetDroneBlueprint(spawndrone))
				sdr:SetDeployed(true)
				sdr.powerRequired = 0
				sdr.powered = true
				sdr.lifespan = 4.0
				
				local px = gui.combatControl.targetPosition.x+gui.combatControl.position.x + sdr.currentLocation.x
				local py = gui.combatControl.targetPosition.y+gui.combatControl.position.y + sdr.currentLocation.y
				table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("effects/drone_launcher_effect.png"), time_length = 200.0, time_length_mem = 200.0, x = px-15, y = py-15, w=240, h=30, fw=30, fh=30, layer = "SPACE_STATUS_up"})
				
				Hyperspace.Sounds:PlaySoundMix('droneLaunch', 7, false)
			else
				Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
				proj_factory.powered = false
			end
		else
			--враг стреляет
			if playerShip and playerShip.ship.hullIntegrity.first > 0 then
				local sdr = nil
				local inum = 0
				local dronesarr = {}
				if varr.current_beacon_enemy_cargo_drone == "" then
					for stringy in vter (Hyperspace.Blueprints:GetBlueprintList('DRONES_COMBAT')) do
						dronesarr[inum] = stringy
						inum = inum + 1
					end
					varr.current_beacon_enemy_cargo_drone = dronesarr[math.random(0, #dronesarr)]
					if math.random(0,100)<20 then
						varr.current_beacon_enemy_cargo_drone2 = dronesarr[math.random(0, #dronesarr)]
					end
				end
				if varr.current_beacon_enemy_cargo_drone2 ~= "" and math.random(0,100)<50 then
					sdr = enemyShip:CreateSpaceDrone(Hyperspace.Blueprints:GetDroneBlueprint(varr.current_beacon_enemy_cargo_drone2))
				else
					sdr = enemyShip:CreateSpaceDrone(Hyperspace.Blueprints:GetDroneBlueprint(varr.current_beacon_enemy_cargo_drone))
				end
				sdr:SetDeployed(true)
				sdr.powerRequired = 0
				sdr.powered = true
				sdr.lifespan = 4.0
				
				local px = gui.shipPosition.x + sdr.currentLocation.x
				local py = gui.shipPosition.y + sdr.currentLocation.y
				table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("effects/drone_launcher_effect.png"), time_length = 200.0, time_length_mem = 200.0, x = px-15, y = py-15, w=240, h=30, fw=30, fh=30, layer = "SPACE_STATUS_up"})
				
				Hyperspace.Sounds:PlaySoundMix('droneLaunch', 7, false)
			end
		end
		projectile:Kill()
	end
	
	-- for sect in vter(Hyperspace.App.world.starMap.sectors) do
        -- if sect then
			-- print(sect.description.type) --даёт список секторов всех
		-- end
	-- end

	
	
end)
script.on_internal_event(Defines.InternalEvents.PROJECTILE_INITIALIZE, function(projectile, weaponBlueprint)
	if weaponBlueprint.name:find("BA_BEAM_VILKA_V") ~= nil then
		local beam_dist = 1200.0
		local corrected_targ = projectile.target
		local wbp = Hyperspace.Blueprints:GetWeaponBlueprint('BA_BEAM_VILKA_DEF')
		local beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ, Hyperspace.Pointf(corrected_targ.x, corrected_targ.y + 1), projectile.destinationSpace, 1, projectile.heading)--projectile.heading
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)
		
		corrected_targ.y = corrected_targ.y - 35.0
		beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ, Hyperspace.Pointf(corrected_targ.x, corrected_targ.y + 1), projectile.destinationSpace, 1, projectile.heading)
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)
		
		corrected_targ.y = corrected_targ.y + 70.0
		beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ, Hyperspace.Pointf(corrected_targ.x, corrected_targ.y + 1), projectile.destinationSpace, 1, projectile.heading)
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)
		
		projectile:Kill()
	end
	if weaponBlueprint.name:find("BA_BEAM_VILKA_G") ~= nil then
		local beam_dist = 1200.0
		local corrected_targ = projectile.target
		local wbp = Hyperspace.Blueprints:GetWeaponBlueprint('BA_BEAM_VILKA_DEF')
		local beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ, Hyperspace.Pointf(corrected_targ.x, corrected_targ.y + 1), projectile.destinationSpace, 1, projectile.heading)--projectile.heading
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)
		
		corrected_targ.x = corrected_targ.x - 35.0
		beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ, Hyperspace.Pointf(corrected_targ.x, corrected_targ.y + 1), projectile.destinationSpace, 1, projectile.heading)
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)
		
		corrected_targ.x = corrected_targ.x + 70.0
		beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ, Hyperspace.Pointf(corrected_targ.x, corrected_targ.y + 1), projectile.destinationSpace, 1, projectile.heading)
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)
		
		projectile:Kill()
	end
	
	
	--print (math.deg(3.14))--180 -- перевод длины окружности в градусы, не нужно в этот раз...
	if weaponBlueprint.name:find("BA_BEAM_PRISM_MAIN") ~= nil then
		local beam_dist = 1200.0
		local memory_targ1 = projectile.target1
		local memory_targ2 = projectile.target2
		local corrected_targ1 = memory_targ1
		local corrected_targ2 = memory_targ2
		local wbp = Hyperspace.Blueprints:GetWeaponBlueprint('BA_BEAM_PRISM_RED')
		local beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ1, corrected_targ2, projectile.destinationSpace, projectile.length, projectile.heading)--projectile.heading
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)
		beam.position = Hyperspace.Pointf(beam.position.x-4, beam.position.y-4)
		
		corrected_targ1 = memory_targ1
		corrected_targ2 = memory_targ2
		local dx = corrected_targ2.x - corrected_targ1.x
		local dy = corrected_targ2.y - corrected_targ1.y
		local lenn = projectile.length
		local coeff = (math.sqrt(dx*dx+dy*dy))/lenn -- вынужденный коэффициент, нужен для врагов. т.к. их целеуказание берёт не точки начало-конец луча, а точки корабля 
		local anglee = (180*math.acos(dx/(lenn*coeff)))/math.pi
		if dy > 0 then
			anglee = -anglee
		end
		anglee = anglee + 53
		if anglee > 180 then
			anglee = anglee - 360
		elseif anglee < -180 then
			anglee = anglee + 360
		end
		corrected_targ2.x = corrected_targ1.x + lenn*math.cos(math.pi*anglee/180)
		corrected_targ2.y = corrected_targ1.y - lenn*math.sin(math.pi*anglee/180)
		wbp = Hyperspace.Blueprints:GetWeaponBlueprint('BA_BEAM_PRISM_ORANGE')
		beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ1, corrected_targ2, projectile.destinationSpace, projectile.length, projectile.heading)--projectile.heading
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)
		beam.position = Hyperspace.Pointf(beam.position.x-3, beam.position.y-3)
		
		anglee = (180*math.acos(dx/(lenn*coeff)))/math.pi
		if dy > 0 then
			anglee = -anglee
		end
		anglee = anglee + 106
		if anglee > 180 then
			anglee = anglee - 360
		elseif anglee < -180 then
			anglee = anglee + 360
		end
		corrected_targ2.x = corrected_targ1.x + lenn*math.cos(math.pi*anglee/180)
		corrected_targ2.y = corrected_targ1.y - lenn*math.sin(math.pi*anglee/180)
		wbp = Hyperspace.Blueprints:GetWeaponBlueprint('BA_BEAM_PRISM_YELLOW')
		beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ1, corrected_targ2, projectile.destinationSpace, projectile.length, projectile.heading)--projectile.heading
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)
		beam.position = Hyperspace.Pointf(beam.position.x-2, beam.position.y-2)
		
		anglee = (180*math.acos(dx/(lenn*coeff)))/math.pi
		if dy > 0 then
			anglee = -anglee
		end
		anglee = anglee + 159--53--106
		if anglee > 180 then
			anglee = anglee - 360
		elseif anglee < -180 then
			anglee = anglee + 360
		end
		corrected_targ2.x = corrected_targ1.x + lenn*math.cos(math.pi*anglee/180)
		corrected_targ2.y = corrected_targ1.y - lenn*math.sin(math.pi*anglee/180)
		wbp = Hyperspace.Blueprints:GetWeaponBlueprint('BA_BEAM_PRISM_GREEN')
		beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ1, corrected_targ2, projectile.destinationSpace, projectile.length, projectile.heading)--projectile.heading
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)
		beam.position = Hyperspace.Pointf(beam.position.x+0, beam.position.y+0)
		
		anglee = (180*math.acos(dx/(lenn*coeff)))/math.pi
		if dy > 0 then
			anglee = -anglee
		end
		anglee = anglee - 159
		if anglee > 180 then
			anglee = anglee - 360
		elseif anglee < -180 then
			anglee = anglee + 360
		end
		corrected_targ2.x = corrected_targ1.x + lenn*math.cos(math.pi*anglee/180)
		corrected_targ2.y = corrected_targ1.y - lenn*math.sin(math.pi*anglee/180)
		wbp = Hyperspace.Blueprints:GetWeaponBlueprint('BA_BEAM_PRISM_CYAN')
		beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ1, corrected_targ2, projectile.destinationSpace, projectile.length, projectile.heading)--projectile.heading
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)
		beam.position = Hyperspace.Pointf(beam.position.x+2, beam.position.y+2)
		
		anglee = (180*math.acos(dx/(lenn*coeff)))/math.pi
		if dy > 0 then
			anglee = -anglee
		end
		anglee = anglee - 106
		if anglee > 180 then
			anglee = anglee - 360
		elseif anglee < -180 then
			anglee = anglee + 360
		end
		corrected_targ2.x = corrected_targ1.x + lenn*math.cos(math.pi*anglee/180)
		corrected_targ2.y = corrected_targ1.y - lenn*math.sin(math.pi*anglee/180)
		wbp = Hyperspace.Blueprints:GetWeaponBlueprint('BA_BEAM_PRISM_BLUE')
		beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ1, corrected_targ2, projectile.destinationSpace, projectile.length, projectile.heading)--projectile.heading
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)
		beam.position = Hyperspace.Pointf(beam.position.x+3, beam.position.y+3)

		anglee = (180*math.acos(dx/(lenn*coeff)))/math.pi
		if dy > 0 then
			anglee = -anglee
		end
		anglee = anglee - 53
		if anglee > 180 then
			anglee = anglee - 360
		elseif anglee < -180 then
			anglee = anglee + 360
		end
		corrected_targ2.x = corrected_targ1.x + lenn*math.cos(math.pi*anglee/180)
		corrected_targ2.y = corrected_targ1.y - lenn*math.sin(math.pi*anglee/180)
		wbp = Hyperspace.Blueprints:GetWeaponBlueprint('BA_BEAM_PRISM_VIOLET')
		beam = Hyperspace.App.world.space:CreateBeam(wbp, projectile.position, projectile.currentSpace, projectile.ownerId, corrected_targ1, corrected_targ2, projectile.destinationSpace, projectile.length, projectile.heading)--projectile.heading
		beam.sub_start.x = beam_dist*math.cos(projectile.entryAngle)
	    beam.sub_start.y = beam_dist*math.sin(projectile.entryAngle)		
		beam.position = Hyperspace.Pointf(beam.position.x+4, beam.position.y+4)
		
		projectile:Kill()
	end
	
end)





-- показывает количество суперщитов у вражеских кораблей
local shieldBox = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/vanilla_shield_on.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
local shieldBoxOff = Hyperspace.Resources:CreateImagePrimitiveString('statusUI/vanilla_shield_off.png', 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1.0, false)
script.on_render_event(Defines.RenderEvents.SHIP, function() end, function()
	if enemyShip and playerShip and not playerShip.bJumping and Hyperspace.Global.GetInstance():GetCApp().world.bStartedGame then
		if enemyShip.shieldSystem and enemyShip.shieldSystem.shields.power.super.second ~= 0 and enemyShip.ship.hullIntegrity.first > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_LoadIdentity()
			if Hyperspace.Global.GetInstance():GetCApp().gui.combatControl.boss_visual == true then
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
		--play_anim_tick_array ("SPACE_STATUS")
		play_anim_tick_array ("SPACE_STATUS")
		if Hyperspace.playerVariables['used_tactical_pause'] == 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(1267, 709)
			Graphics.CSurface.GL_RenderPrimitive(varr.button_no_tactical_pause)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside({x = 1267, y = 709, w = 13, h = 11}) then
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip("В этом полёте не использовалась тактическая пауза.")
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_nousedtacticalpause'))
			end
		end
		
		if Hyperspace.metaVariables['challenge_nopause'] == 1 or 
			Hyperspace.metaVariables['challenge_nofuel'] == 1 or 
			Hyperspace.metaVariables['challenge_nobrain'] == 1 or 
			Hyperspace.metaVariables['challenge_noaug'] == 1 or 
			Hyperspace.metaVariables['challenge_nomaxhp'] == 1 or 
			Hyperspace.metaVariables['challenge_nowst'] == 1 or 
			Hyperspace.metaVariables['challenge_nobf'] == 1 or 
			Hyperspace.metaVariables['challenge_noscrap'] == 1 or 
			Hyperspace.metaVariables['challenge_nosysca'] == 1 or 
			Hyperspace.metaVariables['challenge_nodromis'] == 1 or
			Hyperspace.metaVariables['challenge_nozlt'] == 1 or
			Hyperspace.metaVariables['challenge_norare'] == 1 or
			Hyperspace.metaVariables['challenge_noeye'] == 1 or
			Hyperspace.metaVariables['challenge_nocont'] == 1 or
			Hyperspace.metaVariables['challenge_noai'] == 1 or
			Hyperspace.metaVariables['challenge_nohull'] == 1 or
			Hyperspace.metaVariables['challenge_nogeq'] == 1 or
			Hyperspace.metaVariables['challenge_nostor'] == 1 then
			
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(1254, 709)
			Graphics.CSurface.GL_RenderPrimitive(varr.button_challengeany)
			Graphics.CSurface.GL_PopMatrix()
			if mouseInside({x = 1254, y = 709, w = 13, h = 11}) then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_is_active_any'))
			end
		end
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(650, 1)
		if Hyperspace.playerVariables['calc_is_player_overstrong'] == 2 then
			Graphics.CSurface.GL_RenderPrimitive(varr.button_strong_2)
			if mouseInside({x = 650, y = 1, w = 30, h = 24}) then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_strong_2'))
			end
		elseif Hyperspace.playerVariables['calc_is_player_overstrong'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.button_strong_1)
			if mouseInside({x = 650, y = 1, w = 30, h = 24}) then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_strong_1'))
			end
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_strong_0)
			if mouseInside({x = 650, y = 1, w = 30, h = 24}) then
				Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_strong_0'))
			end
		end
		Graphics.CSurface.GL_PopMatrix()
		
		--показывает иконку капсулы как напоминание если находит её в слотах орудий или трюме
		if gui and gui.upgradeButton.bActive == true and Hyperspace.playerVariables['is_really_safe_place'] == 1 then
			local bFoundCapsule = false
			if playerShip and playerShip.weaponSystem then
				for pf in vter(playerShip.weaponSystem.weapons) do
					if pf.blueprint.name == "CAPSULE_FED" then
						bFoundCapsule = true
						break
					end
				end
			end
			
			if bFoundCapsule == false then
				for carg in vter (gui.equipScreen:GetCargoHold()) do
					if carg == "CAPSULE_FED" then
						bFoundCapsule = true
						break
					end
				end
			end
			if bFoundCapsule == true then
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(736, 1)
				Graphics.CSurface.GL_RenderPrimitive(varr.icon_capsule)
				Graphics.CSurface.GL_PopMatrix()
				if mouseInside({x = 736, y = 1, w = 24, h = 24}) then
					Hyperspace.Mouse:InstantTooltip()
					Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_capsule'))
				end
			end
		end
	end
	
	if varr.pentagram_progress > 0.0 and gui then
		if varr.pentagram_progress >= 100.0 then
			varr.pentagram_progress = 100.0
			if gui.event_pause == false then
				--playerShip.ship:BreachSpecificHull(varr.pentagram_x+70, varr.pentagram_y)
				Hyperspace.playerVariables['ritual_is_done'] = 1
				if Hyperspace.metaVariables['keeper_legendary_first_meet'] == 0 then
					Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'EVENT_LEGENDAGY_KEEPER',false,-1)
					Hyperspace.metaVariables['keeper_legendary_first_meet'] = 1
				else
					Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'EVENT_HELL_CALL_RANDOM',false,-1)
				end--print('hell gate opened!')
			end
		end
		Graphics.CSurface.GL_PushMatrix() -- +332 +145
		--Graphics.CSurface.GL_Translate(varr.pentagram_x + gui.shipPosition.x - 15, varr.pentagram_y + gui.shipPosition.y - 47)
		Graphics.CSurface.GL_Translate(varr.pentagram_x + gui.shipPosition.x - 20, varr.pentagram_y + gui.shipPosition.y - 55)
		Graphics.CSurface.GL_RenderPrimitiveWithAlpha(varr.pentagram, varr.pentagram_progress/100.0)
		Graphics.CSurface.GL_PopMatrix()
		
		if varr.pentagram_progress > 5.0 then
			if varr.micro_tick_counter22 > 1000.0 then--моргалка раз в секунду
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(varr.pentagram_x + gui.shipPosition.x - 20, varr.pentagram_y + gui.shipPosition.y - 55)
				Graphics.CSurface.GL_RenderPrimitive(varr.pentagram_glow)
				Graphics.CSurface.GL_PopMatrix()
			end
		end
	end
	
	
	-- дополнение обычного прицела точечного луча для этих спецорудий
	if gui and gui.combatControl and gui.combatControl.weapControl and gui.combatControl.weapControl.armedWeapon then
		if gui.combatControl.weapControl.armedWeapon.blueprint.name:find("BA_BEAM_VILKA_G") ~= nil then
			local posy_targ = Hyperspace.Mouse.position
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(Hyperspace.Mouse.position.x-35-27, Hyperspace.Mouse.position.y-27)
			if varr.bPressedLCtrl == false then
				if gui.combatControl.weapControl.autoFiring == false then
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_r)
				else
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_y)
				end
			else
				if gui.combatControl.weapControl.autoFiring == false then
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_y)
				else
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_r)
				end
			end
			Graphics.CSurface.GL_PopMatrix()
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(Hyperspace.Mouse.position.x+35-27, Hyperspace.Mouse.position.y-27)
			if varr.bPressedLCtrl == false then
				if gui.combatControl.weapControl.autoFiring == false then
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_r)
				else
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_y)
				end
			else
				if gui.combatControl.weapControl.autoFiring == false then
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_y)
				else
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_r)
				end
			end
			Graphics.CSurface.GL_PopMatrix()
		elseif gui.combatControl.weapControl.armedWeapon.blueprint.name:find("BA_BEAM_VILKA_V") ~= nil then
			local posy_targ = Hyperspace.Mouse.position
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(Hyperspace.Mouse.position.x-27, Hyperspace.Mouse.position.y-35-27)
			if varr.bPressedLCtrl == false then
				if gui.combatControl.weapControl.autoFiring == false then
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_r)
				else
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_y)
				end
			else
				if gui.combatControl.weapControl.autoFiring == false then
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_y)
				else
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_r)
				end
			end
			Graphics.CSurface.GL_PopMatrix()
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(Hyperspace.Mouse.position.x-27, Hyperspace.Mouse.position.y+35-27)
			if varr.bPressedLCtrl == false then
				if gui.combatControl.weapControl.autoFiring == false then
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_r)
				else
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_y)
				end
			else
				if gui.combatControl.weapControl.autoFiring == false then
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_y)
				else
					Graphics.CSurface.GL_RenderPrimitive(varr.mini_target_r)
				end
			end
			Graphics.CSurface.GL_PopMatrix()
		elseif gui.combatControl.weapControl.armedWeapon.blueprint.name:find("BA_BEAM_PRISM_MAIN") ~= nil then
			for t_point in vter(gui.combatControl.aimingPoints) do
				if gui.combatControl.potentialAiming ~= nil then
					
					local start_point = Hyperspace.Pointf(gui.combatControl.targetPosition.x+gui.combatControl.position.x+t_point.x-27, gui.combatControl.targetPosition.y+gui.combatControl.position.y+t_point.y-27)
					local dx = gui.combatControl.potentialAiming.x - t_point.x
					local dy = gui.combatControl.potentialAiming.y - t_point.y
					
					local lenn = Hyperspace.Blueprints:GetWeaponBlueprint(gui.combatControl.weapControl.armedWeapon.blueprint.name).length--projectile.length
					local coeff = (math.sqrt(dx*dx+dy*dy))/lenn 
					local anglee = (180*math.acos(dx/(lenn*coeff)))/math.pi
					if dy > 0 then
						anglee = -anglee
					end
					anglee = anglee + 53
					if anglee > 180 then
						anglee = anglee - 360
					elseif anglee < -180 then
						anglee = anglee + 360
					end
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_Translate(start_point.x + lenn*math.cos(math.pi*anglee/180), start_point.y - lenn*math.sin(math.pi*anglee/180))
					Graphics.CSurface.GL_RenderPrimitiveWithColor(varr.mini_target_prism, varr.color_orange)
					Graphics.CSurface.GL_PopMatrix()
					
					anglee = (180*math.acos(dx/(lenn*coeff)))/math.pi
					if dy > 0 then
						anglee = -anglee
					end
					anglee = anglee + 106
					if anglee > 180 then
						anglee = anglee - 360
					elseif anglee < -180 then
						anglee = anglee + 360
					end
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_Translate(start_point.x + lenn*math.cos(math.pi*anglee/180), start_point.y - lenn*math.sin(math.pi*anglee/180))
					Graphics.CSurface.GL_RenderPrimitiveWithColor(varr.mini_target_prism, varr.color_yellow)
					Graphics.CSurface.GL_PopMatrix()
					
					anglee = (180*math.acos(dx/(lenn*coeff)))/math.pi
					if dy > 0 then
						anglee = -anglee
					end
					anglee = anglee + 159
					if anglee > 180 then
						anglee = anglee - 360
					elseif anglee < -180 then
						anglee = anglee + 360
					end
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_Translate(start_point.x + lenn*math.cos(math.pi*anglee/180), start_point.y - lenn*math.sin(math.pi*anglee/180))
					Graphics.CSurface.GL_RenderPrimitiveWithColor(varr.mini_target_prism, varr.color_green_nashishenniy)
					Graphics.CSurface.GL_PopMatrix()
					
					anglee = (180*math.acos(dx/(lenn*coeff)))/math.pi
					if dy > 0 then
						anglee = -anglee
					end
					anglee = anglee - 159
					if anglee > 180 then
						anglee = anglee - 360
					elseif anglee < -180 then
						anglee = anglee + 360
					end
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_Translate(start_point.x + lenn*math.cos(math.pi*anglee/180), start_point.y - lenn*math.sin(math.pi*anglee/180))
					Graphics.CSurface.GL_RenderPrimitiveWithColor(varr.mini_target_prism, varr.color_cyan)
					Graphics.CSurface.GL_PopMatrix()
					
					anglee = (180*math.acos(dx/(lenn*coeff)))/math.pi
					if dy > 0 then
						anglee = -anglee
					end
					anglee = anglee - 106
					if anglee > 180 then
						anglee = anglee - 360
					elseif anglee < -180 then
						anglee = anglee + 360
					end
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_Translate(start_point.x + lenn*math.cos(math.pi*anglee/180), start_point.y - lenn*math.sin(math.pi*anglee/180))
					Graphics.CSurface.GL_RenderPrimitiveWithColor(varr.mini_target_prism, varr.color_blue)
					Graphics.CSurface.GL_PopMatrix()
					
					anglee = (180*math.acos(dx/(lenn*coeff)))/math.pi
					if dy > 0 then
						anglee = -anglee
					end
					anglee = anglee - 53
					if anglee > 180 then
						anglee = anglee - 360
					elseif anglee < -180 then
						anglee = anglee + 360
					end
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_Translate(start_point.x + lenn*math.cos(math.pi*anglee/180), start_point.y - lenn*math.sin(math.pi*anglee/180))
					Graphics.CSurface.GL_RenderPrimitiveWithColor(varr.mini_target_prism, varr.color_violet)
					Graphics.CSurface.GL_PopMatrix()
					
				end
			end
		end
	end
	
	
	-- участок таймеров
	-- if Hyperspace.metaVariables['show_timer']~=0 then
		-- local seconds = 0
		-- if Hyperspace.metaVariables['show_timer'] == 1 then
			-- seconds = Hyperspace.playerVariables['timer_absolute']
		-- elseif Hyperspace.metaVariables['show_timer'] == 2 then
			-- seconds = Hyperspace.playerVariables['timer_ingame']
		-- end
		-- local hours = 0
		-- if seconds > 3600 then
			-- hours = math.floor(seconds/3600)
		-- end
		-- seconds = seconds - 3600*hours
		-- local minutes = 0
		-- if seconds > 60 then
			-- minutes = math.floor(seconds/60)
		-- end
		-- seconds = seconds - 60*minutes
		-- local texttimer = ''
		-- if hours >= 10 then
			-- texttimer = texttimer..tostring(hours)..':'
		-- else
			-- texttimer = texttimer..'0'..tostring(hours)..':'
		-- end
		-- if minutes >= 10 then
			-- texttimer = texttimer..tostring(minutes)..':'
		-- else
			-- texttimer = texttimer..'0'..tostring(minutes)..':'
		-- end
		-- if seconds >= 10 then
			-- texttimer = texttimer..tostring(math.floor(seconds))
		-- else
			-- texttimer = texttimer..'0'..tostring(math.floor(seconds))
		-- end
		-- Graphics.freetype.easy_print(8, 642,  4, texttimer)
	-- end
end)


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
				Hyperspace.metaVariables['current_run_all_sector_reward'] = Hyperspace.metaVariables['current_run_all_sector_reward'] + sec_reward
				--print('add to cur rew'..tostring(sec_reward))
			end
		end
	else
		--print('sector zaporot!')
	end
end

-- print(Hyperspace.App.world.space.sunLevel)
-- print(Hyperspace.App.world.space.pulsarLevel)
-- print(Hyperspace.App.world.space.bPDS)
-- print(Hyperspace.App.world.space.asteroidGenerator.bRunning)
function isPhisycallyDangerousEnvironment()
	if Hyperspace.App.world.space.sunLevel == true then
		return true
	elseif Hyperspace.App.world.space.pulsarLevel == true then
		return true
	elseif Hyperspace.App.world.space.bPDS == true then
		return true
	elseif Hyperspace.App.world.space.asteroidGenerator.bRunning == true then
		return true
	end
	if Hyperspace.playerVariables['danger_crystals'] == 1 or Hyperspace.playerVariables['danger_cold'] == 1 or Hyperspace.playerVariables['danger_wild_drones'] == 1 or
	Hyperspace.playerVariables['danger_nanites'] == 1 or Hyperspace.playerVariables['danger_radiation'] == 1 or Hyperspace.playerVariables['danger_ultra_sun'] == 1 then
		return true
	end
	return false
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
	
	--выглядит как бред, но работает...
	varr.give_dohod_stat_me_memoryed_output = ''
	local uselessstring = give_dohod_stat_me(false)
	varr.give_dohod_stat_me_memoryed_output = ''
	uselessstring = give_dohod_stat_me(true)
	
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
	
	if current_tab_name == "equipment" or current_tab_name == "sell" then
		varr.equipment_that_will_stay_on_beacon = ''
		if gui then
			local bFoundWastedEquipment = false
			local cargo_counter = 0
			for carg in vter(gui.equipScreen:GetCargoHold()) do
				cargo_counter = cargo_counter + 1
				--print (cargo_counter..','..carg)
				if cargo_counter == 13 then
					--именно 13-й отображается в окне "будет оставлено на маяке". все больше - профукиваются.
					--4х3 = 12, следующий 13-й будет выкинут.
					--любопытно ещё что тут просто имя оборудования (оружие, дрон, ауг - всё в кучу)
					varr.equipment_that_will_stay_on_beacon = carg
					bFoundWastedEquipment = true
				end
			end
			cargo_counter = 0
			--отдельная методика поиска выбрасываемого аугмента. он попадает в карго-список только если выкидывается.
			--и нужен именно первый ауг в карго, если их несколько там.
			if bFoundWastedEquipment == false then
				for carg in vter(gui.equipScreen:GetCargoHold()) do
					cargo_counter = cargo_counter + 1
					if bFoundWastedEquipment == false then
						--print (cargo_counter..','..carg)
						if Hyperspace.Blueprints:GetAugmentBlueprint(carg).desc.cost > 0 then
							varr.equipment_that_will_stay_on_beacon = carg
							bFoundWastedEquipment = true
						end
					end
				end
			end
			--print('will be wasted on beacon='..varr.equipment_that_will_stay_on_beacon)
		end
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
		-- text_out = text_out..'Боевая стоимость корабля: '..tostring(math.floor(Hyperspace.playerVariables['calc_local_strength']))..' ~'
		-- text_out = text_out..'\nСтоимость корабля с грузом: '..tostring(math.floor(Hyperspace.playerVariables['calc_local_strength_pot']))..' ~'
		-- text_out = text_out..'\nМакс. серия побед подряд: '..tostring(math.floor(Hyperspace.metaVariables['max_raw_victory_counter']))
		-- text_out = text_out..'\nТекущая серия побед подряд: '..tostring(math.floor(Hyperspace.metaVariables['raw_victory_counter']))
		
		text_out = text_out..Hyperspace.Text:GetText('lua_battle_ship_cost')..' '..tostring(math.floor(Hyperspace.playerVariables['calc_local_strength']))..' ~'
		text_out = text_out..'\n'..Hyperspace.Text:GetText('lua_cargo_ship_cost')..' '..tostring(math.floor(Hyperspace.playerVariables['calc_local_strength_pot']))..' ~'
		text_out = text_out..'\n'..Hyperspace.Text:GetText('lua_max_win')..' '..tostring(math.floor(Hyperspace.metaVariables['max_raw_victory_counter']))
		text_out = text_out..'\n'..Hyperspace.Text:GetText('lua_cur_win')..' '..tostring(math.floor(Hyperspace.metaVariables['raw_victory_counter']))
		
		if Hyperspace.playerVariables['counter_number_of_sector'] == 1 and Hyperspace.playerVariables['jumps_in_current_sector'] == 0 then
			text_out = text_out..'\n'..Hyperspace.Text:GetText('lua_cur_sector_rew')..' 0 ~'
		else
			text_out = text_out..'\n'..Hyperspace.Text:GetText('lua_cur_sector_rew')..' '..tostring(math.floor(costy_pot - iBeginSectorCostP))..' ~'
		end
		Graphics.freetype.easy_print(11, 317+offs_x, 143, text_out)
		text_out = Hyperspace.Text:GetText('lua_cur_count')--'Текущий счёт:'
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
			-- if diff == '0' then
				-- Hyperspace.Mouse:SetTooltip("Статистика секторов для лёгкого режима")
			-- elseif diff == '1' then
				-- Hyperspace.Mouse:SetTooltip("Статистика секторов для нормального режима")
			-- else
				-- Hyperspace.Mouse:SetTooltip("Статистика секторов для сложного режима")
			-- end
			if diff == '0' then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_statistic_easy'))
			elseif diff == '1' then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_statistic_normal'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_statistic_hard'))
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
				sector_text_out = sector_text_out..'\n'..Hyperspace.Text:GetText('lua_statistic_poppyhatty')--'\nНомер   Ср.доход   Посещено'
				if sector_arr[i].inner_name == 'FINAL' then
					local j = 8
					sd = ''
					if Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'meet'] > 0 then
						local rew = Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'rew']
						sd = sd..'\n'..j..'.           '..tostring(math.floor(rew))..' ~'..anilize_rew(rew)..'          '..tostring(math.floor(Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'meet']))
					else
						sd = sd..'\n'..j..'.           '..Hyperspace.Text:GetText('lua_statistic_nodata')--'нет данных...'
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
						sd = sd..'\n'..j..'.           '..Hyperspace.Text:GetText('lua_statistic_nodata')--'нет данных...'
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
							sd = sd..'\n'..j..'.           '..Hyperspace.Text:GetText('lua_statistic_nodata')--'нет данных...'
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
			--Hyperspace.Mouse:SetTooltip("Очистить статистику полётов")
			Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_statistic_clearstat'))
		else
			Graphics.CSurface.GL_RenderPrimitive(button_clearstat_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		if varr.prepare_to_clear_stat == true then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_confirmBox.x, varr.button_confirmBox.y)
			if mouseInside(varr.button_confirmBox) then
				varr.mouse_inside_mem2 = 999
				Graphics.CSurface.GL_RenderPrimitive(varr.button_confirm_select2)
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip("Подтвердить очистку статистики полётов")
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_statistic_clearconfirm'))
			else
				Graphics.CSurface.GL_RenderPrimitive(varr.button_confirm_on)
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
				--Hyperspace.Mouse:SetTooltip("Вкл./выкл. запись статистики доходности секторов\n[style[color:86c946]]Запись включена[[/style]]")
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_statistic_recon'))
			else
				Graphics.CSurface.GL_RenderPrimitive(button_recOff_select2)
				Hyperspace.Mouse:InstantTooltip()
				--Hyperspace.Mouse:SetTooltip("Вкл./выкл. запись статистики доходности секторов\n[style[color:d93130]]Запись выключена[[/style]]")
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_statistic_recoff'))
			end
		else
			if Hyperspace.metaVariables['rec_sector_statistic'] == 1 then
				Graphics.CSurface.GL_RenderPrimitive(button_recOn_on)
			else
				Graphics.CSurface.GL_RenderPrimitive(button_recOff_on)
			end
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		--stat+
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.analitica_Box.x, varr.analitica_Box.y)
		Graphics.CSurface.GL_RenderPrimitive(varr.analitica)
		Graphics.CSurface.GL_PopMatrix()
		if mouseInside(varr.analitica_Box) then
			-- вычисление относительной успешности полёта тут
			Hyperspace.Mouse:InstantTooltip()
			Hyperspace.Mouse:SetTooltip(give_dohod_stat_me(true))
			--средний доход с начала полёта до начала текущего сектора
		end
		
		
	else
		bRecalculated_ship_cost = false
		varr.TABBED_WINDOW_is_visible = false
	end
	
	
	
	
	-- //////////////////////
	-- ПАНЕЛЬ УСЛОЖНЕНИЙ ИГРЫ
	-- //////////////////////
	if current_tab_name == "challenges" then
		diff = tostring(math.floor(Hyperspace.Settings.difficulty))
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nopause_Box.x - 40+offs_x_panel, varr.button_nopause_Box.y)
		if Hyperspace.metaVariables['challenge_nopause'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nopause_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nopause_Box.x + 29+offs_x_panel, varr.button_nopause_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nopause_Box.x+offs_x_panel, varr.button_nopause_Box.y)
		if mouseInside(varr.button_nopause_Box) then
			varr.button_nopause_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nopause_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nopause'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nopause_on')..get_toolchall_adder('nopause'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nopause_off')..get_toolchall_adder('nopause'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nopause_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nofuel_Box.x - 40+offs_x_panel, varr.button_nofuel_Box.y)
		if Hyperspace.metaVariables['challenge_nofuel'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nofuel_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nofuel_Box.x + 29+offs_x_panel, varr.button_nofuel_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nofuel_Box.x+offs_x_panel, varr.button_nofuel_Box.y)
		if mouseInside(varr.button_nofuel_Box) then
			varr.button_nofuel_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nofuel_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nofuel'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nofuel_on')..get_toolchall_adder('nofuel'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nofuel_off')..get_toolchall_adder('nofuel'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nofuel_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nobrain_Box.x - 40+offs_x_panel, varr.button_nobrain_Box.y)
		if Hyperspace.metaVariables['challenge_nobrain'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nobrain_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nobrain_Box.x + 29+offs_x_panel, varr.button_nobrain_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nobrain_Box.x+offs_x_panel, varr.button_nobrain_Box.y)
		if mouseInside(varr.button_nobrain_Box) then
			varr.button_nobrain_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nobrain_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nobrain'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nobrain_on')..get_toolchall_adder('nobrain'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nobrain_off')..get_toolchall_adder('nobrain'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nobrain_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_noaug_Box.x - 40+offs_x_panel, varr.button_noaug_Box.y)
		if Hyperspace.metaVariables['challenge_noaug'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_noaug_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_noaug_Box.x + 29+offs_x_panel, varr.button_noaug_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_noaug_Box.x+offs_x_panel, varr.button_noaug_Box.y)
		if mouseInside(varr.button_noaug_Box) then
			varr.button_noaug_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_noaug_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_noaug'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_noaug_on')..get_toolchall_adder('noaug'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_noaug_off')..get_toolchall_adder('noaug'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_noaug_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nomaxhp_Box.x - 40+offs_x_panel, varr.button_nomaxhp_Box.y)
		if Hyperspace.metaVariables['challenge_nomaxhp'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nomaxhp_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nomaxhp_Box.x + 29+offs_x_panel, varr.button_nomaxhp_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nomaxhp_Box.x+offs_x_panel, varr.button_nomaxhp_Box.y)
		if mouseInside(varr.button_nomaxhp_Box) then
			varr.button_nomaxhp_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nomaxhp_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nomaxhp'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nomaxhp_on')..get_toolchall_adder('nomaxhp'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nomaxhp_off')..get_toolchall_adder('nomaxhp'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nomaxhp_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_noscrap_Box.x - 40+offs_x_panel, varr.button_noscrap_Box.y)
		if Hyperspace.metaVariables['challenge_noscrap'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_noscrap_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_noscrap_Box.x + 29+offs_x_panel, varr.button_noscrap_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_noscrap_Box.x+offs_x_panel, varr.button_noscrap_Box.y)
		if mouseInside(varr.button_noscrap_Box) then
			varr.button_noscrap_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_noscrap_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_noscrap'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_noscrap_on')..get_toolchall_adder('noscrap'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_noscrap_off')..get_toolchall_adder('noscrap'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_noscrap_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nosysca_Box.x - 40+offs_x_panel, varr.button_nosysca_Box.y)
		if Hyperspace.metaVariables['challenge_nosysca'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nosysca_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nosysca_Box.x + 29+offs_x_panel, varr.button_nosysca_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nosysca_Box.x+offs_x_panel, varr.button_nosysca_Box.y)
		if mouseInside(varr.button_nosysca_Box) then
			varr.button_nosysca_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nosysca_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nosysca'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nosysca_on')..get_toolchall_adder('nosysca'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nosysca_off')..get_toolchall_adder('nosysca'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nosysca_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nodromis_Box.x - 40+offs_x_panel, varr.button_nodromis_Box.y)
		if Hyperspace.metaVariables['challenge_nodromis'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nodromis_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nodromis_Box.x + 29+offs_x_panel, varr.button_nodromis_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nodromis_Box.x+offs_x_panel, varr.button_nodromis_Box.y)
		if mouseInside(varr.button_nodromis_Box) then
			varr.button_nodromis_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nodromis_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nodromis'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nodromis_on')..get_toolchall_adder('nodromis'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nodromis_off')..get_toolchall_adder('nodromis'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nodromis_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nozlt_Box.x - 40+offs_x_panel, varr.button_nozlt_Box.y)
		if Hyperspace.metaVariables['challenge_nozlt'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nozlt_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nozlt_Box.x + 29+offs_x_panel, varr.button_nozlt_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nozlt_Box.x+offs_x_panel, varr.button_nozlt_Box.y)
		if mouseInside(varr.button_nozlt_Box) then
			varr.button_nozlt_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nozlt_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nozlt'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nozlt_on')..get_toolchall_adder('nozlt'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nozlt_off')..get_toolchall_adder('nozlt'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nozlt_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_norare_Box.x - 40+offs_x_panel, varr.button_norare_Box.y)
		if Hyperspace.metaVariables['challenge_norare'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_norare_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_norare_Box.x + 29+offs_x_panel, varr.button_norare_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_norare_Box.x+offs_x_panel, varr.button_norare_Box.y)
		if mouseInside(varr.button_norare_Box) then
			varr.button_norare_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_norare_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_norare'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_norare_on')..get_toolchall_adder('norare'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_norare_off')..get_toolchall_adder('norare'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_norare_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_noeye_Box.x - 40+offs_x_panel, varr.button_noeye_Box.y)
		if Hyperspace.metaVariables['challenge_noeye'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_noeye_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_noeye_Box.x + 29+offs_x_panel, varr.button_noeye_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_noeye_Box.x+offs_x_panel, varr.button_noeye_Box.y)
		if mouseInside(varr.button_noeye_Box) then
			varr.button_noeye_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_noeye_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_noeye'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_noeye_on')..get_toolchall_adder('noeye'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_noeye_off')..get_toolchall_adder('noeye'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_noeye_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nocont_Box.x - 40+offs_x_panel, varr.button_nocont_Box.y)
		if Hyperspace.metaVariables['challenge_nocont'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nocont_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nocont_Box.x + 29+offs_x_panel, varr.button_nocont_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nocont_Box.x+offs_x_panel, varr.button_nocont_Box.y)
		if mouseInside(varr.button_nocont_Box) then
			varr.button_nocont_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nocont_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nocont'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nocont_on')..get_toolchall_adder('nocont'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nocont_off')..get_toolchall_adder('nocont'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nocont_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_noai_Box.x - 40+offs_x_panel, varr.button_noai_Box.y)
		if Hyperspace.metaVariables['challenge_noai'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_noai_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_noai_Box.x + 29+offs_x_panel, varr.button_noai_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_noai_Box.x+offs_x_panel, varr.button_noai_Box.y)
		if mouseInside(varr.button_noai_Box) then
			varr.button_noai_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_noai_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_noai'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_noai_on')..get_toolchall_adder('noai'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_noai_off')..get_toolchall_adder('noai'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_noai_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nohull_Box.x - 40+offs_x_panel, varr.button_nohull_Box.y)
		if Hyperspace.metaVariables['challenge_nohull'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nohull_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nohull_Box.x + 29+offs_x_panel, varr.button_nohull_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nohull_Box.x+offs_x_panel, varr.button_nohull_Box.y)
		if mouseInside(varr.button_nohull_Box) then
			varr.button_nohull_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nohull_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nohull'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nohull_on')..get_toolchall_adder('nohull'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nohull_off')..get_toolchall_adder('nohull'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nohull_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nogeq_Box.x - 40+offs_x_panel, varr.button_nogeq_Box.y)
		if Hyperspace.metaVariables['challenge_nogeq'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nogeq_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nogeq_Box.x + 29+offs_x_panel, varr.button_nogeq_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nogeq_Box.x+offs_x_panel, varr.button_nogeq_Box.y)
		if mouseInside(varr.button_nogeq_Box) then
			varr.button_nogeq_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nogeq_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nogeq'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nogeq_on')..get_toolchall_adder('nogeq'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nogeq_off')..get_toolchall_adder('nogeq'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nogeq_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nostor_Box.x - 40+offs_x_panel, varr.button_nostor_Box.y)
		if Hyperspace.metaVariables['challenge_nostor'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nostor_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nostor_Box.x + 29+offs_x_panel, varr.button_nostor_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nostor_Box.x+offs_x_panel, varr.button_nostor_Box.y)
		if mouseInside(varr.button_nostor_Box) then
			varr.button_nostor_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nostor_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nostor'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nostor_on')..get_toolchall_adder('nostor'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nostor_off')..get_toolchall_adder('nostor'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nostor_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nowst_Box.x - 40+offs_x_panel, varr.button_nowst_Box.y)
		if Hyperspace.metaVariables['challenge_nowst'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nowst_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nowst_Box.x + 29+offs_x_panel, varr.button_nowst_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nowst_Box.x+offs_x_panel, varr.button_nowst_Box.y)
		if mouseInside(varr.button_nowst_Box) then
			varr.button_nowst_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nowst_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nowst'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nowst_on')..get_toolchall_adder('nowst'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nowst_off')..get_toolchall_adder('nowst'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nowst_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_noinst_Box.x - 40+offs_x_panel, varr.button_noinst_Box.y)
		if Hyperspace.metaVariables['challenge_noinst'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_noinst_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_noinst_Box.x + 29+offs_x_panel, varr.button_noinst_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_noinst_Box.x+offs_x_panel, varr.button_noinst_Box.y)
		if mouseInside(varr.button_noinst_Box) then
			varr.button_noinst_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_noinst_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_noinst'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_noinst_on')..get_toolchall_adder('noinst'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_noinst_off')..get_toolchall_adder('noinst'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_noinst_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nobf_Box.x - 40+offs_x_panel, varr.button_nobf_Box.y)
		if Hyperspace.metaVariables['challenge_nobf'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nobf_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nobf_Box.x + 29+offs_x_panel, varr.button_nobf_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nobf_Box.x+offs_x_panel, varr.button_nobf_Box.y)
		if mouseInside(varr.button_nobf_Box) then
			varr.button_nobf_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nobf_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nobf'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nobf_on')..get_toolchall_adder('nobf'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nobf_off')..get_toolchall_adder('nobf'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nobf_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nogus_Box.x - 40+offs_x_panel, varr.button_nogus_Box.y)
		if Hyperspace.metaVariables['challenge_nogus'] == 1 then
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_on)
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.chall_off)
		end
		Graphics.CSurface.GL_PopMatrix()
		if Hyperspace.metaVariables['challenge_nogus_win'..diff] > 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.button_nogus_Box.x + 29+offs_x_panel, varr.button_nogus_Box.y + 19)
			Graphics.CSurface.GL_RenderPrimitive(varr.done_arrow)
			Graphics.CSurface.GL_PopMatrix()
		end
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_nogus_Box.x+offs_x_panel, varr.button_nogus_Box.y)
		if mouseInside(varr.button_nogus_Box) then
			varr.button_nogus_ready = true
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nogus_select2)
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['challenge_nogus'] == 1 then
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nogus_on')..get_toolchall_adder('nogus'))
			else
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_nogus_off')..get_toolchall_adder('nogus'))
			end
			varr.mouse_inside_mem2 = 888
		else
			Graphics.CSurface.GL_RenderPrimitive(varr.button_nogus_on)
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_resetchall_Box.x+offs_x_panel, varr.button_resetchall_Box.y)
		if mouseInside(varr.button_resetchall_Box) then
			varr.button_resetchall_ready = true
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['reset_all_challenges_at_begin'] == 1 then
				Graphics.CSurface.GL_RenderPrimitive(varr.button_resetchall_1_select2)
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_resetchall_on'))
			else
				Graphics.CSurface.GL_RenderPrimitive(varr.button_resetchall_0_select2)
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_resetchall_off'))
			end
			varr.mouse_inside_mem2 = 888
		else
			if Hyperspace.metaVariables['reset_all_challenges_at_begin'] == 1 then
				Graphics.CSurface.GL_RenderPrimitive(varr.button_resetchall_1_on)
			else
				Graphics.CSurface.GL_RenderPrimitive(varr.button_resetchall_0_on)
			end
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.button_rew_Box.x+offs_x_panel, varr.button_rew_Box.y)
		if mouseInside(varr.button_rew_Box) then
			varr.button_rew_ready = true
			Hyperspace.Mouse:InstantTooltip()
			if Hyperspace.metaVariables['reward_for_challenges'] == 1 then
				Graphics.CSurface.GL_RenderPrimitive(varr.button_rew_1_select2)
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_rew_on'))
			else
				Graphics.CSurface.GL_RenderPrimitive(varr.button_rew_0_select2)
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_chall_rew_off'))
			end
			varr.mouse_inside_mem2 = 888
		else
			if Hyperspace.metaVariables['reward_for_challenges'] == 1 then
				Graphics.CSurface.GL_RenderPrimitive(varr.button_rew_1_on)
			else
				Graphics.CSurface.GL_RenderPrimitive(varr.button_rew_0_on)
			end
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		
		
		if Hyperspace.playerVariables['jumps_in_current_sector'] > 0 or Hyperspace.playerVariables['counter_number_of_sector'] ~= 1 then
			--varr.button_nopause_ready = false
			--varr.button_nofuel_ready = false
			--varr.button_nobrain_ready = false
			Graphics.freetype.easy_printAutoNewlines(12, 340+offs_x_panel, 150, 525, Hyperspace.Text:GetText('lua_chall_infousage2'))
		else
			Graphics.freetype.easy_printAutoNewlines(12, 340+offs_x_panel, 150, 525, Hyperspace.Text:GetText('lua_chall_infousage'))
		end
		
		Graphics.freetype.easy_printAutoNewlines(10, 340+offs_x_panel, 508, 525, Hyperspace.Text:GetText('lua_chall_help'))
		
		
		
		--преключатель таймеров
		-- Graphics.CSurface.GL_PushMatrix()
		-- Graphics.CSurface.GL_Translate(varr.button_timer_Box.x+offs_x_panel, varr.button_timer_Box.y)
		-- if mouseInside(varr.button_timer_Box) then
			-- varr.button_timer_ready = true
			-- Hyperspace.Mouse:InstantTooltip()
			-- if Hyperspace.metaVariables['show_timer'] == 0 then
				-- Graphics.CSurface.GL_RenderPrimitive(varr.button_timer_0_select2)
				-- Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_timer_0'))
			-- elseif Hyperspace.metaVariables['show_timer'] == 1 then
				-- Graphics.CSurface.GL_RenderPrimitive(varr.button_timer_1_select2)
				-- Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_timer_1'))
			-- else
				-- Graphics.CSurface.GL_RenderPrimitive(varr.button_timer_2_select2)
				-- Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_timer_2'))
			-- end
			-- varr.mouse_inside_mem2 = 888
		-- else
			-- if Hyperspace.metaVariables['show_timer'] == 0 then
				-- Graphics.CSurface.GL_RenderPrimitive(varr.button_timer_0_on)
			-- elseif Hyperspace.metaVariables['show_timer'] == 1 then
				-- Graphics.CSurface.GL_RenderPrimitive(varr.button_timer_1_on)
			-- else
				-- Graphics.CSurface.GL_RenderPrimitive(varr.button_timer_2_on)
			-- end
		-- end
		-- Graphics.CSurface.GL_PopMatrix()

		
		
	end
	
	--print(current_tab_name)
	if current_tab_name == "upgrades" then
		
	end
	if current_tab_name == "crew" then
		
	end
	if current_tab_name == "equipment" then
		
	end
	if current_tab_name == "buy" then
		-- if varr.enemy_osa_on_playership == true then
			-- Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REMOVE_STORE", false, -1)
		-- end
	end
	if current_tab_name == "sell" then
		-- if varr.enemy_osa_on_playership == true then

		-- end
	end
	
	
	if varr.mouse_inside_mem_prev2 == -1 and varr.mouse_inside_mem2 ~= -1 then
		Hyperspace.Sounds:PlaySoundMix('hoverBeep', 7, false)
	end
	varr.mouse_inside_mem_prev2 = varr.mouse_inside_mem2
end)

function get_toolchall_adder(inputy)
	if Hyperspace.metaVariables['challenge_'..inputy..'_win2'] > 0 then
		return '\n'..Hyperspace.Text:GetText('lua_chall_done_hard')
	elseif Hyperspace.metaVariables['challenge_'..inputy..'_win1'] > 0 then
		return '\n'..Hyperspace.Text:GetText('lua_chall_done_med')
	elseif Hyperspace.metaVariables['challenge_'..inputy..'_win0'] > 0 then
		return '\n'..Hyperspace.Text:GetText('lua_chall_done_easy')
	else
		return ''
	end
end

function press_button_nopause()
	if Hyperspace.metaVariables['challenge_nopause'] == 1 then
		Hyperspace.metaVariables['challenge_nopause'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nopause'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
		
		Hyperspace.FPS.speedLevel=0
		Hyperspace.playerVariables['speed_control_slow_set'] = 1
		Hyperspace.playerVariables['speed_control_norm_set'] = 0
		Hyperspace.playerVariables['speed_control_fast_set'] = 1
	end
end
function press_button_nofuel()
	if Hyperspace.metaVariables['challenge_nofuel'] == 1 then
		Hyperspace.metaVariables['challenge_nofuel'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nofuel'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_nobrain()
	if Hyperspace.metaVariables['challenge_nobrain'] == 1 then
		Hyperspace.metaVariables['challenge_nobrain'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nobrain'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_noaug()
	if Hyperspace.metaVariables['challenge_noaug'] == 1 then
		Hyperspace.metaVariables['challenge_noaug'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_noaug'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_nomaxhp()
	if Hyperspace.metaVariables['challenge_nomaxhp'] == 1 then
		Hyperspace.metaVariables['challenge_nomaxhp'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nomaxhp'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_noscrap()
	if Hyperspace.metaVariables['challenge_noscrap'] == 1 then
		Hyperspace.metaVariables['challenge_noscrap'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_noscrap'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_nosysca()
	if Hyperspace.metaVariables['challenge_nosysca'] == 1 then
		Hyperspace.metaVariables['challenge_nosysca'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nosysca'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_nodromis()
	if Hyperspace.metaVariables['challenge_nodromis'] == 1 then
		Hyperspace.metaVariables['challenge_nodromis'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nodromis'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_nozlt()
	if Hyperspace.metaVariables['challenge_nozlt'] == 1 then
		Hyperspace.metaVariables['challenge_nozlt'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nozlt'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_norare()
	if Hyperspace.metaVariables['challenge_norare'] == 1 then
		Hyperspace.metaVariables['challenge_norare'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_norare'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_noeye()
	if Hyperspace.metaVariables['challenge_noeye'] == 1 then
		Hyperspace.metaVariables['challenge_noeye'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_noeye'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_nocont()
	if Hyperspace.metaVariables['challenge_nocont'] == 1 then
		Hyperspace.metaVariables['challenge_nocont'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nocont'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_noai()
	if Hyperspace.metaVariables['challenge_noai'] == 1 then
		Hyperspace.metaVariables['challenge_noai'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_noai'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_nohull()
	if Hyperspace.metaVariables['challenge_nohull'] == 1 then
		Hyperspace.metaVariables['challenge_nohull'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nohull'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_nogeq()
	if Hyperspace.metaVariables['challenge_nogeq'] == 1 then
		Hyperspace.metaVariables['challenge_nogeq'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nogeq'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_nostor()
	if Hyperspace.metaVariables['challenge_nostor'] == 1 then
		Hyperspace.metaVariables['challenge_nostor'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nostor'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_nowst()
	if Hyperspace.metaVariables['challenge_nowst'] == 1 then
		Hyperspace.metaVariables['challenge_nowst'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nowst'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_noinst()
	if Hyperspace.metaVariables['challenge_noinst'] == 1 then
		Hyperspace.metaVariables['challenge_noinst'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_noinst'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_nobf()
	if Hyperspace.metaVariables['challenge_nobf'] == 1 then
		Hyperspace.metaVariables['challenge_nobf'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nobf'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end
function press_button_nogus()
	if Hyperspace.metaVariables['challenge_nogus'] == 1 then
		Hyperspace.metaVariables['challenge_nogus'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['challenge_nogus'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end

function press_button_resetchall()
	if Hyperspace.metaVariables['reset_all_challenges_at_begin'] == 1 then
		Hyperspace.metaVariables['reset_all_challenges_at_begin'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	else
		Hyperspace.metaVariables['reset_all_challenges_at_begin'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	end
end

function press_button_rew()
	if Hyperspace.metaVariables['reward_for_challenges'] == 1 then
		Hyperspace.metaVariables['reward_for_challenges'] = 0
		Hyperspace.Sounds:PlaySoundMix('moreInfoOff', 10, false)
	else
		Hyperspace.metaVariables['reward_for_challenges'] = 1
		Hyperspace.Sounds:PlaySoundMix('moreInfoOn', 10, false)
	end
end

function press_button_arty(idl)
	if varr.artillery_auto_controllers[idl] == true then
		varr.artillery_auto_controllers[idl] = false
	else
		varr.artillery_auto_controllers[idl] = true
	end
end



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
	
	--sd = sd..'\nНомер   Ср.доход   Посещено'
	sd = sd..'\n'..Hyperspace.Text:GetText('lua_statistic_poppyhatty')
	if Hyperspace.metaVariables[inner_name..'#'..diff..'#'..j..'meet'] > 0 then
		local rew = Hyperspace.metaVariables[inner_name..'#'..diff..'#'..j..'rew']
		sd = sd..'\n'..j..'.           '..tostring(math.floor(rew))..' ~'..anilize_rew(rew)..'          '..tostring(math.floor(Hyperspace.metaVariables[inner_name..'#'..diff..'#'..j..'meet']))
	else
		sd = sd..'\n'..j..'.           '..Hyperspace.Text:GetText('lua_statistic_nodata')--'нет данных...'
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
		--Graphics.freetype.easy_printCenter(11, 1100, 227, "СТАТИСТИКА ПОЛЁТОВ")
		Graphics.freetype.easy_printCenter(11, 1100, 227, Hyperspace.Text:GetText('lua_statistic_fly'))
		
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
		end
		
		--stat+
		Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
		Graphics.freetype.easy_printNewlinesCentered(11, 1097, 427, 256, give_dohod_stat_me(false))
		
		if playerShip and hasAnyAugmentationOfList(playerShip, {"SECTOR_SCANNER", "HID_SECTOR_SCANNER"}) == true then
			if varr.micro_tick_counter22 > 1000.0 then
				Graphics.CSurface.GL_SetColor(varr.color_cyanbezh)
			else
				Graphics.CSurface.GL_SetColor(varr.color_green)
			end
			Graphics.freetype.easy_print(14, 400, 550, Hyperspace.Text:GetText('lua_sector_scaner_active'))
		end
	end
	
	
	
	
	
	
	
end, function() end)


-- периодически запускается из основного блока. служит для вывода из игры на 1 тик всех ос (их как бы нет в этот момент).
-- в этот момент происходит фиксация захвата корабля врага если не осталось живых врагов. после этого осы обязательно возвращаются в исходное состояние.
function reset_osa_activity(bOutOfGame_var)
	--print('osae'..tostring(bOutOfGame_var))
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

function is_beacons_connected(id1, id2)
	if map and playerShip and playerShip.bJumping == false then
		local tlink7 = map.locations[id1]
		local tlink8 = map.locations[id2]
		if tlink7 and tlink8 then
			for locs in vter5(map.locations) do
				if locs == tlink7 then
					for locs2 in vter6(locs.connectedLocations) do
						if locs2 == tlink8 then
							--print('connected'..id1..','..id2)
							return true
						end
					end
				end
			end
		end
	end
	return false
end

-- тоннель восстанавливается теперь при сейв-лоаде.
function define_unique_inner_sector_tonnel()
	if map and playerShip and playerShip.bJumping == false then
		if Hyperspace.playerVariables['connected_beacon1'] == -1 and Hyperspace.playerVariables['connected_beacon2'] == -1 then
			local maxcounter = map.locations:size()
			--print('max'..maxcounter)
			Hyperspace.playerVariables['connected_beacon1'] = math.random(1, maxcounter-1)
			Hyperspace.playerVariables['connected_beacon2'] = math.random(1, maxcounter-1)
			while Hyperspace.playerVariables['connected_beacon2'] == Hyperspace.playerVariables['connected_beacon1'] or is_beacons_connected(Hyperspace.playerVariables['connected_beacon1'], Hyperspace.playerVariables['connected_beacon2']) do
				Hyperspace.playerVariables['connected_beacon2'] = math.random(1, maxcounter-1)
			end
			--print(Hyperspace.playerVariables['connected_beacon1']..','..Hyperspace.playerVariables['connected_beacon2'])
			check_unique_inner_sector_tonnel()
		end
	end
end
function check_unique_inner_sector_tonnel()
	if map and playerShip and playerShip.bJumping == false then
		if Hyperspace.playerVariables['connected_beacon1'] > 0 and Hyperspace.playerVariables['connected_beacon2'] > 0 then
			local tlink1 = map.locations[Hyperspace.playerVariables['connected_beacon1']]
			local tlink2 = map.locations[Hyperspace.playerVariables['connected_beacon2']]
			if tlink1 and tlink2 then
				for locs in vter6(map.locations) do
					if locs == tlink1 then
						locs.connectedLocations:push_back(tlink2)
						tlink2.connectedLocations:push_back(tlink1)
					end
				end
			end
		end
		varr.needed_check_tonnel = false
	end
end
script.on_game_event("EVENT_CREATE_RANDOM_TONNEL", false, function()
	define_unique_inner_sector_tonnel() 
end)
script.on_render_event(Defines.RenderEvents.GUI_CONTAINER, function() end, function()
	
	
	-- фуф, чертовски баговылетный блок кода, но кажется привёл в стабильное состояние.
	-- обеспечивает челлендж с заменой стандартных магазинов на встречу-бой с мотыльками-беспилотниками.
	if map and map.bChoosingNewSector == false then
		if Hyperspace.metaVariables['challenge_nostor'] == 1 then
			Hyperspace.Blueprints:GetAugmentBlueprint("CALL_STORE").desc.rarity = 0
			if Hyperspace.playerVariables['counter_number_of_sector'] >= 2 then
				for i = 0, map.locations:size() - 1 do
					--map.locations[i].event.store == true then
					if map.locations[i].event.eventName:find('STORE') ~= nil or
					map.locations[i].event.eventName:find('TRADERS_3_') ~= nil or
					map.locations[i].event.eventName:find('LOTEREYA') ~= nil or
					map.locations[i].event.eventName:find('SKUP') ~= nil or
					map.locations[i].event.eventName:find('PROTOTYPE_COLLECTIONER') ~= nil or
					map.locations[i].event.eventName:find('META_TRADER') ~= nil then
						if map.locations[i].visited == 0 then -- посещений маяка 0 раз
							local locEvent = Hyperspace.Event:CreateEvent("MOTILEK_EVENT2", Hyperspace.App.world.starMap.worldLevel, true)
							if locEvent ~= nil then
								map.locations[i].event = locEvent
								map.locations[i].event.store = false
								--print('replaced!')
							end
						end
						if map.locations[i] == map.currentLoc and Hyperspace.App.gui.event_pause == false then
							if map.locations[i].event.store == true then
								Hyperspace.CustomEventsParser.GetInstance():LoadEvent(world, "EVENT_REMOVE_STORE", false, -1)
								map.locations[i].event.store = false
								--print('removed store')
							end
						end
					end
					if map.locations[i] == map.currentLoc and map.locations[i].event.store == false then
						Hyperspace.metaVariables['in_store_now'] = 0
					end
				end
			end
		end
	end
	
	if map and map.bOpen == true and map.bChoosingNewSector == false then
		if Hyperspace.playerVariables['connected_beacon1'] > 0 and Hyperspace.playerVariables['connected_beacon2'] > 0 then
			local tlink1 = map.locations[Hyperspace.playerVariables['connected_beacon1']]
			local tlink2 = map.locations[Hyperspace.playerVariables['connected_beacon2']]
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(tlink1.loc.x + 368, tlink1.loc.y + 107)
			Graphics.CSurface.GL_RenderPrimitive(varr.glow_of_tonnel)
			Graphics.CSurface.GL_PopMatrix()
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(tlink2.loc.x + 368, tlink2.loc.y + 107)
			Graphics.CSurface.GL_RenderPrimitive(varr.glow_of_tonnel)
			Graphics.CSurface.GL_PopMatrix()
		end
		
		--этот маленький участок даёт информацию о маяках
		--bamalf-kba3u присваиваем метапеременной значение не равное 0 и работает тогда
		--METAVARIABLE DEBUG 1
		if Hyperspace.metaVariables['DEBUG'] ~= 0 then --or Hyperspace.playerVariables['DEBUG'] ~= 0 then
			for i = 0, map.locations:size() - 1 do
				Graphics.freetype.easy_printCenter(8, map.locations[i].loc.x + 392, map.locations[i].loc.y + 128, tostring(i)..'.'..map.locations[i].event.eventName)
			end
		end
		
		for i = 0, map.locations:size() - 1 do
			
			--был баг, задание в мире кристалинов, квест с открытием корабля. если повторно прилететь на посещённый маяк - давали месть опять.
			--исправлено, протестено баг ушёл.
			if map.locations[i].event.eventName == "CRYSTAL_UNLOCK" then
				if map.locations[i].visited > 0 then
					map.locations[i].event = Hyperspace.Event:GetBaseEvent("EMPTY_EVENT", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
					--print('second crystal unlock corrected'..i)
				end
			end
			
			--был баг, если подождать в волне повстанцев, то выдаёт событие с наградой повышенного топлива, и этот маяк при повторном
			--посещении продолжал давать событие с повышенным топливом. заменяет на стандартное встречи с флотом.
			if map.locations[i].event.eventName == "NO_FUEL_FLEET_DLC" then
				if map.locations[i].visited > 0 then
					map.locations[i].event = Hyperspace.Event:GetBaseEvent("FLEET_EASY_DLC_OLD", Hyperspace.App.world.starMap.worldLevel, false, Hyperspace.Global.currentSeed)
					--print('no fuel corrected'..i)
				end
			end
			
			--if varr.array_of_wasted_equipment[i] ~= nil and varr.array_of_wasted_equipment[i] ~= '' then
			--print('mappy'..i..','..Hyperspace.metaVariables['beacon_'..i])
			if Hyperspace.metaVariables['beacon_'..i] ~= 0 then 
				if map.locations[i].fleetChanging == true then
					--флот захватывает маяк
					--varr.array_of_wasted_equipment[i] = ''
					Hyperspace.metaVariables['beacon_'..i] = 0
				elseif map.locations[i].event.fleetPosition == 1.0 then
					--флот захватил маяк
					--varr.array_of_wasted_equipment[i] = ''
					Hyperspace.metaVariables['beacon_'..i] = 0
				else
					Graphics.CSurface.GL_PushMatrix()
					Graphics.CSurface.GL_Translate(map.locations[i].loc.x + 352, map.locations[i].loc.y + 92)
					Graphics.CSurface.GL_RenderPrimitive(varr.map_wasted_equipment)
					Graphics.CSurface.GL_PopMatrix()
					
					if Hyperspace.Mouse.tooltip ~= '' and mouseInside({x = map.locations[i].loc.x + 373, y = map.locations[i].loc.y + 112, w = 23, h = 23}) then
						--Hyperspace.Mouse:InstantTooltip()
						local we_name = varr.full_list_of_game_equipment[Hyperspace.metaVariables['beacon_'..i]]
						if Hyperspace.Blueprints:GetWeaponBlueprint(we_name).desc.cost > 0 then
							Hyperspace.Mouse.tooltip = Hyperspace.Mouse.tooltip..'\n'..Hyperspace.Text:GetText('lua_here_wasted_weap')..' '..Hyperspace.Blueprints:GetWeaponBlueprint(we_name):GetNameLong()
						elseif Hyperspace.Blueprints:GetDroneBlueprint(we_name).desc.cost > 0 then
							Hyperspace.Mouse.tooltip = Hyperspace.Mouse.tooltip..'\n'..Hyperspace.Text:GetText('lua_here_wasted_drone')..' '..Hyperspace.Blueprints:GetDroneBlueprint(we_name):GetNameLong()
						elseif Hyperspace.Blueprints:GetAugmentBlueprint(we_name).desc.cost > 0 then
							Hyperspace.Mouse.tooltip = Hyperspace.Mouse.tooltip..'\n'..Hyperspace.Text:GetText('lua_here_wasted_aug')..' '..Hyperspace.Blueprints:GetAugmentBlueprint(we_name):GetNameLong()--varr.array_of_wasted_equipment[i]==>we_name
						end
					end
				end
			end
		end

		
		
		
		if Hyperspace.metaVariables['challenge_noeye'] == 1 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(map.currentLoc.loc.x + 368 - 1000, map.currentLoc.loc.y + 107 - 1000)
			Graphics.CSurface.GL_RenderPrimitive(varr.black_mask)
			Graphics.CSurface.GL_PopMatrix()
			if Hyperspace.Mouse.tooltip ~= '' then
				Hyperspace.Mouse.tooltip = '' -- просто блокирует появление всплывающих подсказок на карте. всех.
			end
			Graphics.CSurface.GL_DrawRectOutline(339, 82, 755, 535, varr.color_opac_red, 2)
			if playerShip.fuel_count == 0 then
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(729, 565)
				Graphics.CSurface.GL_RenderPrimitive(varr.red_wait)
				Graphics.CSurface.GL_PopMatrix()
			end
			if map.currentLoc.event.eventName:find('FINISH_BEACON') ~= nil or
			map.currentLoc.event.eventName:find('FLEET_EASY_BEACON') ~= nil then 
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(726, 91)
				Graphics.CSurface.GL_RenderPrimitive(varr.red_next_sector)
				Graphics.CSurface.GL_PopMatrix()
			end
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(917, 620)
			Graphics.CSurface.GL_RenderPrimitive(varr.red_cancel)
			Graphics.CSurface.GL_PopMatrix()
		end
		
		
		Graphics.CSurface.GL_PushMatrix()
		Graphics.CSurface.GL_Translate(varr.waiting_button_Box.x - 7, varr.waiting_button_Box.y - 7)
		if mouseInside(varr.waiting_button_Box) then
			varr.waiting_button_ready = true
			if isAllowedWaitingWithFuel() == false then
				Graphics.CSurface.GL_RenderPrimitive(varr.waiting_button_off)
				varr.waiting_mode_state = false
			else
				Graphics.CSurface.GL_RenderPrimitive(varr.waiting_button_select2)
				--Hyperspace.Mouse:InstantTooltip()
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_waiting_with_fuel'))
				varr.mouse_inside_mem2 = 888
			end
		else
			if isAllowedWaitingWithFuel() == false then
				Graphics.CSurface.GL_RenderPrimitive(varr.waiting_button_off)
			else
				Graphics.CSurface.GL_RenderPrimitive(varr.waiting_button_on)
			end
		end
		Graphics.CSurface.GL_PopMatrix()
		
		
		
		if Hyperspace.metaVariables['challenge_noeye'] == 0 then
			Graphics.CSurface.GL_PushMatrix()
			Graphics.CSurface.GL_Translate(varr.draw_Box.x, varr.draw_Box.y)
			if mouseInside(varr.draw_Box) then
				varr.mouse_inside_mem2 = 888
				varr.draw_ready = true
				if varr.bEnabledDrawMode == true then
					Graphics.CSurface.GL_RenderPrimitive(varr.draw_on_select2)
				else
					Graphics.CSurface.GL_RenderPrimitive(varr.draw_off_select2)
				end
				Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_draw'))
			else
				if varr.bEnabledDrawMode == true then
					Graphics.CSurface.GL_RenderPrimitive(varr.draw_on_on)
				else
					Graphics.CSurface.GL_RenderPrimitive(varr.draw_off_on)
				end
			end
			Graphics.CSurface.GL_PopMatrix()
			
			if varr.bEnabledDrawMode == true then
				
				--print(Hyperspace.Settings.screenResolution.x..','..Hyperspace.Settings.screenResolution.y)
				
				--print(Hyperspace.App.world.space.currentBack.width_..','..Hyperspace.App.world.space.currentBack.height_)
				
				for i = 0, 50 do
					if Hyperspace.metaVariables['map_pointX'..tostring(i)] ~= 0 then
						Graphics.CSurface.GL_LoadIdentity()
						Graphics.CSurface.GL_DrawCircle(Hyperspace.metaVariables['map_pointX'..tostring(i)], Hyperspace.metaVariables['map_pointY'..tostring(i)], 4.0, varr.color_blue_transp)
						--Graphics.CSurface.GL_DrawRectOutline(Hyperspace.metaVariables['map_pointX'..tostring(i)]-2, Hyperspace.metaVariables['map_pointY'..tostring(i)]-2, 3, 3, varr.color_blue_transp, 2)
						if i > 0 then
							Graphics.CSurface.GL_DrawLine(Hyperspace.metaVariables['map_pointX'..tostring(i-1)], Hyperspace.metaVariables['map_pointY'..tostring(i-1)], Hyperspace.metaVariables['map_pointX'..tostring(i)], Hyperspace.metaVariables['map_pointY'..tostring(i)], 3.0, varr.color_blue_transp)
						end
					end
				end
				
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(varr.draw_clear_Box.x, varr.draw_clear_Box.y)
				if Hyperspace.metaVariables['map_pointX0'] ~= 0 then
					if mouseInside(varr.draw_clear_Box) then
						varr.mouse_inside_mem2 = 888
						varr.draw_clear_ready = true
						Graphics.CSurface.GL_RenderPrimitive(varr.draw_clear_select2)
						Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_clear_draw'))
					else
						Graphics.CSurface.GL_RenderPrimitive(varr.draw_clear_on)
					end
				else
					Graphics.CSurface.GL_RenderPrimitive(varr.draw_clear_off)
					if mouseInside(varr.draw_clear_Box) then
						Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_clear_draw'))
					end
				end
				Graphics.CSurface.GL_PopMatrix()
			else
				Graphics.CSurface.GL_PushMatrix()
				Graphics.CSurface.GL_Translate(varr.draw_clear_Box.x, varr.draw_clear_Box.y)
				Graphics.CSurface.GL_RenderPrimitive(varr.draw_clear_off)
				Graphics.CSurface.GL_PopMatrix()
			end
		end
		
		
	end
end)




function isAllowedWaitingWithFuel()
	--local bValue = true
	if playerShip.fuel_count == 0 then
		return false
	end
	if Hyperspace.metaVariables['enemy_state'] == 2 then
		return false
	end
	if isReallyDangerousEnvironment() == true then
		return false
	end
	if varr.micro_delayer_to_waiting_at_beacon > 0.0 then
		return false
	end
	if Hyperspace.App.world.starMap.currentSector.description.type == "FINAL" then
		return false
	end
	if map and map.currentLoc and map.currentLoc.event.eventName == "FLEET_EASY_DLC_OLD" or map.currentLoc.event.eventName == "ELITE_DANGEROUS_1" or map.currentLoc.event.eventName == "NO_FUEL_FLEET_DLC" then
		--print('no wave')
		return false
	end
	return true
end



function change_global_rarity_rare_to_zero()	
	
	for i=0, #varr.full_list_of_game_equipment do
		local equip_name = varr.full_list_of_game_equipment[i]
		if varr.full_list_of_game_equipment_rarity[equip_name]~=nil then
			if varr.full_list_of_game_equipment_rarity[equip_name] > 2 and math.random(0, 100) < 99 then
				if Hyperspace.Blueprints:GetWeaponBlueprint(equip_name).desc.cost > 0 then
					Hyperspace.Blueprints:GetWeaponBlueprint(equip_name).desc.rarity = 0 --для справки. установленное тут значение НЕ сохраняется при переходе в новый сектор
				elseif Hyperspace.Blueprints:GetDroneBlueprint(equip_name).desc.cost > 0 then
					Hyperspace.Blueprints:GetDroneBlueprint(equip_name).desc.rarity = 0
				elseif Hyperspace.Blueprints:GetAugmentBlueprint(equip_name).desc.cost > 0 then
					Hyperspace.Blueprints:GetAugmentBlueprint(equip_name).desc.rarity = 0
				end
				--print('poopy works>2=='..equip_name)
			elseif varr.full_list_of_game_equipment_rarity[equip_name] == 2 and math.random(0, 100) < 50 then
				if Hyperspace.Blueprints:GetWeaponBlueprint(equip_name).desc.cost > 0 then
					Hyperspace.Blueprints:GetWeaponBlueprint(equip_name).desc.rarity = 0 --для справки. установленное тут значение НЕ сохраняется при переходе в новый сектор
				elseif Hyperspace.Blueprints:GetDroneBlueprint(equip_name).desc.cost > 0 then
					Hyperspace.Blueprints:GetDroneBlueprint(equip_name).desc.rarity = 0
				elseif Hyperspace.Blueprints:GetAugmentBlueprint(equip_name).desc.cost > 0 then
					Hyperspace.Blueprints:GetAugmentBlueprint(equip_name).desc.rarity = 0
				end
				--print('poopy works=2=='..equip_name)
			end
		end
	end
		
	
	
	-- for _, file in ipairs(varr.blueprintFiles) do
		-- local doc = RapidXML.xml_document(file)
		-- local Node = (doc:first_node("FTL") or doc):first_node("weaponBlueprint")
		-- while Node do
			-- local wnamelocal = Node:first_attribute("name"):value()
			-- if Hyperspace.Blueprints:GetWeaponBlueprint(wnamelocal).desc.baseRarity > 2 then
				-- if math.random(0,100) < 99 then
					-- Hyperspace.Blueprints:GetWeaponBlueprint(wnamelocal).desc.rarity = 0 --для справки. установленное тут значение НЕ сохраняется при переходе в новый сектор
					-- --print(wnamelocal)
				-- else
					-- Hyperspace.Blueprints:GetWeaponBlueprint(wnamelocal).desc.rarity = Hyperspace.Blueprints:GetWeaponBlueprint(wnamelocal).desc.baseRarity
				-- end
			-- elseif Hyperspace.Blueprints:GetWeaponBlueprint(wnamelocal).desc.baseRarity == 2 then
				-- if math.random(0,100) < 50 then
					-- Hyperspace.Blueprints:GetWeaponBlueprint(wnamelocal).desc.rarity = 0
					-- --print(wnamelocal)
				-- else
					-- Hyperspace.Blueprints:GetWeaponBlueprint(wnamelocal).desc.rarity = Hyperspace.Blueprints:GetWeaponBlueprint(wnamelocal).desc.baseRarity
				-- end
			-- end
			-- -- рекурсивное погружение, не удалять...
			-- -- if Node:first_attribute("name"):value() == "SOULREAPER6" then
				-- -- local mininode = Node:first_node("type")
				-- -- --print("%%%%%%"..mininode:value())
			-- -- end
			-- Node = Node:next_sibling("weaponBlueprint")
		-- end
		-- doc:clear()
	-- end
	-- for _, file in ipairs(varr.blueprintFiles) do
		-- local doc = RapidXML.xml_document(file)
		-- local Node = (doc:first_node("FTL") or doc):first_node("droneBlueprint")
		-- while Node do
			-- local wnamelocal = Node:first_attribute("name"):value()
			-- if Hyperspace.Blueprints:GetDroneBlueprint(wnamelocal).desc.baseRarity > 2 then
				-- if math.random(0,100) < 90 then
					-- Hyperspace.Blueprints:GetDroneBlueprint(wnamelocal).desc.rarity = 0
				-- else
					-- Hyperspace.Blueprints:GetDroneBlueprint(wnamelocal).desc.rarity = Hyperspace.Blueprints:GetDroneBlueprint(wnamelocal).desc.baseRarity
				-- end
			-- end
			-- Node = Node:next_sibling("droneBlueprint")
		-- end
		-- doc:clear()
	-- end
	-- for _, file in ipairs(varr.blueprintFiles) do
		-- local doc = RapidXML.xml_document(file)
		-- local Node = (doc:first_node("FTL") or doc):first_node("augBlueprint")
		-- while Node do
			-- local wnamelocal = Node:first_attribute("name"):value()
			-- if Hyperspace.Blueprints:GetAugmentBlueprint(wnamelocal).desc.baseRarity > 2 then
				-- if math.random(0,100) < 90 then
					-- Hyperspace.Blueprints:GetAugmentBlueprint(wnamelocal).desc.rarity = 0
				-- else
					-- Hyperspace.Blueprints:GetAugmentBlueprint(wnamelocal).desc.rarity = Hyperspace.Blueprints:GetAugmentBlueprint(wnamelocal).desc.baseRarity
				-- end
			-- end
			-- Node = Node:next_sibling("augBlueprint")
		-- end
		-- doc:clear()
	-- end
end



--///////////////////
-- speedManager.lua импортирован сюда
--///////////////////
--by slow
--mods.speed_UI={}
local isWork = false;

script.on_game_event("SPEED_CONTROL_SLOW",false, function()
	if Hyperspace.metaVariables['challenge_nopause'] == 1 then
		Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
		
		Hyperspace.FPS.speedLevel=0
		Hyperspace.playerVariables['speed_control_slow_set'] = 1
		Hyperspace.playerVariables['speed_control_norm_set'] = 0
		Hyperspace.playerVariables['speed_control_fast_set'] = 1
	else
		Hyperspace.FPS.speedLevel=-2
		Hyperspace.playerVariables['speed_control_slow_set'] = 0
		Hyperspace.playerVariables['speed_control_norm_set'] = 1
		Hyperspace.playerVariables['speed_control_fast_set'] = 1
	end
end)
script.on_game_event("SPEED_CONTROL_RESET",false, function()
	Hyperspace.FPS.speedLevel=0
	Hyperspace.playerVariables['speed_control_slow_set'] = 1
	Hyperspace.playerVariables['speed_control_norm_set'] = 0
	Hyperspace.playerVariables['speed_control_fast_set'] = 1
end)
script.on_game_event("SPEED_CONTROL_FAST",false, function()
	Hyperspace.FPS.speedLevel=50
	Hyperspace.playerVariables['speed_control_slow_set'] = 1
	Hyperspace.playerVariables['speed_control_norm_set'] = 1
	Hyperspace.playerVariables['speed_control_fast_set'] = 0
end)
--by AlHazrad
local function InGame()
	--print('InGame')
	Hyperspace.FPS.speedLevel=0
	Hyperspace.playerVariables['speed_control_slow_set'] = 1
	Hyperspace.playerVariables['speed_control_norm_set'] = 0
	Hyperspace.playerVariables['speed_control_fast_set'] = 1
	isWork = true;
end
--local function InMain()
function InMain()
	Hyperspace.FPS.speedLevel=0
	Hyperspace.playerVariables['speed_control_slow_set'] = 1
	Hyperspace.playerVariables['speed_control_norm_set'] = 0
	Hyperspace.playerVariables['speed_control_fast_set'] = 1
	isWork = false;
end

script.on_game_event("START_BEACON", false, InGame)
script.on_init(InGame)

script.on_internal_event(Defines.InternalEvents.ON_KEY_DOWN, function(key)
	if key == Defines.SDL.KEY_LCTRL then
		varr.bPressedLCtrl = true
	end
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
	if key == Defines.SDL.KEY_LEFTBRACKET then
		if Hyperspace.FPS.speedLevel==50 then
			Hyperspace.FPS.speedLevel=0
			Hyperspace.playerVariables['speed_control_slow_set'] = 1
			Hyperspace.playerVariables['speed_control_norm_set'] = 0
			Hyperspace.playerVariables['speed_control_fast_set'] = 1
		else
			if Hyperspace.metaVariables['challenge_nopause'] == 1 then
				Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
				return
			end
			if Hyperspace.FPS.speedLevel==0 then
				Hyperspace.FPS.speedLevel=-2
				Hyperspace.playerVariables['speed_control_slow_set'] = 0
				Hyperspace.playerVariables['speed_control_norm_set'] = 1
				Hyperspace.playerVariables['speed_control_fast_set'] = 1
			end
		end
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
	if key == Defines.SDL.KEY_LCTRL then
		varr.bPressedLCtrl = false
	end
end)

-- при создании корабля противника, если ещё можно добавляет усиление титановое покрытие
--script.on_internal_event(Defines.InternalEvents.CONSTRUCT_SHIP_MANAGER, function(ship_local)
	-- if ship_local then
		-- if Hyperspace.metaVariables['challenge_nosysca'] == 1 then
			-- if ship_local.iShipId == 1 then
				-- if ship_local:HasAugmentation('SYSTEM_CASING') == 0 and ship_local:GetAugmentationCount() < 3 then
					-- ship_local:AddAugmentation('SYSTEM_CASING')
					-- --print('added')
				-- end
			-- end
		-- end
		-- if Hyperspace.metaVariables['challenge_nozlt'] == 1 then
			-- if ship_local.iShipId == 1 then
				-- if ship_local:HasAugmentation('ENERGY_SHIELD') == 0 and ship_local:GetAugmentationCount() < 3 then
					-- ship_local:AddAugmentation('ENERGY_SHIELD')
					-- --print('added')
				-- end
			-- end
		-- end
	-- end
--end)

script.on_game_event("EVENT_BLACK_WING_BOSS_DESTROYED", false, function()
	victory_checks()
	--print('dop')
end)
script.on_game_event("EVENT_REBEL_BOSS_DESTROYED_3_PHASE", false, function()
	if Hyperspace.metaVariables['challenge_nobf'] == 1 then
		--в этом испытании 3 фаза босса не конец - сразу идёт 4-ая
	else
		victory_checks()
	end
end)
script.on_game_event("EVENT_REBEL_BOSS_DESTROYED_4_PHASE", false, function()
	victory_checks()
end)
function victory_checks()
	--print('vic')
	local count_of_challenges_active = 0
	diff = tostring(math.floor(Hyperspace.Settings.difficulty))
	if Hyperspace.metaVariables['challenge_nopause'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nopause_win2'] = 1
			Hyperspace.metaVariables['challenge_nopause_win1'] = 1
			Hyperspace.metaVariables['challenge_nopause_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nopause_win1'] = 1
			Hyperspace.metaVariables['challenge_nopause_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nopause_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nofuel'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nofuel_win2'] = 1
			Hyperspace.metaVariables['challenge_nofuel_win1'] = 1
			Hyperspace.metaVariables['challenge_nofuel_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nofuel_win1'] = 1
			Hyperspace.metaVariables['challenge_nofuel_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nofuel_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nobrain'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nobrain_win2'] = 1
			Hyperspace.metaVariables['challenge_nobrain_win1'] = 1
			Hyperspace.metaVariables['challenge_nobrain_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nobrain_win1'] = 1
			Hyperspace.metaVariables['challenge_nobrain_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nobrain_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_noaug'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_noaug_win2'] = 1
			Hyperspace.metaVariables['challenge_noaug_win1'] = 1
			Hyperspace.metaVariables['challenge_noaug_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_noaug_win1'] = 1
			Hyperspace.metaVariables['challenge_noaug_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_noaug_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nomaxhp'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nomaxhp_win2'] = 1
			Hyperspace.metaVariables['challenge_nomaxhp_win1'] = 1
			Hyperspace.metaVariables['challenge_nomaxhp_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nomaxhp_win1'] = 1
			Hyperspace.metaVariables['challenge_nomaxhp_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nomaxhp_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_noscrap'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_noscrap_win2'] = 1
			Hyperspace.metaVariables['challenge_noscrap_win1'] = 1
			Hyperspace.metaVariables['challenge_noscrap_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_noscrap_win1'] = 1
			Hyperspace.metaVariables['challenge_noscrap_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_noscrap_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nosysca'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nosysca_win2'] = 1
			Hyperspace.metaVariables['challenge_nosysca_win1'] = 1
			Hyperspace.metaVariables['challenge_nosysca_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nosysca_win1'] = 1
			Hyperspace.metaVariables['challenge_nosysca_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nosysca_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nodromis'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nodromis_win2'] = 1
			Hyperspace.metaVariables['challenge_nodromis_win1'] = 1
			Hyperspace.metaVariables['challenge_nodromis_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nodromis_win1'] = 1
			Hyperspace.metaVariables['challenge_nodromis_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nodromis_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nozlt'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nozlt_win2'] = 1
			Hyperspace.metaVariables['challenge_nozlt_win1'] = 1
			Hyperspace.metaVariables['challenge_nozlt_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nozlt_win1'] = 1
			Hyperspace.metaVariables['challenge_nozlt_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nozlt_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_norare'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_norare_win2'] = 1
			Hyperspace.metaVariables['challenge_norare_win1'] = 1
			Hyperspace.metaVariables['challenge_norare_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_norare_win1'] = 1
			Hyperspace.metaVariables['challenge_norare_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_norare_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_noeye'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_noeye_win2'] = 1
			Hyperspace.metaVariables['challenge_noeye_win1'] = 1
			Hyperspace.metaVariables['challenge_noeye_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_noeye_win1'] = 1
			Hyperspace.metaVariables['challenge_noeye_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_noeye_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nocont'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nocont_win2'] = 1
			Hyperspace.metaVariables['challenge_nocont_win1'] = 1
			Hyperspace.metaVariables['challenge_nocont_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nocont_win1'] = 1
			Hyperspace.metaVariables['challenge_nocont_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nocont_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_noai'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_noai_win2'] = 1
			Hyperspace.metaVariables['challenge_noai_win1'] = 1
			Hyperspace.metaVariables['challenge_noai_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_noai_win1'] = 1
			Hyperspace.metaVariables['challenge_noai_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_noai_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nohull'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nohull_win2'] = 1
			Hyperspace.metaVariables['challenge_nohull_win1'] = 1
			Hyperspace.metaVariables['challenge_nohull_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nohull_win1'] = 1
			Hyperspace.metaVariables['challenge_nohull_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nohull_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nogeq'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nogeq_win2'] = 1
			Hyperspace.metaVariables['challenge_nogeq_win1'] = 1
			Hyperspace.metaVariables['challenge_nogeq_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nogeq_win1'] = 1
			Hyperspace.metaVariables['challenge_nogeq_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nogeq_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nostor'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nostor_win2'] = 1
			Hyperspace.metaVariables['challenge_nostor_win1'] = 1
			Hyperspace.metaVariables['challenge_nostor_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nostor_win1'] = 1
			Hyperspace.metaVariables['challenge_nostor_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nostor_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nowst'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nowst_win2'] = 1
			Hyperspace.metaVariables['challenge_nowst_win1'] = 1
			Hyperspace.metaVariables['challenge_nowst_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nowst_win1'] = 1
			Hyperspace.metaVariables['challenge_nowst_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nowst_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_noinst'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_noinst_win2'] = 1
			Hyperspace.metaVariables['challenge_noinst_win1'] = 1
			Hyperspace.metaVariables['challenge_noinst_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_noinst_win1'] = 1
			Hyperspace.metaVariables['challenge_noinst_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_noinst_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nobf'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nobf_win2'] = 1
			Hyperspace.metaVariables['challenge_nobf_win1'] = 1
			Hyperspace.metaVariables['challenge_nobf_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nobf_win1'] = 1
			Hyperspace.metaVariables['challenge_nobf_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nobf_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	if Hyperspace.metaVariables['challenge_nogus'] == 1 then
		if diff == '2' then
			Hyperspace.metaVariables['challenge_nogus_win2'] = 1
			Hyperspace.metaVariables['challenge_nogus_win1'] = 1
			Hyperspace.metaVariables['challenge_nogus_win0'] = 1
		elseif diff == '1' then
			Hyperspace.metaVariables['challenge_nogus_win1'] = 1
			Hyperspace.metaVariables['challenge_nogus_win0'] = 1
		else
			Hyperspace.metaVariables['challenge_nogus_win0'] = 1
		end
		count_of_challenges_active = count_of_challenges_active + 1
	end
	
	if count_of_challenges_active >= 3 then
		Hyperspace.CustomAchievementTracker.instance:SetAchievement("ACH_3_CHALLENGE", false)
	end
end
function calc_reward()
	diff = tostring(math.floor(Hyperspace.Settings.difficulty))
	Hyperspace.playerVariables['calc_rew'] = 0
	local cost_of_one_finished_challenge = 10
	if Hyperspace.metaVariables['challenge_nopause_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_nofuel_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_nobrain_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_noaug_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_nomaxhp_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_noscrap_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_nosysca_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_nodromis_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_nozlt_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_norare_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_noeye_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_nocont_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_noai_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_nohull_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_nogeq_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_nostor_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_nowst_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_noinst_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
	if Hyperspace.metaVariables['challenge_nobf_win'..diff] > 0 then
		Hyperspace.playerVariables['calc_rew'] = Hyperspace.playerVariables['calc_rew'] + cost_of_one_finished_challenge
	end
end
script.on_game_event("LAST_STAND_START", false, function()
	calc_reward()
end)



-- фиксация столкновений дронов со снарядами
script.on_internal_event(Defines.InternalEvents.DRONE_COLLISION, function(spacedrone_0, projectile_0, damage_0, coll_response)
	if projectile_0.ownerId == 0 then
		Hyperspace.playerVariables['drones_shooted_at_one_run'] = Hyperspace.playerVariables['drones_shooted_at_one_run'] + 1
	end
	--print('proj'..projectile_0.ownerId)
	--print('spacedrone'..spacedrone_0.selfId)
	return Defines.Chain.CONTINUE
end)



script.on_internal_event(Defines.InternalEvents.ACTIVATE_POWER, function(power_0, ship_0)
	if power_0.def.name == 'lady_legendary_power' then
		--print(power_0.crew.iShipId)--принадлежность кораблю члена экипажа
		--print(power_0.crew.intruder)
		-- навешивает на способность-пустышку дополнительное действие
		if power_0.crew.intruder == true then
			if power_0.crew.iShipId == 0 then
				Hyperspace.App.world.space:CreateBomb(Hyperspace.Blueprints:GetWeaponBlueprint('BA_BOMB_TIMER_ACC'), 0, enemyShip:GetRoomCenter(power_0.crew.iRoomId), 1)
			else
				Hyperspace.App.world.space:CreateBomb(Hyperspace.Blueprints:GetWeaponBlueprint('BA_BOMB_TIMER_ACC'), 1, playerShip:GetRoomCenter(power_0.crew.iRoomId), 0)
				power_0.crew.extend:InitiateTeleport(0, -1, -1)
			end
		else
			if power_0.crew.iShipId == 0 then
				Hyperspace.App.world.space:CreateBomb(Hyperspace.Blueprints:GetWeaponBlueprint('BA_BOMB_TIMER_ACC'), 0, playerShip:GetRoomCenter(power_0.crew.iRoomId), 0)
			else
				Hyperspace.App.world.space:CreateBomb(Hyperspace.Blueprints:GetWeaponBlueprint('BA_BOMB_TIMER_ACC'), 1, enemyShip:GetRoomCenter(power_0.crew.iRoomId), 1)
				power_0.crew.extend:InitiateTeleport(1, -1, -1)
			end
		end
		--:CreateBomb(WeaponBlueprint *weapon, int ownerId, Pointf target, int targetSpace)
	end
	return Defines.Chain.CONTINUE
end)





--отображение встроенных и обычных усилений
script.on_render_event(Defines.RenderEvents.LAYER_PLAYER, function() end, function(ship)--GUI_CONTAINER
	if Hyperspace.App.menu.shipBuilder.bOpen == true or Hyperspace.App.menu.bOpen == true then -- останавливаем выполнение всех тик-процессов
		-- НИЧЕГО НЕ ДЕЛАТЬ ТУТ
	else
		if playerShip then
			
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
					--print('sw='..search_word)
					if search_word == "ANAEROBIC_PROJECTOR" and Hyperspace.playerVariables['enable_fire_weakness'] == 1 then
						Graphics.CSurface.GL_RenderPrimitive(varr.icon_anaerobic_projector_red)
					elseif search_word == "CALL_STORE" and Hyperspace.metaVariables['call_store_used'] ~= 0 then
						Graphics.CSurface.GL_RenderPrimitive(varr.icon_call_store_red)
					else
						Graphics.CSurface.GL_RenderPrimitive(tip_img_replace_hidden_array[search_word])
					end
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
						
						if search_word == "ANAEROBIC_PROJECTOR" and Hyperspace.playerVariables['enable_fire_weakness'] == 1 then
							collected_tip_text = collected_tip_text..'\n\n'..Hyperspace.Text:GetText('lua_fire_weakness')
						end
						
						Hyperspace.Mouse:SetTooltip(collected_tip_text)
					end
					mmmccc = mmmccc + 1
				end
			end
			
			mmmccc = 0
			local mmmcccx = 0
			local mmmcccy = 0
			
			if Hyperspace.playerVariables['installed_AUG_SLOT'] > 0 then
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
				Graphics.CSurface.GL_RenderPrimitive(tip_img_replace_hidden_array['icon_aug_slot'])
				Graphics.CSurface.GL_PopMatrix()
				if mouseInside({x = mmmcccx + 2, y = 82 + mmmcccy*32, w = 28, h = 28}) and gui and gui.menu_pause == false then
					Hyperspace.Mouse:InstantTooltip()
					Hyperspace.Mouse:SetTooltip(Hyperspace.Text:GetText('lua_additional_augplace')..' '..math.floor(Hyperspace.playerVariables['installed_AUG_SLOT']))
					--Hyperspace.Mouse:SetTooltip('Этот корабль имеет меньше слотов орудий, но больше слотов для усилений и дронов. Дополнительных слотов усилений: '..math.floor(Hyperspace.playerVariables['installed_AUG_SLOT']))
				end
				mmmccc = mmmccc + 1
			end
			
			local strFishAugsDesc = ''
			for augs in vter(Hyperspace.Blueprints:GetBlueprintList("CAN_BE_HIDDEN_AUGS")) do
				if Hyperspace.playerVariables['installed_'..augs] == 1 then
					search_word = augs
					
					if augs:find('FISH_BUFF') == nil then
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
						
						if search_word == "ANAEROBIC_PROJECTOR" and Hyperspace.playerVariables['enable_fire_weakness'] == 1 then
							Graphics.CSurface.GL_RenderPrimitive(varr.icon_anaerobic_projector_red)
						elseif search_word == "CALL_STORE" and Hyperspace.metaVariables['call_store_used'] ~= 0 then
							Graphics.CSurface.GL_RenderPrimitive(varr.icon_call_store_red)
						else
							Graphics.CSurface.GL_RenderPrimitive(tip_img_replace_hidden_array[search_word])
						end
						--Graphics.CSurface.GL_RenderPrimitive(tip_img_replace_hidden_array[search_word])
						Graphics.CSurface.GL_PopMatrix()
						if mouseInside({x = mmmcccx + 2, y = 82 + mmmcccy*32, w = 28, h = 28}) and gui and gui.menu_pause == false then
							Hyperspace.Mouse:InstantTooltip()
							--collected_tip_text = 'Встроенное усиление:\n'..Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.title:GetText()
							collected_tip_text = Hyperspace.Text:GetText('lua_inner_aug')..'\n'..Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.title:GetText()
							if search_word == "AUTO_REPAIR" then
								search_word = "AUTO_REPAIR"..tostring(math.floor(Hyperspace.playerVariables['autorepair_speed_multiplied_on_10'])) -- преобразует 10.0 в 10
							end
							-- Дополнение подписей встроенных усилений.
							if tip_text_replace_hidden_array[search_word] ~= nil then
								collected_tip_text = collected_tip_text..'\n\n'..tip_text_replace_hidden_array[search_word]
								--Hyperspace.Mouse:SetTooltip(collected_tip_text)
							end
							
							if search_word == "ANAEROBIC_PROJECTOR" and Hyperspace.playerVariables['enable_fire_weakness'] == 1 then
								collected_tip_text = collected_tip_text..'\n\n'..Hyperspace.Text:GetText('lua_fire_weakness')
							end
							Hyperspace.Mouse:SetTooltip(collected_tip_text)
						end
						mmmccc = mmmccc + 1
					else
						strFishAugsDesc = strFishAugsDesc..'\n'..Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.description:GetText()
					end
					
					
				end
			end
			if strFishAugsDesc ~= '' then
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
				Graphics.CSurface.GL_RenderPrimitive(tip_img_replace_hidden_array['icon_fish_buff_all'])
				Graphics.CSurface.GL_PopMatrix()
				if mouseInside({x = mmmcccx + 2, y = 82 + mmmcccy*32, w = 28, h = 28}) and gui and gui.menu_pause == false then
					Hyperspace.Mouse:InstantTooltip()
					--collected_tip_text = 'Встроенное усиление:\n'..Hyperspace.Blueprints:GetAugmentBlueprint(augs).desc.title:GetText()
					collected_tip_text = Hyperspace.Text:GetText('lua_inner_aug')..'\n'..Hyperspace.Text:GetText('lua_fish_aug_main_name')..'\n'..strFishAugsDesc
					Hyperspace.Mouse:SetTooltip(collected_tip_text)
				end
				mmmccc = mmmccc + 1
			end
			
		end
	end
end)


-- так как для целеуказания нужен именно вектор точек целей, то пришлось написать этот блок...
function give_me_target_vectors(pf, tid)
	local target_vect = Hyperspace.ships.enemy._targetable:GetAllTargettingPoints()
	local target_vect2 = Hyperspace.ships.enemy._targetable:GetAllTargettingPoints()
	if tid == 1 then
		target_vect = Hyperspace.ships.player._targetable:GetAllTargettingPoints()
		target_vect2 = Hyperspace.ships.player._targetable:GetAllTargettingPoints()
	end
	target_vect2:clear()
	if pf.blueprint.typeName == "BEAM" then
		local nt0 = math.random(0, target_vect:size())
		local nt1 = math.random(0, target_vect:size())
		local defreezer = 0
		while (nt1 == nt0 and defreezer < 100) do
			nt1 = math.random(0, target_vect:size())
			defreezer = defreezer + 1
		end
		target_vect2:push_back(target_vect[nt0])
		if defreezer >= 100 then
			target_vect[nt1] = Hyperspace.Pointf(target_vect[nt0].x + 1, target_vect[nt0].y + 1)
			target_vect2:push_back(target_vect[nt1])
			return target_vect2
		end
		local delta_x = target_vect[nt1].x - target_vect[nt0].x
		local delta_y = target_vect[nt1].y - target_vect[nt0].y
		local length = math.sqrt(delta_x*delta_x + delta_y*delta_y)
		local koeffitient = pf.blueprint.length/length 
		target_vect[nt1] = Hyperspace.Pointf(target_vect[nt0].x + delta_x*koeffitient, target_vect[nt0].y + delta_y*koeffitient)
		target_vect2:push_back(target_vect[nt1])
	else
		for i = 1, pf.numShots do
			target_vect2:push_back(target_vect[math.random(0, target_vect:size()-1)])
		end
	end
	return target_vect2
end


-- проверяет есть ли в списке заданное имя
function check_is_inside_list(listname, checked_string)
	for st in vter7 (Hyperspace.Blueprints:GetBlueprintList(listname)) do
		if st == checked_string then
			return true
		end
	end
	return false
end




function create_full_ingame_list_of_augs()
	local doc = RapidXML.xml_document("data/blueprints.xml")
	local Node = (doc:first_node("FTL") or doc):first_node("augBlueprint")
	local mc_777 = 1
	while Node do
		varr.full_ingame_list_of_augs[mc_777] = Node:first_attribute("name"):value()
		mc_777 = mc_777 + 1
		Node = Node:next_sibling("augBlueprint")
	end
	doc:clear()
	-- for i = 1, #varr.full_ingame_list_of_augs do
		-- print (varr.full_ingame_list_of_augs[i])
	-- end
end
function save_in_metavariables_aug_state_of_player()
	if playerShip then
		for i = 1, #varr.full_ingame_list_of_augs do
			local cntr = playerShip:HasAugmentation(varr.full_ingame_list_of_augs[i])
			if cntr > 0 then
				Hyperspace.metaVariables['aug_'..varr.full_ingame_list_of_augs[i]] = cntr
				--print('aug_'..varr.full_ingame_list_of_augs[i]..'='..cntr)
			else
				Hyperspace.metaVariables['aug_'..varr.full_ingame_list_of_augs[i]] = 0
			end
		end
	end
end
function restore_aug_state_of_player_by_metavariables()
	--print('rest')
	if playerShip then
		for i = 1, #varr.full_ingame_list_of_augs do
			local cntr = playerShip:HasAugmentation(varr.full_ingame_list_of_augs[i])
			if cntr < Hyperspace.metaVariables['aug_'..varr.full_ingame_list_of_augs[i]] then
				playerShip:AddAugmentation(varr.full_ingame_list_of_augs[i])
				--print('===>'..varr.full_ingame_list_of_augs[i])
			end
		end
	end
end

--отключение майндконтроля. история боли и страданий. нельзя просто присвоить экипажу crew.bMindControlled = false. ячейка останется недоступной
--по итогу просто играемся таймером работы системы.
function disable_enemy_mindcontrolling()
	if playerShip and playerShip.mindSystem ~= nil then
		playerShip.mindSystem.controlTimer.first = playerShip.mindSystem.controlTimer.second - 0.01
		--playerShip:GetSystem(14).iLockCount = 4
		--print(playerShip.mindSystem.controlTimer.first..','..playerShip.mindSystem.controlTimer.second)
		
		-- for crew in vter(playerShip.vCrewList) do
			-- if crew.crewAnim.bPlayer == false then--crew.iShipId == 1 then
				-- if crew.bMindControlled == true then
					-- --Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(def_mindresist), crew)
					-- --crew.bMindControlled = false
					-- --crew:MoveToRoom(crew.iRoomId, 0, true)
					-- --crew:UpdateMovement()
					-- --crew:ClearPath()--
					-- --crew:ClearPosition()
					-- --crew:ClearTask()--если этого не делать зависает в ступоре
					-- --crew:Restart()--:RestorePosition()--SavePosition()--test
					-- --playerShip.ship:EmptySlots(crew.iRoomId)--если этого не делать, то слот останется недоступным игроку, баг
					-- print('noMCps!')
				-- end
			-- end
		-- end
	end
	-- if enemyShip then
		-- for crew in vter(enemyShip.vCrewList) do
			-- if crew.crewAnim.bPlayer == false then--crew.iShipId == 1 then
				-- if crew.bMindControlled == true then
					-- --Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(def_mindresist), crew)
					-- -- crew.bMindControlled = false
					-- -- crew:ClearPath()--test
					-- -- crew:ClearPosition()
					-- -- crew:ClearTask()
					-- -- crew:Restart()--:RestorePosition()--:SavePosition()--test
					-- --enemyShip.ship:EmptySlots(crew.iRoomId)
					-- print('noMCes!')
				-- end
			-- end
		-- end
	-- end
end
function thereIsAtLeastOneMindcontrolledEnemy()
	if playerShip then
		for crew in vter(playerShip.vCrewList) do
			if crew.iShipId == 1 then
				if crew.bMindControlled == true then
					return true
				end
			end
		end
	end
	if enemyShip then
		for crew in vter(enemyShip.vCrewList) do
			if crew.iShipId == 1 then
				if crew.bMindControlled == true then
					return true
				end
			end
		end
	end
	return false
end

function thereIsCrewAtPosition(x, y, type_of_crew)
	if playerShip then
		for crew in vter9(playerShip.vCrewList) do		
			if crew.intruder == false then
				if crew.blueprint.name == type_of_crew or type_of_crew == "any" then
					if crew:GetPosition().x == x and crew:GetPosition().y == y then
						return true
					end
				end
			end
		end
	end
	return false
end

function isThereAnyBoardersNoDrone(shiptt)
	if shiptt then
		for crew in vter10(shiptt.vCrewList) do		
			if crew:IsDrone()==false and crew.intruder == true then
				return true
			end
		end
	end
	return false
end

function isThereAnyCrewNoDroneCanSuffocate(shiptt)
	if shiptt then
		for crew in vter10(shiptt.vCrewList) do		
			if crew:IsDrone()==false and crew.intruder == false and crew:CanSuffocate() == true then
				return true
			end
		end
	end
	return false
end

function hasAnyAugmentationOfList(shippy, augNames)
	if shippy == nil then
		return false
	end
	for _, augName in ipairs(augNames) do
		if shippy:HasAugmentation(augName) > 0 then
			return true
		end
	end
	return false
end

function setAutoRepair(speed, ship)
	for system in vter(ship.vSystemList) do
		if not system.bBreached then
			system:PartialRepair(speed, true) --true means that it repairs at speed * the basic autoship repair speed, false means autoRepair * human repair speed (3 times faster than auto)
		end
	end
end



--script.on_internal_event(Defines.InternalEvents.SHIELD_COLLISION_PRE, function(shipMgr, projectile, damage, collresponse)
	--print('coll shield')
	--print('ship'..shipMgr.iShipId)
--	return Defines.Chain.CONTINUE
--end)

--script.on_internal_event(Defines.InternalEvents.SHIELD_COLLISION, function(shipMgr, projectile, damage, collresponse)
	-- print('coll shield'..shipMgr.iShipId)
	
	-- print('ss='..shipMgr.shieldSystem.shields.power.super.first)
	-- print('s='..shipMgr.shieldSystem.shields.power.first)
	-- print('coll type = '..collresponse.collision_type)
	
	-- if projectile.damage.iShieldPiercing < 5 and projectile.damage.iIonDamage == 0 then
		-- if shipMgr.shieldSystem ~= nil and shipMgr.shieldSystem.shields.power.first > 0 then
			-- if shipMgr.shieldSystem.shields.power.super.first > 0 then
				-- --shipMgr.shieldSystem:CollisionReal(projectile.position.x, projectile.position.y, damage, true)
				-- shipMgr.shieldSystem.shields.power.first = shipMgr.shieldSystem.shields.power.first - 1
				-- shipMgr.shieldSystem.shields.power.super.first = shipMgr.shieldSystem.shields.power.super.first + damage.iDamage
				
				
				
				-- print(collresponse.point.x)
				-- --collresponse.damage = damage.iDamage
				-- --collresponse.superDamage = 0
				
			-- end
		-- end
	-- end
	
--	return Defines.Chain.CONTINUE
--end)

function define_current_star_id()
	if map and map.currentLoc and map.currentLoc.event then
		local maxcounter = map.locations:size()
		for i=0, maxcounter - 1 do
			if map.locations[i] == map.currentLoc then
				Hyperspace.metaVariables['current_star_id'] = i
			end
		end
	end
end


function give_unique_id_of_equipment(eq_name)
	for i = 0, #varr.full_list_of_game_equipment do
		if varr.full_list_of_game_equipment[i] == eq_name then
			return i
		end
	end
	return 0--нет такого оборудования
end	
function make_full_list_of_game_equipment()	
	local global_id_counter = 0
	--будем считать что 0 - это отсутствие оборудования
	for _, file in ipairs(varr.blueprintFiles) do
		local doc = RapidXML.xml_document(file)
		local Node = (doc:first_node("FTL") or doc):first_node("weaponBlueprint")
		while Node do
			local wnamelocal = Node:first_attribute("name"):value()
			global_id_counter = global_id_counter + 1
			varr.full_list_of_game_equipment[global_id_counter] = wnamelocal
			
			-- помнит энергию
			local nodepowerlocal = Node:first_node("power")
			if nodepowerlocal ~= nil then
				varr.full_list_of_game_equipment_power[wnamelocal] = tonumber(nodepowerlocal:value())
				--print(wnamelocal..','..nodepowerlocal:value())
			end
			
			-- помнит редкость
			local noderaritylocal = Node:first_node("rarity")
			if noderaritylocal ~= nil then
				varr.full_list_of_game_equipment_rarity[wnamelocal] = tonumber(noderaritylocal:value())
				--print(wnamelocal..','..noderaritylocal:value())
			end
			
			
			--охренеть. этот маленький блок кода выискивает все бурст орудия в блюпринтах и
			--создаёт таблицу соответствия имён и кол-ву реальных снарядов
			local mininode = Node:first_node("type")
			if mininode:value() == "BURST" then
				local micronode = Node:first_node("projectiles")
				if micronode then
					local nanonode = micronode:first_node("projectile")
					local count_of_nofake_burst_projectiles = 0
					while nanonode do
						if nanonode:first_attribute("fake"):value()=='false' then
							count_of_nofake_burst_projectiles = count_of_nofake_burst_projectiles + tonumber(nanonode:first_attribute("count"):value())
						end
						nanonode = nanonode:next_sibling("projectile")
					end
					varr.full_list_of_burst_weapon_proj_count[wnamelocal] = count_of_nofake_burst_projectiles
					--print('BURST='..wnamelocal..'=>'..count_of_nofake_burst_projectiles)
				end
			end
			
			
			Node = Node:next_sibling("weaponBlueprint")
		end
		doc:clear()
	end
	for _, file in ipairs(varr.blueprintFiles) do
		local doc = RapidXML.xml_document(file)
		local Node = (doc:first_node("FTL") or doc):first_node("droneBlueprint")
		while Node do
			local wnamelocal = Node:first_attribute("name"):value()
			global_id_counter = global_id_counter + 1
			varr.full_list_of_game_equipment[global_id_counter] = wnamelocal
			
			-- помнит энергию дронов
			local nodepowerlocal = Node:first_node("power")
			if nodepowerlocal ~= nil then
				varr.full_list_of_game_equipment_power[wnamelocal] = tonumber(nodepowerlocal:value())
				--print(wnamelocal..','..nodepowerlocal:value())
			end
			
			-- помнит редкость
			local noderaritylocal = Node:first_node("rarity")
			if noderaritylocal ~= nil then
				varr.full_list_of_game_equipment_rarity[wnamelocal] = tonumber(noderaritylocal:value())
			end
			
			Node = Node:next_sibling("droneBlueprint")
		end
		doc:clear()
	end
	for _, file in ipairs(varr.blueprintFiles) do
		local doc = RapidXML.xml_document(file)
		local Node = (doc:first_node("FTL") or doc):first_node("augBlueprint")
		while Node do
			local wnamelocal = Node:first_attribute("name"):value()
			global_id_counter = global_id_counter + 1
			varr.full_list_of_game_equipment[global_id_counter] = wnamelocal
			
			-- помнит редкость
			local noderaritylocal = Node:first_node("rarity")
			if noderaritylocal ~= nil then
				varr.full_list_of_game_equipment_rarity[wnamelocal] = tonumber(noderaritylocal:value())
			end
			
			Node = Node:next_sibling("augBlueprint")
		end
		doc:clear()
	end
end


function define_additional_flagship_augment()
	local boss_aug_arr = {"AUTO_COOLDOWN","SHIELD_RECHARGE","REPAIR_SPEED_DOWN","REPAIR_SPEED_UP","FIRE_EXTINGUISHERS","ADV_OXYGEN","DEFENSE_SCRAMBLER","NANO_MEDBAY","CREW_STIMS","SLUG_GEL","ROCK_ARMOR","ANTICLOAK_FIELD","ACCURACY_BOOST","SYSTEM_CASING","AUTO_REPAIR","DRONE_SPEED","HP_BOOSTER_5","ARMOR_SUIT_5","NANOBOT_DEFENSE_SYSTEM","SHELL_GAS","ANAEROBIC_PROJECTOR","RADIOACTIVE"}
	--local boss_aug_arr = {"SLUG_GEL","ROCK_ARMOR","DRONE_SPEED"}--test shit
	local baug = boss_aug_arr[math.random(1, #boss_aug_arr)]
	Hyperspace.metaVariables['additional_flagship_augment'] = 0
	for i = 1, #varr.full_list_of_game_equipment do
		if baug == varr.full_list_of_game_equipment[i] then
			Hyperspace.metaVariables['additional_flagship_augment'] = i
		end
	end
	
	if Hyperspace.Blueprints:GetAugmentBlueprint(varr.full_list_of_game_equipment[math.floor(Hyperspace.metaVariables['additional_flagship_augment'])]).desc.cost == 0 then
		baug = ''
	end
	
	while baug == '' do
		baug = boss_aug_arr[math.random(1, #boss_aug_arr)]
		Hyperspace.metaVariables['additional_flagship_augment'] = 0
		for i = 1, #varr.full_list_of_game_equipment do
			if baug == varr.full_list_of_game_equipment[i] then
				Hyperspace.metaVariables['additional_flagship_augment'] = i
			end
		end
		if Hyperspace.Blueprints:GetAugmentBlueprint(varr.full_list_of_game_equipment[math.floor(Hyperspace.metaVariables['additional_flagship_augment'])]).desc.cost == 0 then
			baug = ''
		end
		if Hyperspace.metaVariables['challenge_nosysca'] == 1 and baug == 'SYSTEM_CASING' then
			baug = ''
		end
		if Hyperspace.metaVariables['challenge_nozlt'] == 1 and baug == 'ENERGY_SHIELD' then
			baug = ''
		end
	end
	--print('def='..baug)
end


function there_is_projectiles_with_id(numy_id)
    local projectiles = Hyperspace.App.world.space.projectiles
    for i = 0, projectiles:size() - 1 do
        if projectiles[i].ownerId == numy_id and projectiles[i].currentSpace == (numy_id - 1) then
			--print(tostring(projectile.extend.name))
			return true
		end
    end
	return false
end




-- блок не удалять, т.к. прецедент УСПЕШНОГО чтения из глубоких нод блюпринтов...
-- local doc = RapidXML.xml_document("data/hyperspace.xml")
-- local Node = (doc:first_node("FTL") or doc):first_node("augments")
-- while Node do
	-- local mininode = Node:first_node("aug")
	-- local mc_777 = 1
	-- while mininode do
		-- varr.full_ingame_list_of_augs[mc_777] = mininode:first_attribute("name"):value()
		-- mc_777 = mc_777 + 1
		-- mininode = mininode:next_sibling("aug")
	-- end
	-- Node = Node:next_sibling("augments")
-- end
-- doc:clear()

-- function isThereSafeRoomToAnyCrewWorkAtEnemyShip()
	-- if enemyShip then
		-- for room in vter11 (enemyShip.ship.vRoomList) do
			-- local bRoomSafeAndHasWork = true
			-- if enemyShip:GetFireCount(room.iRoomId) > 0 then
				-- bRoomSafeAndHasWork = false
			-- end
			-- if bRoomSafeAndHasWork == true then
				-- for crew in vter12(enemyShip.vCrewList) do
					-- if bRoomSafeAndHasWork == true then
						-- if crew.intruder == true and crew.iRoomId == room.iRoomId then
							-- bRoomSafeAndHasWork = false
						-- end
					-- end
				-- end
			-- end
			-- if bRoomSafeAndHasWork == true then
				-- if enemyShip:GetSystemInRoom(room.iRoomId) ~= nil and enemyShip:GetSystemInRoom(room.iRoomId).healthState.first == enemyShip:GetSystemInRoom(room.iRoomId).healthState.second then
					-- if isSystemHasCompucter(enemyShip:GetSystemInRoom(room.iRoomId):GetId()) == false then
						-- bRoomSafeAndHasWork = false
					-- end
				-- end
			-- end
			-- if bRoomSafeAndHasWork == true then
				-- --print('true')
				-- return true
			-- end
		-- end
	-- end
	-- --print('false')
	-- return false
-- end
function isThereMinimalSenseToEvadeBattle()
	if isPhisycallyDangerousEnvironment() == true then
		return true
	end
	if playerShip and isShipStable(playerShip) == false then
		return true
	end
	if enemyShip.weaponSystem then
		for pf in vter99(enemyShip.weaponSystem.weapons) do
			if pf.powered == true then
				return true
			end
		end
	end
	if enemyShip.droneSystem then
		local drones = enemyShip.droneSystem.drones
		for i = 0, drones:size() - 1 do
			if drones[i].powered == true or drones[i].powerRequired == 0 then
				return true
			end
		end
	end
	if enemyShip.artillerySystems ~= nil then
		local vArtSystemList = enemyShip.artillerySystems
		for i = 0, vArtSystemList:size() - 1 do
			local pf = vArtSystemList[i].projectileFactory
			if pf.powered == true then
				return true
			end
		end
	end
	return false
end
function isEnemyHopelessBoarded()
	if enemyShip then
		if enemyShip:HasSystem(5) == true and enemyShip:GetSystem(5):CompletelyDestroyed() == false then--medbay
			return false
		end
		if enemyShip:HasSystem(13) == true and enemyShip:GetSystem(13):CompletelyDestroyed() == false then--clonebay
			return false
		end
		local count_enemy_hp = 0.0
		local count_player_hp = 0.0
		
		local dps_enemy_team_val = 0.0
		local dps_player_team_val = 0.0
		
		for crew in vter11(enemyShip.vCrewList) do
			if crew.health.first > 0.0 and crew.bOutOfGame == false then
				if crew:IsDrone() == false or (crew:IsDrone() == true and crew:Functional() == true) then
					--if crew.intruder == false then
					if crew.crewAnim.bPlayer == false or (crew.crewAnim.bPlayer == true and crew.bMindControlled == true) then
						count_enemy_hp = count_enemy_hp + crew.health.first
						local DPS, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.DAMAGE_MULTIPLIER)
						if crew:CanFight() == true then
							dps_enemy_team_val = dps_enemy_team_val + DPS
						end
					else
						count_player_hp = count_player_hp + crew.health.first
						local DPS, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.DAMAGE_MULTIPLIER)
						if crew:CanFight() == true then
							dps_player_team_val = dps_player_team_val + DPS
						end
					end
				end
			end
		end
		if count_player_hp == 0 then
			return false
		end
		--print('pl'..count_player_hp..','..dps_player_team_val..',en'..count_enemy_hp..','..dps_enemy_team_val)
		if count_player_hp*dps_player_team_val > count_enemy_hp*dps_enemy_team_val + 1.0 then
			return true
		end
		
		--print('en'..DPS)
		-- if count_player_hp > count_enemy_hp then
			-- return true
		-- end
	end
	return false
end
function isSystemHasCompucter(inp_id)
	if inp_id == 0 or inp_id == 1 or inp_id == 3 or inp_id == 0 or inp_id == 6 or inp_id == 7 or inp_id == 8 or inp_id == 11 then
		return true
	end
	return false
end




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


-- function check_mouse_pos()
	-- print(Hyperspace.Mouse.position.x..','..Hyperspace.Mouse.position.y)
	-- local mouin = {x = 306, y = 151, w = 185, h = 343}
	-- while mouseInside(mouin) do
		-- if Hyperspace.Mouse.position.x > mouin.x + mouin.w - 10 then
			-- Hyperspace.Mouse.position = Hyperspace.Point(Hyperspace.Mouse.position.x+1, Hyperspace.Mouse.position.y)
		-- elseif Hyperspace.Mouse.position.x < mouin.x + 10 then
			-- Hyperspace.Mouse.position = Hyperspace.Point(Hyperspace.Mouse.position.x-1, Hyperspace.Mouse.position.y)
		-- elseif Hyperspace.Mouse.position.y < mouin.y + 10 then
			-- Hyperspace.Mouse.position = Hyperspace.Point(Hyperspace.Mouse.position.x, Hyperspace.Mouse.position.y-1)
		-- else
			-- Hyperspace.Mouse.position = Hyperspace.Point(Hyperspace.Mouse.position.x, Hyperspace.Mouse.position.y+1)
		-- end
		-- Hyperspace.Mouse.lastPosition = Hyperspace.Mouse.position
		-- Hyperspace.Mouse.valid = true
		-- Hyperspace.Mouse.lastValid = true
		-- Hyperspace.Mouse.bForceTooltip = false
		-- Hyperspace.Mouse.bMoving = true
		-- Hyperspace.Mouse.bHideMouse = true
		-- Hyperspace.Mouse:OnRender()
		-- Hyperspace.Mouse:OnLoop()
		-- --Hyperspace.Mouse:Reset()
		-- --print('inside!'..tostring(math.random(100,200)))
		-- -- if playerShip.ship.hullIntegrity.first ~= varr.player_res_hp then
			-- -- playerShip.ship.hullIntegrity.first = varr.player_res_hp
		-- -- end
		-- -- if playerShip.currentScrap ~= varr.player_res_scrap then
			-- -- playerShip:ModifyScrapCount(varr.player_res_scrap - playerShip.currentScrap, false)
			-- -- Hyperspace.Sounds:PlaySoundMix('wrong', 10, false)
		-- -- end
		-- -- if playerShip:GetMissileCount() ~= varr.player_res_missiles then
			-- -- playerShip:ModifyMissileCount(varr.player_res_missiles - playerShip:GetMissileCount()) 
		-- -- end
		-- -- if playerShip:GetDroneCount() ~= varr.player_res_drones then
			-- -- playerShip:ModifyDroneCount(varr.player_res_drones - playerShip:GetDroneCount()) 
		-- -- end
		-- -- if playerShip.fuel_count ~= varr.player_res_fuel then
			-- -- playerShip.fuel_count = varr.player_res_fuel
		-- -- end
	-- --else
		-- -- varr.player_res_hp = playerShip.ship.hullIntegrity.first
		-- -- varr.player_res_scrap = playerShip.currentScrap
		-- -- varr.player_res_missiles = playerShip:GetMissileCount()
		-- -- varr.player_res_drones = playerShip:GetDroneCount()
		-- -- varr.player_res_fuel = playerShip.fuel_count
	-- end
-- end


--varr.previous_crew_intruder_state_arr
--crew.iShipId - принадлежность к кораблю. 0 экипаж игрока. 1 врага.
script.on_internal_event(Defines.InternalEvents.CREW_LOOP, function(crew)
	--print(crew.blueprint.name)
	if crew:IsDrone() == false then
		if varr.previous_crew_intruder_state_arr[crew.extend.selfId] == nil then
			varr.previous_crew_intruder_state_arr[crew.extend.selfId] = true
		else
			if crew.extend.customTele.teleporting == true then
				if crew.intruder == true and crew.extend.deathTimer == nil and varr.previous_crew_intruder_state_arr[crew.extend.selfId] == false then
					if crew.blueprint.name:find("legendary") == nil and crew.blueprint.name ~= "gus" and crew.blueprint.name ~= "gusq" and crew.blueprint.name ~= "alien" and crew.blueprint.name ~= "osa" and crew.blueprint.name ~= "osae" then -- легендарные не копируются.
						if Hyperspace.metaVariables['enemy_state'] == 2 then
							--print('tele attacking! '..crew.blueprint.name..crew.iShipId..tostring(crew.intruder))
							if math.random(0,100)<50 then --bamalf шанс срабатывания усиления
								if crew.iShipId == 0 and playerShip and hasAnyAugmentationOfList(playerShip, {"TELEPORT_MULTI", "HID_TELEPORT_MULTI"}) == true then
									--local temporal_crew = playerShip:AddCrewMemberFromString(crew.blueprint.crewNameLong.data, crew.blueprint.name, not crew.intruder, -1, true, crew.stats.male)
									local temporal_crew = playerShip:AddCrewMemberFromString(replaceInTextSomethingHeh(crew.blueprint.crewNameLong.data), crew.blueprint.name, not crew.intruder, -1, true, crew.stats.male)
									temporal_crew.crewAnim.layerColors = crew.crewAnim.layerColors
									temporal_crew.health.first = crew.health.first
									Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_temporal_crew), temporal_crew)
									Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_slot_zero), temporal_crew)
									temporal_crew.extend:InitiateTeleport(1, -1, -1)
									varr.previous_crew_intruder_state_arr[temporal_crew.extend.selfId] = true
									temporal_crew.extend.deathTimer = Hyperspace.TimerHelper(false)
									temporal_crew.extend.deathTimer:Start(30.0)
									Hyperspace.Sounds:PlaySoundMix('teleport_multi_works', 8, false)
									--print(temporal_crew.blueprint.name)
								elseif crew.iShipId == 1 and enemyShip and hasAnyAugmentationOfList(enemyShip, {"TELEPORT_MULTI"}) == true then
									--local temporal_crew = playerShip:AddCrewMemberFromString(crew.blueprint.crewNameLong.data, crew.blueprint.name, not crew.intruder, -1, true, crew.stats.male)
									local temporal_crew = enemyShip:AddCrewMemberFromString(replaceInTextSomethingHeh(crew.blueprint.crewNameLong.data), crew.blueprint.name, not crew.intruder, -1, true, crew.stats.male)
									temporal_crew.crewAnim.layerColors = crew.crewAnim.layerColors
									temporal_crew.health.first = crew.health.first
									Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_temporal_crew), temporal_crew)
									Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_slot_zero), temporal_crew)
									temporal_crew.extend:InitiateTeleport(0, -1, -1)
									varr.previous_crew_intruder_state_arr[temporal_crew.extend.selfId] = true
									temporal_crew.extend.deathTimer = Hyperspace.TimerHelper(false)
									temporal_crew.extend.deathTimer:Start(30.0)
									Hyperspace.Sounds:PlaySoundMix('teleport_multi_works', 8, false)
									--print(temporal_crew.blueprint.name)
								end
							end
						end
					end
				end
			end
			varr.previous_crew_intruder_state_arr[crew.extend.selfId] = crew.intruder
		end
	end
end)
function replaceInTextSomethingHeh(inptext)
	local namebefore = inptext
	local inp2 = inptext
	while namebefore == inp2 do
		local itteration_count = math.random(1,3)
		if inp2:find('a') ~= nil or inp2:find('e') ~= nil or inp2:find('i') ~= nil or inp2:find('u') ~= nil or inp2:find('o') ~= nil or inp2:find('A') ~= nil or inp2:find('E') ~= nil or inp2:find('I') ~= nil or inp2:find('U') ~= nil or inp2:find('O') ~= nil then
			while (itteration_count>0) do
				if string.len(inp2) < 9 then --в англ. считает нормально 1 буква =1 число
					if math.random(0,100)<75 then
						inp2 = inp2..varr.letters_eng[math.random(1, #varr.letters_eng-1)]
					end
				else
					if math.random(0,100)<75 then
						--print('bef='..inp2)
						inp2 = varr.lettersUP_eng[math.random(1, #varr.lettersUP_eng-1)]..inp2:sub(2, #inp2)
						--print('aft='..inp2)
					end
				end
				itteration_count = itteration_count - 1
			end
		else
			while (itteration_count>0) do
				--print(tostring(inp2)..','..string.len(tostring(inp2)))
				if string.len(inp2) < 15 then-- на русском вроде 1 к 2 считает...
					if math.random(0,100)<75 then
						inp2 = inp2..varr.letters_rus[math.random(1, #varr.letters_rus-1)]
					end
				else
					if math.random(0,100)<75 then
						--print('bef='..inp2)
						inp2 = varr.lettersUP_rus[math.random(1, #varr.lettersUP_rus)]..inp2:sub(2, #inp2)
						--print('aft='..inp2)
					end
				end
				itteration_count = itteration_count - 1
			end
		end
	end
	return inp2
end






function copy_anyone_in_player_teleporter()
    if playerShip then
		if playerShip.teleportSystem == nil or playerShip.teleportSystem:Functioning()==false then
			Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, "EVENT_COPY_ANYONE_IN_PLAYER_TELEPORTER_NOFUNCTIONTELE", true, -1)
		elseif (math.random(0,100)<25) then
			Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, "EVENT_COPY_ANYONE_IN_PLAYER_TELEPORTER_EXPLOSION", true, -1)
		else
			local teleportRoomId = playerShip.teleportSystem:GetRoomId()
			local bDirectWay = true
			if (math.random(0,100)<50) then
				bDirectWay = false
			end
			if bDirectWay == true then
				for i = 0, playerShip.vCrewList:size() - 1 do
					local crew = playerShip.vCrewList[i]
					if crew.iRoomId == teleportRoomId and crew:IsDrone() == false and crew.extend.deathTimer == nil then
						if crew.blueprint.name:find("legendary") == nil and crew.blueprint.name ~= "gus" and crew.blueprint.name ~= "gusq" and crew.blueprint.name ~= "alien" and crew.blueprint.name ~= "osa" and crew.blueprint.name ~= "osae" then
							if (math.random(0,100)<66) then
								local temporal_crew = playerShip:AddCrewMemberFromString(replaceInTextSomethingHeh(crew.blueprint.crewNameLong.data), crew.blueprint.name, false, -1, true, crew.stats.male)
								temporal_crew.crewAnim.layerColors = crew.crewAnim.layerColors
								temporal_crew.health.first = crew.health.first
								temporal_crew.extend:InitiateTeleport(0, -1, -1)
								Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, "EVENT_COPY_ANYONE_IN_PLAYER_TELEPORTER_GOOD", true, -1)
								Hyperspace.Sounds:PlaySoundMix('teleport_multi_works', 8, false)
								return
							else
								local temporal_crew = playerShip:AddCrewMemberFromString(replaceInTextSomethingHeh(crew.blueprint.crewNameLong.data), crew.blueprint.name, true, -1, true, crew.stats.male)
								temporal_crew.crewAnim.layerColors = crew.crewAnim.layerColors
								temporal_crew.health.first = crew.health.first
								temporal_crew.extend:InitiateTeleport(0, -1, -1)
								Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, "EVENT_COPY_ANYONE_IN_PLAYER_TELEPORTER_BAD", true, -1)
								Hyperspace.Sounds:PlaySoundMix('teleport_multi_works', 8, false)
								return
							end
						end
					end
				end
			else
				--print('invert way')
				for i = playerShip.vCrewList:size() - 1, 0, -1 do
					local crew = playerShip.vCrewList[i]
					--есть ещё маленький прикол, хз найдут или нет. можно это провернуть скопировав экипаж врага в телепортере))
					--намеренно не ставил проверку враждебности
					if crew.iRoomId == teleportRoomId and crew:IsDrone() == false and crew.extend.deathTimer == nil then
						if crew.blueprint.name:find("legendary") == nil and crew.blueprint.name ~= "gus" and crew.blueprint.name ~= "gusq" and crew.blueprint.name ~= "alien" and crew.blueprint.name ~= "osa" and crew.blueprint.name ~= "osae" then
							if (math.random(0,100) < 66) then
								local temporal_crew = playerShip:AddCrewMemberFromString(replaceInTextSomethingHeh(crew.blueprint.crewNameLong.data), crew.blueprint.name, false, -1, true, crew.stats.male)
								temporal_crew.crewAnim.layerColors = crew.crewAnim.layerColors
								temporal_crew.health.first = crew.health.first
								temporal_crew.extend:InitiateTeleport(0, -1, -1)
								Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, "EVENT_COPY_ANYONE_IN_PLAYER_TELEPORTER_GOOD", true, -1)
								Hyperspace.Sounds:PlaySoundMix('teleport_multi_works', 8, false)
								return
							else
								local temporal_crew = playerShip:AddCrewMemberFromString(replaceInTextSomethingHeh(crew.blueprint.crewNameLong.data), crew.blueprint.name, true, -1, true, crew.stats.male)
								temporal_crew.crewAnim.layerColors = crew.crewAnim.layerColors
								temporal_crew.health.first = crew.health.first
								temporal_crew.extend:InitiateTeleport(0, -1, -1)
								Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, "EVENT_COPY_ANYONE_IN_PLAYER_TELEPORTER_BAD", true, -1)
								Hyperspace.Sounds:PlaySoundMix('teleport_multi_works', 8, false)
								return
							end
							
						end
					end
				end
			end
			Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, "EVENT_COPY_ANYONE_IN_PLAYER_TELEPORTER_NOCREWINTELE", true, -1)
		end
	end
end
script.on_game_event("EVENT_COPY_ANYONE_IN_PLAYER_TELEPORTER", false, copy_anyone_in_player_teleporter)



function radioactivity_firedamage(ship_id)
	--print('fd'..ship_id)
	if ship_id == 0 then
		if playerShip then
			local dam = Hyperspace.Damage()
			dam.iDamage = 0
			dam.fireChance = 10
			dam.iShieldPiercing = 10
			playerShip:DamageArea(playerShip:GetRandomRoomCenter(), dam, true)
		end
	else
		if enemyShip then
			local dam = Hyperspace.Damage()
			dam.iDamage = 0
			dam.fireChance = 10
			dam.iShieldPiercing = 10
			enemyShip:DamageArea(enemyShip:GetRandomRoomCenter(), dam, true)
			Hyperspace.playerVariables['counter_rad_fire'] = Hyperspace.playerVariables['counter_rad_fire'] + 1
		end
	end
end
function radioactivity_itteration(ship_id)
	--print(ship_id)
	if ship_id == 0 then
		if playerShip and playerShip.vCrewList:size() > 0 then
			local crew = playerShip.vCrewList[math.random(0,playerShip.vCrewList:size() - 1)]
			if crew:IsDrone()==false and crew.extend.deathTimer == nil and crew.health.first > 0.0 and crew.bMindControlled == false then
				local posyposy = crew:GetPosition()
				local iroomid_mem = crew.iRoomId
				local slot_mem = crew.currentSlot.slotId
				local next_blue = ""
				while next_blue == "" do
					next_blue = varr.list_of_all_races[math.random(1, #varr.list_of_all_races-1)]
					if next_blue:find('legendary')~=nil then
						next_blue = ""
					end
					if next_blue:find('human_')~=nil then
						next_blue = ""
					end
					if next_blue == crew.blueprint.name then
						next_blue = ""
					end
				end
				--local temporal_crew = playerShip:AddCrewMemberFromString(crew.blueprint.crewNameLong.data, next_blue, crew.intruder, -1, true, crew.stats.male)
				local temporal_crew = playerShip:AddCrewMemberFromString(crew.blueprint.crewNameLong.data, next_blue, crew.intruder, -1, true, crew.stats.male)
				if crew.health.first > temporal_crew.health.second then
					temporal_crew.health.first = temporal_crew.health.second
				else
					temporal_crew.health.first = crew.health.first
				end
				--Hyperspace.Sounds:PlaySoundMix('teleport_multi_works', 8, false)
				Hyperspace.playerVariables['counter_rad_crew'] = Hyperspace.playerVariables['counter_rad_crew'] + 1
				crew:Kill(true)
				temporal_crew:SetPosition(posyposy)
				temporal_crew:MoveToRoom(iroomid_mem, slot_mem, false)
			end
		end
	else
		if enemyShip and enemyShip.vCrewList:size() > 0 then
			local crew = enemyShip.vCrewList[math.random(0, enemyShip.vCrewList:size() - 1)]
			if crew:IsDrone()==false and crew.extend.deathTimer == nil and crew.health.first > 0.0 and crew.bMindControlled == false then
				local posyposy = crew:GetPosition()
				local iroomid_mem = crew.iRoomId
				local slot_mem = crew.currentSlot.slotId
				local next_blue = ""
				while next_blue == "" do
					next_blue = varr.list_of_all_races[math.random(1, #varr.list_of_all_races-1)]
					if next_blue:find('legendary')~=nil then
						next_blue = ""
					end
					if next_blue:find('human_')~=nil then
						next_blue = ""
					end
					if next_blue == crew.blueprint.name then
						next_blue = ""
					end
				end
				local temporal_crew = enemyShip:AddCrewMemberFromString(crew.blueprint.crewNameLong.data, next_blue, crew.intruder, -1, true, crew.stats.male)
				if crew.health.first > temporal_crew.health.second then
					temporal_crew.health.first = temporal_crew.health.second
				else
					temporal_crew.health.first = crew.health.first
				end
				--Hyperspace.Sounds:PlaySoundMix('teleport_multi_works', 8, false)
				crew:Kill(true)
				temporal_crew:SetPosition(posyposy)
				temporal_crew:MoveToRoom(iroomid_mem, slot_mem, false)
			end
		end
	end
end
script.on_game_event("RADIOACTIVE_TRANSQ", false, function()
	radioactivity_itteration(0)
end)


function fire_universal_definer(fire, bAnaerobicFires)
	-- если вражеский корабль имеет этот ауг, то огонь не будет тухнуть в бескислородных комнатах
	if bAnaerobicFires == true then
		fire.fOxygen = 100
	end
	
	--fire.fDamage показатель состояния огня. при возникновении присваивается 100.0 и по мере тушения уходит до 0.0, тогда тухнет. не восстанавливается со временем вверх.
	--fire.fDeathTimer показатель тушения пламени через отсутствие кислорода. если уровень О2 ниже границы, то таймер идёт к 0.0 с 8-10.0 где-то.
	--в 0.0 - тухнет при условии что в комнате не появился кислород по окончанию таймера, даже если хп пламени полные.
	--незавимо от этих параметров огонь ломает системы с одинаковой скоростью.
	
	--если огонь задыхается снижает его хп. в дальнейшем такой огонь легче затушить, если вдруг в комнате появился кислород и он выжил
	if fire.fOxygen < 5.0 then
		if fire.fDamage > 30.0 then
			if math.random(0,2000) < 80 then
				fire.fDamage = fire.fDamage - 0.1*math.random(4,8)
			end
		end
	end
	
	-- исправление отображения огня анаэробного и обычного
	if fire.fireAnimation.animName == "" then
		--print(shipMgr.iShipId..','..tostring(bAnaerobicFires))
		if bAnaerobicFires == true then
			if fire.fDamage < 30.0 then
				fire.fireAnimation.animName = "firea_S1_strip8"
				fire.fireAnimation.animationStrip = varr.firea_S1_strip8
			elseif fire.fDamage < 60.0 then
				fire.fireAnimation.animName = "firea_M1_strip8"
				fire.fireAnimation.animationStrip = varr.firea_M1_strip8
			else
				fire.fireAnimation.animName = "firea_L1_strip8"
				fire.fireAnimation.animationStrip = varr.firea_L1_strip8
			end
		else
			if fire.fDamage < 30.0 then
				fire.fireAnimation.animName = "fire_S1_strip8"
				fire.fireAnimation.animationStrip = varr.fire_S1_strip8
			elseif fire.fDamage < 60.0 then
				fire.fireAnimation.animName = "fire_M1_strip8"
				fire.fireAnimation.animationStrip = varr.fire_M1_strip8
			else
				fire.fireAnimation.animName = "fire_L1_strip8"
				fire.fireAnimation.animationStrip = varr.fire_L1_strip8
			end
		end
		--print('fire nil')
	end
	
	if fire.fDamage ~= 100.0 then
		if fire.fDamage < 60.0 and fire.fDamage > 59.0 then
			fire.fDamage = 58.9
			if bAnaerobicFires == true then
				fire.fireAnimation.animationStrip = varr.firea_M1_strip8
				fire.fireAnimation.animName = "firea_M1_strip8"
			else
				fire.fireAnimation.animationStrip = varr.fire_M1_strip8
				fire.fireAnimation.animName = "firea_M1_strip8"
			end
			--fire.fireAnimation.animationStrip = varr.fire_M1_strip8
			fire.fireAnimation.primitive = nil
			fire.fireAnimation.mirroredPrimitive = nil
		elseif fire.fDamage < 30.0 and fire.fDamage > 29.0 then
			fire.fDamage = 28.9
			if bAnaerobicFires == true then
				fire.fireAnimation.animationStrip = varr.firea_S1_strip8
				fire.fireAnimation.animName = "firea_S1_strip8"
			else
				fire.fireAnimation.animationStrip = varr.fire_S1_strip8
				fire.fireAnimation.animName = "fire_S1_strip8"
			end
			--fire.fireAnimation.animationStrip = varr.fire_S1_strip8
			fire.fireAnimation.primitive = nil
			fire.fireAnimation.mirroredPrimitive = nil
		end
		if fire.fDamage < 29.0 then
			if math.random(0,2000) < 1 then
				if fire.fDeathTimer <= 0.0 then --если огонёк в бескислородной среде и таймер работает, не повышаем хп.
					fire.fDamage = fire.fDamage + math.random(4,12) --периодически (тут около 1 раза в 2 сек) огонь востанавливает свои хп если он маленький
					--print(fire.fDamage..'=growy anti exting')
					if fire.fDamage >= 30.0 then
						if bAnaerobicFires == true then
							fire.fireAnimation.animationStrip = varr.firea_M1_strip8
							fire.fireAnimation.animName = "firea_M1_strip8"
						else
							fire.fireAnimation.animationStrip = varr.fire_M1_strip8
							fire.fireAnimation.animName = "fire_M1_strip8"
						end
						--fire.fireAnimation.animationStrip = varr.fire_M1_strip8--это переход из маленького обратно в средний
						fire.fireAnimation.primitive = nil
						fire.fireAnimation.mirroredPrimitive = nil
					end
				end
			end
		end
		if bAnaerobicFires == true then
			if fire.fireAnimation.animName == "fire_L1_strip8" then
				fire.fireAnimation.animationStrip = varr.firea_L1_strip8
				fire.fireAnimation.primitive = nil
				fire.fireAnimation.mirroredPrimitive = nil
				fire.fireAnimation.animName = "firea_L1_strip8"
			elseif fire.fireAnimation.animName == "fire_M1_strip8" then
				fire.fireAnimation.animationStrip = varr.firea_M1_strip8
				fire.fireAnimation.primitive = nil
				fire.fireAnimation.mirroredPrimitive = nil
				fire.fireAnimation.animName = "firea_M1_strip8"
			elseif fire.fireAnimation.animName == "fire_S1_strip8" then
				fire.fireAnimation.animationStrip = varr.firea_S1_strip8
				fire.fireAnimation.primitive = nil
				fire.fireAnimation.mirroredPrimitive = nil
				fire.fireAnimation.animName = "firea_S1_strip8"
			end
		else
			if fire.fireAnimation.animName == "firea_L1_strip8" then
				fire.fireAnimation.animationStrip = varr.fire_L1_strip8
				fire.fireAnimation.primitive = nil
				fire.fireAnimation.mirroredPrimitive = nil
				fire.fireAnimation.animName = "fire_L1_strip8"
			elseif fire.fireAnimation.animName == "firea_M1_strip8" then
				fire.fireAnimation.animationStrip = varr.fire_M1_strip8
				fire.fireAnimation.primitive = nil
				fire.fireAnimation.mirroredPrimitive = nil
				fire.fireAnimation.animName = "fire_M1_strip8"
			elseif fire.fireAnimation.animName == "firea_S1_strip8" then
				fire.fireAnimation.animationStrip = varr.fire_S1_strip8
				fire.fireAnimation.primitive = nil
				fire.fireAnimation.mirroredPrimitive = nil
				fire.fireAnimation.animName = "fire_S1_strip8"
			end
		end
	elseif fire.fDamage == 100.0 then
		fire.fDamage = 99.9
		if bAnaerobicFires == true then
			fire.fireAnimation.animationStrip = varr.firea_L1_strip8
			fire.fireAnimation.animName = "firea_L1_strip8"
		else
			fire.fireAnimation.animationStrip = varr.fire_L1_strip8
			fire.fireAnimation.animName = "fire_L1_strip8"
		end
		fire.fireAnimation.primitive = nil
		fire.fireAnimation.mirroredPrimitive = nil
	end
end

function redefine_enemy_ai_lamp()
	local chance_of_AI = (Hyperspace.playerVariables['counter_number_of_sector'] - 1.0)*5.0
	if Hyperspace.metaVariables['challenge_noai'] == 1 then
		chance_of_AI = 146
	end
	if math.random(0,100) < chance_of_AI then -- шанс продвинутого ИИ у вражеских кораблей
		Hyperspace.metaVariables['enemy_has_advanced_ai'] = 1
	else
		Hyperspace.metaVariables['enemy_has_advanced_ai'] = 0
	end
end




--stat+
function give_dohod_stat_me(bInStatistic)
	if varr.give_dohod_stat_me_memoryed_output ~= '' then
		return varr.give_dohod_stat_me_memoryed_output
		--так как вычисления отвратительно большие, используем строку памяти. вычислит лишь при первом обращении, далее будет выдавать строку памяти.
	else
		--print('recalc')
		local str_FAD_temp
		local full_average_dohod = 0
		--local bFoundDataProblem = false
		
		
		
		if Hyperspace.playerVariables['counter_number_of_sector'] == 1 and bInStatistic == true then
			str_FAD_temp = Hyperspace.Text:GetText('lua_effectivity_unknown')
		else
			
			costy, costy_pot, overstrong = calculate_ship_cost (Hyperspace.ships.player)
			local last_sector_delta_dohod = costy_pot - Hyperspace.playerVariables['begin_sector_ship_cost'] - 4--учёт расхода топлива на переход в следующий сектор
			if Hyperspace.metaVariables['challenge_nofuel'] == 1 and playerShip.fuel_count >= 2 then
				last_sector_delta_dohod = last_sector_delta_dohod - 4
			end
			local upper_border = math.floor(Hyperspace.playerVariables['counter_number_of_sector'])
			for j = 1, 8 do
				if j <= upper_border then
					local avrew = 0.0
					local full_meet_counter = 0
					for i = 1, #sector_arr do
						full_meet_counter = full_meet_counter + math.floor(Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'meet'])
					end
					for i = 1, #sector_arr do
						if math.floor(Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'meet']) > 0 then
							local rew = Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'rew']
							avrew = avrew + rew*math.floor(Hyperspace.metaVariables[sector_arr[i].inner_name..'#'..diff..'#'..j..'meet'])
						end
					end
					
					if j == upper_border then--текущий сектор
						full_meet_counter = full_meet_counter + 1
						avrew = avrew + last_sector_delta_dohod
						avrew = math.floor(avrew/full_meet_counter)
					else--предыдущие сектора
						if full_meet_counter == 0 then --заглушка, сработает если сектор какой-то условно запорот/пройден с читами или не нормально и записи просто нет.
							avrew = 0
							--bFoundDataProblem = true
						elseif full_meet_counter == 1 then -- случай когда мы в секторе этого номера первый раз
							--bFoundDataProblem = true
						else
							avrew = math.floor(avrew/full_meet_counter)
						end
					end
					
					
					-- if avrew == 0 then
						-- bFoundDataProblem = true
					-- end
					
					full_average_dohod = full_average_dohod + avrew
				end
			end
			
			-- if full_average_dohod == 0 then
				-- bFoundDataProblem = true
			-- end
			
			-- if bFoundDataProblem == true then
				-- str_FAD_temp = Hyperspace.Text:GetText('lua_effectivity_unknown')--was very
			-- else
				local calc_fad = math.floor(100.0*(math.floor(Hyperspace.metaVariables['current_run_all_sector_reward'] + last_sector_delta_dohod)/full_average_dohod))
				
				
				local enterppp = ''
				if bInStatistic == false then
					enterppp = '\n'
					Hyperspace.playerVariables['last_calculated_effectivity'] = calc_fad
					--print('saved calc = '..calc_fad)
				else
					calc_fad = math.floor(Hyperspace.playerVariables['last_calculated_effectivity'])
					--print('loaded calc = '..calc_fad)
				end
				
				if calc_fad < 90 then
					str_FAD_temp = '[style[color:d93130FF]]'..Hyperspace.Text:GetText('lua_effectivity_known')..' '..enterppp..tostring(calc_fad)..'%[[/style]]\n\n'
				elseif calc_fad < 110 then
					str_FAD_temp = '[style[color:f3f132]]'..Hyperspace.Text:GetText('lua_effectivity_known')..' '..enterppp..tostring(calc_fad)..'%[[/style]]\n\n'
				else
					str_FAD_temp = '[style[color:86c946FF]]'..Hyperspace.Text:GetText('lua_effectivity_known')..' '..enterppp..tostring(calc_fad)..'%[[/style]]\n\n'
				end
				
				if bInStatistic == true then
					str_FAD_temp = str_FAD_temp..Hyperspace.Text:GetText('lua_effectivity_info')
				end
			--end
		end
		--print('calculate big done!')
		varr.give_dohod_stat_me_memoryed_output = str_FAD_temp
		return varr.give_dohod_stat_me_memoryed_output
	end
	return ''
end

function ifHasSenseToResendEnemyCrewToGoodPlace(crew)
	if varr.universal_iRoom_targ[crew.extend.selfId] == nil then
		varr.universal_iRoom_targ[crew.extend.selfId] = -1
	end
	if enemyShip and GSIe and varr.universal_iRoom_targ[crew.extend.selfId] ~= -1 then
		--if varr.universal_iRoom_targ[crew.extend.selfId] ~= 8 and varr.universal_iRoom_targ[crew.extend.selfId] ~= 5 then
		if enemyShip:HasSystem(2) == true and enemyShip:GetSystem(2):CompletelyDestroyed() == true and enemyShip:GetOxygenPercentage() < 20 and enemyShip:GetSystem(2).bOccupied == false and (enemyShip:GetFireCount(enemyShip:GetSystemRoom(2)) == 0 or crew:CanBurn()==false) then
			varr.universal_iRoom_targ[crew.extend.selfId] = enemyShip:GetSystemRoom(2)
			--print('resend to oxy')
		elseif math.random(0,100)<30 and enemyShip:HasSystem(1) == true and enemyShip:GetSystem(1):CompletelyDestroyed() == true and enemyShip:GetSystem(1).bOccupied == false and (enemyShip:GetFireCount(enemyShip:GetSystemRoom(1)) == 0 or crew:CanBurn()==false) and (GSIe:GetRoomOxygen(enemyShip:GetSystemRoom(1)) > 10.0 or crew:CanSuffocate() == false) then
			varr.universal_iRoom_targ[crew.extend.selfId] = enemyShip:GetSystemRoom(1)
			--print('resend to pilot')
		elseif math.random(0,100)<30 and enemyShip:HasSystem(6) == true and enemyShip:GetSystem(6):CompletelyDestroyed() == true and enemyShip:GetSystem(6).bOccupied == false and (enemyShip:GetFireCount(enemyShip:GetSystemRoom(6)) == 0 or crew:CanBurn()==false) and (GSIe:GetRoomOxygen(enemyShip:GetSystemRoom(6)) > 10.0 or crew:CanSuffocate() == false) then
			varr.universal_iRoom_targ[crew.extend.selfId] = enemyShip:GetSystemRoom(6)
			--print('resend to engines')
		elseif math.random(0,100)<30 and enemyShip:HasSystem(8) == true and enemyShip:GetSystem(8):CompletelyDestroyed() == false and enemyShip:GetSystem(8).bOccupied == false and (enemyShip:GetFireCount(enemyShip:GetSystemRoom(8)) == 0 or crew:CanBurn()==false) and (GSIe:GetRoomOxygen(enemyShip:GetSystemRoom(8)) > 10.0 or crew:CanSuffocate() == false) then
			varr.universal_iRoom_targ[crew.extend.selfId] = enemyShip:GetSystemRoom(8)
			--print('resend to doors')
		elseif math.random(0,100)<30 and enemyShip:HasSystem(5) == true and enemyShip:GetSystem(5):CompletelyDestroyed() == true and enemyShip:GetSystem(5).bOccupied == false and (enemyShip:GetFireCount(enemyShip:GetSystemRoom(5)) == 0 or crew:CanBurn()==false) and (GSIe:GetRoomOxygen(enemyShip:GetSystemRoom(5)) > 10.0 or crew:CanSuffocate() == false) then
			varr.universal_iRoom_targ[crew.extend.selfId] = enemyShip:GetSystemRoom(5)
			--print('resend to med')
		elseif math.random(0,100)<30 and enemyShip:HasSystem(13) == true and enemyShip:GetSystem(13):CompletelyDestroyed() == true and enemyShip:GetSystem(13).bOccupied == false and (enemyShip:GetFireCount(enemyShip:GetSystemRoom(13)) == 0 or crew:CanBurn()==false) and (GSIe:GetRoomOxygen(enemyShip:GetSystemRoom(13)) > 10.0 or crew:CanSuffocate() == false) then
			varr.universal_iRoom_targ[crew.extend.selfId] = enemyShip:GetSystemRoom(13)
			--print('resend to clonebay')
		end
		--end
	end
end


-- блок снизу даёт возможность 5 или меньше орудиям с инжекторами не нулевой шанс появиться в магазине
-- каждый сектор это разные орудия. с наценкой
function make_allowed_ultrarare_injected_weapons()
	for i = 0, 5 do
		local weapnamy = varr.full_list_of_game_equipment[math.random(0, #varr.full_list_of_game_equipment)]
		if weapnamy:find('_PRC')~= nil or 
		weapnamy:find('_FRC')~= nil or 
		weapnamy:find('_BRC')~= nil or 
		weapnamy:find('_CLD')~= nil or 
		weapnamy:find('_POW')~= nil or 
		weapnamy:find('_UNI')~= nil or 
		weapnamy:find('_ACC')~= nil then
		local weapnamy_source = string.gsub(weapnamy,'_PRC', "")
		weapnamy_source = string.gsub(weapnamy_source,'_FRC', "")
		weapnamy_source = string.gsub(weapnamy_source,'_BRC', "")
		weapnamy_source = string.gsub(weapnamy_source,'_CLD', "")
		weapnamy_source = string.gsub(weapnamy_source,'_POW', "")
		weapnamy_source = string.gsub(weapnamy_source,'_UNI', "")
		weapnamy_source = string.gsub(weapnamy_source,'_ACC', "")
		--print(weapnamy_source)
		if Hyperspace.Blueprints:GetWeaponBlueprint(weapnamy_source).desc.cost ~= nil and Hyperspace.Blueprints:GetWeaponBlueprint(weapnamy_source).desc.cost > 0 then
			if Hyperspace.Blueprints:GetWeaponBlueprint(weapnamy_source).desc.rarity ~= 0 then
				Hyperspace.Blueprints:GetWeaponBlueprint(weapnamy).desc.rarity = 4 -- was 5
				Hyperspace.Blueprints:GetWeaponBlueprint(weapnamy).desc.cost = Hyperspace.Blueprints:GetWeaponBlueprint(weapnamy).desc.cost + 15
				--print('injector allowed='..weapnamy)
			end
		end
		--print('injector allowed='..weapnamy)
		end
	end
end




--2 блока снизу работают вместе, чтобы в начале игры и по прибытию в каждый сектор обнулять редкость 15 единиц оборудования
--с редкостями 1шт. 1 редкости, 2шт. 2редкости и т.д. до 5 редкости.
--каждую новую начатую игру 15 единиц меняются на другие.
function set_filtration()
	for i = 0, 14 do
		if Hyperspace.metaVariables['unallowed_eq'..tostring(i)] ~= 0 then
			equip_name = varr.full_list_of_game_equipment[Hyperspace.metaVariables['unallowed_eq'..tostring(i)]]
			if Hyperspace.Blueprints:GetWeaponBlueprint(equip_name).desc.cost > 0 then
				Hyperspace.Blueprints:GetWeaponBlueprint(equip_name).desc.rarity = 0
			elseif Hyperspace.Blueprints:GetDroneBlueprint(equip_name).desc.cost > 0 then
				Hyperspace.Blueprints:GetDroneBlueprint(equip_name).desc.rarity = 0
			elseif Hyperspace.Blueprints:GetAugmentBlueprint(equip_name).desc.cost > 0 then
				Hyperspace.Blueprints:GetAugmentBlueprint(equip_name).desc.rarity = 0
			end
			--print('set 0 to =='..equip_name)
		end
	end
end
function make_global_rarity_filtration()
	for i = 0, 14 do
		Hyperspace.metaVariables['unallowed_eq'..tostring(i)] = 0
	end
	
	local equip_name = ""
	local equip_id = 1
	local num_of_unallowed_eq = 0
	--print('filtration!')
	local work_counter = 1
	local target_rarity = 1
	while work_counter > 0 do
		equip_id = math.random(0, #varr.full_list_of_game_equipment)
		while soon_in_unallowed_eq_list(equip_id) == true do
			equip_id = math.random(0, #varr.full_list_of_game_equipment)
		end
		equip_name = varr.full_list_of_game_equipment[equip_id]
		if varr.full_list_of_game_equipment_rarity[equip_name]~=nil and varr.full_list_of_game_equipment_rarity[equip_name] == target_rarity then
			Hyperspace.metaVariables['unallowed_eq'..tostring(math.floor(num_of_unallowed_eq))] = math.floor(equip_id)
			work_counter = work_counter - 1
			num_of_unallowed_eq = num_of_unallowed_eq + 1
			--print('X='..equip_name)
		end
	end
	work_counter = 2
	target_rarity = 2
	while work_counter > 0 do
		equip_id = math.random(0, #varr.full_list_of_game_equipment)
		while soon_in_unallowed_eq_list(equip_id) == true do
			equip_id = math.random(0, #varr.full_list_of_game_equipment)
		end
		equip_name = varr.full_list_of_game_equipment[equip_id]
		if varr.full_list_of_game_equipment_rarity[equip_name]~=nil and varr.full_list_of_game_equipment_rarity[equip_name] == target_rarity then
			Hyperspace.metaVariables['unallowed_eq'..tostring(math.floor(num_of_unallowed_eq))] = math.floor(equip_id)
			work_counter = work_counter - 1
			num_of_unallowed_eq = num_of_unallowed_eq + 1
			--print('X='..equip_name)
		end
	end
	work_counter = 3
	target_rarity = 3
	while work_counter > 0 do
		equip_id = math.random(0, #varr.full_list_of_game_equipment)
		while soon_in_unallowed_eq_list(equip_id) == true do
			equip_id = math.random(0, #varr.full_list_of_game_equipment)
		end
		equip_name = varr.full_list_of_game_equipment[equip_id]
		if varr.full_list_of_game_equipment_rarity[equip_name]~=nil and varr.full_list_of_game_equipment_rarity[equip_name] == target_rarity then
			Hyperspace.metaVariables['unallowed_eq'..tostring(math.floor(num_of_unallowed_eq))] = math.floor(equip_id)
			work_counter = work_counter - 1
			num_of_unallowed_eq = num_of_unallowed_eq + 1
			--print('X='..equip_name)
		end
	end
	work_counter = 4
	target_rarity = 4
	while work_counter > 0 do
		equip_id = math.random(0, #varr.full_list_of_game_equipment)
		while soon_in_unallowed_eq_list(equip_id) == true do
			equip_id = math.random(0, #varr.full_list_of_game_equipment)
		end
		equip_name = varr.full_list_of_game_equipment[equip_id]
		if varr.full_list_of_game_equipment_rarity[equip_name]~=nil and varr.full_list_of_game_equipment_rarity[equip_name] == target_rarity then
			Hyperspace.metaVariables['unallowed_eq'..tostring(math.floor(num_of_unallowed_eq))] = math.floor(equip_id)
			work_counter = work_counter - 1
			num_of_unallowed_eq = num_of_unallowed_eq + 1
			--print('X='..equip_name)
		end
	end
	work_counter = 5
	target_rarity = 5
	while work_counter > 0 do
		equip_id = math.random(0, #varr.full_list_of_game_equipment)
		while soon_in_unallowed_eq_list(equip_id) == true do
			equip_id = math.random(0, #varr.full_list_of_game_equipment)
		end
		equip_name = varr.full_list_of_game_equipment[equip_id]
		if varr.full_list_of_game_equipment_rarity[equip_name]~=nil and varr.full_list_of_game_equipment_rarity[equip_name] == target_rarity then
			Hyperspace.metaVariables['unallowed_eq'..tostring(math.floor(num_of_unallowed_eq))] = math.floor(equip_id)
			work_counter = work_counter - 1
			num_of_unallowed_eq = num_of_unallowed_eq + 1
			--print('X='..equip_name)
		end
	end
	--print('done')
end
function soon_in_unallowed_eq_list(checked_id)
	for i = 0, 14 do
		if Hyperspace.metaVariables['unallowed_eq'..tostring(i)] == checked_id then
			--print('soon'..checked_id)
			return true
		end
	end
	return false
end


--блок ниже обеспечивает главное свойство расы черепах - впитывание системного урона снарядов летящих в системы под ними
script.on_internal_event(Defines.InternalEvents.DAMAGE_SYSTEM, function(ship, projectile, roomId, damage)
	local result_sys_damage = damage.iDamage + damage.iSystemDamage
	if result_sys_damage > 0 then
		if ship.iShipId == 0 then
			if playerShip:GetSystemInRoom(roomId) ~= nil and playerShip:GetSystemInRoom(roomId):CompletelyDestroyed() == false then
				local turtle_to_get_damage = nil
				local turtle_max_hp = 0
				for crew in vter(playerShip.vCrewList) do
					if crew.iRoomId == roomId and crew.blueprint.name == "turtle" and crew.health.first > 0.0 then --and playerShip:GetSystemInRoom(crew.iRoomId) ~= nil  then
						if crew.health.first > turtle_max_hp then
							turtle_to_get_damage = crew
							turtle_max_hp = crew.health.first
						elseif crew.health.first == turtle_max_hp and math.random(0,100)<40 then
							turtle_to_get_damage = crew
						end
					end
				end
				if turtle_to_get_damage ~= nil and turtle_max_hp > 0 then 
					turtle_to_get_damage:DirectModifyHealth(-15*result_sys_damage)
					damage.iDamage = 0
					damage.iSystemDamage = 0
					local px = gui.shipPosition.x + turtle_to_get_damage.x
					local py = gui.shipPosition.y + turtle_to_get_damage.y
					table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("effects/block_sys_damage.png"), time_length = 800.0, time_length_mem = 800.0, x = px-38, y = py-38, w=814, h=74, fw=74, fh=74, layer = "SPACE_STATUS_up"})
					Hyperspace.Sounds:PlaySoundMix('turtle_resist', 10, false)
				end
			end
		else
			if enemyShip:GetSystemInRoom(roomId) ~= nil and enemyShip:GetSystemInRoom(roomId):CompletelyDestroyed() == false then
				local turtle_to_get_damage = nil
				local turtle_max_hp = 0
				for crew in vter(enemyShip.vCrewList) do
					if crew.iRoomId == roomId and crew.blueprint.name == "turtle" and crew.health.first > 0.0 then --and enemyShip:GetSystemInRoom(crew.iRoomId) ~= nil 
						if crew.health.first > turtle_max_hp then
							turtle_to_get_damage = crew
							turtle_max_hp = crew.health.first
						elseif crew.health.first == turtle_max_hp and math.random(0,100)<40 then
							turtle_to_get_damage = crew
						end
					end
				end
				if turtle_to_get_damage ~= nil and turtle_max_hp > 0 then 
					turtle_to_get_damage:DirectModifyHealth(-15*result_sys_damage)
					damage.iDamage = 0
					damage.iSystemDamage = 0
					local px = gui.combatControl.targetPosition.x+gui.combatControl.position.x + turtle_to_get_damage.x
					local py = gui.combatControl.targetPosition.y+gui.combatControl.position.y + turtle_to_get_damage.y
					table.insert(anim_tick_array, {texture = Hyperspace.Resources:GetImageId("effects/block_sys_damage.png"), time_length = 800.0, time_length_mem = 800.0, x = px-38, y = py-38, w=814, h=74, fw=74, fh=74, layer = "SPACE_STATUS_up"})
					Hyperspace.Sounds:PlaySoundMix('turtle_resist', 10, false)
				end
			end
		end
	end
	--print('sysdam=0')
	--damage.iDamage = 0
	--я хз почему оно работает так но работает... убирает системный урон от всех внешних попаданий
	--саботаж, пожары урон системам дают.
	return Defines.Chain.Continue
end)


--вспомогательная функция даёт локальный сдвиг координат в клетках относительно левого верхнего края комнаты за айди слота и ширину-высоту комнаты
function GetXYOffsetsForSlotWH(slot_id, room_width, room_height)
	room_width = room_width//35
	room_height = room_height//35
	local x_off = 0.0
	local y_off = 0.0
	if room_width <= 0 or room_height <= 0 then
		print('bug!')
		return 1, 1
	else
		y_off = math.floor(slot_id/room_width)
		x_off = slot_id - y_off*room_width
	end
	return x_off, y_off
end



script.on_internal_event(Defines.InternalEvents.ON_MOUSE_R_BUTTON_DOWN, function(loc_x, loc_y)
	if map and map.bOpen == true and map.bChoosingNewSector == false then
		if varr.bEnabledDrawMode == true then
			if mouseInside({x = 350, y = 90, w = 740, h = 520}) then --координаты окна карты сектора
				--draw_point_on_map(loc_x, loc_y)
				draw_point_on_map(Hyperspace.Mouse.position.x, Hyperspace.Mouse.position.y)
			else
				Hyperspace.Sounds:PlaySoundMix('wrong', 7, false)
			end
		end
	end
end)
function clear_map_drawing()
	--print('clear')
	for i = 0, 50 do
		Hyperspace.metaVariables['map_pointX'..tostring(i)] = 0
		Hyperspace.metaVariables['map_pointY'..tostring(i)] = 0
	end
end
function draw_point_on_map(loc_x, loc_y)
	--print('draw')
	for i = 0, 50 do
		if Hyperspace.metaVariables['map_pointX'..tostring(i)] == 0 then
			Hyperspace.metaVariables['map_pointX'..tostring(i)] = math.floor(loc_x)
			Hyperspace.metaVariables['map_pointY'..tostring(i)] = math.floor(loc_y)
			break
		end
	end
end


--запускалка временных дронов для недостроенного флагмана
local special_drones_arr={
[0]=nil,[1]='BOSS_ION_STOCK',[2]='DE_DRONE_SCATTER',[3]='DE_DRONE_LIGHT_1',[4]='PSLD_1_BEAM_DRONE',[5]='DE_DRONE_ION_3',[6]='DRONE_TRASS1',[7]='COMBAT_1_OLD',[8]='DE_DRONE_LIGHT_2',[9]='PSLD_2_BEAM_DRONE',
[10]='DRONE_ION_V3',[11]='DRONE_TRASS2',[12]='COMBAT_2',[13]='DE_DRONE_LIGHT_SCATTER',[14]='DE_DRONE_LIGHT_MISSILE',[15]='BOSS_BEAM_STOCK',[16]='DRONE_ION_V4',[17]='BL_DRONE_CLONEM',[18]='DE_DRONE_HEAVY_SCATTER',[19]='DE_DRONE_HULL_1',
[20]='BOSS_INFERNO_STOCK',[21]='DE_DRONE_STEALTH_BEAM_1',[22]='COMBAT_BEAM_2',[23]='DE_DRONE_ION_PIERCE',[24]='DE_DRONE_MISSILES_1',[25]='DE_DRONE_MINE_SMALL',[26]='DE_DRONE_CRYSTAL',[27]='DE_DRONE_HULL_2',[28]='COMBAT_FIRE_3',[29]='DE_DRONE_STEALTH_BEAM_2',
[30]='COMBAT_BEAM_3',[31]='DE_DRONE_ION_2',[32]='DE_DRONE_MISSILES_BARRAGE',[33]='DE_DRONE_MINE_MEDIUM',[34]='DE_DRONE_CRYSTAL_2',[35]='DE_DRONE_HEAVY_1',[36]='BOSS_PLASMA_STOCK',[37]='MAGMAN_DRONE_1',[38]='DE_DRONE_BEAM_FOCUS',[39]='DE_DRONE_HULL_BEAM',
[40]='DRONE_IONBEAM',[41]='DE_DRONE_MISSILES_2',[42]='DE_DRONE_MISSILES_3',[43]='DE_DRONE_CRYSTAL_HEAVY',[44]='DE_DRONE_HEAVY_2',[45]='DRONE_FLAK1',[46]='COMBATDRONE_HAMELEON',[47]='MAGMAN_DRONE_2',[48]='DE_DRONE_BEAM_FOCUS2',[49]='DE_DRONE_BEAM_2',
}
function make_special_surge()
	if enemyShip and enemyShip.ship.hullIntegrity.first > 0 then
		for i = 0, 2 do
			local drid = Hyperspace.playerVariables['drone_surge_slot_'..i]
			if drid ~= 0 and special_drones_arr[drid] ~= nil then 
				local sdr = playerShip:CreateSpaceDrone(Hyperspace.Blueprints:GetDroneBlueprint(special_drones_arr[drid]))
				sdr:SetDeployed(true)
				sdr.powerRequired = 0
				sdr.powered = true
				sdr.lifespan = 3.0
				--print(special_drones_arr[drid])
			end
		end
	end
end
script.on_game_event("EVENT_DRONE_SURGE_LAUNCH_END_GREAT", false, make_special_surge)



function count_of_gusq_on_player_ship()
	local count_loc = 0
	for crew in vter(playerShip.vCrewList) do
		if crew.blueprint.name == "gusq" then
			count_loc = count_loc + 1
		end
	end
	return count_loc
end



function player_cargo_has_combat_drone()
	if gui then
		for carg in vter15(gui.equipScreen:GetCargoHold()) do
			if Hyperspace.Blueprints:GetDroneBlueprint(carg).desc.cost > 0 then
				if Hyperspace.Blueprints:GetDroneBlueprint(carg).typeName == "COMBAT" then
					return true
				end
			end
		end
	end
	return false
end




function remove_all_temporal_drones()
	--print('remove')
	local all_drones = Hyperspace.App.world.space.drones
	for i = 0, all_drones:size() - 1 do
		if all_drones[i].lifespan >= 0 and all_drones[i].lifespan < 10 then
			--print('removed'..all_drones[i].blueprint.name)
			all_drones[i]:BlowUp(true)
		end
	end
end


-- делает почти точную копию корабля игрока врагу (техническую, не визуальную конечно)
function make_enemy_same_as_player()
	if enemyShip then
		
		for augs in vter(playerShip:GetAugmentationList()) do
			enemyShip:AddAugmentation(augs)
		end
		
		for crew in vter(playerShip.vCrewList) do
			if crew:IsDrone()==false and crew.health.first > 0.0 and crew.crewAnim.bPlayer==true and not crew.extend.deathTimer and crew.bMindControlled == false and crew.blueprint.name ~= "alien" then
				local targ_crew_blueprint_name = crew.blueprint.name
				local temporal_crew = enemyShip:AddCrewMemberFromString(crew.blueprint.crewNameLong.data, targ_crew_blueprint_name, crew.intruder, -1, true, crew.stats.male)
				temporal_crew.crewAnim.layerColors = crew.crewAnim.layerColors
				temporal_crew.health.first = crew.health.first
			end
		end
		
		enemyShip.ship.hullIntegrity.second = playerShip.ship.hullIntegrity.second
		enemyShip.ship.hullIntegrity.first = playerShip.ship.hullIntegrity.first
		
		enemyShip:ModifyMissileCount(-999) 
		enemyShip:ModifyDroneCount(-999)
		enemyShip:ModifyMissileCount(playerShip:GetMissileCount()) 
		enemyShip:ModifyDroneCount(playerShip:GetDroneCount())
		
		enemyShip.bAutomated = playerShip.bAutomated
		
		
		--local slot_cur_num = 0
		for weap in vter(enemyShip:GetWeaponList()) do
			--print('removed'..weap.blueprint.name)
			enemyShip:RemoveItem(weap.blueprint.name, false)
		end
		if enemyShip.droneSystem ~= nil then		
			local drones = enemyShip.droneSystem.drones
			for i = 0, drones:size() - 1 do
				if drones[i] then
					--print('removed'..drones[i].blueprint.name)
					enemyShip:RemoveItem(drones[i].blueprint.name, false)
				end
			end
		end
		
		
		for i = 0, 20 do
			Hyperspace.playerVariables['sys_remove_'..tostring(math.floor(i))] = 0
		end
		local bAtLeastOneRemoved = false
		for i = 0, 20 do
			if playerShip:HasSystem(i) == true and playerShip:GetSystem(i) ~= nil then
				if enemyShip:HasSystem(i) == false then
					enemyShip:AddSystem(i)
				end
				if enemyShip:HasSystem(i) == true then
					if playerShip:GetSystem(i).healthState.second ~= enemyShip:GetSystem(i).healthState.second then
						--enemyShip:GetSystem(i).healthState.second = playerShip:GetSystem(i).healthState.second
						enemyShip:GetSystem(i):UpgradeSystem(playerShip:GetSystem(i).healthState.second - enemyShip:GetSystem(i).healthState.second)
					end
					enemyShip:GetSystem(i).healthState.first = playerShip:GetSystem(i).healthState.first
				end
			elseif enemyShip:HasSystem(i) == true and enemyShip:GetSystem(i) ~= nil then
				bAtLeastOneRemoved = true
				Hyperspace.playerVariables['sys_remove_'..tostring(math.floor(i))] = 1
						--print('remove'..i)
			end
		end	
		if bAtLeastOneRemoved == true then
			Hyperspace.CustomEventsParser.GetInstance():LoadEvent(Hyperspace.App.world, 'ENEMY_SYSTEM_REMOVE_Q', false, -1)
		end
		enemyShip:GetAvailablePower().first = playerShip:GetAvailablePower().first
		enemyShip:GetAvailablePower().second = playerShip:GetAvailablePower().second
		
		
		
		local slot_cur_num = 0
		for weap in vter(playerShip:GetWeaponList()) do
			--ну суки... в документации нихрена не описано как это использовать. методом тыка и боли выяснил - слева блюпринт, справа слот, нумерация с 0, работает заменой текущих орудий.
			enemyShip:AddWeapon(Hyperspace.Blueprints:GetWeaponBlueprint(weap.blueprint.name), slot_cur_num)
			slot_cur_num = slot_cur_num + 1
		end
		
		
		--if playerShip.artillerySystems ~= nil then
			-- к сожалению арту скопировать не могу, будет его стандартная
		--end
		if playerShip.droneSystem ~= nil and enemyShip.droneSystem ~= nil then
			slot_cur_num = 0
			local drones = playerShip.droneSystem.drones
			for i = 0, drones:size() - 1 do
				enemyShip:AddDrone(Hyperspace.Blueprints:GetDroneBlueprint(drones[i].blueprint.name), slot_cur_num)
				slot_cur_num = slot_cur_num + 1
			end
		end
			
		
		--playerShip:RemoveItem("ARTILLERY_SYSTEM", true)
		
		
		
	end
end
script.on_game_event("ACTIVATE_MIRROR2", false, function()
	varr.make_enemy_same_as_player_at_first_free_tick = true
	--make_enemy_same_as_player()
end)







function crew_add_skill_parser(crew)
	if diff == '' then
		diff = tostring(math.floor(Hyperspace.Settings.difficulty))
	end
	if diff == '2' then
		if crew.crewAnim.bPlayer == false and crew.extend.deathTimer == nil and crew:IsDrone() == false then
			local crewbluename = crew.blueprint.name
			if crewbluename ~= "osa" and crewbluename~= "osae" and crewbluename ~= "gus" and crewbluename ~= "gusq" and crewbluename ~= "alien" and crewbluename ~= "egg" then
				--local chance_of_skill_add = (Hyperspace.playerVariables['counter_number_of_sector'] - 1.0)*5.0
				local chance_of_skill_add = (Hyperspace.playerVariables['counter_number_of_sector'] - 1.0)*4.0 --5 многовато вроде...
				--print(chance_of_skill_add)
				if math.random(0,100) < chance_of_skill_add then -- шанс что прокачает свежесозданный экипаж вражеского типа
					-- ПАМЯТКА ПО СКИЛЛАМ пилот, двиг, щит, орудия, ремонт, бой - id 0,1,2,3,4,5 соответственно
					if math.random(0,100) < 20 then
						Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_skilled_crew_y), crew)
						if crewbluename:find("human")~=nil or crewbluename == "lady_legendary" then
							crew:SetSkillProgress(0, 14)
							crew:SetSkillProgress(1, 14)
							crew:SetSkillProgress(2, 54)
							crew:SetSkillProgress(3, 64)
							crew:SetSkillProgress(4, 18)
							crew:SetSkillProgress(5, 8)
						else
							crew:SetSkillProgress(0, 30)
							crew:SetSkillProgress(1, 30)
							crew:SetSkillProgress(2, 110)
							crew:SetSkillProgress(3, 130)
							crew:SetSkillProgress(4, 36)
							crew:SetSkillProgress(5, 16)
						end
					else
						Hyperspace.StatBoostManager.GetInstance():CreateTimedAugmentBoost(Hyperspace.StatBoost(varr.def_skilled_crew_g), crew)
						if crewbluename:find("human")~=nil or crewbluename == "lady_legendary" then
							crew:SetSkillProgress(0, 7)
							crew:SetSkillProgress(1, 7)
							crew:SetSkillProgress(2, 27)
							crew:SetSkillProgress(3, 32)
							crew:SetSkillProgress(4, 9)
							crew:SetSkillProgress(5, 4)
						else
							crew:SetSkillProgress(0, 15)
							crew:SetSkillProgress(1, 15)
							crew:SetSkillProgress(2, 55)
							crew:SetSkillProgress(3, 65)
							crew:SetSkillProgress(4, 18)
							crew:SetSkillProgress(5, 8)
						end
					end
				end
			end
		end
	end
end

