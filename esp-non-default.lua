local clr = Color.new(255.0, 255.0, 0.0, 0.4) 

local function on_paint()
    local local_idx = g_EngineClient.GetLocalPlayer()
    for idx=1, g_GlobalVars.maxClients + 1 do
        local player = g_EntityList.GetClientEntity(idx)
        if (local_idx ~= idx and player and player ~= nil and player:IsPlayer()) then
            player = player:GetPlayer()
            if(not player:IsTeamMate()) then
                local health = player:m_iHealth()
                if (health > 0) then
                    local origin = player:m_vecOrigin()
                    -- g_Render.CircleFilled3D(origin, 50, 30.0, clr) 
                    g_Render.CylinderFilled3D(origin, 50, 30.0, 100.0, clr)
                end
            end
        end
    end
end

cheat.RegisterCallback("draw", on_paint)
