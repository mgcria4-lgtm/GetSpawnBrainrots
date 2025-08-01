local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("MG_ForceSpawn") then
	CoreGui.MG_ForceSpawn:Destroy()
end

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "MG_ForceSpawn"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 160)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.new(1,1,1)
title.Text = "🧠 Force Spawn Secrets"

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -20, 0, 30)
status.Position = UDim2.new(0, 10, 0, 40)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.new(1,1,1)
status.Text = "Status: Pronto"

local btnStart = Instance.new("TextButton", frame)
btnStart.Size = UDim2.new(0.8, 0, 0, 40)
btnStart.Position = UDim2.new(0.1, 0, 0, 75)
btnStart.Text = "Ativar Força Spawn"
btnStart.Font = Enum.Font.GothamBold
btnStart.TextSize = 16
btnStart.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
btnStart.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", btnStart).CornerRadius = UDim.new(0, 6)

local btnStop = Instance.new("TextButton", frame)
btnStop.Size = UDim2.new(0.8, 0, 0, 30)
btnStop.Position = UDim2.new(0.1, 0, 0, 125)
btnStop.Text = "Desativar"
btnStop.Font = Enum.Font.GothamBold
btnStop.TextSize = 14
btnStop.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
btnStop.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", btnStop).CornerRadius = UDim.new(0, 6)

local rodando = false
local RunService = game:GetService("RunService")

local function getEventos()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer

	local eventos = {}

	for _, evt in pairs(ReplicatedStorage:GetDescendants()) do
		if evt:IsA("RemoteEvent") then
			local nameLower = evt.Name:lower()
			if not (nameLower:find("teleport") or nameLower:find("reset") or nameLower:find("kick") or nameLower:find("leave") or nameLower:find("server") or nameLower:find("base")) then
				table.insert(eventos, evt)
			end
		end
	end

	if LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") then
		for _, evt in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
			if evt:IsA("RemoteEvent") then
				local nameLower = evt.Name:lower()
				if not (nameLower:find("teleport") or nameLower:find("reset") or nameLower:find("kick") or nameLower:find("leave") or nameLower:find("server") or nameLower:find("base")) then
					table.insert(eventos, evt)
				end
			end
		end
	end

	return eventos
end

local eventos = {}

local function tentarSpawn()
	for _, evt in pairs(eventos) do
		pcall(function()
			evt:FireServer("Secret", 999, true)
			evt:FireServer("God", 888, true)
		end)
	end
end

local connection
btnStart.MouseButton1Click:Connect(function()
	if rodando then return end
	rodando = true
	status.Text = "Status: Forçando spawn..."
	eventos = getEventos()
	if #eventos == 0 then
		status.Text = "Erro: nenhum evento válido encontrado."
		rodando = false
		return
	end

	connection = RunService.Heartbeat:Connect(function()
		if not rodando then return end
		tentarSpawn()
		task.wait(0.1)
	end)
end)

btnStop.MouseButton1Click:Connect(function()
	if not rodando then return end
	rodando = false
	if connection then connection:Disconnect() end
	status.Text = "Status: Desativado."
end)
