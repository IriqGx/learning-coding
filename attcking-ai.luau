--For Roblox Studios

local NPC = script.Parent
local HumanoidRootPart = NPC.HumanoidRootPart

local MaxDistance = math.huge
local debounce = false

local speed = 20
NPC.Humanoid.WalkSpeed = speed

local animator = NPC.Humanoid:FindFirstChild("Animator") or Instance.new("Animator", NPC.Humanoid)  -- Make sure there's an Animator
local attackAnimation = Instance.new("Animation")  -- Create a new Animation object
attackAnimation.AnimationId = "rbxassetid://133993294177579"  -- Replace with your Animation ID

--plays attack animantion
local function playAttackAnimation()
	local animationTrack = animator:LoadAnimation(attackAnimation)
	animationTrack:Play()
end

--delays attcks
local function setDebounce()
	debounce = true
	wait(1)
	debounce = false
end

--attacking
local function hit_enemy(humanoid)
	if humanoid and humanoid.Health > 0 then
		humanoid.Health = humanoid.Health - 1
	end
end

--slows down enmey
local function setSpeed()
	NPC.Humanoid.WalkSpeed = 2
	wait(.5)
	NPC.Humanoid.WalkSpeed = speed
end


--attacking  
NPC.Humanoid.Touched:Connect(function(hit)
	
	local character = hit.Parent
	local player = game.Players:GetPlayerFromCharacter(character)
	local humanoid = character:FindFirstChild("Humanoid")
	
	if player and not debounce then
		
		debounce = true

		spawn(function()
			setDebounce()
		end)

		spawn(function()
			hit_enemy(humanoid)
		end)
		
		spawn(function()
			setSpeed()
		end)
		
		
		playAttackAnimation()
		
	end
end)

--pathfinding
while wait() do
	local Players = game.Players:GetPlayers()
	local closest

	for i, plr in pairs(Players) do
		if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
			local PlayerHumanoidRootPart = plr.Character.HumanoidRootPart
			local Distance = (HumanoidRootPart.Position - PlayerHumanoidRootPart.Position).Magnitude

			if not closest then
				closest = PlayerHumanoidRootPart
			end

			if (HumanoidRootPart.Position - closest.Position).Magnitude > Distance then
				closest = PlayerHumanoidRootPart
			end


		end
	end

	if closest and (HumanoidRootPart.Position - closest.Position).Magnitude <= MaxDistance then
		NPC.Humanoid:MoveTo(closest.Position)
	end

end
