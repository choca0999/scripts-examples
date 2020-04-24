local function on_round_freeze_end()
    for idx = 1, g_GlobalVars.maxClients + 1 do
        local ent = g_EntityList.GetClientEntity(idx)
        if ent and ent:IsPlayer() then
            local player = ent:GetPlayer()
            if player:IsTeamMate() then
                if bit.band(player:m_fFlags(), 0x200) == 0x200 then -- FL_FAKECLIENT
                    g_EngineClient.ClientCmd("holdpos")
                    return
                end
            end
        end
    end
end

local function on_event(e)
    if e:GetName() == "round_freeze_end" then
        on_round_freeze_end()
    end
end

cheat.RegisterCallback("events", on_event)
