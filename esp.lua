local clr = Color.new(0.0, 0.0, 200.0) 
local clr2 = Color.new(255.0, 255.0, 0.0) 

-- arguments: entity, esp preview if nullptr(nil) passed
-- return values: table{should draw, string which will be drawn, color}

local function draw_is_preview(ent)
	if(ent == nil) then
    	return {true, "esp preview", clr2}
	else
		return {true, "weapon", clr2}
	end
end

local function draw_health(ent)
    if(ent == nil) then
    	return {true, "100", clr}
	else
		return {true, ent:GetPlayer():m_iHealth(), clr} -- you can pass int
	end
end

cheat.EspText("weapon", draw_is_preview)
cheat.EspText("player", draw_health)
