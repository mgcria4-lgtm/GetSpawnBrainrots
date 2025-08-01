local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("MG_SecretSpawner") then
    CoreGui.MG_SecretSpawner:Destroy()
end

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "MG_SecretSpawner"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 130)
frame.Position = UDim2.new(0.4, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.new(1, 1, 1)
title.Text = "Brainrot Secret Spawner"

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -20, 0, 25)
status.Position = UDim2.new(0, 10, 0, 40)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.new(1, 1, 1)
status.Text = "Clique para gerar!"

local btnSpawn = Instance.new("TextButton", frame)
btnSpawn.Size = UDim2.new(0.8, 0, 0, 35)
btnSpawn.Position = UDim2.new(0.1, 0, 0, 75)
btnSpawn.Text = "Gerar Brainrot Secret"
btnSpawn.Font = Enum.Font.GothamBold
btnSpawn.TextSize = 16
btnSpawn.BackgroundColor3 = Color3.fromRGB(30, 120, 30)
btnSpawn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnSpawn).CornerRadius = UDim.new(0, 6)

btnSpawn.MouseButton1Click:Connect(function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local evt = ReplicatedStorage:FindFirstChild("Hatch") or ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")
    if evt then
        status.Text = "Tentando gerar Secret..."
        pcall(function()
            -- Manda args focando em secret
            evt:FireServer("Secret", 999, true)
        end)
        status.Text = "Pedido enviado!"
    else
        status.Text = "Evento não encontrado."
    end
end)

