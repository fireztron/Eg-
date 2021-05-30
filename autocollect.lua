--// Anti Afk
local VirtualUser=game:GetService('VirtualUser')
game:service('Players').LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

--// Collect shit
while true do
    for i,v in pairs(workspace.currencySpawns:GetDescendants()) do
        if v:IsA("BasePart") then
            local args = {
                [1] = v
            }

            game:GetService("ReplicatedStorage").remotes.events:FindFirstChild("fromClient-currencyCollected"):FireServer(unpack(args))
        end
    end

    for i,v in pairs(workspace.assetSpawns:GetDescendants()) do
        if v:IsA("BasePart") then
            local args = {
                [1] = v
            }

            game:GetService("ReplicatedStorage").remotes.events:FindFirstChild("fromClient-currencyCollected"):FireServer(unpack(args))
        end
    end
    wait(5)
end
