local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local uiCorner = Instance.new("UICorner")
local uiGradient = Instance.new("UIGradient")

screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

frame.Parent = screenGui
frame.Size = UDim2.new(0.6, 0, 1, 0) -- Tăng chiều rộng và chiều cao
frame.Position = UDim2.new(0.25, 0, 0.25, 0) -- Căn giữa màn hình
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25) -- Màu nền cơ bản
frame.BorderColor3 = Color3.fromRGB(255, 255, 0) -- Viền màu vàng
frame.BorderSizePixel = 2 -- Độ dày viền

-- Thuộc tính ImageButton
local imageButton = Instance.new("ImageButton")
imageButton.Parent = screenGui

-- Đặt kích thước hình vuông
imageButton.Size = UDim2.new(0, 30, 0, 30) -- Cả chiều rộng và chiều cao đều bằng nhau
imageButton.Position = UDim2.new(0.05, 0, 0.2, 0) -- Vị trí nút
imageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Màu nền
imageButton.Image = "rbxassetid://70734752670140" -- Thay ID hình ảnh của bạn
imageButton.BorderSizePixel = 0 -- Không viền

-- Bo góc
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(1, 0) -- Bo tròn hoàn toàn
uiCorner.Parent = imageButton

-- Bo góc ImageButton
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = imageButton

-- Sự kiện khi nhấn ImageButton
imageButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible -- Bật/tắt Frame
end)

-- Hàm thêm tính năng kéo/thả
local function enableDrag(guiObject)
    local UIS = game:GetService('UserInputService')
    local dragToggle = false
    local dragStart = nil
    local startPos = nil

    local function updateInput(input)
        local delta = input.Position - dragStart
        local newPosition = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
        guiObject.Position = newPosition
    end

    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragToggle = true
            dragStart = input.Position
            startPos = guiObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateInput(input)
        end
    end)
end

-- Kích hoạt kéo/thả cho ImageButton và Frame
enableDrag(imageButton)
enableDrag(frame)
--Text
-- Thuộc tính MainFrame
-- Tạo mainFrame
local mainFrame = Instance.new("Frame")
mainFrame.Parent = frame
mainFrame.Size = UDim2.new(0, 27, 0, 27) -- Kích thước là 27 pixel cả chiều rộng và chiều cao
mainFrame.Position = UDim2.new(0, 10, 0, 10) 
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.BorderSizePixel = 0

-- Tạo UICorner để bo góc cho mainFrame
local uiCornerMainFrame = Instance.new("UICorner")
uiCornerMainFrame.CornerRadius = UDim.new(0, 5) -- Bo góc 5 pixel
uiCornerMainFrame.Parent = mainFrame

-- Thêm TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Parent = mainFrame
textLabel.Size = UDim2.new(1, 0, 1, 0) -- Bao phủ toàn bộ mainFrame
textLabel.BackgroundTransparency = 1 -- Nền trong suốt
textLabel.Text = "Main" -- Văn bản
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Màu chữ
textLabel.TextScaled = false -- Không tự động chỉnh kích thước chữ
textLabel.Font = Enum.Font.SourceSansBold -- Phông chữ
textLabel.TextSize = 20 -- Kích thước chữ là 14 (có thể chỉnh tùy ý)Bold -- Phông chữ

local mainFrame = Instance.new("Frame")
mainFrame.Parent = frame
mainFrame.Size = UDim2.new(0, 27, 0, 27) -- Kích thước là 27 pixel cả chiều rộng và chiều cao
mainFrame.Position = UDim2.new(0, 10, 0, 10) 
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.BorderSizePixel = 0

-- Tạo UICorner để bo góc cho mainFrame
local uiCornerMainFrame = Instance.new("UICorner")
uiCornerMainFrame.CornerRadius = UDim.new(0, 5) -- Bo góc 5 pixel
uiCornerMainFrame.Parent = mainFrame

local mainFrame = Instance.new("Frame")
mainFrame.Parent = frame
mainFrame.Size = UDim2.new(0, 27, 0, 27) -- Kích thước là 27 pixel cả chiều rộng và chiều cao
mainFrame.Position = UDim2.new(0, 10, 0, 10) 
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.BorderSizePixel = 0

-- Tạo UICorner để bo góc cho mainFrame
local uiCornerMainFrame = Instance.new("UICorner")
uiCornerMainFrame.CornerRadius = UDim.new(0, 5) -- Bo góc 5 pixel
uiCornerMainFrame.Parent = mainFrame

-- Tạo một Frame mới cho Item Farm
local itemFarmFrame = Instance.new("Frame")
itemFarmFrame.Parent = frame -- Đặt trong Frame chính
itemFarmFrame.Size = UDim2.new(0.9, 0, 0.8, 0) -- Điều chỉnh kích thước
itemFarmFrame.Position = UDim2.new(0.05, 0, 0.15, 0) -- Vị trí trong Frame chính
itemFarmFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Màu nền
itemFarmFrame.Visible = false -- Ẩn mặc định (hiển thị khi nhấn nút)

-- Bo góc cho Item Farm Frame
local uiCornerItemFarm = Instance.new("UICorner")
uiCornerItemFarm.CornerRadius = UDim.new(0, 8)
uiCornerItemFarm.Parent = itemFarmFrame

-- Nút chuyển đổi hiển thị Item Farm
local itemFarmButton = Instance.new("TextButton")
itemFarmButton.Parent = frame
itemFarmButton.Size = UDim2.new(0.2, 0, 0.1, 0)
itemFarmButton.Position = UDim2.new(0.4, 0, 0.05, 0)
itemFarmButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
itemFarmButton.Text = "Item Farm"
itemFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local uiCornerButton = Instance.new("UICorner")
uiCornerButton.CornerRadius = UDim.new(0, 8)
uiCornerButton.Parent = itemFarmButton

-- Sự kiện chuyển đổi hiển thị
itemFarmButton.MouseButton1Click:Connect(function()
    itemFarmFrame.Visible = not itemFarmFrame.Visible
end)

-- Hàm tạo tab
local function CreateTab(parent, tabName, tabPosition, tabSize)
    local tab = Instance.new("Frame")
    tab.Name = tabName
    tab.Parent = parent
    tab.Size = tabSize or UDim2.new(0, 100, 0, 30)
    tab.Position = tabPosition or UDim2.new(0, 0, 0, 0)
    tab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    local tabButton = Instance.new("TextButton")
    tabButton.Name = "TabButton"
    tabButton.Parent = tab
    tabButton.Size = UDim2.new(1, 0, 1, 0)
    tabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    tabButton.Text = tabName
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.Font = Enum.Font.SourceSans
    tabButton.TextSize = 14

    return tab, tabButton
end

-- Hàm chuyển tab
local function SwitchTabs(tabContainer, selectedTabName)
    for _, tab in pairs(tabContainer:GetChildren()) do
        if tab:IsA("Frame") then
            tab.Visible = (tab.Name == selectedTabName)
        end
    end
end

-- Tìm Main Frame của bạn (thay MainFrame bằng tên Frame chính của bạn)
local mainFrame = script.Parent:FindFirstChild("MainFrame") or Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Parent = script.Parent
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

-- Tạo container để hiển thị tab
local tabContainer = Instance.new("Frame")
tabContainer.Name = "TabContainer"
tabContainer.Parent = mainFrame
tabContainer.Size = UDim2.new(1, 0, 0.9, 0)
tabContainer.Position = UDim2.new(0, 0, 0.1, 0)
tabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- Tạo Tabs
local tab1, button1 = CreateTab(mainFrame, "Tab1", UDim2.new(0, 0, 0, 0))
local tab2, button2 = CreateTab(mainFrame, "Tab2", UDim2.new(0, 100, 0, 0))

-- Thêm nội dung vào từng Tab
local content1 = Instance.new("TextLabel")
content1.Parent = tabContainer
content1.Size = UDim2.new(1, 0, 1, 0)
content1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
content1.Text = "Nội dung Tab 1"
content1.TextColor3 = Color3.fromRGB(255, 255, 255)
content1.TextSize = 16
content1.Name = "Tab1"

local content2 = Instance.new("TextLabel")
content2.Parent = tabContainer
content2.Size = UDim2.new(1, 0, 1, 0)
content2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
content2.Text = "Nội dung Tab 2"
content2.TextColor3 = Color3.fromRGB(255, 255, 255)
content2.TextSize = 16
content2.Visible = false
content2.Name = "Tab2"

-- Kết nối sự kiện chuyển Tab
button1.MouseButton1Click:Connect(function()
    SwitchTabs(tabContainer, "Tab1")
end)

button2.MouseButton1Click:Connect(function()
    SwitchTabs(tabContainer, "Tab2")
end)

local screenGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("MainGui")
if not screenGui then
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MainGui"
    screenGui.Parent = game.Players.LocalPlayer.PlayerGui
end

local mainFrame = screenGui:FindFirstChild("MainFrame")
if not mainFrame then
    mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Parent = screenGui
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end
local function SwitchTabs(tabContainer, selectedTabName)
    for _, tab in pairs(tabContainer:GetChildren()) do
        if tab:IsA("TextLabel") or tab:IsA("Frame") then
            tab.Visible = (tab.Name == selectedTabName)
        end
    end
end
