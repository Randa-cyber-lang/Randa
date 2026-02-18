-- [[ REZX AI - ANTI MENTAL & KNOCKBACK ]] --
-- Mode: Physical Anchor

local ScreenGui = Instance.new("ScreenGui")
local FloatingBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Name = "RezxAntiMental"
ScreenGui.Parent = game:GetService("CoreGui")

-- [[ TOMBOL RANDA ]] --
FloatingBtn.Name = "RandaToggle"
FloatingBtn.Parent = ScreenGui
FloatingBtn.Size = UDim2.new(0, 70, 0, 70)
FloatingBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
FloatingBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FloatingBtn.Text = "Randa"
FloatingBtn.TextColor3 = Color3.new(1, 1, 1)
FloatingBtn.Font = "GothamBold"
FloatingBtn.Draggable = true 
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = FloatingBtn

local isAntiMental = false

FloatingBtn.MouseButton1Click:Connect(function()
    isAntiMental = not isAntiMental
    local char = game.Players.LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    
    if isAntiMental then
        FloatingBtn.BackgroundColor3 = Color3.fromRGB(255, 85, 0) -- Oranye (Anti-Mental ON)
        FloatingBtn.Text = "FIXED"
        
        task.spawn(function()
            while isAntiMental do
                if hrp then
                    -- 1. MATIKAN SEMUA TENAGA LUAR (Anti-Knockback)
                    hrp.Velocity = Vector3.new(0, 0, 0)
                    hrp.RotVelocity = Vector3.new(0, 0, 0)
                    
                    -- 2. HANCURKAN SENSOR "sedang perlambat"
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v.Name == "sedang perlambat" then
                            v.CanTouch = false
                            v.CanCollide = false -- Biar airnya lewat doang tanpa nabrak
                        end
                    end
                end
                task.wait() -- Run super cepet biar gak sempet gerak
            end
        end)
    else
        FloatingBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        FloatingBtn.Text = "Randa"
    end
end)

