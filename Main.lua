-- Roblox Delta Executor Script

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Защита от дублирования GUI
if CoreGui:FindFirstChild("TWKS_Hub") then
    CoreGui.TWKS_Hub:Destroy()
end

local TWKS_Hub = Instance.new("ScreenGui")
TWKS_Hub.Name = "TWKS_Hub"
TWKS_Hub.Parent = CoreGui
TWKS_Hub.ResetOnSpawn = false

--------------------------------------------------------------------------------
-- 1. СИСТЕМА КЛЮЧЕЙ (KEY SYSTEM GUI)
--------------------------------------------------------------------------------
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Size = UDim2.new(0, 300, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = TWKS_Hub

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.Text = "ENTER K-KEY!"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 20
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.BackgroundTransparency = 1
KeyTitle.Parent = KeyFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
KeyInput.Position = UDim2.new(0.1, 0, 0.3, 0)
KeyInput.PlaceholderText = "By WinterSmile"
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
KeyInput.BorderSizePixel = 0
KeyInput.Font = Enum.Font.SourceSans
KeyInput.TextSize = 16
KeyInput.Parent = KeyFrame

local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(0.8, 0, 0, 35)
CheckBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
CheckBtn.Text = "Enter"
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
CheckBtn.BorderSizePixel = 0
CheckBtn.Font = Enum.Font.SourceSansBold
CheckBtn.TextSize = 18
CheckBtn.Parent = KeyFrame

local IncorrectLabel = Instance.new("TextLabel")
IncorrectLabel.Size = UDim2.new(1, 0, 0, 30)
IncorrectLabel.Position = UDim2.new(0, 0, 0.82, 0)
IncorrectLabel.Text = "SON"
IncorrectLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
IncorrectLabel.TextSize = 16
IncorrectLabel.Font = Enum.Font.SourceSansBold
IncorrectLabel.BackgroundTransparency = 1
IncorrectLabel.Visible = false
IncorrectLabel.Parent = KeyFrame

--------------------------------------------------------------------------------
-- 2. ОСНОВНОЕ МЕНЮ (MAIN MENU GUI)
--------------------------------------------------------------------------------
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 350)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = TWKS_Hub

local MainTitle = Instance.new("TextLabel")
MainTitle.Size = UDim2.new(1, 0, 0, 40)
MainTitle.Text = "Winter Main Menu"
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.TextSize = 20
MainTitle.Font = Enum.Font.SourceSansBold
MainTitle.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
MainTitle.BorderSizePixel = 0
MainTitle.Parent = MainFrame

-- ФУНКЦИЯ 1: ESP (Подсветка игроков)
local EspBtn = Instance.new("TextButton")
EspBtn.Size = UDim2.new(0.9, 0, 0, 40)
EspBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
EspBtn.Text = "ESP (Highlight All)"
EspBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
EspBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EspBtn.Font = Enum.Font.SourceSans
EspBtn.TextSize = 16
EspBtn.BorderSizePixel = 0
EspBtn.Parent = MainFrame

local espEnabled = false
EspBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    EspBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(50, 50, 60)
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if espEnabled then
                if not player.Character:FindFirstChild("TWKS_ESP") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "TWKS_ESP"
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.Parent = player.Character
                end
            else
                if player.Character:FindFirstChild("TWKS_ESP") then
                    player.Character.TWKS_ESP:Destroy()
                end
            end
        end
    end
end)

-- ФУНКЦИЯ 2: Speed Hack (Изменение скорости)
local SpeedInput = Instance.new("TextBox")
SpeedInput.Size = UDim2.new(0.3, 0, 0, 40)
SpeedInput.Position = UDim2.new(0.05, 0, 0.3, 0)
SpeedInput.PlaceholderText = "16"
SpeedInput.Text = ""
SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
SpeedInput.BorderSizePixel = 0
SpeedInput.Font = Enum.Font.SourceSans
SpeedInput.TextSize = 16
SpeedInput.Parent = MainFrame

local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(0.57, 0, 0, 40)
SpeedBtn.Position = UDim2.new(0.38, 0, 0.3, 0)
SpeedBtn.Text = "Set Speed"
SpeedBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtn.Font = Enum.Font.SourceSans
SpeedBtn.TextSize = 16
SpeedBtn.BorderSizePixel = 0
SpeedBtn.Parent = MainFrame

SpeedBtn.MouseButton1Click:Connect(function()
    local val = tonumber(SpeedInput.Text)
    if val and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = val
    end
end)

-- ФУНКЦИЯ 3: Jump Power (Сила прыжка)
local JumpInput = Instance.new("TextBox")
JumpInput.Size = UDim2.new(0.3, 0, 0, 40)
JumpInput.Position = UDim2.new(0.05, 0, 0.45, 0)
JumpInput.PlaceholderText = "50"
JumpInput.Text = ""
JumpInput.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpInput.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
JumpInput.BorderSizePixel = 0
JumpInput.Font = Enum.Font.SourceSans
JumpInput.TextSize = 16
JumpInput.Parent = MainFrame

local JumpBtn = Instance.new("TextButton")
JumpBtn.Size = UDim2.new(0.57, 0, 0, 40)
JumpBtn.Position = UDim2.new(0.38, 0, 0.45, 0)
JumpBtn.Text = "Set JumpPower"
JumpBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
JumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpBtn.Font = Enum.Font.SourceSans
JumpBtn.TextSize = 16
JumpBtn.BorderSizePixel = 0
JumpBtn.Parent = MainFrame

JumpBtn.MouseButton1Click:Connect(function()
    local val = tonumber(JumpInput.Text)
    if val and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.UseJumpPower = true
        LocalPlayer.Character.Humanoid.JumpPower = val
    end
end)

-- ФУНКЦИЯ 4 (ДОП): Noclip (Прохождение сквозь стены)
local NoclipBtn = Instance.new("TextButton")
NoclipBtn.Size = UDim2.new(0.9, 0, 0, 40)
NoclipBtn.Position = UDim2.new(0.05, 0, 0.6, 0)
NoclipBtn.Text = "Noclip: OFF"
NoclipBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
NoclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipBtn.Font = Enum.Font.SourceSans
NoclipBtn.TextSize = 16
NoclipBtn.BorderSizePixel = 0
NoclipBtn.Parent = MainFrame

local noclipEnabled = false
NoclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    NoclipBtn.Text = noclipEnabled and "Noclip: ON" or "Noclip: OFF"
    NoclipBtn.BackgroundColor3 = noclipEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(50, 50, 60)
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- ФУНКЦИЯ 5 (ДОП): Infinite Jump (Бесконечный прыжок в воздухе)
local InfJumpBtn = Instance.new("TextButton")
InfJumpBtn.Size = UDim2.new(0.9, 0, 0, 40)
InfJumpBtn.Position = UDim2.new(0.05, 0, 0.75, 0)
InfJumpBtn.Text = "Infinite Jump: OFF"
InfJumpBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
InfJumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InfJumpBtn.Font = Enum.Font.SourceSans
InfJumpBtn.TextSize = 16
InfJumpBtn.BorderSizePixel = 0
InfJumpBtn.Parent = MainFrame

local infJumpEnabled = false
InfJumpBtn.MouseButton1Click:Connect(function()
    infJumpEnabled = not infJumpEnabled
    InfJumpBtn.Text = infJumpEnabled and "Infinite Jump: ON" or "Infinite Jump: OFF"
    InfJumpBtn.BackgroundColor3 = infJumpEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(50, 50, 60)
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

--------------------------------------------------------------------------------
-- ПРОВЕРКА КЛЮЧА
--------------------------------------------------------------------------------
local isDebounce = false

CheckBtn.MouseButton1Click:Connect(function()
    if isDebounce then return end
    
    if KeyInput.Text == "WinterPP" then
        KeyFrame.Visible = false
        MainFrame.Visible = true
    else
        isDebounce = true
        IncorrectLabel.Visible = true
        task.wait(2)
        IncorrectLabel.Visible = false
        isDebounce = false
    end
end)
