--//Services

--//Variables
local loadersList = loadstring(game:HttpGet("https://raw.githubusercontent.com/yLord24/Y-Hub-V3/refs/heads/main/LuarmorLoaders"))()
local currentPlaceId = tostring(game.PlaceId)

--//Source
local function isGameInList(targetPlaceId): ()
   return targetPlaceId == currentPlaceId
end

for placeId: string, Loader: any in next, loadersList do

    if isGameInList(placeId) then
        Loader()
        break
    end
end


