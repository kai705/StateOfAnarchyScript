local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local X = Material.Load({
	Title = "StateOfAnarchyHub",
	Style = 3,
	SizeX = 500,
	SizeY = 350,
	Theme = "Dark",
	ColorOverrides = {
		MainFrame = Color3.fromRGB(14,14,14)
	}
})

local Y = X.New({
	Title = "Visuals"
})

local A = Y.Button({
	Text = "Chams",
	Callback = function()
		
ALLYCOLOR = {255,255,255}
ENEMYCOLOR =  {255,255,255}
TRANSPARENCY = 0.5
HEALTHBAR_ACTIVATED = false


function createFlex()
players = game:GetService("Players")
faces = {"Front","Back","Bottom","Left","Right","Top"} 
currentPlayer = nil
lplayer = players.LocalPlayer
players.PlayerAdded:Connect(function(p)
	currentPlayer = p
		p.CharacterAdded:Connect(function(character)
			createESP(character)			
		end)		
end)
function checkPart(obj)  if (obj:IsA("Part") or obj:IsA("MeshPart")) and obj.Name~="HumanoidRootPart" then return true end end
function actualESP(obj) 
	
	for i=0,5 do
		surface = Instance.new("SurfaceGui",obj)
		surface.Face = Enum.NormalId[faces[i+1]]
		surface.AlwaysOnTop = true

		frame = Instance.new("Frame",surface)
		frame.Size = UDim2.new(1,0,1,0)
		frame.BorderSizePixel = 0				
		frame.BackgroundTransparency = TRANSPARENCY
			if currentPlayer.Team == players.LocalPlayer.Team then
					frame.BackgroundColor3 = Color3.new(ALLYCOLOR[1],ALLYCOLOR[2],ALLYCOLOR[3])
			else
				frame.BackgroundColor3 = Color3.new(ENEMYCOLOR[1],ENEMYCOLOR[2],ENEMYCOLOR[3])
			end
							
	end
end
function createHealthbar(hrp) 
	board =Instance.new("BillboardGui",hrp) 
	board.Name = "total"
	board.Size = UDim2.new(1,0,1,0)
	board.StudsOffset = Vector3.new(3,1,0)
	board.AlwaysOnTop = true

	bar = Instance.new("Frame",board) 
	bar.BackgroundColor3 = Color3.new(255,0,0)
	bar.BorderSizePixel = 0
	bar.Size = UDim2.new(0.2,0,4,0)
	bar.Name = "total2"
				
	health = Instance.new("Frame",bar) 
	health.BackgroundColor3 = Color3.new(0,255,0)
	health.BorderSizePixel = 0
	health.Size = UDim2.new(1,0,hrp.Parent.Humanoid.Health/100,0)
		hrp.Parent.Humanoid.Changed:Connect(function(property) 
			hrp.total.total2.Frame.Size = UDim2.new(1,0,hrp.Parent.Humanoid.Health/100,0) 							
		end)
end
function createESP(c)
	bugfix = c:WaitForChild("Head")
	for i,v in pairs(c:GetChildren()) do
		if checkPart(v) then
		actualESP(v)
		end
	end
	if HEALTHBAR_ACTIVATED then
		createHealthbar(c:WaitForChild("HumanoidRootPart"))
	end
end
for i,people in pairs(players:GetChildren())do
	if people ~= players.LocalPlayer then
		currentPlayer = people
		createESP(people.Character)
			people.CharacterAdded:Connect(function(character)
				createESP(character)			
			end)
	end
end
end
createFlex()

	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "This function can get you banned in up-to-date servers; use at your own risk."
			})
		end
	}
})

local A = Y.Button({
	Text = "Full-Bright",
	Callback = function()
	if not _G.FullBrightExecuted then
	_G.FullBrightEnabled = true

	_G.NormalLightingSettings = {
		Brightness = game:GetService("Lighting").Brightness,
		ClockTime = game:GetService("Lighting").ClockTime,
		FogEnd = game:GetService("Lighting").FogEnd,
		GlobalShadows = game:GetService("Lighting").GlobalShadows,
		Ambient = game:GetService("Lighting").Ambient
	}

	game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
		if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Brightness = 1
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
		if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").ClockTime = 12
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
		if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").FogEnd = 786543
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").GlobalShadows = false
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
		if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	game:GetService("Lighting").Brightness = 1
	game:GetService("Lighting").ClockTime = 12
	game:GetService("Lighting").FogEnd = 786543
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
					game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
					game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
					game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
				else
					game:GetService("Lighting").Brightness = 1
					game:GetService("Lighting").ClockTime = 12
					game:GetService("Lighting").FogEnd = 786543
					game:GetService("Lighting").GlobalShadows = false
					game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

_G.FullBrightExecuted = true
_G.FullBrightEnabled = not _G.FullBrightEnabled
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "This function can get you banned in up-to-date servers; use at your own risk."
			})
		end
	}
})
