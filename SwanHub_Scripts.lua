-- SwanHub Script
-- Created by mobblockk

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- GUI Kütüphanesi (Örnek: Rayfield veya kendi GUI sistemin)
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- SwanHub Ana Menüsü
local Window = Rayfield:CreateWindow({
    Name = "SwanHub",
    LoadingTitle = "SwanHub Loading...",
    LoadingSubtitle = "by mobblockk",
    ConfigurationSaving = { Enabled = true, FolderName = "SwanHubConfig", FileName = "SwanHub" }
})

-- RGB Welcome Message
local function ShowWelcomeMessage()
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local WelcomeLabel = Instance.new("TextLabel", ScreenGui)
    WelcomeLabel.Size = UDim2.new(1, 0, 0.2, 0)
    WelcomeLabel.Position = UDim2.new(0, 0, 0.4, 0)
    WelcomeLabel.Text = "Welcome to SwanHub"
    WelcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    WelcomeLabel.TextScaled = true
    WelcomeLabel.BackgroundTransparency = 1
    WelcomeLabel.Font = Enum.Font.GothamBold

    -- RGB Animasyon
    spawn(function()
        while WelcomeLabel.Parent do
            for i = 0, 1, 0.01 do
                WelcomeLabel.TextColor3 = Color3.fromHSV(i, 1, 1)
                wait(0.05)
            end
        end
    end)

    -- 2 saniye sonra sil
    wait(2)
    local tween = TweenService:Create(WelcomeLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { TextTransparency = 1 })
    tween:Play()
    tween.Completed:Wait()
    ScreenGui:Destroy()
end

-- Menü Animasyonu
local function AnimateMenu()
    local Frame = Window.Frame
    Frame.Position = UDim2.new(0.5, 0, 1.5, 0) -- Ekran dışında başla
    local tween = TweenService:Create(Frame, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = UDim2.new(0.5, 0, 0.5, 0) })
    tween:Play()
end

-- Kalıcı "SwanHub" ve "by mobblockk" Yazıları
local function AddPermanentLabels()
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local SwanHubLabel = Instance.new("TextLabel", ScreenGui)
    SwanHubLabel.Size = UDim2.new(0.2, 0, 0.05, 0)
    SwanHubLabel.Position = UDim2.new(0.4, 0, 0, 0)
    SwanHubLabel.Text = "SwanHub"
    SwanHubLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SwanHubLabel.TextScaled = true
    SwanHubLabel.BackgroundTransparency = 1
    SwanHubLabel.Font = Enum.Font.GothamBold

    local MobblockkLabel = Instance.new("TextLabel", ScreenGui)
    MobblockkLabel.Size = UDim2.new(0.1, 0, 0.03, 0)
    MobblockkLabel.Position = UDim2.new(0.9, 0, 0.97, 0)
    MobblockkLabel.Text = "by mobblockk"
    MobblockkLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    MobblockkLabel.TextScaled = true
    MobblockkLabel.BackgroundTransparency = 1
    MobblockkLabel.Font = Enum.Font.Gotham
end

-- Script Başlangıcı
ShowWelcomeMessage()
AnimateMenu()
AddPermanentLabels()

-- Özellikler Sekmesi
local FeaturesTab = Window:CreateTab("Features", 4483362458)

-- Kill Aura
local KillAuraToggle = FeaturesTab:CreateToggle({
    Name = "Kill Aura",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            spawn(function()
                while Value do
                    if LocalPlayer.Character and LocalPlayer:GetAttribute("Role") == "Murderer" then
                        for _, player in ipairs(Players:GetPlayers()) do
                            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
                                local distance = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                if distance <= 10 then -- 10 stud mesafe
                                    -- Örnek: Oyuncuyu öldürme (oyununa göre özelleştir)
                                    player.Character.Humanoid.Health = 0
                                end
                            end
                        end
                    end
                    wait(0.1)
                end
            end)
        end
    end
})

-- Auto Farm
local AutoFarmToggle = FeaturesTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            spawn(function()
                while Value do
                    -- Örnek: Coin toplama (oyununa göre özelleştir)
                    for _, coin in ipairs(workspace:GetDescendants()) do
                        if coin.Name == "Coin" and coin:IsA("BasePart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = coin.CFrame
                            wait(0.5)
                        end
                    end
                    wait(1)
                end
            end)
        end
    end
})

-- ESP
local ESPToggle = FeaturesTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local highlight = Instance.new("Highlight", player.Character)
                    highlight.FillColor = player:GetAttribute("Role") == "Murderer" and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                end
            end
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Highlight") then
                    player.Character.Highlight:Destroy()
                end
            end
        end
    end
})

-- Trolling Tools
local TrollingTab = Window:CreateTab("Trolling", 4483362458)
local FlyToggle = TrollingTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local bodyVelocity = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            spawn(function()
                while Value do
                    bodyVelocity.Velocity = Vector3.new(0, 50, 0) -- Uçma hızı
                    wait()
                end
                bodyVelocity:Destroy()
            end)
        end
    end
})

-- Always Win Mode
local AlwaysWinToggle = FeaturesTab:CreateToggle({
    Name = "Always Win Mode",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            spawn(function()
                while Value do
                    local role = LocalPlayer:GetAttribute("Role")
                    if role == "Murderer" then
                        -- Katil için: Tüm oyuncuları öldür
                        for _, player in ipairs(Players:GetPlayers()) do
                            if player ~= LocalPlayer and player.Character then
                                player.Character.Humanoid.Health = 0
                            end
                        end
                    elseif role == "Sheriff" then
                        -- Şerif için: Katili bul ve vur
                        for _, player in ipairs(Players:GetPlayers()) do
                            if player:GetAttribute("Role") == "Murderer" and player.Character then
                                -- Örnek: Katili vur (oyununa göre özelleştir)
                                player.Character.Humanoid.Health = 0
                            end
                        end
                    end
                    wait(1)
                end
            end)
        end
    end
})

-- Teleport & Speed Hacks
local TeleportButton = FeaturesTab:CreateButton({
    Name = "Teleport to Random Player",
    Callback = function()
        local target = Players:GetPlayers()[math.random(1, #Players:GetPlayers())]
        if target ~= LocalPlayer and target.Character then
            LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
        end
    end
})

local SpeedSlider = FeaturesTab:CreateSlider({
    Name = "Speed",
    Range = {16, 100},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

-- Admin Panel
local AdminTab = Window:CreateTab("Admin Panel", 4483362458)
local NoclipToggle = AdminTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            spawn(function()
                while Value do
                    for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                    wait()
                end
            end)
        else
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
})

-- Forge Mode
local ForgeTab = Window:CreateTab("Forge Mode", 4483362458)
local ForgeButton = ForgeTab:CreateButton({
    Name = "Forge Knife",
    Callback = function()
        -- Örnek: Yeni bir bıçak oluştur (oyununa göre özelleştir)
        local knife = Instance.new("Tool", LocalPlayer.Backpack)
        knife.Name = "CustomKnife"
        -- Bıçak özellikleri ekle
    end
})

-- Animasyonlu Butonlar
for _, element in ipairs(Window.Frame:GetDescendants()) do
    if element:IsA("TextButton") then
        element.MouseEnter:Connect(function()
            local tween = TweenService:Create(element, TweenInfo.new(0.3), { BackgroundColor3 = Color3.fromRGB(100, 100, 255) })
            tween:Play()
        end)
        element.MouseLeave:Connect(function()
            local tween = TweenService:Create(element, TweenInfo.new(0.3), { BackgroundColor3 = Color3.fromRGB(50, 50, 50) })
            tween:Play()
        end)
    end
end

Rayfield:Notify({
    Title = "SwanHub Loaded",
    Content = "Welcome to SwanHub by mobblockk!",
    Duration = 5,
    Image = 4483362458
})
