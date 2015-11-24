require "defines"
require "terraformers"

debug = false
single_player = nil

-----------------------------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------------------------
-- List of terraformer entity names
is_terraformer = {}
is_terraformer["bridge-builder"] = 1
is_terraformer["moat-digger"] = 2
is_terraformer["draw-bridge"] = 3
is_terraformer["rail-bridge"] = 4
-- List of tile names considered to be water
is_water_tile = {}
is_water_tile["water"] = 1
is_water_tile["deepwater"] = 1
is_water_tile["water-green"] = 1
is_water_tile["deepwater-green"] = 1
-- Map recipe name to the tile to be placed
tile_for_recipe = {}
tile_for_recipe["ford"] = "grass"
tile_for_recipe["stone-bridge"] = "stone-path"
tile_for_recipe["concrete-bridge"] = "concrete"
tile_for_recipe["moat"] = "water"
tile_for_recipe["stone-moat"] = "water"
tile_for_recipe["concrete-moat"] = "water"
tile_for_recipe["stone-moat-edge"] = "stone-path"
tile_for_recipe["concrete-moat-edge"] = "concrete"
tile_for_recipe["draw-bridge"] = "concrete"
-- Position adjustment for moving in [direction]
shift_delta = {}
shift_delta[defines.direction.north] = {x=0, y=-1}
shift_delta[defines.direction.south] = {x=0, y=1}
shift_delta[defines.direction.east]  = {x=1, y=0}
shift_delta[defines.direction.west]  = {x=-1, y=0}
-- Convert direction to the reverse direction
reverse = {}
reverse[defines.direction.north] = defines.direction.south
reverse[defines.direction.south] = defines.direction.north
reverse[defines.direction.east]  = defines.direction.west
reverse[defines.direction.west]  = defines.direction.east
-- Workface of terraformer given [size] returns table of position adjustments from entity position
workface = {}
workface[1] = {}
workface[1][defines.direction.north] = {{x=0,y=-2}}
workface[1][defines.direction.south] = {{x=0,y=2}}
workface[1][defines.direction.east ] = {{x=2,y=0}}
workface[1][defines.direction.west ] = {{x=-2,y=0}}
workface[2] = {}
workface[3] = {}
workface[3][defines.direction.north] = {{x=-1,y=-2}, {x=0,y=-2}, {x=1,y=-2}}
workface[3][defines.direction.south] = {{x=-1,y=2}, {x=0,y=2}, {x=1,y=2}}
workface[3][defines.direction.east ] = {{x=2,y=-1}, {x=2,y=0}, {x=2,y=1}}
workface[3][defines.direction.west ] = {{x=-2,y=-1}, {x=-2,y=0}, {x=-2,y=1}}
workface[4] = {}
workface[5] = {}
workface[5][defines.direction.north] = {{x=-2,y=-2}, {x=-1,y=-2}, {x=0,y=-2}, {x=1,y=-2}, {x=2,y=-2}}
workface[5][defines.direction.south] = {{x=-2,y=2}, {x=-1,y=2}, {x=0,y=2}, {x=1,y=2}, {x=2,y=2}}
workface[5][defines.direction.east ] = {{x=2,y=-2},{x=2,y=-1}, {x=2,y=0}, {x=2,y=1}, {x=2,y=2}}
workface[5][defines.direction.west ] = {{x=-2,y=-2}, {x=-2,y=-1}, {x=-2,y=0}, {x=-2,y=1}, {x=-2,y=2}}
-- Dig failure messages based on entity type at the dig location
digmsg_type = {}
digmsg_type["player"] = "msg-dig-player"
digmsg_type["unit"] = "msg-dig-enemy"
digmsg_type["unit-spawner"] = "msg-dig-enemy"
digmsg_type["resource"] = "msg-dig-resource"
-- Collision detect based on entity type: 1=ignore, 2=destroy
collide_type = {}
collide_type["resource"] = 1
collide_type["player"] = 1
collide_type["unit"] = 1
collide_type["decorative"] = 1
collide_type["corpse"] = 1
collide_type["particle"] = 1
collide_type["smoke"] = 1
collide_type["entity-ghost"] = 1
collide_type["simple-entity"] = 2
collide_type["tree"] = 2

 --[[
 TODO
 - fix DRY GRASS with moat builder
 - fix bridge graphic
 - get 1x1 or 2x2 working
 - redo all the graphics
 - extensions:: add paver????  tree harvester?? / rock clearer?????
 --]]

script.on_init(function()
	-- Reload recipes and tech when mod is added to a game
	for i, player in ipairs(game.players) do player.force.reset_recipes() end
	for i, player in ipairs(game.players) do player.force.reset_technologies() end
	initialise_tf()
	set_handlers()
end)
 
script.on_load(function()
	-- WARNING: THIS RUNS AFTER AUTO-SAVE
	-- DEBUG ONLY: reload recipes and tech after each load
	if debug then
		for i, player in ipairs(game.players) do player.force.reset_recipes() end
		for i, player in ipairs(game.players) do player.force.reset_technologies() end
	end
	--dbgit("Terraformers loading ...", tf);
	reload_tf()
	set_handlers()
end)

function set_handlers()
	-- Main event handlers (excluding tick)
	--dbgit("HANDLERS ACTIVATED!", tf)
	script.on_event(defines.events.on_built_entity, build_entity_handler)
	script.on_event(defines.events.on_robot_built_entity, build_entity_handler)
	script.on_event(defines.events.on_preplayer_mined_item, pre_mined_handler)
	script.on_event(defines.events.on_robot_pre_mined, pre_mined_handler)
	script.on_event(defines.events.on_player_rotated_entity, rotation_handler)
	script.on_event(defines.events.on_entity_died, death_handler)
end

function build_entity_handler(event)
	local e = event.created_entity
	if e == nil or not is_terraformer[e.name] then return end
	--dbg_lv("BUILD_ENTITY", e.name); dbg_lv("player", event.player_index); dbg_print();
	-- Player is nil if built by a robot!!
	local tf = register_tf(e, event.player_index)
	if e.name == "bridge-builder" then
		local r = range_to_water(tf, 3)
		if r == nil then
			talk (tf, "msg-no-water")
			deactivate_tf(e)
		elseif r > 0 then
			talk (tf, "msg-water-over-there")
		end
	elseif e.name == "moat-digger" then
		if not check_diglocation(tf, true) then
			deactivate_tf(e) -- message already displayed by check_diglocation
		end
	elseif e.name == "draw-bridge" then
		if not next_to_water(tf) then
			talk (tf, "msg-beside-water")
			deactivate_tf(e)
		end
	elseif e.name == "rail-bridge" then
		deactivate_tf(e) -- deactivate terraformer so it isn't counted towards ticking
		local i = build_rail_bridge(tf)
		if i == nil then
			talk (tf, "msg-rail-water")
		elseif i == false then
			talk (tf, "msg-rail-already")
			tf.entity.active = true	-- activate the entity so it works but without counting it towards ticking
		else
			tf.entity.active = true	-- activate the entity so it works but without counting it towards ticking
		end
	end
end
 
function pre_mined_handler(event)
	--dbgit("PRE_MINE_ENTITY");
	local e = event.entity
	if e ~= nil and is_terraformer[e.name] then
		local tf = get_tf(e)
		if e.name == "draw-bridge" then
			if tf.down then
				raise_drawbridge(tf);
			end
		elseif e.name == "rail-bridge" then
			tf.entity.active = false	-- deactivate the entity before deregister so it isn't counted as ticking
			destroy_rail_bridge(tf);
		end
		deregister_tf(e)
	end
end

function death_handler(event)
	--dbgit("DEATH!!");
	pre_mined_handler(event)
end

function rotation_handler(event)
	local e = event.entity
	if e ~= nil and is_terraformer[e.name] then
		-- don't care if you rotate the bridge-builder or draw-bridge
		-- rotation disabled for the rail-bridge
		if e.name == "moat-digger" then
			local tf = get_tf(e)
			local r = range_to_land(tf, 1)
			--dbg_lv("Rotated moat digger", e.direction); dbg_lv("range to land", r); dbg_print();
			if r == nil then
				deactivate_tf(e)
			elseif not check_diglocation(tf, true) then
				deactivate_tf(e) -- message already displayed by check_diglocation
			elseif not e.active then
				talk (tf, "msg-moat-restart")
				activate_tf(e)
			end
		end
	end
end

function process_tick(event)
	--dbg("Tick"); dbg_lv("active", global.active_tf); dbg_print();
	if global.terraformers ~= nil then
		for i, tf in pairs(global.terraformers) do
			local e = tf.entity
			if e.valid and tf.type == "rail-bridge" then
				-- no tick required for rail bridge, it is all done at build/mine stage
			elseif e.valid and tf.type == "draw-bridge" then
				--dbg_lv("is_opened",e.is_opened()); dbg_lv("is_closed",e.is_closed()); dbg_print(tf);
				if e.is_opened() and not tf.down then
					lower_drawbridge(tf);
				elseif e.is_closed() and tf.down then
					raise_drawbridge(tf);
				end
			elseif e.valid then
				local inv = e.get_output_inventory()
				if inv and not inv.is_empty() then
					if tf.type == "bridge-builder" then
						--dbg("place-a-bridge"); dbg_print()
						e.active = false; e.operable = false -- deactivate it to stop anyone playing with it before it moves
						inv.clear()
						tf = build_bridge(tf);
					elseif tf.type == "moat-digger" then
						-- need to check for the specific recipe output if leaving empty barrels behind as outputs too
						for i, v in pairs(inv.get_contents()) do 
							if tile_for_recipe[i] ~= nil then 
								--dbg("dig-a-moat"); dbg_print()
								e.active = false; e.operable = false -- deactivate it to stop anyone playing with it before it moves
								tf = dig_moat(tf);
								break
							end
						end
					end
				end
			end
		end
	end
end

function build_bridge (tf)
	local e = tf.entity
	local pos = e.position
	local dir = e.direction
	-- currently 3x3 and pos is centre.
	local r = e.recipe
	local t = tile_for_recipe[r.name];
	local s = game.get_surface(tf.surface)
	-- Factorio starts crafting the stack_size+1 product immediately in the hope that there will be room. It doesn't stop & wait until the crafting is finished.
	-- This means that it has unfairly consumed one product worth of the ingredients extra, so pass the ingredients through to move_entity to reload them.
	local ingredients = (e.is_crafting() and r.ingredients) or nil 
	local face = workface[3][dir]
	--dbg_tbl("Face", face); dbg_print(tf);
	for _, delta in ipairs(face) do
		local p = addpos(pos, delta)
		if is_water(tf, p) then
			--dbg_lv("Build bridge type", t); dbg_pos("at", p); dbg_print();
			s.set_tiles{{name = t, position = p}}
		end
	end
	e = move_entity(e, shift_delta[dir], ingredients) -- warning: destroys and recreates entity
	tf.entity = e;
	local r = range_to_water(tf, 3)
	if r == nil or r > 1 then
		talk (tf, "msg-bridge-done")
		deactivate_tf(e)
	end
	return tf
end

function dig_moat(tf)
	local e = tf.entity
	local dir = e.direction
	local movedir = reverse[dir]
	-- currently 3x3 and pos is centre, face is only 1 though.
	local s = game.get_surface(tf.surface)
	local r = e.recipe
	local t = tile_for_recipe[r.name];
	local te = tile_for_recipe[r.name.."-edge"];
	-- Factorio starts crafting the stack_size+1 product immediately in the hope that there will be room. It doesn't stop & wait until the crafting time is finished.
	-- This means that it has unfairly consumed one product worth of the ingredients extra, so pass the ingredients through to move_entity to reload them.
	local ingredients = (e.is_crafting() and r.ingredients) or nil 
	local face = workface[1][dir]

	-- Check out if there is a collision that would stop us moving the digger
	local collides = check_collision(tf, 3)
	-- Final check on dig location before we destroy it
	if not check_diglocation(tf, false) then
		deactivate_tf(e) -- message already displayed by check_diglocation
		return
	end
	
	-- Build a list of tiles to be set. 
	-- Factorio automatically extends the land if the spot 2-away from water becomes water.
	-- So we have to do them both at the same time!! But the 2-away is under the digger and
	-- we have to move the digger first (assuming it doesn't collide with something)
	-- Allow for water/land/land/water at the main workface too, by converting the extra land tiles.
	local doublemoat = (range_to_water(tf, 1) == 2)
	--dbg_lv("range2water", range_to_water(tf, 1)); dbg_print(tf);
	local pos = addpos(e.position, face[1])
	local doubleshift = shift_delta[movedir]
	local tiles = facing_moat_tiles(tf, t) -- all tiles at the workface that need to be turned to water
	if doublemoat then
		append_tiles(tiles, t, addpos(pos,doubleshift))
	end
	-- Pave around the edges if required by the recipe
	if te then
		for dx = -1, 1, 1 do for dy = -1, 1, 1 do
			local p = addpos(pos, {x=dx, y=dy})
			if not is_water(tf, p) and not (s.get_tile(p.x, p.y).name == te) then
				append_tiles(tiles, te, p)
			end
		end end
		if doublemoat then
			for _, delta in ipairs(workface[3][movedir]) do
				local p = addpos(pos, delta)
				if not is_water(tf, p) and not (s.get_tile(p.x, p.y).name == te) then
					append_tiles(tiles, te, p)
				end
			end
		end
	else
		fix_dry_grass(tf, 3, tiles)
	end
	--dbg_pos("Dig at", pos); dbg_lv("Double", doublemoat); dbg_lv("Edge", te); dbg_print();
	--dbg_tbl("tiles", tiles); dbg_print();
	if not doublemoat then
		s.set_tiles(tiles)
	end
	if not collides then
		e = move_entity(e, shift_delta[movedir], ingredients) -- warning: destroys and recreates entity
		tf.entity = e;
	else
		-- Dispose of the output recipe to stop it reactivating!
		local outinv = e.get_output_inventory()
		for i, v in pairs(outinv.get_contents()) do
			if tile_for_recipe[i] ~= nil then
				--dbg_lv("dispose outinv i", i); dbg_lv("v",v); dbg_print(tf);
				outinv.remove {name=i, count=v}
			end
		end
	end
	if doublemoat and not collides then
		s.set_tiles(tiles)
	end
	if collides then
		talk (tf, "msg-moat-collision")
		deactivate_tf(e)
	else
		local r = range_to_water(tf, 1)
		--dbg_pos("moved to", e.position); dbg_lv("range to water", r); dbg_print();
		if r == 0 then
			talk (tf, "msg-moat-done")
			deactivate_tf(e)
		elseif not check_diglocation(tf, false) then
			deactivate_tf(e) -- message already displayed by check_diglocation
		end
	end
	return tf
end

function facing_moat_tiles(tf, t) -- returns table of positions to set to water
	local e = tf.entity
	local pos = e.position
	local dir = e.direction
	-- currently 3x3 and pos is centre, but need to extend face out each side to check water.
	local face = workface[5][dir]
	local pos_to_set = {}
	-- always set the centre of the workface
	-- then check left & right for water/land/land or visa-versa
	append_tiles(pos_to_set, t, addpos(pos,face[3]))
	if not is_water(tf,addpos(pos,face[3])) then
		if not is_water(tf,addpos(pos,face[2])) and is_water(tf,addpos(pos,face[1])) then
			append_tiles(pos_to_set, t, addpos(pos,face[2]))
		end
		if not is_water(tf,addpos(pos,face[4])) and is_water(tf,addpos(pos,face[5])) then
			append_tiles(pos_to_set, t, addpos(pos,face[4]))
		end
	end
	--dbg_tbl("P2S", pos_to_set); dbg_print(tf);
	return pos_to_set
end

-- Handle terrain like dry grass by forcing it to grass as we near water.
-- Otherwise Factorio wants to maintain a minimum of water/grass/grass-dry/grass-dry/grass/water
-- and will extend the land into any water we are nearing.
function fix_dry_grass(tf, facewidth, tiles) -- update tiles with grass-dry tiles to be changed
	local e = tf.entity
	local dir = e.direction
	local movedir = reverse[dir]
	local pos = addpos(e.position, shift_delta[movedir]); -- skip the main workface
	local face = workface[facewidth][dir]
	local s = game.get_surface(tf.surface)
	local dx = shift_delta[movedir].x
	local dy = shift_delta[movedir].y
	local dry = nil
	--dbg_tbl("FixDryGrass: Face", face); dbg_pos("EPos", e.position); dbg_pos("Start", pos); dbg_lv("dx", dx, "dy", dy); dbg_print(tf);
	for _, delta in ipairs(face) do
		local p = addpos(pos, delta)
		--dbg_pos("At", p); dbg_lv("t1", s.get_tile(p.x, p.y).name, "t2", s.get_tile(p.x+dx, p.y+dy).name, "t3", s.get_tile(p.x+2*dx, p.y+2*dy).name); dbg_print(tf);
		if s.get_tile(p.x, p.y).name == "grass-dry" and s.get_tile(p.x+dx, p.y+dy).name == "grass-dry" and s.get_tile(p.x+2*dx, p.y+2*dy).name ~= "grass-dry" then
			append_tiles (tiles, "grass", p)
			append_tiles (tiles, "grass", addpos(p, shift_delta[movedir]))
			--dbg_pos("fix dry grass!",p); dbg_pos("and",addpos(p, shift_delta[movedir])); dbg_print(tf);
		end
	end
	--dbg_tbl("tiles", tiles); dbg_print(tf);
end

function check_diglocation (tf, initial_place)
	local e = tf.entity
	local face = workface[1][e.direction]
	local checkpos = addpos(e.position, face[1])
	local s = game.get_surface(tf.surface)
	local ent = s.find_entities({addpos(checkpos,{x=-0.5,y=-0.5}), addpos(checkpos,{x=0.5,y=0.5})})
	local msg = nil
	local res = nil
	
	--dbg_pos("Digger @pos", e.position); dbg_pos("digpos", checkpos); dbg_print(tf);
	--dbg_pos("Ents in", addpos(checkpos,{x=-0.5,y=-0.5})); dbg_pos("to", addpos(checkpos,{x=0.5,y=0.5})); dbg_print(tf);
	if initial_place then tf.eat_resource = nil end
	for i, v in pairs(ent) do
		if initial_place and v.type == "resource" then
			res = v.name
		elseif tf.eat_resource and tf.eat_resource == v.name then
			-- OK, allowed to eat this resource
		else
			msg = digmsg_type[v.type]
		end
		if not msg and not v.has_flag("not-on-map") then
			if not v.destructible then
				msg = "msg-dig-indestructible"
			elseif v.force.name == "player" or v.has_flag("player-creation") then
				msg = "msg-dig-isyours"
			elseif v.force.name ~= "neutral" then
				msg = "msg-dig-notyours"
			end
		end
		--dbg_lv(i, v.name); dbg_lv("type", v.type); dbg_lv("force", v.force.name); dbg_lv("destructible", v.destructible); dbg_lv("minable", v.minable); dbg_print(tf);
		if msg then
			talk (tf, msg)
			return false
		end
	end
	if res then
		tf.eat_resource = res
		talk (tf, "msg-dig-thru-resource", game.get_localised_entity_name(res))
	end
	return true
end

function check_collision (tf, width)
	local e = tf.entity
	local s = game.get_surface(tf.surface)
	local face = workface[3][reverse[e.direction]]
	
	for _, deltaf in ipairs(face) do
		local checkpos = addpos(e.position, deltaf)
		local ent = s.find_entities({addpos(checkpos,{x=-0.5,y=-0.5}), addpos(checkpos,{x=0.5,y=0.5})})
		--dbg_pos("Digger @pos", e.position); dbg_pos("collidepos", checkpos); dbg_print(tf);
		--dbg_pos("Ents in", addpos(checkpos,{x=-0.5,y=-0.5})); dbg_pos("to", addpos(checkpos,{x=0.5,y=0.5})); dbg_print(tf);
		for i, v in pairs(ent) do
			--dbg_lv(i, v.name); dbg_pos("pos",v.position); dbg_lv("notonmap", v.has_flag("not-on-map")); dbg_lv("type", v.type); dbg_lv("force", v.force.name); dbg_lv("destructible", v.destructible); dbg_lv("minable", v.minable); dbg_print(tf);
			-- Ignore small/medium electric poles as a special treat!
			-- Don't check not-on-map flag until later as it is set for a big rock for some reason
			if v.name ~= "small-electric-pole" and v.name ~= "medium-electric-pole" then
				local ct = collide_type[v.type] -- 1 means ignore, 2 means destroy, else it collides
				--dbg_lv("collision type", ct); dbg_print();
				if ct == nil and not v.has_flag("not-on-map") then
					dbg("Collision"); dbg_lv(i, v.name); dbg_pos("pos",v.position); dbg_lv("notonmap", v.has_flag("not-on-map")); dbg_lv("type", v.type); dbg_lv("force", v.force.name); dbg_lv("destructible", v.destructible); dbg_lv("minable", v.minable); dbg_print(tf);
					return true
				elseif ct == 2 then
					v.destroy()
				end
			end
		end
	end
	return false
end

function lower_drawbridge(tf)
	local pos = tf.entity.position
	local s = game.get_surface(tf.surface)
	local t = tile_for_recipe[tf.entity.name]
	local bridges = {}
	for delta = -1, 1, 2 do for _, dp in ipairs({{x=delta, y=0}, {x=0, y=delta}}) do
		local p = addpos(pos, dp)
		if is_water(tf, p) then
			table.insert(bridges, p)
			--dbg_lv("lower",t); dbg_pos("at", p); dbg_print(tf);
			s.set_tiles{{name = t, position = p}}
		end
	end end
	tf.down = true
	tf.bridges = bridges
	--dbg_tbl("created bridges", bridges); dbg_print(tf);
end

function raise_drawbridge(tf)
	local pos = tf.entity.position
	local s = game.get_surface(tf.surface)
	for _, p in ipairs(tf.bridges) do
		s.set_tiles({{name="water", position=p}})
	end 
	tf.down = false
	tf.bridges = nil
end

function build_rail_bridge(tf) -- return true if successful, false if a bridge is already here, or nil if location is invalid
	local e = tf.entity
	local s = game.get_surface(tf.surface)
	local pos = e.position
	local rpos = {x=(pos.x - pos.x%2),y=(pos.y - pos.y%2)}
	local force = (tf.player and game.get_player(tf.player).force or game.forces.player)
	--dbg_pos("check_rail: pos",pos); dbg_pos("rpos",rpos); dbg_lv("dir", e.direction); dbg_print(tf);
	--dbg_lv("0,0",s.get_tile(rpos.x, rpos.y).name); dbg_lv("0,1",s.get_tile(rpos.x, rpos.y+1).name); dbg_lv("1,0",s.get_tile(rpos.x+1, rpos.y).name); dbg_lv("1,1",s.get_tile(rpos.x+1, rpos.y+1).name); dbg_print(tf);
	local bridgedir = nil
	if e.direction == defines.direction.north or e.direction == defines.direction.south then
		local px = (math.floor(pos.x) == rpos.x) and rpos.x+1 or rpos.x
		--dbg_lv("px", px); dbg_print(tf);
		if is_water(tf, {x=px, y=rpos.y}) or is_water(tf, {x=px, y=rpos.y+1}) then
			bridgedir = defines.direction.east
		end
	else
		local py = (math.floor(pos.y) == rpos.y) and rpos.y+1 or rpos.y
		--dbg_lv("py", py); dbg_print(tf);
		if is_water(tf, {x=rpos.x,y=py}) or is_water(tf, {x=rpos.x+1,y=py}) then
			bridgedir = defines.direction.north
		end
	end
	if bridgedir then
		e.rotatable = false
		tf.rail = s.create_entity{name = "straight-rail", position = rpos, direction=bridgedir, force = force}
		if tf.rail then
			tf.rail.minable = false
			return true
		else
			return false
		end
	end
	return nil
end

function destroy_rail_bridge(tf)
	--dbg_tbl("destroy", tf.rail); dbg_print(tf);
	if tf.rail and tf.rail.valid then
		tf.rail.destroy()
	end
end

function move_entity (e, delta, addrecipe)
	local name = e.name
	local pos = e.position
	local newpos = addpos(pos,delta)
	local force = e.force
	local r = e.recipe
	local dir = e.direction
	local fuel = e.get_inventory(defines.inventory.fuel).get_contents()
	local inv = e.get_inventory(defines.inventory.assembling_machine_input).get_contents()
	local modules = e.get_inventory(defines.inventory.assembling_machine_modules).get_contents()
	local outinv = e.get_inventory(defines.inventory.assembling_machine_output).get_contents()
	local energy = e.energy;
	--dbg("Move terraformer"); dbg_lv("Direction", dir); dbg_lv("Energy", energy); dbg_tbl("Fuel", fuel); dbg_tbl("Inventory", inv); dbg_tbl("Modules", modules); dbg_tbl("AddRecipe", addrecipe); dbg_print();
	e.destroy()
	--dbgit("DESTROY");
	e = game.get_surface("nauvis").create_entity{name = name, position = newpos, force = force, recipe = r.name}
	e.operable = false -- stop anyone playing with it until it is loaded
	e.direction = dir
	
	-- Put back in the fuel, inventory and modules it had when it was destroyed
	-- have to use the entity level insert to make them go in the right input spots, so block off the other inventories first
	-- then clear and load them properly after the input slots are done.
	local newmodules = e.get_inventory(defines.inventory.assembling_machine_modules)
	local newfuel = e.get_inventory(defines.inventory.fuel)
	newmodules.insert { name="speed-module", 2 }   -- has two module slots so fill both
	newfuel.insert { name="solid-fuel", count=50 } -- use a full stack to be sure nothing else goes in here
	for i, v in pairs(inv) do
		e.insert {name=i, count=v}
	end
	if addrecipe then
		for i, v in pairs(addrecipe) do
			if v.amount > 0 then
				e.insert {name=v.name, count=v.amount}
			end
		end
	end
	newmodules.clear()
	newfuel.clear()
	for i, v in pairs(modules) do
		newmodules.insert {name=i, count=v}
	end
	for i, v in pairs(fuel) do
		newfuel.insert {name=i, count=v}
	end
	-- Restore items in the output inventory ... but only if they are not the terraformer recipe itself.
	-- Only supports one output result (which must be first) and the terraformer recipe.
	local newout = e.get_output_inventory()
	for i, v in pairs(outinv) do
		--dbg_lv("outinv i", i); dbg_lv("v",v); dbg_print(tf);
		if tile_for_recipe[i] == nil then -- only keep if not the recipe
			newout.insert {name=i, count=v}
		end
	end
	--dbg_tbl("newoutinv", newout.get_contents()); dbg_print(tf);
	e.energy = energy;
	--dbg_lv("saved energy", energy); dbg_lv ("entity energy", e.energy); dbg_print(); -- Damn energy doesn't work properly for fuels!!
	--dbg("After Move"); dbg_lv("Direction", e.direction); dbg_lv("Energy", e.energy); dbg_tbl("Fuel", e.get_inventory(defines.inventory.fuel).get_contents()); dbg_tbl("Inventory", e.get_inventory(defines.inventory.assembling_machine_input).get_contents()); dbg_tbl("Modules", e.get_inventory(defines.inventory.assembling_machine_modules).get_contents());dbg_print();
	e.operable = true
	return e
end

function is_water(tf, pos)
	local n = game.get_surface(tf.surface).get_tile(pos.x, pos.y).name
	--dbg_pos("TileCheck",pos); dbg_lv("Name",n); dbg_lv("Lookup",is_water_tile[n]); dbg_print();
	return is_water_tile[n]
end

function range_to_water(tf, facewidth) -- returns range 0, 1, 2, 3, 4 or nil
	local e = tf.entity
	local pos = e.position
	local dir = e.direction
	local movedir = (e.name == "moat-digger") and reverse[dir] or dir
	-- currently 3x3 and pos is centre.
	local face = workface[facewidth][dir]
	local water = false
	--dbg_tbl("RangeToWater: Face", face); dbg_print(tf);
	for range = 0, 4, 1 do
		for _, delta in ipairs(face) do
			local p = addpos(pos, delta)
			--dbg_pos("Pos", pos); dbg_pos("Delta", delta); dbg_pos("At", p); dbg_lv("range", range, "is_water", is_water(tf, p), "tile", game.get_surface(tf.surface).get_tile(p.x, p.y).name); dbg_print(tf);
			water = water or is_water(tf, p)
		end
		if water then return range end
		pos = addpos(pos, shift_delta[movedir]);
	end
	return nil
end

function next_to_water(tf)
	local pos = tf.entity.position
	for delta = -1, 1, 2 do 
		if is_water(tf, addpos(pos, {x=delta, y=0})) or
		   is_water(tf, addpos(pos, {x=0, y=delta})) then
			return true
		end
	end
	return false
end

function range_to_land(tf, facewidth) -- returns range 0, 1, 2, 3 or nil
	local e = tf.entity
	local pos = e.position
	local dir = e.direction
	local face = workface[facewidth][dir]
	local land = false
	--dbg_tbl("RangeToLand: Face", face); dbg_print(tf);
	for range = 0, 3, 1 do
		for _, delta in ipairs(face) do
			local p = addpos(pos, delta)
			--dbg_pos("Delta", delta); dbg_lv("range", range, "is_water", is_water(tf, p)); dbg_print(tf);
			land = land or not is_water(tf, p)
		end
		if land then return range end
		pos = addpos(pos, shift_delta[reverse[dir]]);
	end
	return nil
end

--================================ UTILITY =====================================

function append_tiles(tiles, t, pos) -- returns true if appended or false if duplicate
	for _, tile in ipairs(tiles) do
		if tile.position.x == pos.x and tile.position.y == pos.y then
			return false
		end
	end
	table.insert(tiles, {name=t, position=pos})
	return true
end

function addpos (p1, p2)
	if p1 == nil then return p2 end
	if p2 == nil then return p1 end
	return ({x=(p1.x + p2.x), y=(p1.y + p2.y)})
end

function talk (tf, msg, ...)
	if single_player == nil then
		single_player = pcall(function() return game.player end)
		--dbg_lv("Single player detect", single_player); dbg_print(tf);
		--single_player = false
	end
	if single_player then
		--dbg_lv("talk single player", msg); dbg_print(tf);
		game.show_message_dialog{text={msg, ...}, point_to = {type = "entity", entity = tf.entity}}
		game.player.print({msg, ...});
	elseif tf and tf.player then
		local plyr = game.get_player(tf.player)
		--dbg_lv("talk to owner", msg); dbg_lv("plyr#", tf.player); dbg_lv("plyr", plyr); dbg_print(tf);
		if plyr then
			plyr.print({msg, ...})
		end
	else
		--dbg_lv("talk to all", msg); dbg_print(tf);
		for _, plyr in pairs(game.players) do
			plyr.print({msg, ...})
		end
	end
end

--================================ DEBUG =====================================

function dbg_clear()
	global.dbg_msg = ""
end

function dbg(m)
	if not global.dbg_msg then global.dbg_msg = "" end
	global.dbg_msg = global.dbg_msg .. tostring(m) .. ". "
end

function dbg_tbl(l, t)
	if not global.dbg_msg then global.dbg_msg = "" end
	global.dbg_msg = global.dbg_msg .. tostring(l) .. ": " .. tostring(t) .. " {"
	if t then
		for i, v in pairs(t) do
			if type(v) == "table" then
				dbg_tbl(i, v)
			else
				global.dbg_msg = global.dbg_msg .. tostring(i) .."=".. tostring(v) .. ", "
			end
		end
	end
	global.dbg_msg = global.dbg_msg .. "}. "
end

function dbg_lv(label, value, ...)
	if not global.dbg_msg then global.dbg_msg = "" end
	global.dbg_msg = global.dbg_msg .. tostring(label) .."=".. tostring(value) .. ". "
	if select("#", ...) > 0 then
		dbg_lv(...);
	end
end

function dbg_pos(label, p)
	if not global.dbg_msg then global.dbg_msg = "" end
	if p == nil then return end
	assert(type(p) == "table")
	global.dbg_msg = global.dbg_msg .. tostring(label) .. "=(" .. tostring(p.x) .. "," .. tostring(p.y) .. "). "
end

function dbg_print(tf)
	if not global.dbg_msg then 
		global.dbg_msg = ""
	elseif global.dbg_msg > "" and debug then
		local player = (tf and tf.player) and game.get_player(tf.player) -- print to entity owner if known
		if player == nil then player = game.get_player("MudRaker") end
		if player == nil then player = game.get_player(1) end
		if player then 
			player.print(global.dbg_msg)
			dbg_clear()
		end
	end
end

function dbgit(m, tf)
	global.dbg_msg = m;
	dbg_print(tf);
end