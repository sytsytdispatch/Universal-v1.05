--//v1.05
--//made by sytsytdispatch



local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
print("successfully injected Key system")
local Window = Rayfield:CreateWindow({
   Name = "Universal plus+",
   LoadingTitle = "Universal Plus is loading..",
   LoadingSubtitle = "by Sirius and sytsytdispatch",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Blackyhub121"
   },
   Discord = {
      Enabled = false,
      Invite = "Cf3cmK5uwB",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Verify you are not a bot",
      Subtitle = "The key is on the side",
      Note = "Key: VERIFY123",
      FileName = "Blackyhub1212",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {"VERIFY123"}
   }
})
print("User is a Human")
local Tab = Window:CreateTab("Local Player", nil)
local TPTab = Window:CreateTab("Teleportation", nil) -- Title, Image
local AETab = Window:CreateTab("ESP and Aimbot", nil) -- Title, Image
local TRTab = Window:CreateTab("Troll", nil) -- Title, Image
print("Successfully injected Universal++")
local Slider1 = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 150},
   Increment = 10,
   Suffix = "Are you the flash?",
   CurrentValue = 16,
   Flag = "Slider1",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local Slider2 = Tab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 200},
   Increment = 10,
   Suffix = "How high can ya go?",
   CurrentValue = 50,
   Flag = "Slider2",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local Button = Tab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
      infiniteJumpEnabled = not infiniteJumpEnabled -- Toggle the boolean

      if infiniteJumpEnabled then
         -- Enable infinite jump (no delay)
         game:GetService("UserInputService").JumpRequest:connect(function()
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
         end)
         print("Infinite Jump Enabled")
      else
         -- Disable infinite jump (normal delay)
         game:GetService("UserInputService").JumpRequest:disconnect()
         print("Infinite Jump Disabled")
      end
   end
})

local Button = Tab:CreateButton({
   Name = "Shift to ZOOM",
   Callback = function()
   -- Define the player and initial walking speed
local player = game.Players.LocalPlayer
local walkingSpeed = 16  -- Default walking speed

-- Function to handle key press events
local function onKeyPress(input)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        -- Increase walking speed when Shift is pressed
        player.Character.Humanoid.WalkSpeed = 100
    end
end

-- Function to handle key release events
local function onKeyRelease(input)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        -- Reset walking speed when Shift is released
        player.Character.Humanoid.WalkSpeed = walkingSpeed
    end
end

-- Connect key press and release events
game:GetService("UserInputService").InputBegan:Connect(onKeyPress)
game:GetService("UserInputService").InputEnded:Connect(onKeyRelease)

   end,
})

    local Button = TPTab:CreateButton({
   Name = "CNTL + click to TP",
   Callback = function()
   local UIS = game:GetService("UserInputService")

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()


function GetCharacter()
   return game.Players.LocalPlayer.Character
end

function Teleport(pos)
   local Char = GetCharacter()
   if Char then
       Char:MoveTo(pos)
   end
end


UIS.InputBegan:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
       Teleport(Mouse.Hit.p)
   end
end)
   end,
})


local Button = TPTab:CreateButton({
   Name = "TP to nearest person (press V)",
   Callback = function()
   -- Define the key you want to use for teleporting
local teleportKey = Enum.KeyCode.V

-- Function to calculate distance between two points
local function distance(pos1, pos2)
    return (pos1 - pos2).magnitude
end

-- Function to find the nearest player
local function findNearestPlayer()
    local players = game.Players:GetPlayers()
    local closestPlayer = nil
    local shortestDistance = math.huge
    local myPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

    for _, player in ipairs(players) do
        if player ~= game.Players.LocalPlayer then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local playerPosition = character.HumanoidRootPart.Position
                local dist = distance(myPosition, playerPosition)
                if dist < shortestDistance then
                    shortestDistance = dist
                    closestPlayer = player
                end
            end
        end
    end

    return closestPlayer
end

-- Teleport function
local function teleportToNearestPlayer()
    local nearestPlayer = findNearestPlayer()
    if nearestPlayer then
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(nearestPlayer.Character.HumanoidRootPart.Position)
        end
    else
        print("No other players found.")
    end
end

-- Bind the teleport function to the key press
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == teleportKey then
        teleportToNearestPlayer()
    end
end)

   end,
})

Rayfield:Notify({
   Title = "Universal++",
   Content = "Welcome to Universal ++!",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "got it!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Slider = Tab:CreateSlider({
   Name = "Spin Speed",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Currently bugged, reset to stop",
   CurrentValue = 0,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
 -- Parameters
local spinSpeed = (Value)  -- Initial spin speed (adjust as needed)
local character = game.Players.LocalPlayer.Character
local humanoid = character:WaitForChild("Humanoid")

-- Function to make the character spin
local function spinCharacter()
    while true do
        character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
        wait(0.1 / spinSpeed)  -- Adjust speed based on spinSpeed
    end
end

-- Call the function to start spinning
spinCharacter()

   end,
})

local Button = AETab:CreateButton({
   Name = "FULL BODY ESP",
   Callback = function()
-- LocalPlayer refers to the player using the script
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to change a player's character color to bright red
local function changeColorToRed(character)
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.BrickColor = BrickColor.new("Bright red") -- Change the part's color to bright red
        end
    end
end

-- Function to create a highlight for the player's character
local function createHighlight(character)
    -- Check if the character already has a highlight
    if character:FindFirstChild("Highlight") then return end

    -- Create a new highlight instance
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.new(1, 0, 0) -- Set highlight fill color to bright red
    highlight.FillTransparency = 0.5 -- Set transparency for visibility through walls
    highlight.OutlineTransparency = 0.1 -- Adjust outline transparency
    highlight.Parent = character -- Parent the highlight to the character
end

-- Function to apply changes to all players
local function applyChangesToPlayers()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            changeColorToRed(player.Character)
            createHighlight(player.Character)
        end
    end
end

-- Run the script initially
applyChangesToPlayers()

-- Connect to PlayerAdded event to apply changes to new players
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        changeColorToRed(character)
        createHighlight(character)
    end)
end)

-- Connect to CharacterAdded event for all current players
for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        changeColorToRed(player.Character)
        createHighlight(player.Character)
    end
    player.CharacterAdded:Connect(function(character)
        changeColorToRed(character)
        createHighlight(character)
    end)
end
   end,
})

local Button = AETab:CreateButton({
   Name = "Tracers",
   Callback = function()
   local function API_Check()
    if Drawing == nil then
        return "No"
    else
        return "Yes"
    end
end

local Find_Required = API_Check()

if Find_Required == "No" then
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Exunys Developer";
        Text = "Tracer script could not be loaded because your exploit is unsupported.";
        Duration = math.huge;
        Button1 = "OK"
    })

    return
end

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Camera = game:GetService("Workspace").CurrentCamera
local UserInputService = game:GetService("UserInputService")
local TestService = game:GetService("TestService")

local Typing = false

_G.SendNotifications = true   -- If set to true then the script would notify you frequently on any changes applied and when loaded / errored. (If a game can detect this, it is recommended to set it to false)
_G.DefaultSettings = false   -- If set to true then the tracer script would run with default settings regardless of any changes you made.

_G.TeamCheck = false   -- If set to true then the script would create tracers only for the enemy team members.

--[!]-- ONLY ONE OF THESE VALUES SHOULD BE SET TO TRUE TO NOT ERROR THE SCRIPT --[!]--

_G.FromMouse = false   -- If set to true, the tracers will come from the position of your mouse curson on your screen.
_G.FromCenter = false   -- If set to true, the tracers will come from the center of your screen.
_G.FromBottom = true   -- If set to true, the tracers will come from the bottom of your screen.

_G.TracersVisible = true   -- If set to true then the tracers will be visible and vice versa.
_G.TracerColor = Color3.fromRGB(255, 80, 10)   -- The color that the tracers would appear as.
_G.TracerThickness = 1   -- The thickness of the tracers.
_G.TracerTransparency = 0.7   -- The transparency of the tracers.

_G.ModeSkipKey = Enum.KeyCode.E   -- The key that changes between modes that indicate where will the tracers come from.
_G.DisableKey = Enum.KeyCode.Q   -- The key that disables / enables the tracers.

local function CreateTracers()
    for _, v in next, Players:GetPlayers() do
        if v.Name ~= game.Players.LocalPlayer.Name then
            local TracerLine = Drawing.new("Line")
    
            RunService.RenderStepped:Connect(function()
                if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                    local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * 1
                    local Vector, OnScreen = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(0, -HumanoidRootPart_Size.Y, 0).p)
                    
                    TracerLine.Thickness = _G.TracerThickness
                    TracerLine.Transparency = _G.TracerTransparency
                    TracerLine.Color = _G.TracerColor

                    if _G.FromMouse == true and _G.FromCenter == false and _G.FromBottom == false then
                        TracerLine.From = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                    elseif _G.FromMouse == false and _G.FromCenter == true and _G.FromBottom == false then
                        TracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                    elseif _G.FromMouse == false and _G.FromCenter == false and _G.FromBottom == true then
                        TracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    end

                    if OnScreen == true  then
                        TracerLine.To = Vector2.new(Vector.X, Vector.Y)
                        if _G.TeamCheck == true then 
                            if Players.LocalPlayer.Team ~= v.Team then
                                TracerLine.Visible = _G.TracersVisible
                            else
                                TracerLine.Visible = false
                            end
                        else
                            TracerLine.Visible = _G.TracersVisible
                        end
                    else
                        TracerLine.Visible = false
                    end
                else
                    TracerLine.Visible = false
                end
            end)

            Players.PlayerRemoving:Connect(function()
                TracerLine.Visible = false
            end)
        end
    end

    Players.PlayerAdded:Connect(function(Player)
        Player.CharacterAdded:Connect(function(v)
            if v.Name ~= game.Players.LocalPlayer.Name then
                local TracerLine = Drawing.new("Line")
        
                RunService.RenderStepped:Connect(function()
                    if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                        local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * 1
                    	local Vector, OnScreen = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(0, -HumanoidRootPart_Size.Y, 0).p)
                        
                        TracerLine.Thickness = _G.TracerThickness
                        TracerLine.Transparency = _G.TracerTransparency
                        TracerLine.Color = _G.TracerColor

                        if _G.FromMouse == true and _G.FromCenter == false and _G.FromBottom == false then
                            TracerLine.From = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                        elseif _G.FromMouse == false and _G.FromCenter == true and _G.FromBottom == false then
                            TracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                        elseif _G.FromMouse == false and _G.FromCenter == false and _G.FromBottom == true then
                            TracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                        end

                        if OnScreen == true  then
                            TracerLine.To = Vector2.new(Vector.X, Vector.Y)
                            if _G.TeamCheck == true then 
                                if Players.LocalPlayer.Team ~= Player.Team then
                                    TracerLine.Visible = _G.TracersVisible
                                else
                                    TracerLine.Visible = false
                                end
                            else
                                TracerLine.Visible = _G.TracersVisible
                            end
                        else
                            TracerLine.Visible = false
                        end
                    else
                        TracerLine.Visible = false
                    end
                end)

                Players.PlayerRemoving:Connect(function()
                    TracerLine.Visible = false
                end)
            end
        end)
    end)
end

UserInputService.TextBoxFocused:Connect(function()
    Typing = true
end)

UserInputService.TextBoxFocusReleased:Connect(function()
    Typing = false
end)

UserInputService.InputBegan:Connect(function(Input)
    if Input.KeyCode == _G.ModeSkipKey and Typing == false then
        if _G.FromMouse == true and _G.FromCenter == false and _G.FromBottom == false and _G.TracersVisible == true then
            _G.FromCenter = false
            _G.FromBottom = true
            _G.FromMouse = false

            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "Exunys Developer";
                    Text = "Tracers will be now coming from the bottom of your screen (Mode 1)";
                    Duration = 5;
                })
            end
        elseif _G.FromMouse == false and _G.FromCenter == false and _G.FromBottom == true and _G.TracersVisible == true then
            _G.FromCenter = true
            _G.FromBottom = false
            _G.FromMouse = false

            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "Exunys Developer";
                    Text = "Tracers will be now coming from the center of your screen (Mode 2)";
                    Duration = 5;
                })
            end
        elseif _G.FromMouse == false and _G.FromCenter == true and _G.FromBottom == false and _G.TracersVisible == true then
            _G.FromCenter = false
            _G.FromBottom = false
            _G.FromMouse = true

            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "Exunys Developer";
                    Text = "Tracers will be now coming from the position of your mouse cursor on your screen (Mode 3)";
                    Duration = 5;
                })
            end
        end
    elseif Input.KeyCode == _G.DisableKey and Typing == false then
        _G.TracersVisible = not _G.TracersVisible
        
        if _G.SendNotifications == true then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Exunys Developer";
                Text = "The tracers' visibility is now set to "..tostring(_G.TracersVisible)..".";
                Duration = 5;
            })
        end
    end
end)

if _G.DefaultSettings == true then
    _G.TeamCheck = false
    _G.FromMouse = false
    _G.FromCenter = false
    _G.FromBottom = true
    _G.TracersVisible = true
    _G.TracerColor = Color3.fromRGB(40, 90, 255)
    _G.TracerThickness = 1
    _G.TracerTransparency = 0.5
    _G.ModeSkipKey = Enum.KeyCode.E
    _G.DisableKey = Enum.KeyCode.Q
end

local Success, Errored = pcall(function()
    CreateTracers()
end)

if Success and not Errored then
    if _G.SendNotifications == true then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Universal++";
            Text = "Tracer script has successfully loaded.";
            Duration = 5;
        })
    end
elseif Errored and not Success then
    if _G.SendNotifications == true then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Exunys Developer";
            Text = "Tracer script has errored while loading, please check the developer console! (F9)";
            Duration = 5;
        })
    end
    TestService:Message("The tracer script has errored, please notify Exunys with the following information :")
    warn(Errored)
    print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")
end
   end,
})

local Button = AETab:CreateButton({
   Name = "Universal Aimbot (Hold right click)",
   Callback = function()
   local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Holding = false

_G.AimbotEnabled = true
_G.TeamCheck = false -- If set to true then the script would only lock your aim at enemy team members.
_G.AimPart = "Head" -- Where the aimbot script would lock at.
_G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.

_G.CircleSides = 64 -- How many sides the FOV circle would have.
_G.CircleColor = Color3.fromRGB(255, 255, 255) -- (RGB) Color that the FOV circle would appear as.
_G.CircleTransparency = 0.7 -- Transparency of the circle.
_G.CircleRadius = 80 -- The radius of the circle / FOV.
_G.CircleFilled = false -- Determines whether or not the circle is filled.
_G.CircleVisible = true -- Determines whether or not the circle is visible.
_G.CircleThickness = 0 -- The thickness of the circle.

local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.CircleColor
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

local function GetClosestPlayer()
	local MaximumDistance = _G.CircleRadius
	local Target = nil

	for _, v in next, Players:GetPlayers() do
		if v.Name ~= LocalPlayer.Name then
			if _G.TeamCheck == true then
				if v.Team ~= LocalPlayer.Team then
					if v.Character ~= nil then
						if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
							if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
								local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
								local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
								
								if VectorDistance < MaximumDistance then
									Target = v
								end
							end
						end
					end
				end
			else
				if v.Character ~= nil then
					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
							local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
							
							if VectorDistance < MaximumDistance then
								Target = v
							end
						end
					end
				end
			end
		end
	end

	return Target
end

UserInputService.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
    end
end)

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Filled = _G.CircleFilled
    FOVCircle.Color = _G.CircleColor
    FOVCircle.Visible = _G.CircleVisible
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Transparency = _G.CircleTransparency
    FOVCircle.NumSides = _G.CircleSides
    FOVCircle.Thickness = _G.CircleThickness

    if Holding == true and _G.AimbotEnabled == true then
        TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
    end
end)
   end,
})

local Toggle = TRTab:CreateToggle({
    Name = "Troll section coming soon!",
    CurrentValue = false,
    Flag = "Annoyer101Universal123",
    Callback = function(Value)
print("Coming soon!")

    end,
})


print("Everything was a success")
print("Enjoy universal Plus Plus V1.06")
