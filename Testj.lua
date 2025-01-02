local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local attackRange = 3000
local weaponName = "Gun" 


local function isHoldingWeapon()
    local backpack = player:WaitForChild("Backpack")
    local characterTool = character:FindFirstChildOfClass("Tool")
    return (characterTool and characterTool.Name == weaponName) or (backpack:FindFirstChild(weaponName) ~= nil)
end


local function findTarget()
    local closestTarget = nil
    local shortestDistance = attackRange

    for _, enemy in ipairs(workspace:WaitForChild("Enemies"):GetChildren()) do
        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
            local enemyPosition = enemy:FindFirstChild("HumanoidRootPart").Position
            local distance = (character:WaitForChild("HumanoidRootPart").Position - enemyPosition).Magnitude

            if distance < shortestDistance then
                closestTarget = enemy
                shortestDistance = distance
            end
        end
    end

    return closestTarget
end


local function attackTarget(target)
    if not target or not target:FindFirstChild("HumanoidRootPart") then return end

    local args = {
        [1] = character:WaitForChild("HumanoidRootPart").Position, -- Vị trí người chơi
        [2] = {
            [1] = target:FindFirstChild("HumanoidRootPart") -- Mục tiêu
        }
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/ShootGunEvent"):FireServer(unpack(args))
end


local function autoAttack()
    while true do
        task.wait(0.01) 
        if isHoldingWeapon() then
            local target = findTarget()
            if target then
                attackTarget(target)
            end
        end
    end
end

task.spawn(autoAttack)

local shootGunEvent = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/ShootGunEvent")

shootGunEvent.OnServerEvent:Connect(function(player, origin, targets)
    if typeof(origin) == "Vector3" and typeof(targets) == "table" then
        local character = player.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then return end

        for _, target in ipairs(targets) do
            local distance =
