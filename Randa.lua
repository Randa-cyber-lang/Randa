-- Tambahkan variabel ini di bagian "Variables de Estado"
local killAura = false
local killDistance = 20 -- Jarak radius serangan (bisa lu ubah)

-- Tambahkan button ini di bagian "Botones de Funciones"
createBtn("Kill Aura", Color3.fromRGB(200, 0, 0), function(s) 
    killAura = s 
end)

-- Masukkan logic ini ke dalam loop task.spawn lu tadi
task.spawn(function()
    while _G.Running do
        if killAura then
            local p = game.Players.LocalPlayer
            local char = p.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                for _, enemy in pairs(workspace:GetChildren()) do
                    -- Cek apakah objek itu player lain atau mob (punya Humanoid)
                    if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy ~= char then
                        local dist = (char.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                        if dist <= killDistance and enemy.Humanoid.Health > 0 then
                            
                            -- BAGIAN PENTING: Lu harus cari nama RemoteEvent attack gamenya
                            -- Contoh standar: 
                            local attackRemote = game:GetService("ReplicatedStorage"):FindFirstChild("Attack") 
                                               or char:FindFirstChildOfClass("Tool") and char:FindFirstChildOfClass("Tool"):FindFirstChild("RemoteClick")
                            
                            if attackRemote then
                                -- Eksekusi serangan tanpa ampun
                                attackRemote:FireServer(enemy.Humanoid) 
                            end
                        end
                    end
                end
            end
        end
        task.wait(0.1) -- Delay biar nggak gampang kedeteksi anti-cheat
    end
end)
