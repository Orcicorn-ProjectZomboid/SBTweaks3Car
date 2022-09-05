if VehicleZoneDistribution then -- check if the table exists for backwards compatibility
    if getActivatedMods():contains("FRUsedCars") then
        -- Remove Filibuster's Military vehicles since we're using KI5 instead
        VehicleZoneDistribution.Military.vehicles["Base.hmmwvht"] = nil;
        VehicleZoneDistribution.Military.vehicles["Base.hmmwvtr"] = nil;
        VehicleZoneDistribution.Military.vehicles["Base.m35a2bed"] = nil;
        VehicleZoneDistribution.Military.vehicles["Base.m35a2covered"] = nil;
        VehicleZoneDistribution.Military.vehicles["Base.m151canvas"] = nil;
    end
end