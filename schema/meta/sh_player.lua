
local PLAYER = FindMetaTable("Player")

function PLAYER:IsPolice()
	return self:Team() == FACTION_POLICE
end

function PLAYER:IsArrested()
	return self:GetNetVar("arrested", false)
end

function PLAYER:IsWanted()
	return self:GetNetVar("wanted", false)
end

function PLAYER:Arrest(timePeriod, arrester){
	return NULL
end
