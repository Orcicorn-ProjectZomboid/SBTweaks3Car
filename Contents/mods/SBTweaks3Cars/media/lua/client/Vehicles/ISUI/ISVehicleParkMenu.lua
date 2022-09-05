-- Overwrite the Animation times for INflating and deflating tires
-- see //PATH_TO_GAME/media/lua/client/Vehicles/ISUI/ISVehiclePartMenu.lua

-- Overwrite the Tire Inflation animations
function ISVehiclePartMenu.onInflateTire(playerObj, part)
	if not playerObj:getInventory():contains("TirePump", true) then return end
	if playerObj:getVehicle() then
		ISVehicleMenu.onExit(playerObj)
	end
	ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), part:getArea()))
	local pump = ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), "TirePump", true)
	local psiTarget = part:getContainerCapacity() + 5
	if round(part:getContainerContentAmount(), 2) < part:getContainerCapacity() then
		psiTarget = part:getContainerCapacity()
	end
	-- ORIGINAL: Slow inflation
	-- local maxTime = math.ceil(psiTarget - part:getContainerContentAmount()) * 100
	local maxTime = math.ceil(psiTarget - part:getContainerContentAmount()) * 10
	ISTimedActionQueue.add(ISInflateTire:new(playerObj, part, pump, psiTarget, maxTime))
end

-- Overwrite the Tire deflation animation times
function ISVehiclePartMenu.onDeflateTire(playerObj, part)
	if playerObj:getVehicle() then
		ISVehicleMenu.onExit(playerObj)
	end
	ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), part:getArea()))
	-- ORIGINAL: Slow Deflation
	--ISTimedActionQueue.add(ISDeflateTire:new(playerObj, part, 0, (part:getContainerContentAmount() - 0) * 50))
	ISTimedActionQueue.add(ISDeflateTire:new(playerObj, part, 0, (part:getContainerContentAmount() - 0) * 5))
end
