--//v1.2
--//made by sytsytdispatch
--//ui template from https://docs.sirius.menu/rayfield


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
print("successfully injected Key system")
local Window = Rayfield:CreateWindow({
   Name = "Universal Plus Plus",
   LoadingTitle = "Universal Plus is loading..",
   LoadingSubtitle = "by Sirius and sytsytdispatch",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Blackyhub121"
   },
   Discord = {
      Enabled = true,
      Invite = "Cf3cmK5uwB",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Join the discord for the key!",
      Subtitle = "https://discord.gg/4xPkdpE6A8",
      Note = "https://discord.gg/4xPkdpE6A8",
      FileName = "Blackyhub1212",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {"BLDR"}
   }
})
print("User is a Human")


local Tab = Window:CreateTab("Local Player", nil)
local TPTab = Window:CreateTab("Teleportation", nil) -- Title, Image
local AETab = Window:CreateTab("ESP and Aimbot", nil) -- Title, Image
local TRTab = Window:CreateTab("Admin", nil) -- Title, Image
local GUITab = Window:CreateTab("Game GUI's", nil) -- Title, Image


print("Successfully injected Universal++")
local Slider1 = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 150},
   Increment = 5,
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
   Increment = 5,
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
    Increment = 10,
    Suffix = "Don't Get to dizzy!",
    CurrentValue = 0,
    Flag = "Slider1", 
    Callback = function(Value)
        
        local spinSpeed = Value  
        local character = game.Players.LocalPlayer.Character
        local humanoid = character:WaitForChild("Humanoid")
        
        
        local function spinCharacter()
            while true do
                if spinSpeed == 0 then
                    break
                end
                character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
                wait(0.1 / spinSpeed) 
            end
        end
        
        
        if _G.spinCoroutine then
            coroutine.close(_G.spinCoroutine)
        end
        _G.spinCoroutine = coroutine.create(spinCharacter)
        coroutine.resume(_G.spinCoroutine)
        
       
        spinSpeed = Value
    end,
})


local Button = AETab:CreateButton({
   Name = "Box ESP",
   Callback = function()
local plr = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera

for i, v in pairs(game.Players:GetChildren()) do
    local Top = Drawing.new("Line")
    Top.Visible = false
    Top.From = Vector2.new(0, 0)
    Top.To = Vector2.new(200, 200)
    Top.Color = Color3.fromRGB(255, 0, 0)
    Top.Thickness = 2
    Top.Transparency = 1

    local Bottom = Drawing.new("Line")
    Bottom.Visible = false
    Bottom.From = Vector2.new(0, 0)
    Bottom.To = Vector2.new(200, 200)
    Bottom.Color = Color3.fromRGB(255, 0, 0)
    Bottom.Thickness = 2
    Bottom.Transparency = 1

    local Left = Drawing.new("Line")
    Left.Visible = false
    Left.From = Vector2.new(0, 0)
    Left.To = Vector2.new(200, 200)
    Left.Color = Color3.fromRGB(255, 0, 0)
    Left.Thickness = 2
    Left.Transparency = 1

    local Right = Drawing.new("Line")
    Right.Visible = false
    Right.From = Vector2.new(0, 0)
    Right.To = Vector2.new(200, 200)
    Right.Color = Color3.fromRGB(255, 0, 0)
    Right.Thickness = 2
    Right.Transparency = 1

    function ESP()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Name ~= plr.Name and v.Character.Humanoid.Health > 0 then 
                local ScreenPos, OnScreen = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if OnScreen then
                    local Scale = v.Character.Head.Size.Y/2
                    local Size = Vector3.new(2, 3, 0) * (Scale * 2)
                    local humpos = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                    local TL = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, 0)).p)
                    local TR = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, 0)).p)
                    local BL = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, 0)).p)
                    local BR = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).p)

                    Top.From = Vector2.new(TL.X, TL.Y)
                    Top.To = Vector2.new(TR.X, TR.Y)

                    Left.From = Vector2.new(TL.X, TL.Y)
                    Left.To = Vector2.new(BL.X, BL.Y)

                    Right.From = Vector2.new(TR.X, TR.Y)
                    Right.To = Vector2.new(BR.X, BR.Y)

                    Bottom.From = Vector2.new(BL.X, BL.Y)
                    Bottom.To = Vector2.new(BR.X, BR.Y)

                    if v.TeamColor == plr.TeamColor then
                        Top.Color = Color3.fromRGB(0, 255, 0)
                        Left.Color = Color3.fromRGB(0, 255, 0)
                        Bottom.Color = Color3.fromRGB(0, 255, 0)
                        Right.Color = Color3.fromRGB(0, 255, 0)
                    else 
                        Top.Color = Color3.fromRGB(255, 0, 0)
                        Left.Color = Color3.fromRGB(255, 0, 0)
                        Bottom.Color = Color3.fromRGB(255, 0, 0)
                        Right.Color = Color3.fromRGB(255, 0, 0)
                    end

                    Top.Visible = true
                    Left.Visible = true
                    Bottom.Visible = true
                    Right.Visible = true
                else 
                    Top.Visible = false
                    Left.Visible = false
                    Bottom.Visible = false
                    Right.Visible = false
                end
            else 
                Top.Visible = false
                Left.Visible = false
                Bottom.Visible = false
                Right.Visible = false
                if game.Players:FindFirstChild(v.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(ESP)()
end

game.Players.PlayerAdded:Connect(function(newplr) --Parameter gets the new player that has been added
    local Top = Drawing.new("Line")
    Top.Visible = false
    Top.From = Vector2.new(0, 0)
    Top.To = Vector2.new(200, 200)
    Top.Color = Color3.fromRGB(255, 0, 0)
    Top.Thickness = 2
    Top.Transparency = 1

    local Bottom = Drawing.new("Line")
    Bottom.Visible = false
    Bottom.From = Vector2.new(0, 0)
    Bottom.To = Vector2.new(200, 200)
    Bottom.Color = Color3.fromRGB(255, 0, 0)
    Bottom.Thickness = 2
    Bottom.Transparency = 1

    local Left = Drawing.new("Line")
    Left.Visible = false
    Left.From = Vector2.new(0, 0)
    Left.To = Vector2.new(200, 200)
    Left.Color = Color3.fromRGB(255, 0, 0)
    Left.Thickness = 2
    Left.Transparency = 1

    local Right = Drawing.new("Line")
    Right.Visible = false
    Right.From = Vector2.new(0, 0)
    Right.To = Vector2.new(200, 200)
    Right.Color = Color3.fromRGB(255, 0, 0)
    Right.Thickness = 2
    Right.Transparency = 1

    function ESP()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if newplr.Character ~= nil and newplr.Character:FindFirstChild("HumanoidRootPart") ~= nil and newplr.Name ~= plr.Name  and newplr.Character.Humanoid.Health > 0 then
                local ScreenPos, OnScreen = camera:WorldToViewportPoint(newplr.Character.HumanoidRootPart.Position)
                if OnScreen then
                    local Scale = newplr.Character.Head.Size.Y/2
                    local Size = Vector3.new(2, 3, 0) * (Scale * 2)
                    local humpos = camera:WorldToViewportPoint(newplr.Character.HumanoidRootPart.Position)
                    local TL = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, 0)).p)
                    local TR = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, 0)).p)
                    local BL = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, 0)).p)
                    local BR = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).p)

                    Top.From = Vector2.new(TL.X, TL.Y)
                    Top.To = Vector2.new(TR.X, TR.Y)

                    Left.From = Vector2.new(TL.X, TL.Y)
                    Left.To = Vector2.new(BL.X, BL.Y)

                    Right.From = Vector2.new(TR.X, TR.Y)
                    Right.To = Vector2.new(BR.X, BR.Y)

                    Bottom.From = Vector2.new(BL.X, BL.Y)
                    Bottom.To = Vector2.new(BR.X, BR.Y)

                    if newplr.TeamColor == plr.TeamColor then
                        Top.Color = Color3.fromRGB(0, 255, 0)
                        Left.Color = Color3.fromRGB(0, 255, 0)
                        Bottom.Color = Color3.fromRGB(0, 255, 0)
                        Right.Color = Color3.fromRGB(0, 255, 0)
                    else 
                        Top.Color = Color3.fromRGB(255, 0, 0)
                        Left.Color = Color3.fromRGB(255, 0, 0)
                        Bottom.Color = Color3.fromRGB(255, 0, 0)
                        Right.Color = Color3.fromRGB(255, 0, 0)
                    end

                    Top.Visible = true
                    Left.Visible = true
                    Bottom.Visible = true
                    Right.Visible = true
                else 
                    Top.Visible = false
                    Left.Visible = false
                    Bottom.Visible = false
                    Right.Visible = false
                end
            else 
                Top.Visible = false
                Left.Visible = false
                Bottom.Visible = false
                Right.Visible = false
                if game.Players:FindFirstChild(newplr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(ESP)()
end)
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
_G.TeamCheck = true
_G.AimPart = "Head"
_G.Sensitivity = 0.1

_G.CircleSides = 64
_G.CircleColor = Color3.fromRGB(255, 255, 255)
_G.CircleTransparency = 0.7
_G.CircleRadius = 80
_G.CircleFilled = false
_G.CircleVisible = true
_G.CircleThickness = 0

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

    for _, v in pairs(Players:GetPlayers()) do
        if v.Name ~= LocalPlayer.Name then
            if _G.TeamCheck then
                if v.Team ~= LocalPlayer.Team then
                    if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        if v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                            local ScreenPoint = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                            local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                            
                            if VectorDistance < MaximumDistance then
                                Target = v
                                MaximumDistance = VectorDistance
                            end
                        end
                    end
                end
            else
                if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    if v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                        local ScreenPoint = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                        local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                        
                        if VectorDistance < MaximumDistance then
                            Target = v
                            MaximumDistance = VectorDistance
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

    if Holding and _G.AimbotEnabled then
        local closestPlayer = GetClosestPlayer()
        if closestPlayer then
            TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, closestPlayer.Character[_G.AimPart].Position)}):Play()
        end
    end
end)

   end,
})

local Button = TRTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = TRTab:CreateButton({
   Name = "Nameless Admin",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))() 
        
   end,
})


local Button = TPTab:CreateButton({
   Name = "Universal Teleport",
   Callback = function()
   local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.6, 0)
frame.Position = UDim2.new(0.35, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Parent = screenGui

local topBar = Instance.new("TextLabel")
topBar.Size = UDim2.new(1, 0, 0, 60)  -- Height doubled
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
topBar.Text = "Universal Teleportation"
topBar.TextScaled = true
topBar.Font = Enum.Font.LuckiestGuy
topBar.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundTransparency = 1
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 0, 0)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.LuckiestGuy
closeButton.Parent = topBar

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, -60)  -- Adjusted for new top bar height
scrollingFrame.Position = UDim2.new(0, 0, 0, 60)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 10
scrollingFrame.Parent = frame

local function createPlayerButton(player)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 50)
    button.Text = player.Name
    button.TextScaled = true
    button.Parent = scrollingFrame

    local avatar = Instance.new("ImageLabel")
    avatar.Size = UDim2.new(0, 50, 0, 50)
    avatar.Position = UDim2.new(0, 0, 0, 0)
    avatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"
    avatar.Parent = button

    button.MouseButton1Click:Connect(function()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character:SetPrimaryPartCFrame(player.Character.HumanoidRootPart.CFrame)
        end
    end)

    return button
end

local function updatePlayerList()
    local existingPlayers = {}
    for _, child in ipairs(scrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            existingPlayers[child.Text] = child
        end
    end

    local yOffset = 0
    for _, player in ipairs(Players:GetPlayers()) do
        local button = existingPlayers[player.Name]
        if not button then
            button = createPlayerButton(player)
        end
        button.Position = UDim2.new(0, 10, 0, yOffset)
        yOffset = yOffset + 60
    end

    for name, button in pairs(existingPlayers) do
        if not Players:FindFirstChild(name) then
            button:Destroy()
        end
    end

    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end

Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

game:GetService("RunService").Stepped:Connect(function()
    updatePlayerList()
end)

local dragging
local dragInput
local dragStart
local startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

topBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

topBar.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui.Enabled = false
    game.StarterGui:SetCore("SendNotification", {
        Title = "Universal Teleportation",
        Text = "Press L to bring back the GUI",
        Duration = 5
    })
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.L then
        if not screenGui.Enabled then
            screenGui.Enabled = true
        end
    end
end)

while true do
    updatePlayerList()
    wait(1)
end

   end,
})

local Button = GUITab:CreateButton({
   Name = "Arsenal GUI",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidzyScripter/VoidHub-/main/Source%20Code"))();
   end,
})

local Button = GUITab:CreateButton({
   Name = "Murder Mystery 2",
   Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/yurji45slfk65hixhme/HRDXGJ/main/BBBESTscriptForMM2'),true))()
   end,
})

local Button = GUITab:CreateButton({
   Name = "Dahood GUI",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
   end,
})


local Button = GUITab:CreateButton({
   Name = "PS99 GUI",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/PetSimulator99/main/redz9999.lua"))()
   end,
})





print("Everything was a success")
print("Enjoy universal Plus Plus V1.2")

