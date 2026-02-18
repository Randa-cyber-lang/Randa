-- [[ REZX AI - RANDA SYSTEM V2 UPDATED ]] --

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local MinBtn = Instance.new("TextButton")
local MiniFrame = Instance.new("TextButton")
local Content = Instance.new("ScrollingFrame")
local Layout = Instance.new("UIListLayout")

-- Parent ke CoreGui
ScreenGui.Name = "RandaSystemV2"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- [ DRAGGABLE LOGIC ] --
local UIS = game:GetService("UserInputService")
local dragToggle, dragStart, startPos
local function updateInput(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
TopBar.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        dragToggle = true; dragStart = input.Position; startPos = MainFrame.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragToggle = false end end)
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType.Touch) then updateInput(input) end
end)

-- [ STYLE ] --
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 320)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
Instance.new("UICorner", MainFrame)

TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TopBar.Size = UDim2.new(1, 0, 0, 35)
Instance.new("UICorner", TopBar)

Title.Parent = TopBar
Title.Text = "REZX x RANDA V2"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 16

CloseBtn.Parent = TopBar
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Position = UDim2.new(1, -30, 0, 7)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", CloseBtn)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

MinBtn.Parent = TopBar
MinBtn.Text = "-"
MinBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MinBtn.Position = UDim2.new(1, -55, 0, 7)
MinBtn.Size = UDim2.new(0, 20, 0, 20)
MinBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", MinBtn)

Content.Parent = MainFrame
Content.Position = UDim2.new(0, 5, 0, 40)
Content.Size = UDim2.new(1, -10, 1, -45)
Content.BackgroundTransparency = 1
Content.CanvasSize = UDim2.new(0, 0, 2, 0)
Content.ScrollBarThickness = 2

Layout.Parent = Content
Layout.Padding = UDim.new(0, 5)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function createButton(name, color, callback)
    local btn = Instance.new("TextButton", Content)
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.BackgroundColor3 = color
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
end

-- [ FEATURES ] --

-- 1. Speed
createButton("Speed Hack (100)", Color3.fromRGB(50, 100, 200), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

-- 2. Infinite Jump
createButton("Infinite Jump", Color3.fromRGB(50, 150, 50), function()
    game:GetService("UserInputService").JumpRequest:Connect(function()
        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
    end)
end)

-- 3. DUPE ITEM (Fitur Request Lu)
createButton("DUPE HELD ITEM", Color3.fromRGB(150, 50, 200), function()
    local p = game.Players.LocalPlayer
    local tool = p.Character:FindFirstChildOfClass("Tool")
    if tool then
        local copy = tool:Clone()
        copy.Parent = p.Backpack
        print("Rezx: Duplicated " .. tool.Name)
    else
        warn("Rezx: Pegang itemnya dulu!")
    end
end)

-- 4. TP TO SAFE ZONE (Biar gak kena Tsunami)
createButton("TP to Safe Height", Color3.fromRGB(200, 150, 50), function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0)
        print("Rezx: Teleported Up!")
    end
end)

-- [ MINIMIZE ] --
MiniFrame.Parent = ScreenGui
MiniFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MiniFrame.Size = UDim2.new(0, 80, 0, 30)
MiniFrame.Position = UDim2.new(0, 10, 0, 10)
MiniFrame.Text = "Randa"
MiniFrame.TextColor3 = Color3.new(1, 1, 1)
MiniFrame.Visible = false
Instance.new("UICorner", MiniFrame)

MinBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false; MiniFrame.Visible = true end)
MiniFrame.MouseButton1Click:Connect(function() MainFrame.Visible = true; MiniFrame.Visible = false end)
