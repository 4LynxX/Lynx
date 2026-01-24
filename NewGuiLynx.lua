-- Lynx Script Update Notification
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Membuat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LynxNotification"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Membuat Frame untuk notifikasi
local notificationFrame = Instance.new("Frame")
notificationFrame.Size = UDim2.new(0, 400, 0, 120)
notificationFrame.Position = UDim2.new(0.5, -200, 0.5, -60)
notificationFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
notificationFrame.BorderSizePixel = 0
notificationFrame.Parent = screenGui

-- Membuat UICorner untuk rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = notificationFrame

-- Membuat UIStroke untuk border
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(100, 200, 255)
stroke.Thickness = 2
stroke.Parent = notificationFrame

-- Membuat Title Text
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -20, 0, 35)
titleLabel.Position = UDim2.new(0, 10, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "⚠️ LYNX SCRIPT UPDATE"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = notificationFrame

-- Membuat Message Text
local messageLabel = Instance.new("TextLabel")
messageLabel.Size = UDim2.new(1, -20, 0, 60)
messageLabel.Position = UDim2.new(0, 10, 0, 50)
messageLabel.BackgroundTransparency = 1
messageLabel.Text = "Lynx Script has been updated,\nPlease get the script again!!!"
messageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
messageLabel.TextSize = 16
messageLabel.Font = Enum.Font.Gotham
messageLabel.TextXAlignment = Enum.TextXAlignment.Left
messageLabel.TextYAlignment = Enum.TextYAlignment.Top
messageLabel.TextWrapped = true
messageLabel.Parent = notificationFrame

-- Animasi fade in
notificationFrame.BackgroundTransparency = 1
titleLabel.TextTransparency = 1
messageLabel.TextTransparency = 1
stroke.Transparency = 1

-- Tween fade in
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local fadeIn = TweenService:Create(notificationFrame, tweenInfo, {BackgroundTransparency = 0})
local fadeInTitle = TweenService:Create(titleLabel, tweenInfo, {TextTransparency = 0})
local fadeInMessage = TweenService:Create(messageLabel, tweenInfo, {TextTransparency = 0})
local fadeInStroke = TweenService:Create(stroke, tweenInfo, {Transparency = 0})

fadeIn:Play()
fadeInTitle:Play()
fadeInMessage:Play()
fadeInStroke:Play()

-- Tunggu beberapa detik (5 detik)
wait(5)

-- Tween fade out
local fadeOut = TweenService:Create(notificationFrame, tweenInfo, {BackgroundTransparency = 1})
local fadeOutTitle = TweenService:Create(titleLabel, tweenInfo, {TextTransparency = 1})
local fadeOutMessage = TweenService:Create(messageLabel, tweenInfo, {TextTransparency = 1})
local fadeOutStroke = TweenService:Create(stroke, tweenInfo, {Transparency = 1})

fadeOut:Play()
fadeOutTitle:Play()
fadeOutMessage:Play()
fadeOutStroke:Play()

-- Hapus GUI setelah animasi selesai
fadeOut.Completed:Wait()
screenGui:Destroy()

print("Lynx Script notification displayed and removed")
