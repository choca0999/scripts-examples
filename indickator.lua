local clr_green = Color.new(0, 255, 0)
local clr_red = Color.new(255, 0, 0)


local var_aa = g_Config.FindGlobalVar("antiaim", "enabled")
local var_rage = g_Config.FindGlobalVar("ragebot", "enabled")

local screen_w, screen_h = g_EngineClient.GetScreenSize()

local pos_start = Vector2.new(20,screen_h -  100)
local text_size = 30
local pos_add = Vector2.new(0, text_size)
local cur_pos = 0 -- current frame

local function GetColorFromBool(val)
	return val and clr_green or clr_red
end

local function RenderIndicator(str, val)
	g_Render.Text(str, cur_pos,  GetColorFromBool(val),  text_size)
	cur_pos = cur_pos - pos_add
end

cheat.RegisterCallback("draw", function()
	cur_pos = pos_start

	RenderIndicator("RAGE", var_rage:GetBool() )
	RenderIndicator("AA", var_aa:GetBool())

end)
