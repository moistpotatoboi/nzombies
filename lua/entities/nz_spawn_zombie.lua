AddCSLuaFile( )

ENT.Type = "anim"
ENT.Base = "base_entity"

ENT.PrintName		= "nz_spawn_zombie"

AccessorFunc(ENT, "iSpawnWeight", "SpawnWeight", FORCE_NUMBER)
AccessorFunc(ENT, "tZombieData", "ZombieData")
AccessorFunc(ENT, "iZombiesToSpawn", "ZombiesToSpawn", FORCE_NUMBER)
AccessorFunc(ENT, "hSpawner", "Spawner")

function ENT:DecrementZombiesToSpawn()
	self:SetZombiesToSpawn( self:GetZombiesToSpawn() - 1 )
end

function ENT:SetupDataTables()

	self:NetworkVar( "String", 0, "Link" )

end

function ENT:Initialize()
	self:SetModel( "models/player/odessa.mdl" )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self:SetColor(Color(0, 255, 0))
	self:DrawShadow( false )
	self:SetSpawnWeight(0)
	self:SetZombiesToSpawn(0)
end

function ENT:IsSuitable()
	local tr = util.TraceHull( {
		start = self:GetPos(),
		endpos = self:GetPos(),
		filter = self,
		mins = Vector( -20, -20, -0 ),
		maxs = Vector( 20, 20, 70 ),
		mask = MASK_NPCSOLID
	} )

	return not tr.HitNonWorld
end

function ENT:Think()
	if SERVER then
	    if Round:InState( ROUND_PROG ) and self:GetZombiesToSpawn() > 0 then
			if self:IsSuitable() then
				local class = nz.Misc.Functions.WeightedRandom(self:GetZombieData(), "chance")
				local zombie = ents.Create(class)
				zombie:SetPos(self:GetPos())
				zombie:Spawn()
				-- make a reference to the spawner object used for "respawning"
				zombie:SetSpawner(self:GetSpawner())
				zombie:Activate()
				-- reduce zombies in queue on self and spawner object
				self:GetSpawner():DecrementZombiesToSpawn()
				self:DecrementZombiesToSpawn()
			end
		end
	end
end

if CLIENT then
	function ENT:Draw()
		if Round:InState( ROUND_CREATE ) then
			self:DrawModel()
		end
	end
end
