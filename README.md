
# Roblox Points System with Touch Parts

This script creates a points system in Roblox where players can earn points by touching specific parts. The points are tracked in a leaderboard, and each part awards a different score.

---

## How It Works

1. **Leaderboard Creation**:
   - When a player joins the game, a leaderboard (`leaderstats`) is created for them.
   - The leaderboard contains an integer value called `Score`, which tracks the player's points.

2. **Touch Parts**:
   - Specific parts in the game are configured to award points when a player touches them.
   - Each part has a unique score associated with it.

3. **Point Awarding**:
   - When a player touches a part:
     - The script identifies the player.
     - The player's score on the leaderboard is increased by the score value of the touched part.

---

## Setup Instructions

### 1. Define Parts and Scores
In the script, parts are defined in the `PointsConfig` table. Each part has:
- `PartName`: The name of the part in the **Workspace**.
- `Score`: The number of points awarded when the part is touched.

Example:
```lua
local PointsConfig = {
    {PartName = "PointPart1", Score = 10},
    {PartName = "PointPart2", Score = 20},
    {PartName = "PointPart3", Score = 50},
}
```
Make sure the parts in **Workspace** match the names in this table.

---

### 2. Place the Script
1. Insert this script into the **ServerScriptService**.
2. The script automatically:
   - Creates leaderboards for players.
   - Assigns touch event handlers to the configured parts.

---

### 3. Add Touch Parts to Workspace
1. Add the parts (`PointPart1`, `PointPart2`, `PointPart3`) to **Workspace**.
2. These parts will trigger the score-adding functionality when touched.

---

## File Structure

Your **Explorer** should look like this:

```
Workspace
├── PointPart1 (Part)
├── PointPart2 (Part)
├── PointPart3 (Part)
ServerScriptService
├── PointsScript (Script)
```

---

## Script Details

### Key Functions
1. `createLeaderboard(player)`:
   - Creates a `leaderstats` folder for each player.
   - Adds a `Score` value to track points.

2. `onTouch(part, score)`:
   - Connects the `Touched` event of a part to a function.
   - Updates the player's score when they touch the part.

3. **Main Loop**:
   - Loops through all parts in `PointsConfig`.
   - Assigns the `onTouch` function to each part.

---

## Adding New Parts

1. Add a new part to **Workspace**.
2. Update the `PointsConfig` table with the part name and desired score.
3. Example:
```lua
local PointsConfig = {
    {PartName = "PointPart1", Score = 10},
    {PartName = "PointPart2", Score = 20},
    {PartName = "PointPart3", Score = 50},
    {PartName = "PointPart4", Score = 100}, -- New part added
}
```

---

## Testing the Script

1. Play the game in **Roblox Studio**.
2. Touch the parts to see the score increase in the leaderboard.

---

## Troubleshooting

1. **Part Not Found**:
   - If you see a warning like `Part PointPart1 not found in Workspace`, make sure the part exists and is correctly named in the **Workspace**.

2. **Score Not Updating**:
   - Ensure the `leaderstats` folder and `Score` value are correctly created for the player.

---

## Additional Resources

- **GitHub Repository**: [Access the scripts here](https://github.com/sugeng-riyanto/Scoring-or-add-points-in-Roblox/tree/main)
- **YouTube Tutorial**: [Watch this video for a detailed tutorial](https://youtu.be/WpsBeFhSqR8)

[![Watch the video](https://img.youtube.com/vi/WpsBeFhSqR/0.jpg)](https://youtu.be/WpsBeFhSqR8)

---

With this setup, you can easily add interactive parts to your game and reward players with points for touching them!
