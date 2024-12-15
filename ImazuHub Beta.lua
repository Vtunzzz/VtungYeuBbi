if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
else
    game:GetService("Players").LocalPlayer:Kick("Do not Support, Please wait...")
end

---attackcd

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
local cooldownfastattack = tick()
    
local Farming = Tabs.Main:AddSection("Farming")


local listfastattack = {'Normal Attack','Fast Attack','Super Fast Attack'}

    local DropdownDelayAttack = Tabs.Main:AddDropdown("DropdownDelayAttack", {
        Title = "Select Fast Attack",
        Values = listfastattack,
        Multi = false,
        Default = 1,
    })
    DropdownDelayAttack:SetValue("Fast Attack")
    DropdownDelayAttack:OnChanged(function(Value)
    _G.FastAttackFaiFao_Mode = Value
	if _G.FastAttackFaiFao_Mode == "Fast Attack" then
		_G.Fast_Delay = 0.15
	elseif _G.FastAttackFaiFao_Mode == "Normal Attack" then
		_G.Fast_Delay = 0.25
	elseif _G.FastAttackFaiFao_Mode == "Super Fast Attack" then
		_G.Fast_Delay = 0.05
	end
end)

    local DropdownSelectWeapon = Tabs.Main:AddDropdown("DropdownSelectWeapon", {
        Title = "Weapon",
        Values = {'Melee','Sword','Blox Fruit'},
        Multi = false,
        Default = 1,
    })
    DropdownSelectWeapon:SetValue('Melee')
    DropdownSelectWeapon:OnChanged(function(Value)
        ChooseWeapon = Value
    end)
    task.spawn(function()
        while wait() do
            pcall(function()
                if ChooseWeapon == "Melee" then
                    for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.ToolTip == "Melee" then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                                SelectWeapon = v.Name
                            end
                        end
                    end
                elseif ChooseWeapon == "Sword" then
                    for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.ToolTip == "Sword" then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                                SelectWeapon = v.Name
                            end
                        end
                    end
                elseif ChooseWeapon == " Blox Fruit" then
                    for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.ToolTip == "Blox Fruit" then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                                SelectWeapon = v.Name
                            end
                        end
                    end
                else
                    for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.ToolTip == "Melee" then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                                SelectWeapon = v.Name
                            end
                        end
                    end
                end
            end)
        end
    end)
    
--select weapon
function EquipTool(ToolSe)
		if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
			local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
			wait(0.5)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
		end
	end
	
local SettingFarm = Tabs.Setting:AddSection("Setting Farming")

 local ToggleFastAttack = Tabs.Setting:AddToggle("ToggleFastAttack", {Title = "Fast Attack", Default = true })

    ToggleFastAttack:OnChanged(function(Value)
     _G.FastAttackFaiFao = Value
    end)
    Options.ToggleFastAttack:SetValue(true)

spawn(function()
	while wait(.5) do
		pcall(function()
			if _G.FastAttackFaiFao then
				repeat wait(_G.Fast_Delay)
					AttackNoCD()
				until not _G.FastAttackFaiFao
			end
		end)
	end
end)
local Camera = require(game.ReplicatedStorage.Util.CameraShaker)
Camera:Stop()




    local ToggleBringMob = Tabs.Setting:AddToggle("ToggleBringMob", {Title = "Bring Mob", Default = true })
    ToggleBringMob:OnChanged(function(Value)
        _G.BringMob = Value
    end)
    Options.ToggleBringMob:SetValue(true)
	task.spawn(function()
        while task.wait() do
        if _G.BringMob then
        pcall(function()
          for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
          if not string.find(v.Name,"Boss") and v.Name == MonFarm and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 350 then
          if InMyNetWork(v.HumanoidRootPart) then
            if InMyNetWork(v.HumanoidRootPart) then
          v.HumanoidRootPart.CFrame = FarmPos
          v.HumanoidRootPart.CanCollide = false
          v.HumanoidRootPart.Size = Vector3.new(1,1,1)
		  if v.Humanoid:FindFirstChild("Animator") then
			v.Humanoid.Animator:Destroy()
		end
          end
        end
          end
          end
          end)
        end
    end
        end)
      task.spawn(function()
        while true do wait()
        if setscriptable then
        setscriptable(game.Players.LocalPlayer,"SimulationRadius",true)
        end
        if sethiddenproperty then
        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
        end
        end
        end)
      function InMyNetWork(object)
      if isnetworkowner then
      return isnetworkowner(object)
      else
        if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
      return true
      end
      return false
      end
      end

    local ToggleBypassTP = Tabs.Setting:AddToggle("ToggleBypassTP", {Title = "Bypass Tp", Default = false })
    ToggleBypassTP:OnChanged(function(Value)
        BypassTP = Value
    end)
    Options.ToggleBypassTP:SetValue(false)


local ToggleRemove = Tabs.Setting:AddToggle("ToggleRemove", {Title = "Remove Dame Text", Default = true })
ToggleRemove:OnChanged(function(Value)
    FaiFaoRemovetext = Value
    end)
    Options.ToggleRemove:SetValue(true)

    spawn(function()
        while wait() do
            if FaiFaoRemovetext then
                game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
            else
                game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
            end
        end
        end)

        
local ToggleRemoveNotify = Tabs.Setting:AddToggle("ToggleRemoveNotify", {Title = "Remove All Notify", Default = false })
ToggleRemoveNotify:OnChanged(function(Value)
    RemoveNotify = Value
    end)
    Options.ToggleRemoveNotify:SetValue(false)

    spawn(function()
        while wait() do
            if RemoveNotify then
                game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
            else
                game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
            end
        end
    end)


hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Death), function() return end)
hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Respawn), function() return end)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local MainScreenGui = Instance.new("ScreenGui")
local ButtonScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
MainScreenGui.Name = "MainScreenGui"
MainScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ButtonScreenGui.Name = "ButtonScreenGui"
ButtonScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ImageButton.Parent = ButtonScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0) 
ImageButton.AnchorPoint = Vector2.new(0.5, 0) 
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Image = "rbxassetid://97737839773409"
UICorner.CornerRadius = UDim.new(1, 0) 
UICorner.Parent = ImageButton
UIStroke.Parent = ImageButton

local colors = {
    Color3.fromRGB(255, 165, 0),
}
local index = 1
spawn(function()
    while wait() do
        UIStroke.Color = colors[index]
        index = index % #colors + 1 
        wait(0.5) 
    end
end)
ImageButton.MouseButton1Click:Connect(function()
    
    local goal = {Rotation = 360} 
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Back) 
    local tween = TweenService:Create(ImageButton, tweenInfo, goal)

    tween:Play()
    tween.Completed:Connect(function()
        ImageButton.Rotation = 0 
        MainScreenGui.Enabled = not MainScreenGui.Enabled
    end)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
end)

local DiscordLib = {}
local TweenService = game:GetService("TweenService")
local Balaraja = Instance.new("ScreenGui")
Balaraja.Name = "Balaraja"
Balaraja.Parent = game.CoreGui
Balaraja.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local NotiFrame = Instance.new("Frame")
NotiFrame.Name = "NotiFrame"
NotiFrame.Parent = Balaraja
NotiFrame.AnchorPoint = Vector2.new(0.5, 0.5)
NotiFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotiFrame.BackgroundTransparency = 1
NotiFrame.Position = UDim2.new(1.2, 0, 0.0613496937, 0)
NotiFrame.Size = UDim2.new(0, 1632, 0 , 100)

local Notilistlayout = Instance.new("UIListLayout")

Notilistlayout.Name = "Notilistlayout"
Notilistlayout.Parent = NotiFrame
Notilistlayout.FillDirection = Enum.FillDirection.Vertical
Notilistlayout.SortOrder = Enum.SortOrder.LayoutOrder
Notilistlayout.Padding = UDim.new(0, 5)

function DiscordLib:Notification(text,text2,delays,logo)
    if logo == nil then
        logo = ""
    end
    if delays == nil then
        delays = 1
    end
    local TitleFrame = Instance.new("Frame")

    TitleFrame.Name = "TitleFrame"
    TitleFrame.Parent = NotiFrame
    TitleFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
    TitleFrame.Size = UDim2.new(0, 0, 0, 0)

    local Main_UiStroke = Instance.new("UIStroke")

    Main_UiStroke.Thickness = 1
    Main_UiStroke.Name = ""
    Main_UiStroke.Parent = TitleFrame
    Main_UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Main_UiStroke.LineJoinMode = Enum.LineJoinMode.Round
    Main_UiStroke.Color = Color3.fromRGB(255, 255, 255)
    Main_UiStroke.Transparency = 0

    TitleFrame:TweenSizeAndPosition(UDim2.new(0, 250-10, 0, 70),  UDim2.new(0.5, 0, 0.5,0), "Out", "Back", 0.3, true)

    local ConnerTitile = Instance.new("UICorner")

    ConnerTitile.CornerRadius = UDim.new(0, 4)
    ConnerTitile.Name = "ConnerTitile"
    ConnerTitile.Parent = TitleFrame

    local imagenoti = Instance.new("ImageLabel")

    imagenoti.Name = "imagenoti"
    imagenoti.Parent = TitleFrame
    imagenoti.AnchorPoint = Vector2.new(0.5, 0.5)
    imagenoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    imagenoti.Position = UDim2.new(0.135999978, 0, 0.5, 0)
    imagenoti.Size = UDim2.new(0, 50, 0, 50)
    imagenoti.BackgroundTransparency = 1
    imagenoti.Image = "http://www.roblox.com/asset/?id="..tostring(logo)

    local txdlid = Instance.new("TextLabel")
    local LableFrame = Instance.new("Frame")

    txdlid.Name = "txdlid"
    txdlid.Parent = TitleFrame
    txdlid.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
    txdlid.BackgroundTransparency = 1.000
    txdlid.Position = UDim2.new(0.25, 0, 0.15, 0)
    txdlid.Size = UDim2.new(0, 175, 0, 24)
    txdlid.Font = Enum.Font.LuckiestGuy	
    txdlid.TextColor3 = Color3.fromRGB(85, 170, 255)
    txdlid.TextSize = 13.000
    txdlid.Text = text
    txdlid.TextXAlignment = Enum.TextXAlignment.Left

    LableFrame.Name = "LableFrame"
    LableFrame.Parent = TitleFrame
    LableFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    LableFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LableFrame.BackgroundTransparency = 1.000
    LableFrame.Position = UDim2.new(0.625999987, 0, 0.620000005, 0)
    LableFrame.Size = UDim2.new(0, 175, 0, 25)

    local TextNoti = Instance.new("TextLabel")

    TextNoti.Name = "TextNoti"
    TextNoti.Parent = LableFrame
    TextNoti.Active = true
    TextNoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextNoti.BackgroundTransparency = 1.000
    TextNoti.Size = UDim2.new(0, 175, 0, 25)
    TextNoti.Font = Enum.Font.GothamBlack
    TextNoti.Text = text2
    TextNoti.TextScaled = true
    TextNoti.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextNoti.TextSize = 12.000
    TextNoti.TextXAlignment = Enum.TextXAlignment.Left

    repeat wait() until TitleFrame.Size == UDim2.new(0, 250-10, 0, 70)

    local Time = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIPadding = Instance.new("UIPadding")

    Time.Name = "Time"
    Time.Parent = TitleFrame
    Time.Active = true
    Time.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
    Time.BorderSizePixel = 0
    Time.Position = UDim2.new(0.0320000015, 0, 0.870000005, 0)
    Time.Size = UDim2.new(0, 236, 0, 3)

    UICorner.Parent = Time
    UICorner.CornerRadius = UDim.new(0, 7)
    UICorner.Name = ""

    UIPadding.Parent = NotiFrame
    UIPadding.PaddingLeft = UDim.new(0, 15)
    UIPadding.PaddingTop = UDim.new(0, 15)

    TweenService:Create(
        Time,
        TweenInfo.new(tonumber(delays), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
        {Size = UDim2.new(0, 0, 0, 3)} -- UDim2.new(0, 128, 0, 25)
    ):Play()
    delay(tonumber(delays),function()
        TweenService:Create(
            imagenoti,
            TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {ImageTransparency = 1} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextNoti,
            TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            txdlid,
            TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        wait(0.3)
        TweenService:Create(
            TitleFrame,
            TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 0, 0, 70)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        wait(0.3)
        TitleFrame:Destroy()
    end
    )
end 

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenLam2504/rblx/refs/heads/main/gay.lua"))()
    local Window = Fluent:CreateWindow({
    Title = "Imazu Hub " ,
    SubTitle = "Beta🫠",
    TabWidth = 160,
    Size = UDim2.fromOffset(530, 350),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    About = Window: AddTab({ Title = "information", Icon = "clipboard" }),
	Settings = Window:AddTab({ Title = "Settings", Icon = "cog" }),
	Main = Window:AddTab({ Title = "Auto Farm", Icon = "ghost" }),
    Race V4 = Window:AddTab*{Title = "Race V4", Icon = "" }),
}

local Options = Fluent.Options

'do'

Tabs.About:AddParagraph({
    Title = "Owner",
    Content = "Vtung_Teddy"
})
Tabs.About:AddParagraph({
    Title = "Version",
    Content = "1.0"
})
local Time = Tabs.About:AddParagraph({
    Title = "",
    Content = ""
})
local function UpdateOS()
    local date = os.date("*t")
    local hour = (date.hour) % 24
    local ampm = hour < 12 and "AM" or "PM"
    local timezone = string.format("%02i:%02i:%02i %s", ((hour -1) % 12) + 1, date.min, date.sec, ampm)
    local datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
    local LocalizationService = game:GetService("LocalizationService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local name = player.Name
    local result, code = pcall(function()
     return LocalizationService:GetCountryRegionForPlayerAsync(player)
     end)
     Time:SetDesc(datetime.." - "..timezone.." [" .. code .. "]")
    end
