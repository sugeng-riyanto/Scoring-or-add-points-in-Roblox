local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

-- Define the touch parts and their respective scores
local PointsConfig = {
	{PartName = "PointPart1", Score = 10},
	{PartName = "PointPart2", Score = 20},
	{PartName = "PointPart3", Score = 50},
}

-- Function to create a leaderboard for each player
local function createLeaderboard(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local score = Instance.new("IntValue")
	score.Name = "Score"
	score.Value = 0
	score.Parent = leaderstats
end

-- Handle player added event
Players.PlayerAdded:Connect(function(player)
	createLeaderboard(player)
end)

-- Function to handle touch events with sound
local function onTouch(part, score)
	part.Touched:Connect(function(hit)
		local character = hit.Parent
		local player = Players:GetPlayerFromCharacter(character)

		if player then
			-- Play the sound effect
			local sound = part:FindFirstChild("TouchSound")
			if sound then
				sound:Play()
			end

			-- Update the player's score
			local leaderstats = player:FindFirstChild("leaderstats")
			if leaderstats then
				local scoreValue = leaderstats:FindFirstChild("Score")
				if scoreValue then
					scoreValue.Value = scoreValue.Value + score
				end
			end
		end
	end)
end

-- Attach touch event handlers to configured parts
for _, config in ipairs(PointsConfig) do
	local part = Workspace:FindFirstChild(config.PartName)
	if part then
		onTouch(part, config.Score)
	else
		warn("Part " .. config.PartName .. " not found in Workspace")
	end
end
