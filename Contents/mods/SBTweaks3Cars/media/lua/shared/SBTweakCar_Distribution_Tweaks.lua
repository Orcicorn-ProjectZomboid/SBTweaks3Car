VehicleZoneDistribution = VehicleZoneDistribution or {};
VehicleZoneDistribution.military = VehicleZoneDistribution.military or {}
VehicleZoneDistribution.military.vehicles = VehicleZoneDistribution.military.vehicles or {}

-- Add Jeep archer to regular spawn options instead of just trailer parks
if getActivatedMods():contains("ATA_Jeep") then
    VehicleZoneDistribution.parkingstall.vehicles["Base.ATAJeepArcher"] = {index = 0, spawnChance = 1};
    VehicleZoneDistribution.medium.vehicles["Base.ATAJeepArcher"] = {index = 0, spawnChance = 1};
    VehicleZoneDistribution.good.vehicles["Base.ATAJeepArcher"] = {index = 0, spawnChance = 1};
end

-- Increase 74 AMGeneral Spawns
if getActivatedMods():contains("74amgeneralM151A2") then
    VehicleZoneDistribution.parkingstall.vehicles["Base.74amgeneralM151A2"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.trailerpark.vehicles["Base.74amgeneralM151A2"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.bad.vehicles["Base.74amgeneralM151A2"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.medium.vehicles["Base.74amgeneralM151A2"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.good.vehicles["Base.74amgeneralM151A2"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.junkyard.vehicles["Base.74amgeneralM151A2"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.junkyard.vehicles["Base.74amgeneralM151A2Burnt"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.ranger.vehicles["Base.74amgeneralM151A2"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.trafficjams.vehicles["Base.74amgeneralM151A2"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.trafficjams.vehicles["Base.74amgeneralM151A2Burnt"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.military.vehicles["Base.74amgeneralM151A2"] = {index = -1, spawnChance = 22};
    VehicleZoneDistribution.military.vehicles["Base.74amgeneralM151A2Burnt"] = {index = -1, spawnChance = 11};
    VehicleZoneDistribution.military.vehicles["Base.74amgeneralM151A2MP"] = {index = -1, spawnChance = 8};
end

-- Increase/Fix 78 AM General M35A2 Spawns
if getActivatedMods():contains("78amgeneralM35A2") then
    VehicleZoneDistribution.parkingstall.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.trailerpark.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.bad.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.medium.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.good.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.junkyard.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.junkyard.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.ranger.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.trafficjams.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.trafficjams.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 4};
    VehicleZoneDistribution.military.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 22};
    VehicleZoneDistribution.military.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 11};
end

-- Generator Spawns should be rarer
if getActivatedMods():contains("autotsartrailers") then
    VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerGenerator"] = {index = -1, spawnChance = 0.5};
    VehicleZoneDistribution.farm = VehicleZoneDistribution.farm or {}
    VehicleZoneDistribution.farm.vehicles = VehicleZoneDistribution.farm.vehicles or {}
    VehicleZoneDistribution.farm.vehicles["Base.TrailerGenerator"] = {index = -1, spawnChance = 4};
end

-- If Fort Redstone is enabled tweak his custom spawns
if getActivatedMods():contains("FORTREDSTONE") then
    -- Substitute Ki5 Military Vehicles if enabled
    if getActivatedMods():contains("92amgeneralM998") then
        VehicleZoneDistribution.militarycar.vehicles["Base.92amgeneralM998"] = {index = -1, spawnChance = 30};
    end
    if getActivatedMods():contains("74amgeneralM151A2") then
        VehicleZoneDistribution.militarycar.vehicles["Base.74amgeneralM151A2"] = {index = -1, spawnChance = 30};
        VehicleZoneDistribution.militarycar.vehicles["Base.74amgeneralM151A2MP"] = {index = -1, spawnChance = 3};
    end
    if getActivatedMods():contains("78amgeneralM35A2") then
        VehicleZoneDistribution.militarycar.vehicles["Base.78amgeneralM35A2"] = {index = -1, spawnChance = 40};
        VehicleZoneDistribution.militarycar.vehicles["Base.78amgeneralM49A2C"] = {index = -1, spawnChance = 10};
        VehicleZoneDistribution.militarycar.vehicles["Base.78amgeneralM50A3"] = {index = -1, spawnChance = 10};
    end
end

-- 86 Ford Econoline E150 (Spawns too much in "transit.vehicle"
if getActivatedMods():contains("86fordE150") then
    VehicleZoneDistribution.transit.vehicles["Base.86fordE150long"] = {index = -1, spawnChance = 10};
end

if getActivatedMods():contains("86fordE150dnd") then
    VehicleZoneDistribution.parkingstall.vehicles["Base.86fordE150dnd"] = {index = -1, spawnChance = 0.1};
    VehicleZoneDistribution.fossoil.vehicles["Base.86fordE150dnd"] = {index = -1, spawnChance = 0.5};
end