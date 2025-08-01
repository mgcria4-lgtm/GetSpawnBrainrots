local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("MG_SecretForce") then
	CoreGui.MG_SecretForce:Destroy()
end

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "MG_SecretForce"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 180)
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
title.TextColor3 = Color3.new(1,1,1)
title.Text = "🧠 MG Secret Force & Detector"

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -20, 0, 25)
status.Position = UDim2.new(0, 10, 0, 40)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.new(1,1,1)
status.Text = "Status: Aguardando ação..."

local btnSpawn = Instance.new("TextButton", frame)
btnSpawn.Size = UDim2.new(0.8, 0, 0, 35)
btnSpawn.Position = UDim2.new(0.1, 0, 0, 75)
btnSpawn.Text = "Forçar Spawn Secret/God"
btnSpawn.Font = Enum.Font.GothamBold
btnSpawn.TextSize = 16
btnSpawn.BackgroundColor3 = Color3.fromRGB(0, 160, 0)
btnSpawn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", btnSpawn).CornerRadius = UDim.new(0, 6)

local btnDisable = Instance.new("TextButton", frame)
btnDisable.Size = UDim2.new(0.8, 0, 0, 30)
btnDisable.Position = UDim2.new(0.1, 0, 0, 120)
btnDisable.Text = "Desativar Script"
btnDisable.Font = Enum.Font.GothamBold
btnDisable.TextSize = 14
btnDisable.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
btnDisable.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", btnDisable).CornerRadius = UDim.new(0, 6)

local rodando = true

btnDisable.MouseButton1Click:Connect(function()
	rodando = false
	gui:Destroy()
end)

local function filtrarEventos(lista)
	local proibidos = {"Teleport","Reset","Kick","Leave","Server","Base"}
	local filtrados = {}

	for _, evt in pairs(lista) do
		local nome = evt.Name:lower()
		local bloqueado = false
		for _, p in pairs(proibidos) do
			if string.find(nome, p:lower()) then
				bloqueado = true
				break
			end
		end
		if not bloqueado then
			table.insert(filtrados, evt)
		end
	end
	return filtrados
end

local function getEventos()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer

	local eventos = {}

	for _, evt in pairs(ReplicatedStorage:GetDescendants()) do
		if evt:IsA("RemoteEvent") then
			table.insert(eventos, evt)
		end
	end

	-- Também procura em PlayerGui do LocalPlayer
	if LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") then
		for _, evt in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
			if evt:IsA("RemoteEvent") then
				table.insert(eventos, evt)
			end
		end
	end

	return filtrarEventos(eventos)
end

local function spawnBrainrot(evt)
	if not rodando then return end
	pcall(function()
		-- Tenta enviar os argumentos que mais aparentam forçar Secrets/Gods
		evt:FireServer("Secret", 999, true)
		evt:FireServer("God", 888, true)
		evt:FireServer("SecretMulti", 777, true)
		evt:FireServer({PetID = "SecretGod999", LuckBoost=999999, Force=true})
	end)
end

local function detectarSpawn()
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer

	if not LocalPlayer then return end

	-- Exemplo: escutar eventos visuais ou objetos no workspace (adaptar conforme o jogo)
	workspace.ChildAdded:Connect(function(child)
		if not rodando then return end
		if child.Name == "SecretBrainrot" or child.Name:lower():find("secret") or child.Name:lower():find("god") then
			status.Text = "🔥 Brainrot Secret/God spawnado! "..child.Name
		end
	end)
end

btnSpawn.MouseButton1Click:Connect(function()
	status.Text = "🚀 Tentando spawnar Secrets/Gods..."

	local eventos = getEventos()
	if #eventos == 0 then
		status.Text = "❌ Nenhum evento válido encontrado!"
		return
	end

	for _, evt in pairs(eventos) do
		spawnBrainrot(evt)
	end
end)

detectarSpawn()

