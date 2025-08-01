-- Interface + Spawn Brainrot Force & Desativador

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("MG_BrainrotInjector") then
    CoreGui.MG_BrainrotInjector:Destroy()
end

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "MG_BrainrotInjector"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 260, 0, 150)
frame.Position = UDim2.new(0.4, -130, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.new(1, 1, 1)
title.Text = "MG Brainrot Injector"

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, 0, 0, 25)
status.Position = UDim2.new(0, 0, 0, 35)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 16
status.TextColor3 = Color3.new(1, 1, 1)
status.Text = "↻ Aguardando..."

local btnSpawn = Instance.new("TextButton", frame)
btnSpawn.Size = UDim2.new(0.8, 0, 0, 40)
btnSpawn.Position = UDim2.new(0.1, 0, 0, 65)
btnSpawn.Text = "Spawn Brainrot Secret/God"
btnSpawn.Font = Enum.Font.GothamBold
btnSpawn.TextSize = 16
btnSpawn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
btnSpawn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnSpawn).CornerRadius = UDim.new(0, 6)

local btnDisable = Instance.new("TextButton", frame)
btnDisable.Size = UDim2.new(0.8, 0, 0, 30)
btnDisable.Position = UDim2.new(0.1, 0, 0, 115)
btnDisable.Text = "Desativar Script"
btnDisable.Font = Enum.Font.Gotham
btnDisable.TextSize = 14
btnDisable.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
btnDisable.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnDisable).CornerRadius = UDim.new(0, 6)

-- Função de spawn
local ativo = false

local function spawnTry()
    if ativo then return end
    ativo = true
    status.Text = "☁️ Tentando spawn..."
    local RepStorage = game:GetService("ReplicatedStorage")

    for i = 1, 4000 do
        if not ativo then
            status.Text = "❌ Interrompido"
            return
        end
        pcall(function()
            local evt = RepStorage:FindFirstChild("Hatch") or RepStorage:FindFirstChildOfClass("RemoteEvent")
            if evt then
                evt:FireServer("Secret", 999, true)
                evt:FireServer("God", 999, false)
                evt:FireServer("SecretMulti", 500, true)
                evt:FireServer("GodSingle", 1000, false)
            end
        end)
        status.Text = "Tentativa: "..i
        task.wait(0.03)
    end
    status.Text = "✔️ Término das tentativas"
    ativo = false
end

btnSpawn.MouseButton1Click:Connect(function()
    spawnTry()
end)

btnDisable.MouseButton1Click:Connect(function()
    ativo = false
    gui:Destroy()
end)
