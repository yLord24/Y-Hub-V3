--//Services
local Players = game:GetService("Players")

--//Variables
local foundLoader = false
local loadersList = loadstring(game:HttpGet("https://raw.githubusercontent.com/yLord24/Y-Hub-V3/_/LuarmorLoaders"))()
local currentPlaceId = tostring(game.PlaceId)

--//Source
local function isGameInList(targetPlaceId): ()
   return targetPlaceId == currentPlaceId
end

for placeId: string, Loader: any in next, loadersList do

    if isGameInList(placeId) then
        foundLoader = true
        task.spawn(Loader)
        break
    end
end

if not foundLoader then
    Players.LocalPlayer:Kick("Y Hub V3: Game not supported or not found.")
end
