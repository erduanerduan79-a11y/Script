local ui = script.Parent.Parent.Parent.uiList.Add("Frame", "Auto Raid UI")
ui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ui.BorderColor3 = Color3.fromRGB(0, 0, 0)
ui.Position = UDim2.fromScale(0.2, 0, 0.2, 0)
ui.Size = UDim2.fromScale(0.8, 0, 0.8, 0)

local closeButton = ui:WaitForChild("Close Button")
closeButton.Size = UDim2.fromScale(0, 30, 0, 30)
closeButton.Position = UDim2.fromScale(0, 0, 0, 0.9)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 20
closeButton.TextStrokeTransparency = 0
closeButton.TextXAlignment = Enum.TextXAlignment.Left
closeButton.TextTruncate = true
closeButton.OnClick:Connect(function()
    ui:Destroy()
end)

local autoRaidButton = ui:WaitForChild("Auto Raid")
autoRaidButton.Size = UDim2.fromScale(0, 100, 0, 30)
autoRaidButton.Position = UDim2.fromScale(0, 0, 0, 0.1)
autoRaidButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
autoRaidButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
autoRaidButton.Text = "Auto Raid"
autoRaidButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoRaidButton.TextSize = 20
autoRaidButton.TextStrokeTransparency = 0
autoRaidButton.TextXAlignment = Enum.TextXAlignment.Left
autoRaidButton.TextTruncate = true
autoRaidButton.OnClick:Connect(function()
    if autoRaidButton.Text == "Auto Raid" then
        autoRaidButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        autoRaidButton.Text = "Stop"
        main()
    else
        autoRaidButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        autoRaidButton.Text = "Auto Raid"
        wave1()
    end
end)

local player = game.Players.LocalPlayer.Character

function wave1()
    player:SetPrimaryPartCFrame(CFrame.new(100, 100, 100))
    player.Humanoid.PlatformStand = true
    player.Humanoid.WalkSpeed = 0
    player.Humanoid.Jump = true
    player.Humanoid.Health = 0
    player.Humanoid.MaxHealth = 0
    player.Humanoid.Health = 0
end

function wave2()
    player:SetPrimaryPartCFrame(CFrame.new(100, 100, 100))
    player.Humanoid.PlatformStand = true
    player.Humanoid.WalkSpeed = 0
    player.Humanoid.Jump = true
    player.Humanoid.Health = 0
    player.Humanoid.MaxHealth = 0
    player.Humanoid.Health = 0
end

function wave3()
    player:SetPrimaryPartCFrame(CFrame.new(100, 100, 100))
    player.Humanoid.PlatformStand = true
    player.Humanoid.WalkSpeed = 0
    player.Humanoid.Jump = true
    player.Humanoid.Health = 0
    player.Humanoid.MaxHealth = 0
    player.Humanoid.Health = 0
end

function main()
    wave1()
    wait(5)
    wave2()
    wait(5)
    wave3()
end
