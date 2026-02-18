local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TargetBox = Instance.new("TextBox")
local PlayButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "Rezx_Attack_V2"

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
MainFrame.Size = UDim2.new(0, 200, 0, 150)
MainFrame.Active = true
MainFrame.Draggable = true

-- Tombol X
CloseButton.Text = "X"
CloseButton.Parent = MainFrame
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.MouseButton1Click:Connect(function()
    _G.Attacking = false
    ScreenGui:Destroy()
end)

-- Tombol -
MinimizeButton.Text = "-"
MinimizeButton.Parent = MainFrame
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.MouseButton1Click:Connect(function()
    TargetBox.Visible = not TargetBox.Visible
    PlayButton.Visible = not PlayButton.Visible
    MainFrame.Size = TargetBox.Visible and UDim2.new(0, 200, 0, 150) or UDim2.new(0, 200, 0, 30)
end)

TargetBox.Parent = MainFrame
TargetBox.PlaceholderText = "Username Target"
TargetBox.Size = UDim2.new(0, 180, 0, 35)
TargetBox.Position = UDim2.new(0, 10, 0, 45)

PlayButton.Text = "MULAI HAJAR"
PlayButton.Parent = MainFrame
PlayButton.Size = UDim2.new(0, 180, 0, 45)
PlayButton.Position = UDim2.new(0, 10, 0, 90)
PlayButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
PlayButton.TextColor3 = Color3.new(1, 1, 1)

PlayButton.MouseButton1Click:Connect(function()
    local targetName = TargetBox.Text
    local player = game.Players.LocalPlayer
    
    _G.Attacking = not _G.Attacking
    PlayButton.Text = _G.Attacking and "STOP" or "MULAI HAJAR"
    PlayButton.BackgroundColor3 = _G.Attacking and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(0, 100, 200)

    while _G.Attacking do
        task.wait()
        local target = game.Players:FindFirstChild(targetName)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            -- Auto Walk/Teleport ke target
            player.Character.Humanoid:MoveTo(target.Character.HumanoidRootPart.Position)
            
            -- Auto Click/Hit
            local tool = player.Character:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate()
            end
        else
            warn("Target tidak ditemukan atau sedang respawn")
        end
    end
end)

