-- Swan Hub | by mobblockk
-- Delta Executor için Birleşik Hack Menüsü
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/DexHub/main/UI.lua"))()
local Window = Library.CreateLib("Swan Hub", "DarkTheme")

-- Branding
local function AddBranding(tab)
    tab:NewLabel("Swan Hub", "Right")
    tab:NewLabel("by mobblockk", "BottomRight")
end

-- RGB Kenarlık
local function RGBBorder(frame)
    local speed = 0.05
    while true do
        for i = 0, 1, 0.01 do
            frame.BorderColor3 = Color3.fromHSV(i, 1, 1)
            wait(speed)
        end
    end
end

-- Ana Menü
local MainTab = Window:NewTab("Oyun Seçimi")
local MainSection = MainTab:NewSection("Oyunlar")
AddBranding(MainTab)
spawn(function() RGBBorder(MainTab.Frame) end)

-- Oyunlar
local Games = {
    "Murder Mystery 2",
    "Blox Fruits",
    "Pet Simulator X",
    "Adopt Me",
    "Jailbreak",
    "Arsenal",
    "Tower of Hell",
    "Brookhaven",
    "Da Hood",
    "Phantom Forces"
}

-- Oyun Seçimi
for i, gameName in ipairs(Games) do
    MainSection:NewButton(gameName, "Hile menüsünü aç", function()
        Window:Notify("Oyun Seçildi", gameName .. " hileleri yükleniyor...")
        Window:Hide()
        
        local GameTab = Window:NewTab(gameName)
        local GameSection = GameTab:NewSection(gameName .. " Hileleri")
        AddBranding(GameTab)
        spawn(function() RGBBorder(GameTab.Frame) end)
        
        -- Hileler
        if gameName == "Murder Mystery 2" then
            GameSection:NewToggle("ESP", "Duvar arkası görme", function(state)
                if state then loadstring(game:HttpGet("https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/Releases/main/MurderMystery2HighlightESP"))() end
            end)
            GameSection:NewToggle("Auto Aim", "Otomatik nişan", function(state)
                if state then loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-Script/main/Aimbot.lua"))() end
            end)
            GameSection:NewButton("Auto Farm", "Otomatik coin", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CorruptedClan/BackOnTop/main/SyrHubRemastered.lua"))()
            end)
        elseif gameName == "Blox Fruits" then
            GameSection:NewToggle("Auto Farm", "Otomatik seviye", function(state)
                if state then loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))() end
            end)
        elseif gameName == "Pet Simulator X" then
            GameSection:NewToggle("Auto Farm Pets", "Otomatik pet", function(state)
                if state then loadstring(game:HttpGet("https://raw.githubusercontent.com/NeaPchX2/PetSimulatorX.lua/main/PetSimX.lua"))() end
            end)
        elseif gameName == "Adopt Me" then
            GameSection:NewToggle("Auto Collect", "Otomatik eşya", function(state)
                if state then loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptRUs/AdoptMe/main/AutoCollect.lua"))() end
            end)
        elseif gameName == "Jailbreak" then
            GameSection:NewToggle("Infinite Cash", "Sınırsız para", function(state)
                if state then loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Jailbreak.lua"))() end
            end)
        elseif gameName == "Arsenal" then
            GameSection:NewToggle("Aimbot", "Otomatik nişan", function(state)
                if state then loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-Script/main/Aimbot.lua"))() end
            end)
        elseif gameName == "Tower of Hell" then
            GameSection:NewToggle("God Mode", "Ölümsüzlük", function(state)
                if state then loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/Roblox/main/Tower%20Of%20Hell"))() end
            end)
        elseif gameName == "Brookhaven" then
            GameSection:NewToggle("Speed Hack", "Hızlı koşma", function(state)
                if state then loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptRUs/Brookhaven/main/SpeedHack.lua"))() end
            end)
        elseif gameName == "Da Hood" then
            GameSection:NewToggle("Aimlock", "Otomatik kilit", function(state)
                if state then loadstring(game:HttpGet("https://raw.githubusercontent.com/SeizureScript/SeizureSalad/main/dahoodaimlock.lua"))() end
            end)
        elseif gameName == "Phantom Forces" then
            GameSection:NewToggle("ESP", "Duvar arkası", function(state)
                if state then loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidHubz/PF-ESP/main/PF-ESP.lua"))() end
            end)
        end
        
        GameSection:NewButton("Ana Menüye Dön", "Geri dön", function()
            Window:Show()
            GameTab:Remove()
        end)
    end)
end
