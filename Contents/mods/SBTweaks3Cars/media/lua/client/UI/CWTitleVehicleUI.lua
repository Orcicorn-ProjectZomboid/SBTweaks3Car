--[[
    DIRTY OVERWRITE SO THAT WE CAN FORCE THE MOD TO USE WHITELISTS INSTEAD
    SEE LINE 10 with "whiteListVehicles" and add vehicles you want to allow.
]]

require "ISUI/ISModalDialog"
require "luautils"

-- Add Whitelisted vehicles here, ALL LOWER CASE.  Make sure you have a pink slip in items
local whiteListVehicles = {
    "base.amc_bmw_classic",
    "base.amc_bmw_custom",
    "base.amc_harley",
    "base.vino125",
    "base.vino125b",
    "base.vino125pizza"
};

-- Function to check if items are in the whitelist, see line 74 for usage
local function tableContains(t, e)
	for _, value in pairs(t) do
		if value == e then
			return true
		end
	end
	return false
end

CWTitleVehicle = CWTitleVehicle or {}
CWTitleVehicle.UI = CWTitleVehicle.UI or {}
CWTitleVehicle.PartWhitelist = CWTitleVehicle.PartWhitelist or {}
CWTitleVehicle.VehicleBlacklist = CWTitleVehicle.VehicleBlacklist or {}

CWTitleVehicle.wantNoise = getDebug() or false
local noise = function(msg)
	if CWTitleVehicle.wantNoise then
		print('[CarWanna]: '..msg)
	end
end

local function createVehicleTitle(player, button, vehicle)
    if button.internal == "NO" then return end
    if luautils.walkAdj(player, vehicle:getSquare()) then
        ISTimedActionQueue.add(CWCreateVehicleTitle:new(player, vehicle))
    end
end

local function confirmationDialog(player, vehicle)    
    local message = string.format(getText("IGUI_CW_Confirm"), getText("IGUI_VehicleName"..vehicle:getScript():getName()))
    local playerNum = player:getPlayerNum()
    local modal = ISModalDialog:new(0, 0, 300, 150, message, true, player, createVehicleTitle, playerNum, vehicle)
    modal:initialise();
    modal:addToUIManager();
end

function CWTitleVehicle.UI.addOptionToMenuOutsideVehicle(player, context, vehicle)
    if not SandboxVars.CarWanna.EnableRegistration then return end
    
    local vehicleName = string.lower(vehicle:getScriptName())
    if string.find(vehicleName, "burnt") or string.find(vehicleName, "smashed") then return end --yeah no

    --Check if player has registration form
    if SandboxVars.CarWanna.NeedForm and not player:getInventory():containsTypeRecurse("AutoForm") then return end
    
    local hasPassengers
    for i = 0, vehicle:getMaxPassengers() - 1 do
        if vehicle:getCharacter(i) then
            hasPassengers = true
            break
        end
    end
    if hasPassengers then return end
    
    -- ------------------------------------------------------------- --
    -- TYLER'S WHITELIST FILTER ------------------------------------ --
    -- ------------------------------------------------------------- --
    -- If it's not in the whitelist, abort
    if tableContains(whiteListVehicles, vehicleName) ~= true then
        return;
    end
    -- ------------------------------------------------------------- --

    local optionText = getText('ContextMenu_CW_CreateTitle')
    local option= context:addOption(optionText, player, confirmationDialog, vehicle)
    
    local toolTip = ISToolTip:new()
    toolTip:initialise()
    toolTip:setVisible(false)
    toolTip:setName(optionText)
    option.toolTip = toolTip
    
    local vehicleID = vehicle:getScript():getName()
    local text =  getText("IGUI_VehicleName"..vehicleID)
    noise("Vehicle: "..text)
    noise("Vehicle ID: "..vehicleID)    
    local notAvailable = false    

    if (Valhalla and Valhalla.VehicleClaims) then
        local ownerData = Valhalla.VehicleClaims:getOwner(vehicle)
        if ownerData then 
            text = text .. " <LINE> <LINE> <RGB:1,1,1> " .. getText("Tooltip_CW_Aegis") .. " <LINE> <RGB:1,0,0> " .. ownerData
            notAvailable = true
        end
    end
        
        local key = player:getInventory():haveThisKeyId(vehicle:getKeyId())
        text = text .. " <LINE> <LINE> <RGB:1,1,1> " .. getText("Tooltip_CW_Key")
        if not key then
            local ktcolor = "<RGB:1,1,0> "
            if SandboxVars.CarWanna.MustHaveKey then
                notAvailable = true
                ktcolor = "<RGB:1,0,0> "
            end
            text = text .. " <LINE> ".. ktcolor .. getText("Tooltip_CW_KeyNo")
        else
            text = text .. " <LINE> <RGB:0,1,0> " .. getText("Tooltip_CW_KeyYes")
        end
        
        if vehicle:isHotwired() then            
            if not SandboxVars.CarWanna.AllowHotwire then
                notAvailable = true
                text = text .. " <LINE> <RGB:1,0,0> "
            else
                text = text .. " <LINE> <RGB:1,1,0> "
            end
            text = text .. getText("Tooltip_CW_KeyHot")
        end

        local containerHasItems = {}
        local missingParts = {}
        local brokenParts = {}
        for i = 1, vehicle:getPartCount() do
            local part = vehicle:getPartByIndex(i - 1)            
            local partItem = part:getInventoryItem()            
            local partId   = part:getId()         
            
            --print(partId)--.." Item Type: "..partItem)--:getItemType()).."Is Empty: "..part:getItemType():isEmpty())
            --if partItem then
            --    print(partId, partItem:getType())
            --end
            --print(partId, part:getItemType())
            if CWTitleVehicle.wantNoise then
                if partItem then            
                    print("Part ID: "..partId)
                    print("Item Type: "..partItem:getFullType())
                    print("Item Name: "..partItem:getName())                              
                    if partItem:IsDrainable()  then
                        print("Drainable: "..partItem:getUsedDelta()) -- This is a battery --tostring(canDrain)
                    end
                    
                    --print("IsContainer: "..tostring(part:isContainer()))                
                    --print("MaxCapacity: "..partItem:getMaxCapacity())
                    local container = part:getItemContainer()
                    if container then
                        print("Container: "..container:getItems():size())  --This holds items
                    end
                    if not container and part:isContainer() then
                        print("Content: "..part:getContainerContentAmount()) --this holds fluids
                    end
                else
                    print("Part ID: "..partId)
                    if part:getItemType() and not part:getItemType():isEmpty() then
                        print("Item Type: MISSING")
                        print("Item Name: MISSING")
                    else
                        print("Item Type: nopart")
                        print("Item Name: nopart")
                    end                
                end
            end
            -- nodisplay parts cant be repaired.
            if part:getCategory() ~= "nodisplay" then
                --"Real" Part, not installed            
                if part:getItemType() and not part:getItemType():isEmpty() and not partItem then
                    --if part:getItemType() then
                    if not CWTitleVehicle.PartWhitelist[partId] then
                        table.insert(missingParts, partId)
                    end
                    --end
                else
                    --Part with damage
                    if part:getCondition() < (SandboxVars.CarWanna.MinmumCondition) then
                        if not CWTitleVehicle.PartWhitelist[partId] then
                            table.insert(brokenParts, partId)
                        end
                    end
                    --Container not empty
                    local container = part:getItemContainer()
                    if container and not container:getItems():isEmpty() then
                        table.insert(containerHasItems, partId)
                    end
                    
                end
                
            end
            --end of loop though parts
        end

        if #missingParts > 0 then
            text = text .. " <LINE> <LINE> <RGB:1,1,1> " .. getText("Tooltip_CW_Install")
            for _, part in ipairs(missingParts) do
                text = text .. " <LINE> <RGB:1,0,0> " .. getText("IGUI_VehiclePart" .. part)
            end
            if SandboxVars.CarWanna.MustHaveAllParts then
                notAvailable = true
            end
        end
        if #brokenParts > 0 then
            text = text .. " <LINE> <LINE> <RGB:1,1,1> " .. getText("Tooltip_CW_Repair") .. (SandboxVars.CarWanna.MinmumCondition) .. "%"
            for _, part in ipairs(brokenParts) do
                text = text .. " <LINE> <RGB:1,0,0> " .. getText("IGUI_VehiclePart" .. part)
            end
                notAvailable = true
        end
        if #containerHasItems > 0 then
            text = text .. " <LINE> <LINE> <RGB:1,1,1> " .. getText("Tooltip_CW_HasItems")
            local ttcolor = "<RGB:1,1,0> "
            if SandboxVars.CarWanna.MustClearInventory then
                ttcolor = "<RGB:1,0,0> "
                notAvailable = true
            end
            
            for _, part in ipairs(containerHasItems) do
                text = text .. " <LINE> " .. ttcolor .. getText("IGUI_VehiclePart" .. part)
            end

        end
        
        local fulltype = vehicle:getScript():getFullName()
        if CWTitleVehicle.VehicleBlacklist[fulltype] then 
                text = text .. " <LINE> <LINE> <RGB:1,1,1> " .. getText("Tooltip_CW_BlackListed") .. " <LINE> <RGB:1,0,0> " .. fulltype
                notAvailable = true
        end

        if notAvailable and player:getAccessLevel() == "Admin" and SandboxVars.CarWanna.AdminOverride then
                text = text .. " <LINE> <LINE> <RGB:0,1,0> " .. getText("Tooltip_CW_AdminOverride")
                notAvailable = false
        end
        --Tooltip_CW_Inspection
        if not notAvailable then
            text = text .. " <LINE> <LINE> <RGB:1,1,1> " .. getText("Tooltip_CW_Inspection")
            text = text .. " <LINE> <RGB:0,1,0> " .. getText("Tooltip_CW_Pass")
        end
        
    --end of tool tips
    toolTip.description = text
    option.notAvailable = notAvailable
end

if not CWTitleVehicle.UI.defaultMenuOutsideVehicle then
    CWTitleVehicle.UI.defaultMenuOutsideVehicle = ISVehicleMenu.FillMenuOutsideVehicle
end

function ISVehicleMenu.FillMenuOutsideVehicle(player, context, vehicle, test)
    CWTitleVehicle.UI.defaultMenuOutsideVehicle(player, context, vehicle, test)
    CWTitleVehicle.UI.addOptionToMenuOutsideVehicle(getSpecificPlayer(player), context, vehicle)
end