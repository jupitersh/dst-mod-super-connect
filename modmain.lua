local ANCHOR_MIDDLE = GLOBAL.ANCHOR_MIDDLE
local SCALEMODE_PROPORTIONAL = GLOBAL.SCALEMODE_PROPORTIONAL
local SCALEMODE_FILLSCREEN = GLOBAL.SCALEMODE_FILLSCREEN
local FRONTEND_TITLE_COLOUR = GLOBAL.FRONTEND_TITLE_COLOUR
local RESOLUTION_X = GLOBAL.RESOLUTION_X
local RESOLUTION_Y = GLOBAL.RESOLUTION_Y
local BACK_BUTTON_Y = GLOBAL.BACK_BUTTON_Y
local STRINGS = GLOBAL.STRINGS
local GOLD = GLOBAL.GOLD
local MOVE_DOWN = GLOBAL.MOVE_DOWN
local MOVE_UP = GLOBAL.MOVE_UP

local title_x = 20
local title_y = 10
local subtitle_offset_x = 20
local subtitle_offset_y = -260
local rcol = RESOLUTION_X/2 -200
local lcol = -RESOLUTION_X/2 + 280

local Image = GLOBAL.require("widgets/image")
local Widget = GLOBAL.require("widgets/widget")
local TEMPLATES = GLOBAL.require("widgets/templates")
local OnlineStatus = GLOBAL.require("widgets/onlinestatus")
local Countdown = GLOBAL.require("widgets/countdown")
local ImageButton = GLOBAL.require("widgets/imagebutton")
local io = GLOBAL.require("io")

local button_location = GetModConfigData("button_loc")

local a1 = GetModConfigData("a1")
local a2 = GetModConfigData("a2")
local a3 = GetModConfigData("a3")
local b1 = GetModConfigData("b1")
local b2 = GetModConfigData("b2")
local b3 = GetModConfigData("b3")
local c1 = GetModConfigData("c1")
local c2 = GetModConfigData("c2")
local c3 = GetModConfigData("c3")
local d1 = GetModConfigData("d1")
local d2 = GetModConfigData("d2")
local d3 = GetModConfigData("d3")
local p1 = GetModConfigData("p1")
local p2 = GetModConfigData("p2")
local p3 = GetModConfigData("p3")
local p4 = GetModConfigData("p4")
local p5 = GetModConfigData("p5")

local ip1 = a1*100 + a2*10 + a3
local ip2 = b1*100 + b2*10 + b3
local ip3 = c1*100 + c2*10 + c3
local ip4 = d1*100 + d2*10 + d3
local portttt = p1*10000 + p2*1000 + p3*100 + p4*10 + p5

local function str(num)
	return string.format(num)
end

local ipppp = str(ip1).."."..str(ip2).."."..str(ip3).."."..str(ip4)

line_index = 0
file = io.open(MODROOT.."name.txt", "r")
for line in file:lines() do
    line_index = line_index + 1
    if line_index == 1 then titleeee = line end
end
file:close()

if titleeee == nil then
    if GetModConfigData("lang") == "ch" then
        titleeee = "直连"
    else
        titleeee = "Connect"
    end
end

local function mainscreen_modify(self)
    local btn_profile = {
        {name = "connecttt", title = titleeee, fn = function()
            self.connecttt_button:Disable()
            GLOBAL.c_connect(ipppp, portttt)
        end}
    }

    for k, v in pairs(btn_profile) do
        local btn = self.fixed_root:AddChild(ImageButton("images/frontscreen.xml", "play_highlight.tex", nil, nil, nil, nil, {1,1}, {0,0}))
        btn.bg = btn:AddChild(Image("images/frontscreen.xml", "play_highlight_hover.tex"))
        btn.bg:SetScale(.69, .53)
        btn.bg:MoveToBack()
        btn.bg:Hide()
        btn.image:SetPosition(0,3)
        btn.bg:SetPosition(0,3)
        
        if GetModConfigData("position") then
            btn:SetPosition(-RESOLUTION_X * .35, -75 * k)
        else
            btn:SetPosition(RESOLUTION_X * .35, 0)
        end

        btn:SetTextColour(1, 1, 1, 1)
        btn:SetTextFocusColour(1, 1, 1, 1)
        btn:SetTextDisabledColour({1,1,1,1})
        btn:SetNormalScale(.65, .5)
        btn:SetFocusScale(.7, .55)
        btn:SetTextSize(55)
        btn:SetFont(GLOBAL.TITLEFONT)
        btn:SetDisabledFont(GLOBAL.TITLEFONT)
        btn:SetText(v.title, true, {2,-3})
        local playgainfocusfn = btn.OnGainFocus
        local playlosefocusfn = btn.OnLoseFocus
        btn.OnGainFocus = function()
            playgainfocusfn(btn)
            btn:SetTextSize(58)
            btn.image:SetTint(1,1,1,1)
            btn.bg:Show()
        end
        btn.OnLoseFocus = function()
            playlosefocusfn(btn)
            btn:SetTextSize(55)
            btn.image:SetTint(1,1,1,.6)
            btn.bg:Hide()
        end
        btn:SetOnClick(v.fn)

        self[v.name .. "_button"] = btn
    end

    local old_OnBecomeActive = self.OnBecomeActive
    function self:OnBecomeActive()
        old_OnBecomeActive(self)
        for k, v in pairs(btn_profile) do
            self[v.name .. "_button"]:Enable()
        end
    end
end

local function multiplayermainscreen_modify(self)
    local btn_profile = {
        {name = "connecttt", title = titleeee, fn = function()
            self.connecttt_button:Disable()
            GLOBAL.c_connect(ipppp, portttt)
        end}
    }

    for k, v in pairs(btn_profile) do
        local btn = self.fixed_root:AddChild(ImageButton("images/frontscreen.xml", "play_highlight.tex", nil, nil, nil, nil, {1,1}, {0,0}))
        btn.bg = btn:AddChild(Image("images/frontscreen.xml", "play_highlight_hover.tex"))
        btn.bg:SetScale(.345, .265) --btn.bg:SetScale(.69, .53) --ontline size
        btn.bg:MoveToBack()
        btn.bg:Hide()
        btn.image:SetPosition(0,3)  
        btn.bg:SetPosition(0,3)
        btn:SetPosition(-RESOLUTION_X * .355, -45 * k + 90) --btn:SetPosition(-RESOLUTION_X * .35, -75 * k) --coodinate
        btn:SetTextColour(1, 1, 1, 1)
        btn:SetTextFocusColour(1, 1, 1, 1)
        btn:SetTextDisabledColour({1,1,1,1})
        btn:SetNormalScale(.325, .25) --btn:SetNormalScale(.65, .5) --image size losing focus
        btn:SetFocusScale(.35, .275) --btn:SetFocusScale(.7, .55) --image size on focus
        btn:SetTextSize(55) --btn:SetTextSize(55)
        btn:SetFont(GLOBAL.TITLEFONT)
        btn:SetDisabledFont(GLOBAL.TITLEFONT)
        btn:SetText(v.title, true, {2,-3})
        local playgainfocusfn = btn.OnGainFocus
        local playlosefocusfn = btn.OnLoseFocus
        btn.OnGainFocus = function()
            playgainfocusfn(btn)
            btn:SetTextSize(29) --btn:SetTextSize(58) --text size on focus
            btn.image:SetTint(1,1,1,1) --btn.image:SetTint(1,1,1,1) --image tranparency on focus
            btn.bg:Show()
        end
        btn.OnLoseFocus = function()
            playlosefocusfn(btn)
            btn:SetTextSize(27.5) --btn:SetTextSize(55) --text size losing focus
            btn.image:SetTint(1,1,1,.6) --btn.image:SetTint(1,1,1,.6) --image transparency losing focus
            btn.bg:Hide()
        end
        btn:SetOnClick(v.fn)

        self[v.name .. "_button"] = btn
    end

    local old_OnBecomeActive = self.OnBecomeActive
    function self:OnBecomeActive()
        old_OnBecomeActive(self)
        for k, v in pairs(btn_profile) do
            self[v.name .. "_button"]:Enable()
        end
    end
end

if button_location == 1 or button_location ==3 then
    AddClassPostConstruct("screens/redux/mainscreen", mainscreen_modify)
end

if button_location == 2 or button_location ==3 then
    AddClassPostConstruct("screens/redux/multiplayermainscreen", multiplayermainscreen_modify)
end