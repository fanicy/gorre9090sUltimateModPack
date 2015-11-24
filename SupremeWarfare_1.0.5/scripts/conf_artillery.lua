function getArtyAtr(name)
	local atr={}
	if name == "sb-artillery-mk1" then
		atr={
			minrange=10,
			maxrange=30,
			scatter=false,
			scatterrange=0,
			muzzle=false,
			pollution=2,
			aggro=false,
			cooldown=2,
			autofire=true
		}
	elseif name == "sb-artillery-mk2" then
		atr={
			minrange=20,
			maxrange=100,
			scatter=true,
			scatterrange=4,
			muzzle=true,
			pollution=2,
			aggro=true,
			cooldown=5,
			autofire=true
		}
	elseif name == "sb-artillery-mk3" then
		atr={
			minrange=40,
			maxrange=300,
			scatter=true,
			scatterrange=7,
			muzzle=true,
			pollution=4,
			aggro=true,
			cooldown=1,
			autofire=true
		}
	elseif name == "sb-artillery-mk4" then
		atr={
			minrange=0,
			maxrange=1000,
			scatter=true,
			scatterrange=10,
			muzzle=true,
			pollution=100,
			aggro=true,
			cooldown=20,
			autofire=false
		}
	elseif name == "sb-rocketlauncher-mk3" then
		atr={
			minrange=0,
			maxrange=1000,
			scatter=false,
			scatterrange=0,
			muzzle=true,
			pollution=100,
			aggro=true,
			cooldown=20,
			autofire=true
		}
	end
	return atr
end
--MissileSpeed
function missileSpeed(missile)
	local speed
	if missile == "sb-heshell-mk1" or missile == "rocket" or missile == "explosive-rocket" or missile == "he-rocket-mk3" then
		speed=0.5
	elseif missile == "sb-heshell-mk2" or missile == "sb-heshell-mk3" then
		speed=0.33
	elseif missile == "sb-heshell-mk4" then
		speed=0.1
	end
	return speed
end