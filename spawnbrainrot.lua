-- MG Secrets Spawner com Interface + Auto Spawn + Desativar

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("MG_SecretSpawner") then
	CoreGui.MG_SecretSpawner:Destroy()
end

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "MG_SecretSpawner"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 270, 0, 140)
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
title.Text = "🧠 MG Secrets Spawner"

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -20, 0, 25)
status.Position = UDim2.new(0, 10, 0, 35)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.new(1, 1, 1)
status.Text = "⏳ Aguardando início..."

local btnDesativar = Instance.new("TextButton", frame)
btnDesativar.Size = UDim2.new(0.8, 0, 0, 30)
btnDesativar.Position = UDim2.new(0.1, 0, 0, 95)
btnDesativar.Text = "Desativar Script"
btnDesativar.Font = Enum.Font.Gotham
btnDesativar.TextSize = 14
btnDesativar.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
btnDesativar.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnDesativar).CornerRadius = UDim.new(0, 6)

local rodando = true

btnDesativar.MouseButton1Click:Connect(function()
	rodando = false
	gui:Destroy()
end)

task.spawn(function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local tentativas = 0
	status.Text = "🚀 Iniciando spawn direto..."

	while rodando and tentativas < 4000 do
		local evt = ReplicatedStorage:FindFirstChild("Hatch") or ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")
		if evt then
			pcall(function()
				-- força tentativa de SECRET
				evt:FireServer("Secret", 999, true)
				evt:FireServer("SecretMulti", 888, true)
				evt:FireServer("S", 777, true)
			end)
		end
		tentativas += 1
		status.Text = "Tentando SECRET: " .. tentativas
		task.wait(0.04)
	end

	if rodando then
		status.Text = "✅ Finalizado (4000 tentativas)"
	else
		status.Text = "❌ Script desativado"
	end
end)

