local vter = function(cvec) --Taken from Vertex
	local i = -1 -- so the first returned value is indexed at zero
	local n = cvec:size()
	return function()
		i = i + 1
		if i < n then return cvec[i] end
	end
end

local function selectOne(n, ...)
	return arg[n]
end

local function isShipStable(ship) --Check if the ship doesn't have a fire and doesn't have a destroyed oxygen system
	return (ship.fireSpreader.count == 0 and not (ship.oxygenSystem and ship.oxygenSystem:CompletelyDestroyed()))
end

local function isShipSuperStable(ship) --As above, but also check if no systems are breached
	local systemsUnbreached = true
	for system in vter(ship.vSystemList) do
		if system.bBreached then
			systemsUnbreached = false
			break
		end
	end
	
	return (isShipStable(ship) and systemsUnbreached)
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
		print()
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

script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(ship)
    local gui = Hyperspace.Global.GetInstance():GetCApp().gui
	local inSafeEnviroment = (gui.upgradeButton.bActive and not gui.event_pause)
    
    if ship:HasSystem(13) and inSafeEnviroment and isShipStable(ship) then --13 is clonebay
        ship.cloneSystem.fTimeToClone = ship.cloneSystem.fTimeGoal
    end
    if inSafeEnviroment and isShipSuperStable(ship) then
        local maxHealAmount, maxTrueHealAmount = getMaxHealer(ship)
		local droneSystemPowered = (ship:HasSystem(4) and ship:GetSystem(4):GetEffectivePower() > 0)
		for crew in vter(ship.vCrewList) do
			local healSpeed, _ = crew.extend:CalculateStat(Hyperspace.CrewStat.HEAL_SPEED_MULTIPLIER)
			if ((((maxHealAmount * healSpeed) + maxTrueHealAmount + getCrewDecay(crew)) > 0
			and (((not crew.bSuffocating) and ship:GetOxygenPercentage() >= 70) or crewCanSurviveNoOxygen(crew)))
			or (droneSystemPowered and crew:IsDrone()))
			and ((currentHealers.size > 1
			and (getCrewDecay(crew) == 0 or (currentHealers[ship:GetSystem(5)] and currentHealers[ship:GetSystem(5)] > math.abs(getCrewDecay(crew)))
			or not currentHealers[crew])) or not currentHealers[crew])
			and not crew.extend.deathTimer then
				--[[
				if crew.health.first ~= crew.health.second then
					for source, value in pairs(currentHealers) do
						print(source, value)
					end
				end
				]]
				crew:DirectModifyHealth(999)
			end
		end
    end
end)