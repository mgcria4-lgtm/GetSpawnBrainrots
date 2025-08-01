-- 🧠 MG Spawn Secrets/Gods 99% | Interface + Forçador Explícito + Desativador
-- Compatível com KRNL

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("MGSpawnSecrets") then
	CoreGui.MGSpawnSecrets:Destroy()
end

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "MGSpawnSecrets"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 270, 0, 170)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
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
title.Text = "🧠 MG Force Brainrot Secrets/Gods"

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -20, 0, 25)
status.Position = UDim2.new(0, 10, 0, 40)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.new(1, 1, 1)
status.Text = "Status: Aguardando..."

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.8, 0, 0, 30)
btn.Position = UDim2.new(0.1, 0, 0, 75)
btn.Text = "🔮 Spawn Secrets/Gods"
btn.Font = Enum.Font.GothamBold
btn.TextSize = 14
btn.BackgroundColor3 = Color3.fromRGB(0, 160, 0)
btn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

local btnOff = Instance.new("TextButton", frame)
btnOff.Size = UDim2.new(0.8, 0, 0, 30)
btnOff.Position = UDim2.new(0.1, 0, 0, 115)
btnOff.Text = "❌ Desativar Script"
btnOff.Font = Enum.Font.GothamBold
btnOff.TextSize = 14
btnOff.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
btnOff.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnOff).CornerRadius = UDim.new(0, 6)

btn.MouseButton1Click:Connect(function()
	status.Text = "Tentando spawnar..."

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local events = {
		"Hatch", "SummonPet", "CreateBrainrot", "PetRoll", "OpenCapsule", "SpawnEgg"
	}

	for _, evtName in pairs(events) do
		local evt = ReplicatedStorage:FindFirstChild(evtName)
		if evt and evt:IsA("RemoteEvent") then
			pcall(function()
				-- Força 10 formas diferentes
				for i = 1, 10 do
					evt:FireServer({
						PetID = "SecretGod999",
						Tier = "Secret",
						LuckBoost = 999999,
						Forced = true,
						Bypass = true,
						Hack = true,
						SpawnSecretNow = true,
						Guarantee = true,
						Trevo = true
					})
				end
			end)
		end
	end

	status.Text = "✅ Spawn forçado enviado!"
end)

btnOff.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

