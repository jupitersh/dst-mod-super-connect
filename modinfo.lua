name = "Super Connect"
description = [[
]]
author = "辣椒小皇纸"
version = "1.3.1"
forumthread = ""
api_version = 10
icon_atlas = "modicon.xml"
icon = "modicon.tex"
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = false
dst_compatible = true
client_only_mod = true
all_clients_require_mod = false

priority = -99

----------------------
-- General settings --
----------------------

local emptyoptions = {{description="", data=false}}
local function Breaker(title, hover)
	return {
		name=title,
		hover=hover, --hover does not work, as this item cannot be hovered
		options=emptyoptions,
		default=false,
	}
end

numoption = {}

for i=0,9 do
	numoption[#numoption + 1] = {
		description = i,
		data = i,
	}
end

configuration_options =
{
	{
		name = "lang",
		label = "LANGUAGE 语言",
		options =	{
						{description = "ENGLISH", data = "en"},
						{description = "中文", data = "ch"},
					},
		default = "en",
	},

	{
		name = "position",
		label = "Mian Pos主界面按钮位置",
		options =	{
						{description = "LEFT", data = true},
						{description = "RIGHT", data = false},
					},
		default = true,
	},

    {
        name = "button_loc",
        label = "Button Location大厅按钮",
        options =   {
                        {description = "Main Screen开始界面", data = 1},
                        {description = "Lobby Screen主界面", data = 2},
                        {description = "Both都显示", data = 3},
                    },
        default = 3,
    },

	Breaker("IP", "IP address of ur server 你服务器的IP地址"),

	{ name = "a1", label = "IP num1", options = numoption, default = 1,},
	{ name = "a2", label = "IP num2", options = numoption, default = 1,},
	{ name = "a3", label = "IP num3", options = numoption, default = 1,},

	Breaker(".", ""),

	{ name = "b1", label = "IP num4", options = numoption, default = 1,},
	{ name = "b2", label = "IP num5", options = numoption, default = 1,},
	{ name = "b3", label = "IP num6", options = numoption, default = 1,},

	Breaker(".", ""),

	{ name = "c1", label = "IP num7", options = numoption, default = 1,},
	{ name = "c2", label = "IP num8", options = numoption, default = 1,},
	{ name = "c3", label = "IP num9", options = numoption, default = 1,},

	Breaker(".", ""),

	{ name = "d1", label = "IP num10", options = numoption, default = 1,},
	{ name = "d2", label = "IP num11", options = numoption, default = 1,},
	{ name = "d3", label = "IP num12", options = numoption, default = 1,},

	Breaker("Port", "Port of ur server 你服务器的端口"),

	{ name = "p1", label = "Port num1", options = numoption, default = 1,},	
	{ name = "p2", label = "Port num2", options = numoption, default = 1,},	
	{ name = "p3", label = "Port num3", options = numoption, default = 1,},	
	{ name = "p4", label = "Port num4", options = numoption, default = 1,},	
	{ name = "p5", label = "Port num5", options = numoption, default = 1,},	
}