-- [[ REZX AI - RANDA SYSTEM ]] --

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local MinBtn = Instance.new("TextButton")
local Content = Instance.new("Frame")
local MiniFrame = Instance.new("TextButton") -- Ini kotak hitam pas dikecilin

-- Parent ke CoreGui biar aman
ScreenGui.Name = "RandaSystem"
ScreenGui.Parent = game:GetService("CoreGui")

-- [ LOGIC DRAGGABLE ] --
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

-- [ STYLE MAIN FRAME ] --
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.BorderSizePixel = 0

local Corner = Instance.new("UICorner", MainFrame)

-- [ STYLE TOP BAR ] --
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TopBar.Size = UDim2.new(1, 0, 0, 30)
Instance.new("UICorner", TopBar)

Title.Parent = TopBar
Title.Text = "RANDA EXECUTOR"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 14

-- [ BUTTON CLOSE X ] --
CloseBtn.Parent = TopBar
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Position = UDim2.new(1, -25, 0, 5)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", CloseBtn)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- [ BUTTON MINIMIZE - ] --
MinBtn.Parent = TopBar
MinBtn.Text = "-"
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinBtn.Position = UDim2.new(1, -50, 0, 5)
MinBtn.Size = UDim2.new(0, 20, 0, 20)
MinBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", MinBtn)

-- [ MINI FRAME (KOTAK HITAM RANDA) ] --
MiniFrame.Name = "MiniFrame"
MiniFrame.Parent = ScreenGui
MiniFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MiniFrame.Size = UDim2.new(0, 100, 0, 40)
MiniFrame.Position = UDim2.new(0.05, 0, 0.05, 0)
MiniFrame.Text = "Randa"
MiniFrame.TextColor3 = Color3.new(1, 1, 1)
MiniFrame.Font = Enum.Font.SourceSansBold
MiniFrame.Visible = false
Instance.new("UICorner", MiniFrame)
MiniFrame.Draggable = true -- Biar kotak kecilnya juga bisa digeser

-- [ LOGIC MINIMIZE ] --
MinBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MiniFrame.Visible = true
end)

MiniFrame.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MiniFrame.Visible = false
end)
