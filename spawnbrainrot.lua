local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("MG_SecretForceSimple") then
	CoreGui.MG_SecretForceSimple:Destroy()
end

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "MG_SecretForceSimple"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 140)
frame.Position = UDim2.new(0.4, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.new(1,1,1)
title.Text = "Spawn Brainrot Secret"

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -20, 0, 25)
status.Position = UDim2.new(0, 10, 0, 40)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.new(1,1,1)
status.Text = "Clique para tentar spawnar"

local btnSpawn = Instance.new("TextButton", frame)
btnSpawn.Size = UDim2.new(0.8, 0, 0, 40)
btnSpawn.Position = UDim2.new(0.1, 0, 0, 75)
btnSpawn.Text = "Spawnar Secret"
btnSpawn.Font = Enum.Font.GothamBold
btnSpawn.TextSize = 16
btnSpawn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
btnSpawn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", btnSpawn).CornerRadius = UDim.new(0, 6)

btnSpawn.MouseButton1Click:Connect(function()
	status.Text = "Tentando enviar spawn..."

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local evt = ReplicatedStorage:FindFirstChild("Hatch")
	if evt and evt:IsA("RemoteEvent") then
		pcall(function()
			evt:FireServer("Secret", 999, true)
			status.Text = "Pedido enviado para evento Hatch!"
		end)
	else
		status.Text = "Evento Hatch não encontrado."
	end
end)
