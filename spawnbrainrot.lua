-- Interface simples + Spawn instantâneo de Secrets/Gods
-- Compatível com KRNL

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("MG_BrainrotInstant") then
	CoreGui.MG_BrainrotInstant:Destroy()
end

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "MG_BrainrotInstant"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 260, 0, 130)
frame.Position = UDim2.new(0.35, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.new(1, 1, 1)
title.Text = "🧠 Spawn Secrets/Gods"

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -20, 0, 25)
status.Position = UDim2.new(0, 10, 0, 35)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.new(1, 1, 1)
status.Text = "💤 Aguardando clique..."

local spawnButton = Instance.new("TextButton", frame)
spawnButton.Size = UDim2.new(0.8, 0, 0, 30)
spawnButton.Position = UDim2.new(0.1, 0, 0, 75)
spawnButton.Text = "Spawnar Secrets/Gods"
spawnButton.Font = Enum.Font.GothamBold
spawnButton.TextSize = 14
spawnButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
spawnButton.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", spawnButton).CornerRadius = UDim.new(0, 6)

spawnButton.MouseButton1Click:Connect(function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local evt = ReplicatedStorage:FindFirstChild("Hatch") or ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

	if evt then
		status.Text = "🔮 Gerando Brainrots Secrets/Gods..."

		-- Tentativas diretas com nome forçado de raridade
		pcall(function()
			evt:FireServer("God", 999, true)
			evt:FireServer("Secret", 888, true)
			evt:FireServer("SecretGodMode", 777, true)
			evt:FireServer("Exclusive", 666, true)
			evt:FireServer("Mythic", 555, true)
		end)

		status.Text = "✅ Spawn solicitado!"
	else
		status.Text = "❌ Evento não encontrado!"
	end
end)

