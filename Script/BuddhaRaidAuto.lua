-- Buddha Raid Auto Script for Blox Fruits
-- Credits: @erduanerduan79-a11y

local npcNames = {
    "Buddha Beast",
    "Buddha Monk",
    "Buddha Guardian",
    "Buddha Sentinel",
    "Buddha Commander"
}

local enabled = false
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- Simple GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BuddhaRaidAutoGui"
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.5, -100, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
Frame.Parent = ScreenGui

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 180, 0, 40)
Button.Position = UDim2.new(0, 10, 0, 30)
Button.Text = "Auto Raid: OFF"
Button.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
Button.TextColor3 = Color3.new(1,1,1)
Button.Parent = Frame

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(0, 180, 0, 20)
Status.Position = UDim2.new(0, 10, 0, 75)
Status.Text = "Status: Idle"
Status.BackgroundTransparency = 1
Status.TextColor3 = Color3.new(1,1,1)
Status.Parent = Frame

-- "Script Successfully Loaded" overlay
local LoadedLabel = Instance.new("TextLabel")
LoadedLabel.Size = UDim2.new(0, 270, 0, 40)
LoadedLabel.Position = UDim2.new(0.5, -135, 0.07, 0)
LoadedLabel.BackgroundColor3 = Color3.fromRGB(35, 180, 70)
LoadedLabel.BackgroundTransparency = 0.15
LoadedLabel.Text = "Script Successfully Loaded!"
LoadedLabel.TextColor3 = Color3.new(1, 1, 1)
LoadedLabel.TextSize = 25
LoadedLabel.Font = Enum.Font.SourceSansSemibold
LoadedLabel.Parent = ScreenGui
LoadedLabel.ZIndex = 10

-- Fade out the "Script Successfully Loaded" label
spawn(function()
    wait(3)
    for i = 0, 1, 0.05 do
        LoadedLabel.TextTransparency = i
        LoadedLabel.BackgroundTransparency = 0.15 + i*0.85
        wait(0.05)
    end
    LoadedLabel:Destroy()
end)

-- Notification function
local function notify(title, text)
    game.StarterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = 4;
    })
end

-- Teleport to NPC function
local function tpTo(part)
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    char:MoveTo(part.Position + Vector3.new(0,6,0))
end

-- Find all raid NPCs in workspace
local function getRaidNPCs()
    local npcs = {}
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and table.find(npcNames, v.Name) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            table.insert(npcs, v)
        end
    end
    return npcs
end

-- Main raid loop
local function raidLoop()
    while enabled do
        local npcs = getRaidNPCs()
        if #npcs > 0 then
            Status.Text = "Status: Teleporting ("..#npcs.." NPCs)"
            for _,npc in ipairs(npcs) do
                tpTo(npc.HumanoidRootPart)
                Status.Text = "Status: Teleported to "..npc.Name
                wait(0.5)
            end
        else
            Status.Text = "Status: Waiting for next island"
            -- If you know the next island's position or part, you can add teleport code here.
            wait(2)
        end
        wait(0.4)
    end
    Status.Text = "Status: Idle"
end

Button.MouseButton1Click:Connect(function()
    enabled = not enabled
    Button.Text = enabled and "Auto Raid: ON" or "Auto Raid: OFF"
    notify("Buddha Raid Auto", enabled and "Started!" or "Stopped!")
    if enabled then
        spawn(raidLoop)
    end
end)

notify("GitHub Loader", "Buddha Raid script loaded!")
