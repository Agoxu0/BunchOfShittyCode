-- Basic  variables :>>
local UserInputService = game:GetService("UserInputService") -- We will this  to stop fling bot
local RunService = game:GetService("RunService")
local Players = game.Players
local Player = Players.LocalPlayer
local Character = Player.Character
local OldCFrame = Character.HumanoidRootPart.CFrame
local DidJump = false
-- Time for coding  (⌐▨_▨)
_G.FlingBot = RunService.Heartbeat:connect(function() -- This will loop every frame.
	-- This code sets the Velocity of the HumanoidRootPart to 9999,9999,9999 To be able to fling people. 
	Character.HumanoidRootPart.Velocity = Vector3.new(9999,9999,9999)
	-- Also we need Anti Sit! So this is a simple code.
	Character.Humanoid.Sit = false
end)
-- i need to put this here to know until player jumped!
UserInputService.JumpRequest:Connect(function()
    DidJump = true
end)
-- Now we need to loop every player, and then tp to them for .1 or .2 second's
-- How do we do it? Its very simple! (I am talking to my self and writing this code at 2 am help me please)
-- We will just repeat the whole thing until player jumped cuz why not?
repeat
	-- We want to update the Players List so we need to overwrite the Players variable! Why we want to overwrite  the Players List? cuz if not, when new players join, the script wont see them.
	local Players = game.Players
	-- First Check if you even have Character And RootPart
	if Character ~= nil and Character.HumanoidRootPart then
		-- Now we need to loop every player!
		for _,v in pairs(Players:GetPlayers()) do
			-- Check if its not us!
			if v.Name ~= Player.Name then
				-- Check if the Player has Character And RootPart!
				if v.Character ~= nil and v.Character.HumanoidRootPart then
					local Start = os.clock() -- os.clock() is a function that gets your time right now
                    while os.clock() - Start < .2 do -- This Code Checks if the .2 of second passed
                        Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0) --  And the Best Part! Teleporting to Players! BTW You can make it without * CFrame.New(0,-1,0) but with it it will fling players with noclip
                        RunService.Heartbeat:Wait() -- More Better Wait
                    end
				end
			end
		end
	end
until DidJump -- By this line of code you can stop this after you jump. Usefull if you want to stop flinging
_G.FlingBot:Disconnect() -- This will turn off the fling bot.
-- Code that i explained Before.
local Start = os.clock()
while os.clock() - Start < .5 do
    Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0) -- return velocity back to 0,0,0 
    Character.HumanoidRootPart.CFrame = OldCFrame -- come back to the place where we were
    RunService.Heartbeat:Wait()
end
-- Thats it! Were done.  (⌐▨_▨)
