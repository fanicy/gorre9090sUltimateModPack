local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD,DefS = defines.command,defines.distraction,defines.groupstate

local MaxDrones = 10
local DroneName = "attack-drone"

function OnCRPBuilt(entity)
	MoEntity.AddToLoop("croboport",entity,{G={},C=1})
end

function OnCRCCBuilt(entity)
	MoEntity.AddToLoop("commandposts",entity,{P={}})
end

MoEntity.SubscribeOnBuilt("combat-roboport-smart","combatroboport",OnCRPBuilt)
MoEntity.SubscribeOnBuilt("combat-drone-wagon","combatrobowagon",OnCRPBuilt)

MoEntity.SubscribeOnBuilt("combat-command-tower-smart","combatcommtower",OnCRCCBuilt)

function SpawnDrone(E,G)
	local Drones = E.getitemcount(DroneName)
	if Drones > 0 and not E.tobedeconstructed(E.force) then
		local V = game.findnoncollidingposition(DroneName, E.position, 10, 1)
		
		local Drone=game.createentity{name = DroneName, position=V}
		Drone.force=E.force
		MoEntity.AddToLoop("combatrobots",Drone,{NT=0})
		table.insert(G,RegKey(Drone))
		E.getinventory(1).remove({name=DroneName,count=1})
		return true
	else
		return false
	end
end

function StoreDrone(E,G)
	MoEntity.LoopThis(G,function(ent)
		local D = KTE(ent)
		if D==nil or not D.valid then return false end
		if E.caninsert({name=DroneName,count=1}) then
			if util.distance(D.position,E.position) < 5 then
				E.insert({name=DroneName,count=1})
				MoEntity.RemoveFromLoop("combatrobots",D)
				D.destroy()
				return false --We stored the drone, lets remove it from the table.
			end
		end
		return true
	end)	
end

function CommandDrones(G,V,C)
	MoEntity.LoopThis(G,function(ent)
		local D = KTE(ent)
		if D==nil or not D.valid then 
			MoEntity.RemoveFromLoop("combatrobots",D)
			return false 
		end
		local Dat = MoEntity.GetDataFromLoop("combatrobots",D)
		if Dat==nil then
			MoEntity.AddToLoop("combatrobots",D,{NT=0})
		else
			if Dat.extra.NT<=game.tick then
				local Distance = (util.distance(V,D.position)/10)
				Dat.extra.Dis = Distance
				Dat.extra.NT = game.tick+(Distance*60)
				D.setcommand(C)
			end
		end
		return true
	end)
end

function ProtectArea(P,E,V,R)
	local G = E.G

	local Scan = game.findnearestenemy{position=V, maxdistance=R}
	if Scan~=nil and Scan.valid then
		while #G < MaxDrones do 
			if not SpawnDrone(P,G) then break end 
		end
		CommandDrones(G,Scan.position,{type=DefC.attack,target=Scan,distraction=DefD.byenemy})
	else--Return to base nothing nearby for us to kill.
		CommandDrones(G,P.position,{type=DefC.gotolocation,destination=P.position,radius=10,distraction=DefD.byenemy})
		StoreDrone(P,G)
	end
end

function AssistPlayer(P,E,O)
	local G = E.G
	if E.C==nil then E.C = 1 else E.C=E.C+1 end
	
	while #G < MaxDrones do 
		if not SpawnDrone(P,G) then break end 
	end
	
	local Scan = game.findnearestenemy{position=O.position, maxdistance=20}
	if Scan~=nil and Scan.valid then
		if E.C > 6 then E.C=1
			CommandDrones(G,Scan.position,{type=DefC.attack,target=Scan,distraction=DefD.byenemy})
		end
	else
		if E.C > 4 then E.C=1	
			CommandDrones(G,P.position,{type=DefC.gotolocation,destination=O.position,radius=10,distraction=DefD.byenemy})
		end
	end
end

function GetOrders(P,E)
	local Rad = 40+(P.getitemcount("drone-orders-rangeboost")*10)
	if P.getitemcount("drone-orders-player") > 0 then
		--Find closest player, store inside table.
		E.P=game.player
		return "Player",Rad
	end
	return false,Rad
end

function ManageDrones(P,E,CP)
	local Orders,Radius = GetOrders(P,E)
	local Center = P
	
	
	if CP and CP.valid then
		Orders,Radius = GetOrders(CP,E)
		Center = CP
	end
	
	if Orders then
		if Orders == "Player" then
			if util.distance(Center.position,E.P.position) < Radius then
				AssistPlayer(P,E,E.P)
			else
				ProtectArea(P,E,Center.position,Radius)
			end
		end
	else
		ProtectArea(P,E,Center.position,Radius)
	end
end

function CommandPostFind(Key,entity,data)
	local Command=MoEntity.findentinsquareradius(entity.position,10,"combat-roboport-smart")
	MoEntity.LoopThis(Command,function(ent)
		local res = MoEntity.GetDataFromLoop("croboport",ent)
		
		if res==nil then return end
		if res.extra.CP and res.extra.CP.valid then return end
		
		res.extra.CP = Key
		data.P[res.entity] = res
	end)
end

--Lets Register into the MoToolBar :D
if remote.interfaces.MoToolBar and remote.interfaces.MoToolBar.addbutton then
	remote.call("MoToolBar", "addbutton","detectcr","Detect Combat Robotics","MoCombat","detectcombatrobot","MoCombat","Detect Combat Robotics Entitys")
end

ModInterface.detectcombatrobot = function()
	game.player.print("Detecting Combat Robotics!")
	MoEntity.LoopThis(MoEntity.findentinsquareradius(MoEntity.getplayerpos(),100,"combat-roboport-smart"),OnCRPBuilt)
	MoEntity.LoopThis(MoEntity.findentinsquareradius(MoEntity.getplayerpos(),100,"combat-drone-wagon"),OnCRPBuilt)	
	
	MoEntity.LoopThis(MoEntity.findentinsquareradius(MoEntity.getplayerpos(),100,"combat-command-tower-smart"),OnCRCCBuilt)
end

--This timer will manage all the combat robotics functions.
MoTimers.CreateTimer("Combat-RobotPorts",0.5,0,false,function()
	MoEntity.CallLoop("croboport",function(data)
		local DE = KTE(data.entity)
		if DE==nil or not DE.valid then return false end
		
		local E = data.extra
		if E.CP==nil or not KTE(E.CP).valid then
			ManageDrones(DE,E)
		end
		
		return true
	end)
	
	MoEntity.CallLoop("commandposts",function(data)
		local DE = KTE(data.entity)
		if DE==nil or not DE.valid then return false end
		
		CommandPostFind(data.entity,DE,data.extra)

		MoEntity.LoopThis(data.extra.P,function(dat)
			local CR = KTE(dat.entity)
			if not CR or not CR.valid then return false end
			ManageDrones(CR,dat.extra,DE)
			return true
		end)		
		
		return true
	end)
end)









