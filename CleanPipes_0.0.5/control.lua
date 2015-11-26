require "defines"

script.on_event(defines.events, function(event)
	if event.createdentity.name == "cleanpipe-p" then
		PipePPlaced(event.createdentity)
	elseif event.createdentity.name == "cleanpipe-p2" then
		PipeP2Placed(event.createdentity)
	end
end)

local directionToNSEW = {[0] = "n",
						 [2] = "e",
						 [4] = "s",
						 [6] = "w"}
local directionToOffset = {[0] = {x =  0, y = -1},
						   [2] = {x =  1, y =  0},
						   [4] = {x =  0, y =  1},
						   [6] = {x = -1, y =  0}}
local invertedNSEW = {["n"] = "s",
					  ["s"] = "n",
					  ["e"] = "w",
					  ["w"] = "e"}
local invertedDirection = {[0] = 4, [2] = 6, [4] = 0, [6] = 2}
					  
function ScanAndReplace(_Position, _Direction)
	local scanPos = {x = _Position.x + directionToOffset[_Direction].x, y = _Position.y + directionToOffset[_Direction].y}
	local scanArea = {{scanPos.x - 0.25, scanPos.y - 0.25}, {scanPos.x + 0.25, scanPos.y + 0.25}}
	
	local scan = game.findentitiesfiltered{type = "pipe", area = scanArea}
	
	if #scan > 1 then
		game.player.print("ERORR: CleanPipes: Found more than 1 pipe on specified location.")
	end
	
	if #scan > 0 then
		if string.sub(scan[1].name, 0, 9) == "cleanpipe" then
			local pipe = scan[1]
			
			local n = string.find(string.sub(pipe.name, 10), "n") or invertedNSEW[directionToNSEW[_Direction]] == "n"
			local s = string.find(string.sub(pipe.name, 10), "s") or invertedNSEW[directionToNSEW[_Direction]] == "s"
			local e = string.find(string.sub(pipe.name, 10), "e") or invertedNSEW[directionToNSEW[_Direction]] == "e"
			local w = string.find(string.sub(pipe.name, 10), "w") or invertedNSEW[directionToNSEW[_Direction]] == "w"
			
			
			
			local newPipeName
			if string.find(string.sub(pipe.name, 10), "2") then
				newPipeName = "cleanpipe-2"
			else
				newPipeName = "cleanpipe-"
			end
			
			if n then newPipeName = newPipeName .. "n" end
			if s then newPipeName = newPipeName .. "s" end
			if e then newPipeName = newPipeName .. "e" end
			if w then newPipeName = newPipeName .. "w" end
			
			-- Replace the old piece of pipe with the correct new one.
			local pipePos = pipe.position
			pipe.destroy()
			game.createentity{position=pipePos, name=newPipeName, force = game.forces.player}
		end
	end
end

function PipePPlaced(_Entity)
	ScanAndReplace(_Entity.position, _Entity.direction)
	
	-- Replace the placed pipe with the appropriate end piece.
	local pipePPos = _Entity.position
	local pipePDir = _Entity.direction
	_Entity.destroy()
	game.createentity{position=pipePPos, name="cleanpipe-" .. directionToNSEW[pipePDir], force = game.forces.player}
end


function PipeP2Placed(_Entity)	
	ScanAndReplace(_Entity.position, _Entity.direction)
	ScanAndReplace(_Entity.position, invertedDirection[_Entity.direction])
	
	
	local newPipeName = "cleanpipe-2"
	if _Entity.direction == 0 or _Entity.direction == 4 then
		newPipeName = newPipeName .. "ns"
	else
		newPipeName = newPipeName .. "ew"
	end
	
	local pipePPos = _Entity.position
	local pipePDir = _Entity.direction
	_Entity.destroy()
	game.createentity{position=pipePPos, name=newPipeName, force = game.forces.player}
end