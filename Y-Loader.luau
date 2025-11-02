--//Services
local Players = game:GetService("Players")
local marketplaceService = game:GetService("MarketplaceService")

--//Variables
local foundLoader = false
local loadersList = loadstring(game:HttpGet("https://raw.githubusercontent.com/yLord24/Y-Hub-V3/_/LuarmorLoaders"))()
local Adjuster = loadstring(game:HttpGet("https://raw.githubusercontent.com/yLord24/Y-Hub-V3/_/Adjuster.luau"))()
local currentPlaceId = tostring(game.PlaceId)
local currentGameName;

--//Source
local function getPlaceNameFromMarketplace()

    local Success, gameName = pcall(function()
        local productInfo = marketplaceService:GetProductInfo(tonumber(currentPlaceId))
        return productInfo.Name
    end)
    
    if Success then
        return gameName
    end

    return ""
end

local function isGameInList(targetPlaceId): ()
   return (targetPlaceId == currentPlaceId) or (currentGameName == targetPlaceId)
end

currentGameName = getPlaceNameFromMarketplace()

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
