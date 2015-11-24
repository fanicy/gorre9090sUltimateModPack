--Functions
function fireArty(arty,target,distance,missile)
	local atr = getArtyAtr(arty.name)
	local mspeed = missileSpeed(missile)
	--Scatter
	if atr.scatter then 
		scatterrange=atr.scatterrange
		if distance >= 100 then
			if distance >= 300 then
				scatterrange = atr.scatterrange*1.9
			else 
				scatterrange = atr.scatterrange*(1+distance*0.003)
			end
		end
		local angleS = math.random()*(math.pi*2)
		local distanceS = math.random()*(scatterrange*2)
		local xS = target.position.x + distanceS * math.sin(angleS)
		local yS = target.position.y + distanceS * math.cos(angleS)
		local newTarget=arty.surface.create_entity({name="sb-target", position = {xS, yS}, force = game.forces.enemy})
		arty.surface.create_entity({name=missile, target = newTarget, force = game.forces.player, position = arty.position, speed= mspeed})
		newTarget.destroy()
	else
		arty.surface.create_entity({name=missile, position = {x = arty.position.x, y = arty.position.y}, force = game.forces.player, target = target, speed= mspeed})
	end
	if atr.muzzle then
		arty.surface.create_entity({name="muzzle-flash", position = arty.position, force = game.forces.player, target = arty, speed= 0.01})
	end
	arty.surface.pollute(arty.position,atr.pollution)
end

function pullAggro(arty,targetpos)
	--units = game.findenemyunits(targetpos, 15)
	units = arty.surface.find_enemy_units(targetpos, 15)
	for _, unit in pairs(units) do
			unit.set_command({type=defines.command.attack, target=arty, distraction=defines.distraction.bydamage })
	end
end

--Artillery
function processArty(artyList)
	
	local arty=artyList[1]
	local artyi=artyList[2]
	
	local inventory = artyi.get_inventory(1)
	local inventoryContent = inventory.get_contents()
	local rocketTyp
	local ammo = 0
	local enemys
	local spawner
	local atr=getArtyAtr(arty.name)
	local target
	local checkUnits=false
	
	if inventoryContent ~= nil then
		for n,a in pairs(inventoryContent) do
			rocketTyp=n
			ammo=a
		end
	end
	
	if ammo > 0 then	
		if arty.name == "sb-artillery-mk1" then
			enemys = arty.surface.find_enemy_units(arty.position, atr.maxrange)
			checkUnits=true
		end
		if atr.autofire then
			spawner = arty.surface.find_entities_filtered({area = {{x = arty.position.x - atr.maxrange, y = arty.position.y - atr.maxrange}, {x = arty.position.x + atr.maxrange, y = arty.position.y + atr.maxrange}}, type = "unit-spawner"})
			--CheckUnits
			if checkUnits and #enemys > 0 then
				for _,enemy in pairs(enemys) do
					local distance = math.sqrt(((arty.position.x - enemy.position.x)^2) +((arty.position.y - enemy.position.y)^2) )
					if (distance > atr.minrange) then
						if target == nil then
							target={enemy,distance}
						else
							if target[2] > distance then
								target[1]=enemy
								target[2]=distance
							end
						end
					end
				end
			end
			--CheckSpawners
			if #spawner > 0 and target == nil then
				for _,enemy in pairs(spawner) do
					local distance = math.sqrt(((arty.position.x - enemy.position.x)^2) +((arty.position.y - enemy.position.y)^2) )
					if (distance > atr.minrange) then
						if target == nil then
							target={enemy,distance}
						else
							if target[2] > distance then
								target[1]=enemy
								target[2]=distance
							end
						end
					end
				end
			end
		else
			marks = {}
			if global.listTarget ~= nil then
				marks = global.listTarget
			end
			--Check Marks
			if #marks > 0 then
				for k,enemy in pairs(marks) do
					if enemy.valid == false then
						table.remove(global.listTarget, k)
						if #global.listArty == 0 then
							global.listTarget = nil
						end
						break
					end
					local distance = math.sqrt(((arty.position.x - enemy.position.x)^2) +((arty.position.y - enemy.position.y)^2) )
					if (distance > atr.minrange) then
						if target == nil then
							target={enemy,distance}
						else
							if target[2] > distance then
								target[1]=enemy
								target[2]=distance
							end
						end
					end
				end
			end
		end
		--Attack!?
		if target ~= nil then
			fireArty(arty,target[1],target[2],rocketTyp)
			--Aggro!?
			if atr.aggro then
				pullAggro(artyi,target[1].position)
			end
			--reduce Ammo
			ammo = ammo-1
			inventory.clear()
			if ammo > 0 then
				inventory.insert({name = rocketTyp, count = ammo})
			end
			--Cooldown
			artyList[3]=atr.cooldown
		end
	end
end