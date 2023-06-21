----------------------------------
-- @package     GAS ULX Commands
-- @author      geo
-- @build       v1.0
----------------------------------

local CATEGORY_NAME = "GAS"

-- Player Database
function ulx.database( calling_ply )
	calling_ply:ConCommand("gmodadminsuite playerdatabase")
end
local database = ulx.command( CATEGORY_NAME, "ulx database", ulx.database, "!database" )
database:defaultAccess( ULib.ACCESS_ADMIN )
database:help( "Open the GAS player database." )

-- Logs
function ulx.logs( calling_ply )
	calling_ply:ConCommand("gmodadminsuite logging")
end
local logs = ulx.command( CATEGORY_NAME, "ulx logs", ulx.logs, "!logs" )
logs:defaultAccess( ULib.ACCESS_ADMIN )
logs:help( "Open the bLogs logs menu." )

-- Create Sit
function ulx.createsit( calling_ply, plys )
	table.insert( plys, 1, calling_ply )
	GAS.AdminSits:CreateSit( calling_ply, plys )
end
local createsit = ulx.command( CATEGORY_NAME, "ulx createsit", ulx.createsit, "!createsit" )
createsit:addParam{ type=ULib.cmds.PlayersArg, target = "!^" }
createsit:defaultAccess( ULib.ACCESS_ADMIN )
createsit:help( "Creates a sit with the specified player(s)." )

-- Add to Sit
function ulx.sitadd( calling_ply, target_plys )
	for i=1, #target_plys do
		local v = target_plys[ i ]
		GAS.AdminSits:AddPlayerToSit( v, GAS.AdminSits:GetPlayerSit( calling_ply ) )
	end
end
local sitadd = ulx.command( CATEGORY_NAME, "ulx sitadd", ulx.sitadd, "!sitadd" )
sitadd:addParam{ type=ULib.cmds.PlayersArg, target = "!^" }
sitadd:defaultAccess( ULib.ACCESS_ADMIN )
sitadd:help( "Adds or invites the specified player(s) to the current sit." )

-- Remove from Sit
function ulx.sitremove( calling_ply, target_plys )
	for i=1, #target_plys do
		local v = target_plys[ i ]
		GAS.AdminSits:RemovePlayerFromSit( v, GAS.AdminSits:GetPlayerSit( calling_ply ) )
	end
end
local sitremove = ulx.command( CATEGORY_NAME, "ulx sitremove", ulx.sitremove, "!sitremove" )
sitremove:addParam{ type=ULib.cmds.PlayersArg, target = "!^" }
sitremove:defaultAccess( ULib.ACCESS_ADMIN )
sitremove:help( "Removes the specified player(s) from the current sit." )

-- End Sit
function ulx.endsit( calling_ply )
	GAS.AdminSits:EndSit( GAS.AdminSits:GetPlayerSit( calling_ply ) )
end
local endsit = ulx.command( CATEGORY_NAME, "ulx endsit", ulx.endsit, "!endsit" )
endsit:defaultAccess( ULib.ACCESS_ADMIN )
endsit:help( "Ends the current sit." )

-- Show Active Sits
function ulx.activesits( calling_ply )
	calling_ply:ConCommand("gmodadminsuite adminsits")
end
local resit = ulx.command( CATEGORY_NAME, "ulx activesits", ulx.activesits, "!activesits" )
resit:defaultAccess( ULib.ACCESS_ADMIN )
resit:help( "Display a list of currently on-going sits." )

-- Open FPS-Booster ---
function ulx.fpsboost( calling_ply )
	calling_ply:ConCommand("gmodadminsuite fpsbooster")
end
local fpsboost = ulx.command( CATEGORY_NAME, "ulx fpsboost", ulx.fpsboost, "!fpsboost" )
fpsboost:defaultAccess( ULib.ACCESS_ADMIN )
fpsboost:help( "Opens the FPS-Booster GUI." )
