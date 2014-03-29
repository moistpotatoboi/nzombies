if SERVER then
	//Main Tables
	conv={}

	bnpvbWJpZXM = {}
	bnpvbWJpZXM.Config = {}
	
	//Downloads
	resource.AddWorkshop("182104437")
	--resource.AddWorkshop("132835998")

	resource.AddFile( "models/toybox.mdl" )
	resource.AddFile( "materials/models/toybox/zombie_treasure_box_c.vmt" )
	resource.AddFile( "materials/models/toybox/zombie_treasure_box_c.vtf" )
	resource.AddFile( "materials/models/toybox/zombie_treasure_fill_c.vmt" )
	resource.AddFile( "materials/models/toybox/zombie_treasure_fill_c.vtf" )
	resource.AddFile( "materials/models/toybox/zombie_treasure_fill_c.vtf" )
	resource.AddFile( "resource/fonts/28_Days_Later.ttf" )
	
	
	
	//MAIN CONFIG
	
	//The first wave of zombies
	bnpvbWJpZXM.Config.BaseDifficultySpawnRateCurve = 5
	//Difficulty of the curve
	bnpvbWJpZXM.Config.DifficultySpawnRateCurve = 1.01
	//Base health at level 1
	bnpvbWJpZXM.Config.BaseDifficultyHealthCurve = 75
	//Difficulty of the curve
	bnpvbWJpZXM.Config.DifficultyHealthCurve = 0.6
	
	//Max amount of zombies at the same time
	bnpvbWJpZXM.Config.MaxZombiesSim = 100
	
	//Self Explanitory
	bnpvbWJpZXM.Config.BaseStartingPoints = 500
	bnpvbWJpZXM.Config.BaseStartingWeapon = "weapon_sim_colt1911"
	bnpvbWJpZXM.Config.BaseStartingAmmoAmount = 120
	
	//Change name variables
	//Setting this to true allows for the gamemode change the name to have a tag in front while its going on
	bnpvbWJpZXM.Config.AllowServerName = true
	bnpvbWJpZXM.Config.ServerName =	GetHostName()
	bnpvbWJpZXM.Config.ServerNameProg = "[In Progress] "
	//Similar to Allow Server name, but it also locks the server.
	bnpvbWJpZXM.Config.AllowServerPasswordLocking = false
	
end

if CLIENT then

end
