if SERVER then
	AddCSLuaFile("Mathrixte_config.lua")

	include("Mathrixte_config.lua")
elseif CLIENT then
	include("Mathrixte_config.lua")
end
