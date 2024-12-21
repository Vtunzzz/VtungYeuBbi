if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
else
    game:GetService("Players").LocalPlayer:Kick("Do not Support, Please wait...")
end


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Imazu Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

OrionLib:MakeNotification({
	Name = "Join Discord",
	Content = "Vtung",
	Image = "nil",
	Time = 5
})

Tab:AddButton({
	Name = "Farm",
	Callback = function()
      		print("nil")
  	end    
})
