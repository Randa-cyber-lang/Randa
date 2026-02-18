local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Ganti "NamaScreenGuiLu" dan "NamaTombolLu" sesuai yang ada di Explorer game
-- Kalau lu buat GUI sendiri lewat script, pastikan jalurnya benar
local screenGui = PlayerGui:FindFirstChild("ScreenGui") -- Sesuaikan nama ScreenGui
local button = screenGui and screenGui:FindFirstChild("TextButton") -- Sesuaikan nama Button

if button then
    button.MouseButton1Click:Connect(function()
        local character = player.Character
        if character then
            local tool = character:FindFirstChildOfClass("Tool")
            if tool then
                local copy = tool:Clone()
                copy.Parent = player.Backpack
                print("Rezx System: Berhasil duplikat " .. tool.Name)
            else
                print("Rezx System: Pegang dulu itemnya!")
            end
        end
    end)
    print("Rezx System: Script Berhasil Terpasang ke Tombol.")
else
    print("Rezx System: Error! Tombol nggak ketemu. Cek lagi nama tombolnya.")
end
