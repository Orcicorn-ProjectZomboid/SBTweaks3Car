if VehicleZoneDistribution then
    if getActivatedMods():contains("RidingMower") then
        VehicleZoneDistribution.trailerpark.vehicles["Base.GoKart"] = {index = -1, spawnChance = 10};
        VehicleZoneDistribution.trailerpark.vehicles["Base.RidingMower"] = {index = -1, spawnChance = 1};
        VehicleZoneDistribution.trailerpark.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 1};

        VehicleZoneDistribution.junkyard.vehicles["Base.GoKart"] = {index = -1, spawnChance = 5};
        VehicleZoneDistribution.junkyard.vehicles["Base.RidingMower"] = {index = -1, spawnChance = 1};

        VehicleZoneDistribution.bad.vehicles["Base.RidingMower"] = {index = -1, spawnChance = 0.5};
        VehicleZoneDistribution.bad.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 0.5};

        VehicleZoneDistribution.mccoy.vehicles["Base.GoKart"] = {index = -1, spawnChance = 5};

        -- If Filibuster installed, add to farm vehicles
        if getActivatedMods():contains("FRUsedCars") then
            VehicleZoneDistribution.farm.vehicles["Base.RidingMower"] = {index = -1, spawnChance = 10};
            VehicleZoneDistribution.farm.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 6};
        end

        -- if TSARLib installed, add trailer to small trailers
        -- if getActivatedMods():contains("tsarslib") then
        --     VehicleZoneDistribution.smalltrailerparkinglot.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 1};
        -- end
    end
end
