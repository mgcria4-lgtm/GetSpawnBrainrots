-- MG Scripts | V3 EXTREMO | Forçador de Brainrots Secrets/Gods
-- 150+ chamadas diferentes de FireServer
-- Interface + botão Desativar

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("MGSpawnSecrets") then CoreGui.MGSpawnSecrets:Destroy() end

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "MGSpawnSecrets"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.new(1, 1, 1)
title.Text = "🧠 MG | Super Spawn Secrets/Gods"

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -20, 0, 25)
status.Position = UDim2.new(0, 10, 0, 40)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.new(1, 1, 1)
status.Text = "Status: Pronto para forçar..."

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.8, 0, 0, 32)
btn.Position = UDim2.new(0.1, 0, 0, 75)
btn.Text = "💥 Forçar Spawn de Secrets"
btn.Font = Enum.Font.GothamBold
btn.TextSize = 14
btn.BackgroundColor3 = Color3.fromRGB(0, 160, 0)
btn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

local btnOff = Instance.new("TextButton", frame)
btnOff.Size = UDim2.new(0.8, 0, 0, 30)
btnOff.Position = UDim2.new(0.1, 0, 0, 120)
btnOff.Text = "❌ Desativar Script"
btnOff.Font = Enum.Font.GothamBold
btnOff.TextSize = 14
btnOff.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
btnOff.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnOff).CornerRadius = UDim.new(0, 6)

btn.MouseButton1Click:Connect(function()
	status.Text = "⚙️ Forçando spawns..."

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local eventos = {}

	for _, v in pairs(ReplicatedStorage:GetDescendants()) do
		if v:IsA("RemoteEvent") or v:IsA("BindableEvent") or v:IsA("RemoteFunction") then
			table.insert(eventos, v)
		end
	end

	for _, evt in pairs(eventos) do
		if evt:IsA("RemoteEvent") then
			pcall(function()
				for i = 1, 150 do
					evt:FireServer({
						PetID = "SecretGod"..math.random(1000,9999),
						Force = true,
						Secret = true,
						Guarantee = true,
						Luck = math.huge,
						Spawn = true,
						Event = true,
						Cheat = true,
						Crit = true,
						Hack = true,
						Override = true,
						God = true,
						ForceLuck = true,
						FakeEgg = "UltraSecret",
						Power = 99999999,
						[""] = "Empty",
						[math.random()] = "Random",
						["🌟"] = "Glitch"
					})
				end
			end)
		end
	end

	status.Text = "✅ Tentativas EXTREMAS enviadas!"
end)

btnOff.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

