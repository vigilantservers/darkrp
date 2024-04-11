local PLUGIN = PLUGIN

PLUGIN.name = "Law and Order"
PLUGIN.author = "Tom"
PLUGIN.description = "A plugin that adds laws and arresting mechanics to the schema."

-- This table will store the current laws.
PLUGIN.laws = {
    {
        text = "Law 1",
        fine = 100,
        jailTime = 60
    },
    {
        text = "Law 2",
        fine = 200,
        jailTime = 120
    },
    -- Add more laws here.
}

-- Load the laws from a Lua file when the plugin is initialized.
function PLUGIN:InitializedPlugins()
end

-- This function reloads the laws from the Lua file.
function PLUGIN:ReloadLaws()
end

function PLUGIN:ArrestPlayer(player, arrestingOfficer)
    if IsValid(player) and player:IsPlayer() then
        -- TODO: Add your arresting code here.
        -- For example, you might set a player variable to indicate that the player is arrested:
        player:SetNWBool("IsArrested", true)

        -- You might also want to move the player to a jail location. You'll need to replace 'jailPosition' with the actual position:
        local jailPosition = Vector(0, 0, 0) -- Replace with your jail coordinates
        player:SetPos(jailPosition)

        -- Notify the arresting officer and the arrested player
        arrestingOfficer:ChatPrint("You have arrested " .. player:Nick() .. ".")
        player:ChatPrint("You have been arrested by " .. arrestingOfficer:Nick() .. ".")
    end
end

-- This function releases a player from arrest.
function PLUGIN:ReleasePlayer(player)
    -- TODO: Implement this function.
end

ix.command.Add("ListLaws", {
    description = "Lists the current laws.",
    OnRun = function(self, client)
        if type(PLUGIN.laws) == "table" then
            client:ChatPrint("Current Laws:")
            for i, law in ipairs(PLUGIN.laws) do
                client:ChatPrint(i .. ". " .. law.text .. " - Fine: " .. law.fine .. " - Jail Time: " .. law.jailTime)
            end
        else
            client:ChatPrint("No laws have been loaded.")
        end
    end
})