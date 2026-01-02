-- Lynx Script Notification
-- Execute this in your Roblox executor

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LynxNotification"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = PlayerGui

-- Background overlay (black transparent)
local overlay = Instance.new("Frame")
overlay.Name = "Overlay"
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.Position = UDim2.new(0, 0, 0, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.3
overlay.BorderSizePixel = 0
overlay.ZIndex = 1
overlay.Parent = screenGui

-- Main notification window
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 200)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 2
mainFrame.Parent = screenGui

-- Add corner radius
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 15)
mainCorner.Parent = mainFrame

-- Gradient effect
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))
}
gradient.Rotation = 45
gradient.Parent = mainFrame

-- Border glow effect
local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(100, 150, 255)
border.Thickness = 2
border.Transparency = 0.3
border.Parent = mainFrame

-- Title Frame
local titleFrame = Instance.new("Frame")
titleFrame.Name = "TitleFrame"
titleFrame.Size = UDim2.new(1, 0, 0, 50)
titleFrame.Position = UDim2.new(0, 0, 0, 0)
titleFrame.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
titleFrame.BackgroundTransparency = 0.8
titleFrame.BorderSizePixel = 0
titleFrame.ZIndex = 3
titleFrame.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 15)
titleCorner.Parent = titleFrame

-- Lynx Logo/Icon (using emoji-like symbol)
local icon = Instance.new("TextLabel")
icon.Name = "Icon"
icon.Size = UDim2.new(0, 40, 0, 40)
icon.Position = UDim2.new(0, 10, 0, 5)
icon.BackgroundTransparency = 1
icon.Text = "⚡"
icon.TextColor3 = Color3.fromRGB(255, 255, 255)
icon.TextSize = 32
icon.Font = Enum.Font.GothamBold
icon.ZIndex = 4
icon.Parent = titleFrame

-- Title text
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 55, 0, 0)
title.BackgroundTransparency = 1
title.Text = "LYNX SCRIPT"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 4
title.Parent = titleFrame

-- Message text
local message = Instance.new("TextLabel")
message.Name = "Message"
message.Size = UDim2.new(1, -40, 0, 100)
message.Position = UDim2.new(0, 20, 0, 70)
message.BackgroundTransparency = 1
message.Text = "Script Lynx is currently\nunder temporary maintenance"
message.TextColor3 = Color3.fromRGB(220, 220, 220)
message.TextSize = 18
message.Font = Enum.Font.Gotham
message.TextWrapped = true
message.TextXAlignment = Enum.TextXAlignment.Center
message.TextYAlignment = Enum.TextYAlignment.Center
message.ZIndex = 4
message.Parent = mainFrame

-- Timer bar
local timerBar = Instance.new("Frame")
timerBar.Name = "TimerBar"
timerBar.Size = UDim2.new(1, -20, 0, 4)
timerBar.Position = UDim2.new(0, 10, 1, -15)
timerBar.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
timerBar.BorderSizePixel = 0
timerBar.ZIndex = 4
timerBar.Parent = mainFrame

local timerCorner = Instance.new("UICorner")
timerCorner.CornerRadius = UDim.new(0, 2)
timerCorner.Parent = timerBar

-- Fade in animation
mainFrame.BackgroundTransparency = 1
message.TextTransparency = 1
title.TextTransparency = 1
icon.TextTransparency = 1
timerBar.BackgroundTransparency = 1
border.Transparency = 1

local function fadeIn()
    for i = 1, 20 do
        local alpha = i / 20
        mainFrame.BackgroundTransparency = 1 - (alpha * 1)
        message.TextTransparency = 1 - alpha
        title.TextTransparency = 1 - alpha
        icon.TextTransparency = 1 - alpha
        timerBar.BackgroundTransparency = 1 - alpha
        border.Transparency = 1 - (alpha * 0.7)
        overlay.BackgroundTransparency = 0.3 + (0.7 - alpha * 0.7)
        wait(0.02)
    end
end

-- Glow pulse effect
spawn(function()
    while screenGui.Parent do
        for i = 1, 30 do
            border.Transparency = 0.3 + (math.sin(i / 5) * 0.2)
            wait(0.05)
        end
    end
end)

-- Timer animation
spawn(function()
    wait(0.4)
    for i = 1, 70 do
        timerBar.Size = UDim2.new((70 - i) / 70, -20, 0, 4)
        wait(0.1)
    end
end)

-- Execute fade in
fadeIn()

-- Close after 7 seconds with fade out
wait(3)

for i = 1, 20 do
    local alpha = 1 - (i / 20)
    mainFrame.BackgroundTransparency = 1 - alpha
    message.TextTransparency = 1 - alpha
    title.TextTransparency = 1 - alpha
    icon.TextTransparency = 1 - alpha
    timerBar.BackgroundTransparency = 1 - alpha
    border.Transparency = 1 - (alpha * 0.7)
    overlay.BackgroundTransparency = 0.3 + (0.7 - alpha * 0.7)
    wait(0.02)
end

screenGui:Destroy()
print("Lynx Script notification closed")
