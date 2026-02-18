local player = game.Players.LocalPlayer
local button = script.Parent

button.MouseButton1Click:Connect(function()
    local character = player.Character
    if not character then return end

    -- Mencari Tool yang sedang di-equip (sedang dipegang)
    local tool = character:FindFirstChildOfClass("Tool")

    if tool then
        -- Duplikasi tool tersebut
        local copy = tool:Clone()
        
        -- Masukkan hasil duplikat ke dalam Backpack agar bisa dipakai lagi
        copy.Parent = player.Backpack
        
        print("Brainrot berhasil diduplikasi: " .. tool.Name)
    else
        print("Lu belum pegang item brainrot-nya!")
    end
end)

