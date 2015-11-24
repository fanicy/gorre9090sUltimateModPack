function init()
	if global.researchQ == nil then global.researchQ = {} end
	if global.labs == nil then global.labs = {} end
	for name, force in pairs(game.forces) do
		if global.researchQ[name] == nil then global.researchQ[name] = {} end
		if global.labs[name] == nil then global.labs[name] = find_labs(force) end
	end
	if global.showIcon == nil then global.showIcon = {} end
	if global.showResearched == nil then global.showResearched = {} end
	if global.offset_queue == nil then global.offset_queue = {} end
	if global.offset_tech == nil then global.offset_tech = {} end
	if global.showExtended == nil then global.showExtended = {} end
	if global.science == nil then global.science = {} end
	for name, item in pairs(game.item_prototypes) do
		if item.type == "tool" then
			global.science[name] = {}
		end
	end
	colspan = nil
	global.bobsmodules = {
		["module-case"] = true, 
		["module-circuit-board"] = true, 
		["speed-processor"] = true, 
		["effectivity-processor"] = true, 
		["productivity-processor"] = true, 
		["pollution-clean-processor"] = true, 
		["pollution-create-processor"] = true
		}
	if global.showBobsmodules == nil then global.showBobsmodules = {} end
	global.bobsaliens = {
		["alien-science-pack-blue"] = true, 
		["alien-science-pack-orange"] = true, 
		["alien-science-pack-purple"] = true, 
		["alien-science-pack-yellow"] = true, 
		["alien-science-pack-green"] = true, 
		["alien-science-pack-red"] = true
		}
	if global.showBobsaliens == nil then global.showBobsaliens = {} end
	
end

function player_init(player_index)
	if not game.players[player_index].gui.top.research_Q then game.players[player_index].gui.top.add{type = "button", name = "research_Q", caption = "Research queue", style = "rq-top-button"} end
	global.showIcon[player_index] = true
	global.showResearched[player_index] = false
	global.offset_queue[player_index] = 0
	global.offset_tech[player_index] = 0
	global.showExtended[player_index] = false
	for name, science in pairs(global.science) do
		if game.players[player_index].force.recipes[name] ~= nil then
		science[player_index] = game.players[player_index].force.recipes[name].enabled
		else science[player_index] = false
		end
	end
	global.showBobsmodules[player_index] = game.players[player_index].force.technologies["modules"].researched
	if game.players[player_index].force.technologies["alien-research"] then 
		global.showBobsaliens[player_index] = game.players[player_index].force.technologies["alien-research"].researched
	else
		global.showBobsaliens[player_index] = false
	end
end

function find_labs(force)
	local n = force.get_entity_count("lab")
	local count = 0
	local labs = {}
	local size = 0
	while count < n do
		size = size +32
		for _, surface in pairs(game.surfaces) do
			for k,v in pairs(surface.find_entities_filtered{area = {{-size, -size}, {size, size}}, type= "lab"}) do
				table.insert(labs,v)
			end
			count = count + surface.count_entities_filtered{area = {{-size, -size}, {size, size}}, type= "lab"}
		end
	end
	return labs
end