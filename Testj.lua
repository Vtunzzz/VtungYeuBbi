local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local attackRange = 99999 -- Phạm vi tấn công (đơn vị: studs)
local shooting = false -- Kiểm tra trạng thái bắn

-- Tìm mục tiêu trong phạm vi
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

-- Gửi sự kiện bắn
local function shootAtTarget(target)
    if not target or not target:FindFirstChild("HumanoidRootPart") then return end

    local targetPosition = target:FindFirstChild("HumanoidRootPart").Position
    local args = {
        [1] = character:WaitForChild("HumanoidRootPart").Position, -- Vị trí người chơi
        [2] = {
            [1] = target:FindFirstChild("HumanoidRootPart") -- Mục tiêu
        }
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/ShootGunEvent"):FireServer(unpack(args))
end

-- Tự động bắn khi có mục tiêu
local function autoShoot()
    while true do
        task.wait(0.01) -- Điều chỉnh tốc độ bắn (0.1 giây/lần)
        
        if not shooting then
            local target = findTarget()
            if target then
                shooting = true
                shootAtTarget(target)
                shooting = false
            end
        end
    end
end

-- Bắt đầu auto click
task.spawn(autoShoot)
