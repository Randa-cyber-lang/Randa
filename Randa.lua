-- [[ REZX AI CUSTOM GUI TEMPLATE ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🅞︎R҉e҉z҉x҉🅟︎ CUSTOM V1", "DarkTheme")

-- TABS
local Main = Window:NewTab("Main Features")
local Player = Window:NewTab("Player")
local Credits = Window:NewTab("Credits")

-- SECTION MAIN
local MainSection = Main:NewSection("Combat & Automation")

MainSection:NewButton("Kill Aura (Standard)", "Otomatis hit musuh terdekat", function()
    -- Masukkan logic Kill Aura yang gue kasih tadi di sini
    print("Kill Aura Activated")
end)

MainSection:NewToggle("Auto Clicker", "Klik sangat cepat", function(state)
    _G.AutoClick = state
    while _G.AutoClick do
        -- Logic klik (biasanya pake VirtualUser)
        game:GetService("VirtualUser"):ClickButton1(Vector2.new(0,0))
        task.wait(0.1)
    end
end)

-- SECTION PLAYER
local PlayerSection = Player:NewSection("Movement")

PlayerSection:NewSlider("Walkspeed", "Ubah kecepatan lari", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("JumpPower", "Ubah tinggi lompatan", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

PlayerSection:NewButton("Infinite Jump", "Lompat tanpa batas", function()
    local InfiniteJumpEnabled = true
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if InfiniteJumpEnabled then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
        end
    end)
end)

-- SECTION CREDITS
local CreditSection = Credits:NewSection("Created by Rezz")
CreditSection:NewLabel("Developer: Rezz")
CreditSection:NewLabel("AI Collaborator: Rezx AI")
