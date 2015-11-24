-- Functions to manage the terraformer registry & the on_tick hook

function initialise_tf ()
	if global.terraformers == nil then global.terraformers = {} end
	global.active_tf = 0
	--dbgit("Terraformers initialised")
end

function reload_tf ()
	--Globals are saved and restored, so the basic data is retained properly.
	--dbg_lv("RELOAD:", global.active_tf); dbg_tbl("tf", global.terraformers); dbg_print();
	if global.active_tf and global.active_tf >= 1 then
		--dbgit("RELOAD: activate on_tick", tf);
		game.on_event(defines.events.on_tick, process_tick)
	end
end

function register_tf (e, player)
	--dbg_lv("RegisterTf", e); dbg_lv("player", player); dbg_print();
	local tf = {entity=e, type=e.name, player=player, surface=(player and game.players[player].surface.name or "nauvis")}
	--dbg_lv("Terraformer", tf.type); dbg_pos("pos", e.position); dbg_lv("surface", tf.surface); dbg_lv("direction",e.direction); dbg_lv("rotatable",e.rotatable); dbg_print(tf);
	if global.terraformers == nil then initialise_tf() end
	table.insert(global.terraformers, tf)
	if e.active then
		e.active = false
		activate_tf(e);
	end
	return tf;
end

function get_tf (e)
	for i, tf in pairs(global.terraformers) do
		if e == tf.entity then
			return tf, i
		end
	end
	dbg_lv("***GETTF Failed:", e); dbg_tbl(global.terraformers); dbg_print();
	assert(false);
end

function activate_tf (e)
	local tf = get_tf(e);
	if not e.active then
		e.active = true;
		global.active_tf = global.active_tf + 1
		--dbg_tbl("Activating", tf); dbg_lv("active", global.active_tf); dbg_print(tf);
		if global.active_tf == 1 then
			--dbgit("activate on_tick", tf);
			game.on_event(defines.events.on_tick, process_tick)
		end
	end
end

function deactivate_tf (e)
	local tf = get_tf(e);
	if e.active then
		e.active = false
		global.active_tf = global.active_tf - 1
		--dbg_tbl("Deactivating", tf); dbg_lv("active", global.active_tf); dbg_print(tf);
		if global.active_tf <= 0 then
			--dbgit("Deactivate on_tick", tf);
			game.on_event(defines.events.on_tick, nil)
		end
	end
end

function deregister_tf (e)
	local tf, i = get_tf(e);
	if e.active then
		deactivate_tf (e)
	end
	table.remove(global.terraformers, i)
	--dbg_lv("Deregister", e); dbg_tbl("g.t", global.terraformers); dbg_print(tf);
end