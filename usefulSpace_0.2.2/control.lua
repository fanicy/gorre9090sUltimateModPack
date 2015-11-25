require "util"
require "defines"

script.on_init(function() On_Load() end)
script.on_load(function() On_Load() end)
script.on_event(defines.events.on_tick, function() On_Tick() end)

script.on_event(defines.events.on_built_entity, function(event) On_Built(event) end)
script.on_event(defines.events.on_robot_built_entity, function(event) On_Built(event) end)

script.on_event(defines.events.on_preplayer_mined_item, function(event) On_Removed(event) end)
script.on_event(defines.events.on_robot_pre_mined, function(event) On_Removed(event) end)
script.on_event(defines.events.on_entity_died, function(event) On_Removed(event) end)
--printout = game.players[1].print
--Values set at start..
--How to check which surface it is:
--if game.players[1].surface == game.surfaces["nauvis"] then game.players[1].print("yes") else game.players[1].print("no") end
--tickerA = 60
global.energyCreated = 0
modifier = 1.05
global.findRockets = 0
function message(mes)
  for i, player in ipairs(game.players) do
    player.print(mes)
  end
end

function On_Load()
    if not global.rockets_sent then
	  global.rockets_sent = 0
	end
  	if not global.energyReceivers then
	global.energyReceivers = {}
  end
end

function On_Tick()
    if (game.tick % 60) then
	if global.findRockets == 0 then
	global.energyCreated = global.rockets_sent * 100 * 60000 * modifier
	global.findRockets = 1
	  read_satellites_sent_from_gui(game.forces.player)
      message("Satelites already orbiting the planet was detected: "..global.rockets_sent)
    end
    --tickerA = 60
	addEnergy()
	--If you have sent up rockets before and want those to count as well then remove the -- infront of the line under
	--and then set the "number" to how many rockets you have sent up. Then load the game. Save. Exit. And then remove/add the "--"
	--back again
	--These two i mean:
	   -- global.rockets_sent = number
	   --global.energyCreated = global.rockets_sent * 100 * 60000 * modifier
    --^^^^^^
	else
	 --tickerA = tickerA - 1
	end
end

function On_Built(event)
  local ent = event.created_entity
  if ent.name == "energy-receiver" then
    global.energyReceivers[#global.energyReceivers+1] = ent
	message("New energy receiver connected. Remember it will spread the energy created evenly between all the receivers!")
  end
end

function On_Removed(event)
  local ent = event.entity
  if ent.name == "energy-receiver" then
    for receivers = 1, #global.energyReceivers do
	  if global.energyReceivers[receivers] == ent then
	   table.remove(global.energyReceivers, receivers) 
	  end
	end
  end
end

--Counting how many rockets that have been sent
script.on_event(defines.events.on_rocket_launched, function(event)
  local force = event.rocket.force
    if event.rocket.get_item_count("satellite") > 0 then
	  global.rockets_sent = global.rockets_sent + 1
      global.energyCreated = global.rockets_sent * 100 * 60000 * modifier
  	  message("Congratulation at sending up another satelite! ")
	  message("Number of satelites in operation: "..global.rockets_sent)
	  if global.rockets_sent/#global.energyReceivers > 10 then
	    message("To fully utilize the energy your rockets are creating. Please build atleast one more energy receiver. Thank you.")
	  end
	end
end)


--Find out how many satelites there are, and then how much energy to create
    --For simplicity i can choose to give each energy receiver 1/x amount of energy where x is number of receivers. This way its
--A little bit simpler. Though i would wish to at a later point to add in the functionality to place down an energyreceiver and then
--open a GUI and then you can specify how many satelites that should be connected to that one energy receiver. 
function addEnergy()
    for receiver = 1, #global.energyReceivers do
	if global.energyReceivers[receiver] ~= 1 or global.energyReceivers[receiver] ~= nil then
	  if global.energyCreated ~= 0 then
	    if global.energyReceivers[receiver] ~= nil then
	      global.energyReceivers[receiver].energy = global.energyCreated/#global.energyReceivers
		end
	  end
	end
	end
end
--Thank you Zwobot :D!
function read_satellites_sent_from_gui(force)
    --print("Reading #satellites from " .. force.name)
    for i, player in ipairs(game.players) do
        local rocket_score = player.gui.left.rocket_score
        if rocket_score then
             local rocket_count = rocket_score.rocket_count
			 global.rockets_sent = tonumber(rocket_count.caption)
            if rocket_count ~= nil then
                --message("FoundGUI: " .. tostring_ex(rocket_count.caption))
            end
        end
    end
end