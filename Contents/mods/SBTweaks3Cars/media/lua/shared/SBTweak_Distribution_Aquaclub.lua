require "VehicleZoneDefinition"
if getActivatedMods():contains("amclub") then
    -- Parking Stalls --
    VehicleZoneDistribution.parkingstall.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.parkingstall.vehicles["Base.AMC_bmw_custom"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.parkingstall.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.parkingstall.vehicles["Base.AMC_quad"] = {index = -1, spawnChance = 0.5};

    -- Trailer Parks --
    VehicleZoneDistribution.trailerpark.vehicles["Base.AMC_quad"] = {index = -1, spawnChance = 8};
    VehicleZoneDistribution.trailerpark.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 1};

    -- Junk spawns --
    VehicleZoneDistribution.junkyard.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 0};

    -- Traffic Jams --
    VehicleZoneDistribution.trafficjamn.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 0};
    VehicleZoneDistribution.trafficjamn.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 0};

    -- Special --
    VehicleZoneDistribution.farm = VehicleZoneDistribution.farm or {}
    VehicleZoneDistribution.farm.vehicles = VehicleZoneDistribution.farm.vehicles or {}
    VehicleZoneDistribution.farm.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 0};
    VehicleZoneDistribution.farm.vehicles["Base.AMC_quad"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.mccoy.vehicles["Base.AMC_quad"] = {index = -1, spawnChance = 3};
    VehicleZoneDistribution.fossoil.vehicles["Base.AMC_quad"] = {index = -1, spawnChance = 0.5};
    VehicleZoneDistribution.postal.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 0.1};
    VehicleZoneDistribution.postal.vehicles["Base.AMC_quad"] = {index = -1, spawnChance = 0.1};

    if VehicleZoneDistribution.sea then
        VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerAMCWaverunnerWithBody"] = {index = -1, spawnChance = 0};
        VehicleZoneDistribution.sea.vehicles["Base.AMC_Waverunner"] = {index = -1, spawnChance = 0};
        VehicleZoneDistribution.river.vehicles["Base.AMC_Waverunner"] = {index = -1, spawnChance = 0};
        VehicleZoneDistribution.harbour.vehicles["Base.AMC_Waverunner"] = {index = -1, spawnChance = 0};
        VehicleZoneDistribution.smallboat.vehicles["Base.AMC_Waverunner"] = {index = -1, spawnChance = 0};
    end
end