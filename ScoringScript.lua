-- Import the Players and Workspace services from Roblox
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

-- Define the parts that will give points and the scores they award
local PointsConfig = {
    {PartName = "PointPart1", Score = 10}, -- Part named "PointPart1" gives 10 points
    {PartName = "PointPart2", Score = 20}, -- Part named "PointPart2" gives 20 points
    {PartName = "PointPart3", Score = 50}, -- Part named "PointPart3" gives 50 points
}

-- Function to create a leaderboard for a player when they join the game
local function createLeaderboard(player)
    -- Create a folder to store leaderboard stats
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats" -- This name is required for the leaderboard to display
    leaderstats.Parent = player -- Attach the leaderboard to the player

    -- Create a "Score" stat in the leaderboard
    local score = Instance.new("IntValue")
    score.Name = "Score" -- The stat name displayed on the leaderboard
    score.Value = 0 -- Initial score is set to 0
    score.Parent = leaderstats -- Attach the score to the leaderboard folder
end

-- Event: When a player joins the game
Players.PlayerAdded:Connect(function(player)
    createLeaderboard(player) -- Create a leaderboard for the new player
end)

-- Function to handle touch events for a part
local function onTouch(part, score)
    -- Connect the Touched event of the part
    part.Touched:Connect(function(hit)
        -- Check if the object that touched the part belongs to a player's character
        local character = hit.Parent
        local player = Players:GetPlayerFromCharacter(character)

        -- If a player is found, update their score and play a sound
        if player then
            -- Play the sound effect if the part has a "TouchSound" object
            local sound = part:FindFirstChild("TouchSound")
            if sound then
                sound:Play() -- Play the sound
            end

            -- Update the player's score in the leaderboard
            local leaderstats = player:FindFirstChild("leaderstats")
            if leaderstats then
                local scoreValue = leaderstats:FindFirstChild("Score")
                if scoreValue then
                    scoreValue.Value = scoreValue.Value + score -- Add points to the player's score
                end
            end
        end
    end)
end

-- Attach the touch event handler to each configured part
for _, config in ipairs(PointsConfig) do
    -- Find the part in the Workspace by its name
    local part = Workspace:FindFirstChild(config.PartName)
    if part then
        -- Attach the onTouch function to handle touches for this part
        onTouch(part, config.Score)
    else
        -- Warn in the output if the part is not found
        warn("Part " .. config.PartName .. " not found in Workspace")
    end
end
