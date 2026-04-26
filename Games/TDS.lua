local ggchannel = require(game.ReplicatedStorage.Resources.Universal.NewNetwork).Channel("GatlingGun")
local gganim = require(game:GetService("ReplicatedStorage").Content.Tower["Gatling Gun"].Animator)
getgenv().gatlingcooldown = 0.01
getgenv().multiplytimes = 60
getgenv().norecoil = false
gganim._fireGun = function(arg1)
        local stores = require(game:GetService("ReplicatedStorage").Client.Interfaces.Stores)
        local camcontroller = require(game:GetService("ReplicatedStorage").Content.Tower["Gatling Gun"].Animator.CameraController)
        local minigun = arg1.Replicator:Get("Minigun")
        if minigun then
            local canfire = arg1.Replicator:Get("CanFire")
        end
        if not arg1.Replicator:Get("Minigun") and true or canfire then
            arg1:_fire(camcontroller.position)
            if not getgenv().norecoil then
            stores.CrosshairStore.store:dispatch({
                ["type"] = "addSpread",
                ["spread"] = arg1.Stats.Attributes.SpreadAdd or 10
            })
            camcontroller.recoil(arg1.Stats.Attributes.Recoil or 0.03)
            end
        end
        local camposition = camcontroller.result and camcontroller.result.Position or camcontroller.position
        for i = 1, getgenv().multiplytimes do
                ggchannel:fireServer("Fire", camposition, workspace:GetAttribute("Sync"), workspace:GetServerTimeNow())
        end
        arg1:Wait(getgenv().gatlingcooldown)
    end
    
local Library, SaveManager, InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunUwU/Scripts/main/Library/Fluent.lua"))()

local Window = Library:CreateWindow({
    Title = "XA Hub",
    SubTitle = "TDS",
    TabWidth = 160,
    Size = UDim2.fromOffset(550, 350),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tab = Window:AddTab({Title = "修改机枪", Icon = ""})

Tab:AddToggle("Toggle", {
    Title = "开关",
    Default = getgenv().norecoil,
    Callback = function(Value)
        getgenv().norecoil = Value
    end
})

Tab:AddSlider("Slider", {
    Title = "修改射速",
    Default = getgenv().gatlingcooldown,
    Min = 0,
    Max = 1,
    Rounding = 0.01,
    Callback = function(value)
     getgenv().gatlingcooldown = value
    end
})

Tab:AddSlider("Slider", {
    Title = "修改子弹",
    Default = getgenv().multiplytimes,
    Min = 0,
    Max = 600,
    Rounding = 1,
    Callback = function(value)
     getgenv().multiplytimes = value
    end
})

local Settings = Window:AddTab({Title = "设置", Icon = "settings"})

InterfaceManager:SetLibrary(Library)
InterfaceManager:SetFolder("XA-Hub/Fluent")
InterfaceManager:BuildInterfaceSection(Settings)
SaveManager:SetLibrary(Library)
SaveManager:SetFolder("XA-Hub/Fluent/"..game.PlaceId)
SaveManager:IgnoreThemeSettings()
SaveManager:BuildConfigSection(Settings)
SaveManager:LoadAutoloadConfig()
Window:SelectTab(1)
