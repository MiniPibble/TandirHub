-- ThunderHub | Code Redeemer
-- Toggle UI: RightCtrl

local _0x = getfenv and getfenv() or _G
local _1x = _0x.print or print
local _2x = _0x.table or table
local _3x = _0x.math or math
local _4x = _0x.string or string
local _5x = _0x.wait or task.wait
local _6x = _0x.delay or task.delay
local _7x = _0x.TweenService or game:GetService("TweenService")
local _8x = _0x.RunService or game:GetService("RunService")
local _9x = _0x.UserInputService or game:GetService("UserInputService")
local _10x = _0x.Players or game:GetService("Players")
local _11x = _0x.ReplicatedStorage or game:GetService("ReplicatedStorage")
local _12x = _0x.HttpService or game:GetService("HttpService")
local _13x = _0x.cloneref or function(x) return x end

local _A = _13x(_10x)
local _B = _13x(_11x)
local _C = _13x(_8x)
local _D = _13x(_9x)
local _E = _13x(_7x)
local _F = _13x(_12x)

local _G = {}
_G.a = _A.LocalPlayer
_G.b = _G.a:WaitForChild("PlayerGui")

local _H = "levithon_code_redeemer_config.json"
local _I = {a=true,b=true,c=3,d=false,e=false}

pcall(function()
    if type(isfile)=="function"and type(readfile)=="function"and isfile(_H)then
        local _J=_F:JSONDecode(readfile(_H))
        if type(_J)=="table"then
            if type(_J.a)=="boolean"then _I.a=_J.a end
            if type(_J.b)=="boolean"then _I.b=_J.b end
            if type(_J.c)=="number"then _I.c=_3x.max(1,_3x.floor(_J.c))end
            if type(_J.d)=="boolean"then _I.d=_J.d end
            if type(_J.e)=="boolean"then _I.e=_J.e end
        end
    end
end)

local function _K()
    if type(writefile)~="function"then return end
    pcall(function()writefile(_H,_F:JSONEncode({a=_I.a,b=_I.b,c=_I.c,d=_I.d,e=_I.e}))end)
end

local _L={}
_L.a=_I.a
_L.b={}
_L.c=nil
_L.d=nil
_L.e=_I.b
_L.f=_I.c
_L.g={}
_L.h=nil
_L.i=nil
_L.j=nil
_L.k={}
_L.l=_I.d
_L.m=_I.e
_L.n=""
_L.o=nil
_L.p=nil
_L.q=0
_L.r=0
_L.s=nil

local _M=(debug and debug.getupvalues)or getupvalues
local _N=getconnections or(debug and debug.getconnections)
local _O=(debug and debug.setupvalue)or setupvalue

local _P={}
_P.a=nil
_P.b=nil

local function _Q(x)
    local y=x
    for i=1,10 do
        if not y then break end
        if y.Name=="LevithonCodeRedeemer"or y.Name=="SourcesHubRedeemerGui"or y.Name=="ThunderHub"then return true end
        y=y.Parent
    end
    return false
end

local function _R(x)
    local y=x
    while y do
        if y:IsA("GuiObject")and not y.Visible then return false end
        if y:IsA("ScreenGui")then return y.Enabled end
        y=y.Parent
    end
    return true
end

local function _S(pg)
    local r={}
    for _,g in ipairs(pg:GetChildren())do
        if g:IsA("ScreenGui")and g.Enabled and not _Q(g)then
            for _,d in ipairs(g:GetDescendants())do
                if d:IsA("TextBox")and not _Q(d)then r[#r+1]=d end
            end
        end
    end
    return r
end

local function _T(pg)
    local r={}
    for _,g in ipairs(pg:GetChildren())do
        if g:IsA("ScreenGui")and g.Enabled and not _Q(g)then
            for _,d in ipairs(g:GetDescendants())do
                if(d:IsA("TextButton")or d:IsA("ImageButton"))and not _Q(d)then
                    local n=d.Name:lower()
                    local pn=(d.Parent and d.Parent.Name or""):lower()
                    if(n:find("code")or n:find("redeem")or pn:find("code")or pn:find("redeem"))and _R(d)then r[#r+1]=d end
                end
            end
        end
    end
    return r
end

local function _U(b)
    if not b then return false end
    local m={}
    m[#m+1]=function()b.MouseButton1Click:Fire()end
    m[#m+1]=function()b.Activated:Fire()end
    if typeof(firesignal)=="function"then
        m[#m+1]=function()firesignal(b.MouseButton1Click)end
        m[#m+1]=function()firesignal(b.Activated)end
    end
    if typeof(_N)=="function"then
        m[#m+1]=function()
            local ok,cs=pcall(_N,b.MouseButton1Click)
            if ok and type(cs)=="table"then for _,c in ipairs(cs)do pcall(function()c:Fire()end)end end
            local ok2,cs2=pcall(_N,b.Activated)
            if ok2 and type(cs2)=="table"then for _,c in ipairs(cs2)do pcall(function()c:Fire()end)end end
        end
    end
    if typeof(fireclick)=="function"then m[#m+1]=function()fireclick(b)end end
    local any=false
    for _,f in ipairs(m)do local ok=pcall(f)any=any or ok end
    return any
end

local function _V(b)
    if not b then return false end
    local any=false
    if typeof(firesignal)=="function"then local ok=pcall(firesignal,b.FocusLost,true)any=any or ok end
    if typeof(_N)=="function"then
        local ok,cs=pcall(_N,b.FocusLost)
        if ok and type(cs)=="table"then
            for _,c in ipairs(cs)do
                local f
                pcall(function()f=c.Function end)
                if f and typeof(_M)=="function"and typeof(_O)=="function"then
                    local uok,ups=pcall(_M,f)
                    if uok and type(ups)=="table"then
                        for i,v in pairs(ups)do
                            if type(v)=="boolean"and v==true then pcall(_O,f,i,false)end
                        end
                    end
                end
                local fok=pcall(function()if c.Enabled~=false then c:Fire(true)end end)
                any=any or fok
            end
        end
    end
    return any
end

local function _W(code)
    local pg=_G.b or _G.a:FindFirstChildOfClass("PlayerGui")
    if not pg then return false,"no PlayerGui"end
    local cg=pg:FindFirstChild("Codes")
    if cg then
        if cg:IsA("ScreenGui")then cg.Enabled=true end
        local cf=cg:FindFirstChild("Codes")or cg
        if cf then
            if cf:IsA("GuiObject")then cf.Visible=true end
            local cur=cf
            while cur and cur~=cg do if cur:IsA("GuiObject")then cur.Visible=true end cur=cur.Parent end
            local box=nil
            for _,d in ipairs(cf:GetDescendants())do if d:IsA("TextBox")and not _Q(d)then box=d break end end
            local btn=nil
            for _,d in ipairs(cf:GetDescendants())do
                if(d:IsA("TextButton")or d:IsA("ImageButton"))and not _Q(d)then
                    local n=d.Name:lower()
                    local t=""
                    pcall(function()t=d.Text:lower()end)
                    if n:find("submit")or t:find("submit")or n:find("redeem")or t:find("redeem")or n:find("claim")or t:find("confirm")or n:find("enter")then btn=d break end
                end
            end
            if not btn then
                for _,d in ipairs(cf:GetDescendants())do
                    if(d:IsA("TextButton")or d:IsA("ImageButton"))and not _Q(d)then
                        local n=d.Name:lower()
                        if not n:find("close")and not n:find("x")and not n:find("toggle")then btn=d break end
                    end
                end
            end
            if box then
                pcall(function()box.Text=code end)
                _5x(0.05)
                if btn then _U(btn)end
                _V(box)
                return true,"submitted via PlayerGui.Codes"
            end
        end
    end
    local btns=_T(pg)
    for _,b in ipairs(btns)do _U(b)_5x(0.05)end
    _5x(0.2)
    local box=nil
    local dl=_3x.floor(os.clock()+2)
    while os.clock()<dl do
        local all=_S(pg)
        for _,d in ipairs(all)do
            if _R(d)then
                local n=d.Name:lower()
                local pn=(d.Parent and d.Parent.Name or""):lower()
                if n:find("code")or pn:find("code")or n:find("redeem")or pn:find("redeem")or n:find("input")or pn:find("textbox")or n:find("enter")then box=d break end
            end
        end
        if not box then for _,d in ipairs(all)do if _R(d)then box=d break end end end
        if box then break end
        _5x(0.1)
    end
    if not box then return false,"no codebox visible"end
    pcall(function()box.Text=code end)
    _5x(0.05)
    local btn=nil
    local names={"submit","redeem","claim","confirm","enter","send","apply","ok","use","go","check"}
    local p=box.Parent
    for i=1,8 do
        if not p then break end
        for _,d in ipairs(p:GetDescendants())do
            if(d:IsA("TextButton")or d:IsA("ImageButton"))and not _Q(d)and d~=box then
                local n=d.Name:lower()
                local t=""
                pcall(function()t=d.Text:lower()end)
                for _,sn in ipairs(names)do
                    if n:find(sn)or t:find(sn)then
                        if _R(d)then btn=d break end
                    end
                end
                if btn then break end
            end
        end
        if btn then break end
        p=p.Parent
    end
    if btn then _U(btn)end
    _V(box)
    return true,"submitted via dynamic search"
end

local function _X()
    local pg=_G.b
    local all=_S(pg)
    for _,b in ipairs(all)do if _R(b)then return b end end
    return nil
end

pcall(function()
    for _,name in ipairs({"LevithonCodeRedeemer","ACECodeSniperUI","AutoTypeCodesUI","ThunderHub"})do
        local prev=game.CoreGui:FindFirstChild(name)
        if prev then prev:Destroy()end
    end
end)

for _,name in ipairs({"LevithonCodeRedeemer","ACECodeSniperUI","AutoTypeCodesUI","ThunderHub"})do
    local prev=_G.b:FindFirstChild(name)
    if prev then prev:Destroy()end
end

-- ============================================================
--                      T H U N D E R H U B   U I
-- ============================================================
local function _BuildUI()
    local UI = {}
    local CSK = ColorSequenceKeypoint.new

    -- palette
    local BG    = Color3.fromRGB(7, 7, 10)
    local PANEL = Color3.fromRGB(15, 15, 21)
    local ITEM  = Color3.fromRGB(24, 24, 33)
    local LINE  = Color3.fromRGB(40, 40, 54)
    local TXT   = Color3.fromRGB(242, 242, 248)
    local SUB   = Color3.fromRGB(135, 135, 152)
    local GOOD  = Color3.fromRGB(70, 210, 100)
    local BAD   = Color3.fromRGB(255, 80, 90)
    local WARN  = Color3.fromRGB(255, 190, 60)
    local OFFC  = Color3.fromRGB(42, 42, 54)
    local DARK  = Color3.fromRGB(8, 8, 12)

    local ACCENTS = {
        { "Thunder", Color3.fromRGB(0, 170, 255),  Color3.fromRGB(140, 90, 255) },
        { "Volt",    Color3.fromRGB(255, 214, 0),  Color3.fromRGB(255, 120, 0) },
        { "Toxic",   Color3.fromRGB(0, 230, 120),  Color3.fromRGB(0, 170, 255) },
        { "Crimson", Color3.fromRGB(255, 60, 90),  Color3.fromRGB(255, 140, 60) },
    }
    local curIdx = 1
    local A1, A2 = ACCENTS[1][2], ACCENTS[1][3]

    local themedGrads, switches, refreshers = {}, {}, {}

    -- helpers
    local function new(cls, props, parent)
        local o = Instance.new(cls)
        for k, v in pairs(props) do o[k] = v end
        if parent then o.Parent = parent end
        return o
    end
    local function corner(o, r) return new("UICorner", { CornerRadius = UDim.new(0, r) }, o) end
    local function stroke(o, c, t, tr)
        return new("UIStroke", { Color = c, Thickness = t or 1, Transparency = tr or 0, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, o)
    end
    local function tw(o, p, t, style)
        _E:Create(o, TweenInfo.new(t or 0.18, style or Enum.EasingStyle.Quad, Enum.EasingDirection.Out), p):Play()
    end
    local function txt(parent, text, size, color, font, props)
        local l = new("TextLabel", {
            BackgroundTransparency = 1, Text = text, TextSize = size, TextColor3 = color,
            Font = font or Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center, BorderSizePixel = 0,
        }, parent)
        if props then for k, v in pairs(props) do l[k] = v end end
        return l
    end
    local function themedGrad(obj, rot)
        local g = new("UIGradient", { Rotation = rot or 0, Color = ColorSequence.new({ CSK(0, A1), CSK(0.5, A2), CSK(1, A1) }) }, obj)
        themedGrads[#themedGrads + 1] = g
        return g
    end
    local function card(parent, size, pos)
        local f = new("Frame", { Size = size, Position = pos or UDim2.new(), BackgroundColor3 = PANEL, BackgroundTransparency = 0.1, BorderSizePixel = 0 }, parent)
        corner(f, 10)
        stroke(f, LINE, 1)
        return f
    end

    -- stats
    local S = { captured = 0, redeemed = 0, failed = 0 }
    local history = {}
    local startClock = os.clock()

    -- ScreenGui + window
    local gui = new("ScreenGui", { Name = "ThunderHub", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 999 })
    if not pcall(function() gui.Parent = game.CoreGui end) then gui.Parent = _G.b end
    UI.gui = gui

    local win = new("Frame", {
        Name = "Window", Size = UDim2.fromOffset(280, 360), Position = UDim2.fromOffset(100, 100),
        BackgroundColor3 = BG, BorderSizePixel = 0, Active = true, ClipsDescendants = true,
    }, gui)
    corner(win, 14)
    local ring = stroke(win, Color3.new(1, 1, 1), 1.6, 0.1)
    local ringGrad = themedGrad(ring, 0)
    new("UIGradient", { Rotation = 90, Color = ColorSequence.new(Color3.fromRGB(17, 17, 24), Color3.fromRGB(5, 5, 8)) }, win)

    -- header
    local head = new("Frame", { Name = "Header", Size = UDim2.new(1, 0, 0, 42), BackgroundTransparency = 1, Active = true }, win)
    local logo = new("Frame", { Size = UDim2.fromOffset(26, 26), Position = UDim2.fromOffset(10, 8), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0 }, head)
    corner(logo, 8)
    themedGrad(logo, 45)
    txt(logo, "⚡", 14, Color3.new(1, 1, 1), Enum.Font.GothamBold, { Size = UDim2.fromScale(1, 1), TextXAlignment = Enum.TextXAlignment.Center })
    local title = txt(head, "ThunderHub", 16, Color3.new(1, 1, 1), Enum.Font.GothamBlack, { Position = UDim2.fromOffset(44, 0), Size = UDim2.fromOffset(100, 42) })
    themedGrad(title, 0)
    local verTag = new("Frame", { Size = UDim2.fromOffset(28, 14), Position = UDim2.fromOffset(142, 14), BackgroundColor3 = ITEM, BorderSizePixel = 0 }, head)
    corner(verTag, 5)
    txt(verTag, "v2.0", 8, SUB, Enum.Font.GothamBold, { Size = UDim2.fromScale(1, 1), TextXAlignment = Enum.TextXAlignment.Center })

    local function headBtn(text, xOff, hover)
        local b = new("TextButton", {
            Size = UDim2.fromOffset(24, 24), Position = UDim2.new(1, xOff, 0, 9), BackgroundColor3 = ITEM, Text = text,
            TextColor3 = TXT, TextSize = 14, Font = Enum.Font.GothamBold, AutoButtonColor = false, BorderSizePixel = 0,
        }, head)
        corner(b, 8)
        b.MouseEnter:Connect(function() tw(b, { BackgroundColor3 = hover }) end)
        b.MouseLeave:Connect(function() tw(b, { BackgroundColor3 = ITEM }) end)
        return b
    end
    local closeBtn = headBtn("×", -32, Color3.fromRGB(200, 50, 65))
    local minBtn = headBtn("-", -60, Color3.fromRGB(50, 50, 66))

    -- dragging
    do
        local dragging, dInput, dStart, sPos = false, nil, nil, nil
        head.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dStart = input.Position
                sPos = win.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end)
        head.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dInput = input end
        end)
        _D.InputChanged:Connect(function(input)
            if input == dInput and dragging then
                local d = input.Position - dStart
                win.Position = UDim2.new(sPos.X.Scale, sPos.X.Offset + d.X, sPos.Y.Scale, sPos.Y.Offset + d.Y)
            end
        end)
    end

    -- tab bar
    local tabBar = new("Frame", { Position = UDim2.fromOffset(8, 46), Size = UDim2.new(1, -16, 0, 28), BackgroundColor3 = PANEL, BorderSizePixel = 0 }, win)
    corner(tabBar, 9)
    stroke(tabBar, LINE, 1)
    local ind = new("Frame", { Size = UDim2.new(1 / 3, -6, 1, -6), Position = UDim2.new(0, 3, 0, 3), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0 }, tabBar)
    corner(ind, 7)
    themedGrad(ind, 0)

    local tabNames = { "MAIN", "SETTINGS", "LOGS" }
    local tabBtns = {}
    for i, n in ipairs(tabNames) do
        tabBtns[i] = new("TextButton", {
            Size = UDim2.new(1 / 3, 0, 1, 0), Position = UDim2.new((i - 1) / 3, 0, 0, 0), BackgroundTransparency = 1,
            Text = n, TextSize = 10, Font = Enum.Font.GothamBold, TextColor3 = SUB, AutoButtonColor = false, ZIndex = 3,
        }, tabBar)
    end

    -- body + footer
    local body = new("Frame", { Position = UDim2.fromOffset(8, 80), Size = UDim2.new(1, -16, 1, -106), BackgroundTransparency = 1 }, win)
    local foot = new("Frame", { Position = UDim2.new(0, 8, 1, -22), Size = UDim2.new(1, -16, 0, 18), BackgroundTransparency = 1 }, win)
    local footDot = new("Frame", { Size = UDim2.fromOffset(6, 6), Position = UDim2.fromOffset(2, 6), BackgroundColor3 = GOOD, BorderSizePixel = 0 }, foot)
    corner(footDot, 3)
    local footTxt = txt(foot, "Scanning for codes", 9, SUB, Enum.Font.GothamMedium, { Position = UDim2.fromOffset(14, 0), Size = UDim2.new(0.6, 0, 1, 0) })
    txt(foot, "RightCtrl = hide", 9, SUB, Enum.Font.Gotham, { Size = UDim2.fromScale(1, 1), TextXAlignment = Enum.TextXAlignment.Right })

    -- widgets
    local function makeSwitch(parent, pos, w, h, def, cb)
        local sw = { state = def }
        local function knobPos(on)
            return on and UDim2.new(1, -(h - 3), 0.5, -(h - 6) / 2) or UDim2.new(0, 3, 0.5, -(h - 6) / 2)
        end
        local tr = new("TextButton", {
            Size = UDim2.fromOffset(w, h), Position = pos, BackgroundColor3 = def and A1 or OFFC,
            AutoButtonColor = false, Text = "", BorderSizePixel = 0,
        }, parent)
        corner(tr, h)
        local kn = new("Frame", { Size = UDim2.fromOffset(h - 6, h - 6), Position = knobPos(def), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0 }, tr)
        corner(kn, h)
        function sw.refresh()
            tw(tr, { BackgroundColor3 = sw.state and A1 or OFFC }, 0.15)
            tw(kn, { Position = knobPos(sw.state) }, 0.15)
        end
        function sw.set(v, silent)
            sw.state = v
            sw.refresh()
            if cb and not silent then cb(v) end
        end
        tr.MouseButton1Click:Connect(function() sw.set(not sw.state) end)
        switches[#switches + 1] = sw
        return sw
    end

    local function button(parent, text, size, pos, filled)
        local b = new("TextButton", {
            Text = text, Size = size, Position = pos, AutoButtonColor = false,
            BackgroundColor3 = filled and Color3.new(1, 1, 1) or ITEM,
            TextColor3 = filled and DARK or TXT, TextSize = 10, Font = Enum.Font.GothamBold, BorderSizePixel = 0,
        }, parent)
        corner(b, 7)
        if filled then themedGrad(b, 0) else stroke(b, LINE, 1) end
        b.MouseEnter:Connect(function()
            if filled then tw(b, { BackgroundTransparency = 0.15 }) else tw(b, { BackgroundColor3 = Color3.fromRGB(34, 34, 46) }) end
        end)
        b.MouseLeave:Connect(function()
            if filled then tw(b, { BackgroundTransparency = 0 }) else tw(b, { BackgroundColor3 = ITEM }) end
        end)
        return b
    end

    local function page(scroll)
        local p
        if scroll then
            p = new("ScrollingFrame", {
                Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 2,
                ScrollBarImageColor3 = SUB, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Visible = false,
            }, body)
        else
            p = new("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false }, body)
        end
        return p
    end

    local mainP, setP, logP = page(false), page(true), page(false)
    local pageList = { mainP, setP, logP }

    -- ===== toast =====
    local toastF = new("Frame", { Size = UDim2.new(1, -20, 0, 28), Position = UDim2.new(0, 10, 1, 8), BackgroundColor3 = Color3.fromRGB(20, 20, 28), BorderSizePixel = 0, ZIndex = 20 }, win)
    corner(toastF, 9)
    stroke(toastF, LINE, 1)
    local tBar = new("Frame", { Size = UDim2.new(0, 3, 1, -10), Position = UDim2.fromOffset(7, 5), BackgroundColor3 = A1, BorderSizePixel = 0, ZIndex = 21 }, toastF)
    corner(tBar, 2)
    local tTxt = txt(toastF, "", 11, TXT, Enum.Font.GothamMedium, { Position = UDim2.fromOffset(18, 0), Size = UDim2.new(1, -24, 1, 0), ZIndex = 21, TextTruncate = Enum.TextTruncate.AtEnd })
    local toastTok = 0
    local function toast(msg, col)
        toastTok = toastTok + 1
        local tok = toastTok
        tTxt.Text = msg
        tBar.BackgroundColor3 = col or A1
        tw(toastF, { Position = UDim2.new(0, 10, 1, -56) }, 0.28, Enum.EasingStyle.Back)
        task.delay(2.2, function()
            if tok == toastTok then tw(toastF, { Position = UDim2.new(0, 10, 1, 8) }, 0.2) end
        end)
    end
    UI.toast = toast

    -- ===== MAIN PAGE =====
    local sCard = card(mainP, UDim2.new(1, 0, 0, 56))
    local halo = new("Frame", { Size = UDim2.fromOffset(26, 26), Position = UDim2.fromOffset(9, 15), BackgroundColor3 = GOOD, BackgroundTransparency = 0.8, BorderSizePixel = 0 }, sCard)
    corner(halo, 13)
    local sDot = new("Frame", { Size = UDim2.fromOffset(10, 10), Position = UDim2.fromOffset(17, 23), BackgroundColor3 = GOOD, BorderSizePixel = 0 }, sCard)
    corner(sDot, 5)
    txt(sCard, "AUTO CODE", 9, SUB, Enum.Font.GothamBold, { Position = UDim2.fromOffset(44, 9), Size = UDim2.new(1, -110, 0, 12) })
    local sTxt = txt(sCard, "Scanning", 16, TXT, Enum.Font.GothamBold, { Position = UDim2.fromOffset(44, 22), Size = UDim2.new(1, -110, 0, 24) })

    local masterSw
    masterSw = makeSwitch(sCard, UDim2.new(1, -56, 0.5, -12), 44, 24, _L.a, function(v)
        _L.a = v
        _I.a = v
        _K()
        UI.setStatus(v)
        UI.log(v and "Auto code enabled" or "Auto code disabled", v and GOOD or BAD)
    end)

    local function statCard(i, label, color)
        local f = card(mainP, UDim2.new(1 / 3, -6, 0, 48), UDim2.new((i - 1) / 3, (i - 1) * 3, 0, 64))
        local num = txt(f, "0", 19, color, Enum.Font.GothamBold, { Size = UDim2.new(1, 0, 0, 28), Position = UDim2.fromOffset(0, 5), TextXAlignment = Enum.TextXAlignment.Center })
        txt(f, label, 8, SUB, Enum.Font.GothamBold, { Size = UDim2.new(1, 0, 0, 12), Position = UDim2.fromOffset(0, 31), TextXAlignment = Enum.TextXAlignment.Center })
        return num
    end
    local capNum = statCard(1, "CAPTURED", A1)
    local redNum = statCard(2, "REDEEMED", GOOD)
    local failNum = statCard(3, "FAILED", BAD)
    refreshers[#refreshers + 1] = function() capNum.TextColor3 = A1 end

    txt(mainP, "MANUAL REDEEM", 9, SUB, Enum.Font.GothamBold, { Position = UDim2.fromOffset(2, 120), Size = UDim2.new(1, 0, 0, 12) })
    local boxWrap = new("Frame", { Position = UDim2.fromOffset(0, 135), Size = UDim2.new(1, -72, 0, 30), BackgroundColor3 = PANEL, BackgroundTransparency = 0.1, BorderSizePixel = 0 }, mainP)
    corner(boxWrap, 8)
    local boxStroke = stroke(boxWrap, LINE, 1)
    local codeBox = new("TextBox", {
        Size = UDim2.new(1, -16, 1, 0), Position = UDim2.fromOffset(8, 0), BackgroundTransparency = 1, Text = "",
        PlaceholderText = "Enter code...", PlaceholderColor3 = SUB, TextColor3 = TXT, TextSize = 12, Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left, ClearTextOnFocus = false,
    }, boxWrap)
    codeBox.Focused:Connect(function() tw(boxStroke, { Color = A1 }) end)
    codeBox.FocusLost:Connect(function() tw(boxStroke, { Color = LINE }) end)
    local redeemBtn = button(mainP, "REDEEM", UDim2.fromOffset(66, 30), UDim2.new(1, -66, 0, 135), true)

    local lastCard = card(mainP, UDim2.new(0.5, -3, 0, 44), UDim2.fromOffset(0, 174))
    txt(lastCard, "LAST CODE", 8, SUB, Enum.Font.GothamBold, { Position = UDim2.fromOffset(10, 6), Size = UDim2.new(1, -20, 0, 12) })
    local lastVal = txt(lastCard, "-", 13, TXT, Enum.Font.GothamBold, { Position = UDim2.fromOffset(10, 20), Size = UDim2.new(1, -20, 0, 18), TextTruncate = Enum.TextTruncate.AtEnd })
    local upCard = card(mainP, UDim2.new(0.5, -3, 0, 44), UDim2.new(0.5, 3, 0, 174))
    txt(upCard, "SESSION", 8, SUB, Enum.Font.GothamBold, { Position = UDim2.fromOffset(10, 6), Size = UDim2.new(1, -20, 0, 12) })
    local upVal = txt(upCard, "00:00", 13, TXT, Enum.Font.GothamBold, { Position = UDim2.fromOffset(10, 20), Size = UDim2.new(1, -20, 0, 18) })

    txt(mainP, "Tip: click the game's code box once so ThunderHub can link to it.", 9, SUB, Enum.Font.Gotham,
        { Position = UDim2.fromOffset(2, 226), Size = UDim2.new(1, -4, 0, 24), TextWrapped = true, TextYAlignment = Enum.TextYAlignment.Top })

    -- ===== SETTINGS PAGE =====
    new("UIListLayout", { Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder }, setP)
    new("UIPadding", { PaddingRight = UDim.new(0, 4) }, setP)
    local order = 0
    local function srow(h)
        order = order + 1
        local r = card(setP, UDim2.new(1, -2, 0, h or 32))
        r.LayoutOrder = order
        return r
    end
    local function toggleRow(label, def, cb)
        local r = srow(32)
        txt(r, label, 11, TXT, Enum.Font.GothamMedium, { Position = UDim2.fromOffset(12, 0), Size = UDim2.new(1, -70, 1, 0) })
        return makeSwitch(r, UDim2.new(1, -48, 0.5, -9), 36, 18, def, cb)
    end

    toggleRow("Auto submit", _L.e, function(v) _L.e = v _I.b = v _K() UI.log("Auto submit " .. (v and "on" or "off"), SUB) end)
    toggleRow("Riddle solver", _L.m, function(v) _L.m = v _I.e = v _K() UI.log("Riddle solver " .. (v and "on" or "off"), SUB) end)
    toggleRow("Retype invalid", _L.l, function(v) _L.l = v _I.d = v _K() UI.log("Retype invalid " .. (v and "on" or "off"), SUB) end)

    -- stepper
    do
        local r = srow(32)
        txt(r, "Submit after", 11, TXT, Enum.Font.GothamMedium, { Position = UDim2.fromOffset(12, 0), Size = UDim2.new(1, -100, 1, 0) })
        local minus = button(r, "-", UDim2.fromOffset(22, 22), UDim2.new(1, -86, 0.5, -11), false)
        local val = txt(r, tostring(_L.f), 12, TXT, Enum.Font.GothamBold, { Position = UDim2.new(1, -62, 0, 0), Size = UDim2.fromOffset(28, 32), TextXAlignment = Enum.TextXAlignment.Center })
        local plus = button(r, "+", UDim2.fromOffset(22, 22), UDim2.new(1, -32, 0.5, -11), false)
        local function setStep(v)
            _L.f = _3x.max(1, _3x.min(99, v))
            val.Text = tostring(_L.f)
            _I.c = _L.f
            _K()
        end
        minus.MouseButton1Click:Connect(function() setStep(_L.f - 1) end)
        plus.MouseButton1Click:Connect(function() setStep(_L.f + 1) end)
    end

    -- opacity slider
    do
        local r = srow(46)
        txt(r, "Window opacity", 11, TXT, Enum.Font.GothamMedium, { Position = UDim2.fromOffset(12, 4), Size = UDim2.new(1, -70, 0, 18) })
        local sVal = txt(r, "100%", 10, SUB, Enum.Font.GothamBold, { Position = UDim2.new(1, -58, 0, 4), Size = UDim2.fromOffset(46, 18), TextXAlignment = Enum.TextXAlignment.Right })
        local track = new("Frame", { Size = UDim2.new(1, -24, 0, 4), Position = UDim2.fromOffset(12, 32), BackgroundColor3 = OFFC, BorderSizePixel = 0 }, r)
        corner(track, 2)
        local fill = new("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0 }, track)
        corner(fill, 2)
        themedGrad(fill, 0)
        local knob = new("Frame", { Size = UDim2.fromOffset(12, 12), Position = UDim2.new(1, -6, 0.5, -6), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0 }, track)
        corner(knob, 6)
        local function setOpacity(rel)
            rel = _3x.max(0, _3x.min(1, rel))
            fill.Size = UDim2.fromScale(rel, 1)
            knob.Position = UDim2.new(rel, -6, 0.5, -6)
            local op = 0.5 + 0.5 * rel
            win.BackgroundTransparency = 1 - op
            sVal.Text = _3x.floor(op * 100) .. "%"
        end
        local hit = new("TextButton", { Text = "", BackgroundTransparency = 1, Size = UDim2.new(1, -24, 0, 22), Position = UDim2.fromOffset(12, 23) }, r)
        local dragging = false
        local function fromX(x) setOpacity((x - track.AbsolutePosition.X) / track.AbsoluteSize.X) end
        hit.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                fromX(input.Position.X)
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end)
        _D.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                fromX(input.Position.X)
            end
        end)
    end

    -- accent swatches
    local swatches = {}
    do
        local r = srow(36)
        txt(r, "Accent theme", 11, TXT, Enum.Font.GothamMedium, { Position = UDim2.fromOffset(12, 0), Size = UDim2.new(1, -130, 1, 0) })
        for i, a in ipairs(ACCENTS) do
            local b = new("TextButton", {
                Size = UDim2.fromOffset(20, 20), Position = UDim2.new(1, -(12 + (#ACCENTS - i + 1) * 26 - 6), 0.5, -10),
                BackgroundColor3 = a[2], Text = "", AutoButtonColor = false, BorderSizePixel = 0,
            }, r)
            corner(b, 10)
            local sg = new("UIGradient", { Rotation = 45, Color = ColorSequence.new(a[2], a[3]) }, b)
            local st = stroke(b, Color3.new(1, 1, 1), 1.5, i == 1 and 0 or 1)
            swatches[i] = { btn = b, stroke = st }
            b.MouseButton1Click:Connect(function() UI.applyTheme(i) end)
        end
    end

    -- action buttons
    do
        local r = srow(36)
        r.BackgroundTransparency = 1
        for _, c in ipairs(r:GetChildren()) do if c:IsA("UIStroke") then c:Destroy() end end
        local reset = button(r, "RESET STATS", UDim2.new(0.5, -3, 1, 0), UDim2.new(), false)
        local unload = button(r, "UNLOAD", UDim2.new(0.5, -3, 1, 0), UDim2.new(0.5, 3, 0, 0), false)
        unload.TextColor3 = BAD
        reset.MouseButton1Click:Connect(function()
            S.captured, S.redeemed, S.failed = 0, 0, 0
            capNum.Text, redNum.Text, failNum.Text = "0", "0", "0"
            lastVal.Text = "-"
            toast("Stats reset", A1)
        end)
        unload.MouseButton1Click:Connect(function()
            if _P.unload then _P.unload() else gui:Destroy() end
        end)
    end

    -- ===== LOGS PAGE =====
    local entriesLbl = txt(logP, "0 entries", 10, SUB, Enum.Font.GothamMedium, { Position = UDim2.fromOffset(2, 0), Size = UDim2.new(0.4, 0, 0, 24) })
    local copyBtn = button(logP, "COPY", UDim2.fromOffset(50, 22), UDim2.new(1, -108, 0, 1), false)
    local clearBtn = button(logP, "CLEAR", UDim2.fromOffset(50, 22), UDim2.new(1, -52, 0, 1), false)
    local logBox = new("ScrollingFrame", {
        Position = UDim2.fromOffset(0, 28), Size = UDim2.new(1, 0, 1, -28), BackgroundColor3 = Color3.fromRGB(5, 5, 8),
        BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = SUB, CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y,
    }, logP)
    corner(logBox, 8)
    stroke(logBox, LINE, 1)
    new("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder }, logBox)
    new("UIPadding", { PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 6), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8) }, logBox)

    local entries, logCount = {}, 0
    local function addLog(msg, col)
        if not gui.Parent then return end
        col = col or Color3.fromRGB(190, 190, 200)
        local stamp = os.date("%H:%M:%S")
        history[#history + 1] = "[" .. stamp .. "] " .. msg
        logCount = logCount + 1
        local e = txt(logBox, "[" .. stamp .. "] " .. msg, 10, col, Enum.Font.Code, {
            Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, TextWrapped = true,
            TextYAlignment = Enum.TextYAlignment.Top, LayoutOrder = logCount,
        })
        entries[#entries + 1] = e
        if #entries > 80 then
            local old = table.remove(entries, 1)
            old:Destroy()
        end
        entriesLbl.Text = #entries .. " entries"
        task.delay(0.03, function()
            if logBox.Parent then logBox.CanvasPosition = Vector2.new(0, logBox.AbsoluteCanvasSize.Y) end
        end)
    end
    UI.log = addLog

    clearBtn.MouseButton1Click:Connect(function()
        for _, e in ipairs(entries) do e:Destroy() end
        entries, history = {}, {}
        entriesLbl.Text = "0 entries"
        toast("Log cleared", A1)
    end)
    copyBtn.MouseButton1Click:Connect(function()
        if type(setclipboard) == "function" then
            pcall(setclipboard, table.concat(history, "\n"))
            toast("Log copied to clipboard", GOOD)
        else
            toast("Clipboard not supported", WARN)
        end
    end)

    -- ===== status / stats =====
    function UI.setStatus(on)
        local c = on and GOOD or BAD
        sTxt.Text = on and "Scanning" or "Disabled"
        sTxt.TextColor3 = on and TXT or SUB
        tw(sDot, { BackgroundColor3 = c })
        tw(halo, { BackgroundColor3 = c })
        tw(footDot, { BackgroundColor3 = c })
        footTxt.Text = on and "Scanning for codes" or "Idle - auto code off"
    end

    local function refreshStats()
        capNum.Text, redNum.Text, failNum.Text = tostring(S.captured), tostring(S.redeemed), tostring(S.failed)
    end

    -- called by the (unchanged) logic through _P.b
    function UI.handle(msg, col)
        local a, b = msg:match("^Pasted (%d+)/(%d+)")
        if a and tonumber(a) >= tonumber(b) then S.captured = S.captured + 1 end
        if msg:find("^Redeemed") then
            S.redeemed = S.redeemed + 1
            local code = msg:match("^Redeemed:%s*(.*)")
            if code and code ~= "" then lastVal.Text = code end
            toast("Redeemed " .. (code or ""), GOOD)
        elseif msg:find("^Failed") then
            S.failed = S.failed + 1
            toast(msg, BAD)
        elseif msg:find("^Invalid") then
            S.failed = S.failed + 1
            toast("Invalid code - repasted", WARN)
        end
        refreshStats()
        addLog(msg, col)
    end

    -- manual redeem
    local busy = false
    local function manual()
        if busy then return end
        local code = (codeBox.Text:gsub("%s", ""))
        if code == "" then toast("Enter a code first", WARN) return end
        busy = true
        task.spawn(function()
            addLog("Manual: " .. code, A1)
            local pok, ok, msg = pcall(_W, code)
            if pok and ok then
                S.redeemed = S.redeemed + 1
                lastVal.Text = code
                addLog("Redeemed: " .. code, GOOD)
                toast("Submitted " .. code, GOOD)
            else
                S.failed = S.failed + 1
                addLog("Failed: " .. tostring(pok and msg or ok), BAD)
                toast("Failed: " .. tostring(pok and msg or ok), BAD)
            end
            refreshStats()
            busy = false
        end)
    end
    redeemBtn.MouseButton1Click:Connect(manual)
    codeBox.FocusLost:Connect(function(enter) if enter then manual() end end)

    -- ===== theming =====
    function UI.applyTheme(i)
        curIdx = i
        A1, A2 = ACCENTS[i][2], ACCENTS[i][3]
        for _, g in ipairs(themedGrads) do g.Color = ColorSequence.new({ CSK(0, A1), CSK(0.5, A2), CSK(1, A1) }) end
        for _, sw in ipairs(switches) do sw.refresh() end
        for _, f in ipairs(refreshers) do f() end
        for k, s in ipairs(swatches) do tw(s.stroke, { Transparency = k == i and 0 or 1 }) end
        tBar.BackgroundColor3 = A1
    end

    -- ===== tabs =====
    local function selectTab(i)
        tw(ind, { Position = UDim2.new((i - 1) / 3, 3, 0, 3) }, 0.25, Enum.EasingStyle.Quint)
        for k, b in ipairs(tabBtns) do tw(b, { TextColor3 = k == i and DARK or SUB }, 0.15) end
        for k, p in ipairs(pageList) do
            if k == i then
                p.Position = UDim2.fromOffset(12, 0)
                p.Visible = true
                tw(p, { Position = UDim2.fromOffset(0, 0) }, 0.22, Enum.EasingStyle.Quint)
            else
                p.Visible = false
            end
        end
    end
    for i, b in ipairs(tabBtns) do b.MouseButton1Click:Connect(function() selectTab(i) end) end

    -- ===== window controls =====
    local minimized = false
    minBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        minBtn.Text = minimized and "+" or "-"
        tw(win, { Size = UDim2.fromOffset(280, minimized and 42 or 360) }, 0.28, Enum.EasingStyle.Quint)
    end)
    closeBtn.MouseButton1Click:Connect(function()
        tw(win, { Size = UDim2.fromOffset(280, 0) }, 0.2)
        task.delay(0.22, function()
            if _P.unload then _P.unload() else gui:Destroy() end
        end)
    end)
    _D.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.RightControl then win.Visible = not win.Visible end
    end)

    -- ===== animation tick =====
    local acc = 0
    function UI.tick(dt)
        ringGrad.Rotation = (ringGrad.Rotation + dt * 90) % 360
        if _L.a then
            halo.BackgroundTransparency = 0.78 + 0.12 * _3x.sin(os.clock() * 3.2)
        else
            halo.BackgroundTransparency = 0.9
        end
        acc = acc + dt
        if acc >= 1 then
            acc = 0
            local t = _3x.floor(os.clock() - startClock)
            local h, m, s = _3x.floor(t / 3600), _3x.floor(t % 3600 / 60), t % 60
            upVal.Text = h > 0 and string.format("%d:%02d:%02d", h, m, s) or string.format("%02d:%02d", m, s)
        end
    end

    -- ===== init =====
    UI.setStatus(_L.a)
    selectTab(1)
    local fullSize = win.Size
    win.Size = UDim2.fromOffset(280, 0)
    tw(win, { Size = fullSize }, 0.45, Enum.EasingStyle.Back)
    addLog("ThunderHub loaded", A1)
    addLog(_L.a and "Scanning for codes..." or "Auto code is OFF", _L.a and GOOD or SUB)

    return UI
end

local _UI = _BuildUI()
local _Y = _UI.gui

_P.b = function(msg, col)
    if not _L.a then return end
    if msg == _L.s then return end
    _L.s = msg
    pcall(_UI.handle, msg, col or Color3.fromRGB(190, 190, 200))
end
_P.log = _UI.log

local _hb = _C.Heartbeat:Connect(function(dt) pcall(_UI.tick, dt) end)

local function _aH()_L.g={}end

local function _aI()
    if _L.i then pcall(function()_L.i:Disconnect()end)end
    if _L.j then pcall(function()_L.j:Disconnect()end)end
    for _,conn in ipairs(_L.k)do pcall(function()conn:Disconnect()end)end
    _L.i=nil
    _L.j=nil
    _L.k={}
    _L.h=nil
end

local function _aJ(box)
    if not box or _L.h==box then return end
    _aI()
    _L.h=box
    if box.Text~=""then _L.n=box.Text end
    _L.i=box:GetPropertyChangedSignal("Text"):Connect(function()
        if box.Text==""then _aH()else _L.n=box.Text end
    end)
    _L.j=box.AncestryChanged:Connect(function(_,parent)
        if not parent then _aH()_aI()end
    end)
end

_D.TextBoxFocused:Connect(function(box)
    if box:IsDescendantOf(_Y)then return end
    if box~=_X()then return end
    _L.c=box
    _L.d=box
    _aJ(box)
    if _L.a then _P.b("Ready",Color3.fromRGB(70,210,100))end
end)

_D.TextBoxFocusReleased:Connect(function(box)
    if box:IsDescendantOf(_Y)then return end
    local cb=_X()
    if box~=cb and box~=_L.d then return end
    if _L.l and (box==cb or box==_L.d)then
        local text=box.Text~=""and box.Text or _L.n
        if _L.o and os.clock()<=_L.q then return end
        _L.r=_L.r+1
        local token=_L.r
        _L.o=text
        _L.p=box
        _L.q=os.clock()+8
        _6x(8,function()if token==_L.r then _L.o=nil _L.p=nil _L.q=0 end end)
    end
    if _L.c==box then
        _L.c=nil
        if _L.a then _P.b((_L.d and _L.d.Parent)and"Ready"or"Click code box first",(_L.d and _L.d.Parent)and Color3.fromRGB(70,210,100)or Color3.fromRGB(120,120,130))end
    end
end)

local function _aK(box,text)
    if not _L.l or not text or text==""then return false end
    _C.Heartbeat:Wait()
    local cb=_X()or box
    if not cb or not _R(cb)then return false end
    local ok=pcall(function()cb.Text=text end)
    if ok then _L.d=cb _aJ(cb)end
    return ok
end

local function _aL(text,obj)
    if not _L.l or not _L.o then return end
    if os.clock()>_L.q then _L.o=nil _L.p=nil _L.q=0 return end
    if obj and obj:IsDescendantOf(_Y)then return end
    local lower=tostring(text or""):lower()
    local rej=lower:find("invalid code",1,true)or lower:find("code is invalid",1,true)or lower:find("expired",1,true)or lower:find("already redeemed",1,true)or lower:find("already used",1,true)or lower:find("doesn't exist",1,true)or lower:find("does not exist",1,true)or lower:find("not found",1,true)or lower:find("rejected",1,true)
    if not rej then return end
    local pt=_L.o
    local pb=_L.p
    local rs=_aK(pb,pt)
    _L.o=nil _L.p=nil _L.q=0
    if rs then _P.b("Invalid - repasted: "..pt,Color3.fromRGB(190,190,196))end
end

local function _aM(text)
    if not text or text==""then return end
    if not _L.a then return end
    if _L.h and not _R(_L.h)then _aH()_aI()end
    local box=_X()
    _L.g[#_L.g+1]=text
    local comb=_2x.concat(_L.g)
    local cnt=#_L.g
    if box then
        _L.d=box
        _aJ(box)
        local fcs=_D:GetFocusedTextBox()==box
        box.Text=comb
        if fcs then pcall(function()local p=#comb+1 box.CursorPosition=p box.SelectionStart=p end)end
    else _P.b("Captured; opening UI...",Color3.fromRGB(190,190,196))end
    _P.b("Pasted "..tostring(cnt).."/"..tostring(_L.f),Color3.fromRGB(70,210,100))
    if cnt>=_L.f then
        _L.g={}
        if _L.e then
            local ok,msg=_W(comb)
            if ok then _P.b("Redeemed: "..comb,Color3.fromRGB(70,210,100))
            else
                local rs=_aK(box,comb)
                if rs then _P.b("Invalid - repasted: "..comb,Color3.fromRGB(190,190,196))
                else _P.b("Failed: "..tostring(msg),Color3.fromRGB(255,70,70))end
            end
        end
    end
end

local function _aN(obj)
    if not(obj:IsA("TextLabel")or obj:IsA("TextButton"))then return end
    _aL(obj.Text or"",obj)
    obj:GetPropertyChangedSignal("Text"):Connect(function()_aL(obj.Text or"",obj)end)
end

for _,obj in ipairs(_G.b:GetDescendants())do _aN(obj)end
_G.b.DescendantAdded:Connect(function(obj)_5x(0.04)_aN(obj)end)

local function _aO()
    if _G.PhiNotifyRemote then return _G.PhiNotifyRemote end
    local pk=_B:WaitForChild("Packages",15)
    if not pk then return nil end
    local net=pk:WaitForChild("Net",15)
    if not net then return nil end
    local info=debug and(debug.getinfo or debug.info)
    if getgc and info and _N then
        for _,d in ipairs(net:GetDescendants())do
            if d:IsA("RemoteEvent")then
                local ok,cs=pcall(_N,d.OnClientEvent)
                if ok then
                    for _,c in ipairs(cs)do
                        local f,fn=pcall(function()return c.Function end)
                        if f and type(fn)=="function"then
                            local i,inf=pcall(info,fn)
                            if i and tostring(inf.short_src or inf.source or""):find("NotificationController",1,true)then return d end
                        end
                    end
                end
            end
        end
    end
    return nil
end

local function _aP(t)
    if type(t)~="string"then return tostring(t)end
    return(t:gsub("<[^>]->",""))
end

local function _aQ(t)
    local words={}
    for word in t:gmatch("[%w_]+")do words[#words+1]=word end
    return words
end

local _aR={}
local _aS=1

local function _aT(...)
    if not _L.a then return end
    local text=_aP(tostring((...)or""))
    text=text:match("^%s*(.-)%s*$")or""
    if text==""or text:find("%s")then return end
    for _,word in ipairs(_aQ(text))do _aR[#_aR+1]=word end
    local parts={}
    for i=1,_3x.min(#_aR,_aS)do parts[i]=_aR[i]end
    if #_aR<_aS then return end
    _aR={}
    local captured=_2x.concat(parts)
    if captured==""or _L.b[captured]then return end
    _L.b[captured]=true
    _6x(1.25,function()_L.b[captured]=nil end)
    _aM(captured)
end

local _aU=_aO()
local _aV

if _aU then
    if getgenv then
        local prev=getgenv().LevithonCodeRedeemerNotifyConnection
        if prev then pcall(function()prev:Disconnect()end)end
    end
    _aV=_aU.OnClientEvent:Connect(function(...)pcall(_aT,...)end)
    if getgenv then getgenv().LevithonCodeRedeemerNotifyConnection=_aV end
end


if not _aU then
    _P.log("Notify remote not found - manual redeem still works", Color3.fromRGB(255,190,60))
end

local function _Stop()
    if _aV then pcall(function()_aV:Disconnect()end)_aV=nil end
    if getgenv then
        local g=getgenv()
        if g.LevithonCodeRedeemerNotifyConnection then pcall(function()g.LevithonCodeRedeemerNotifyConnection:Disconnect()end)g.LevithonCodeRedeemerNotifyConnection=nil end
    end
    pcall(function()_hb:Disconnect()end)
    pcall(_aI)
    if _Y then _Y:Destroy()end
end
_P.unload=_Stop

if getgenv then
    getgenv().StopAura=_Stop
    getgenv().StopThunderHub=_Stop
end
