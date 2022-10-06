if VehicleZoneDistribution then -- check if the table exists for backwards compatibility
    if getActivatedMods():contains("FRUsedCars") then
        -- Remove Filibuster's Military vehicles since we're using KI5 instead
        VehicleZoneDistribution.military.vehicles["Base.hmmwvht"] = nil;
        VehicleZoneDistribution.trafficjamw.vehicles["Base.hmmwvht"] = nil;

        VehicleZoneDistribution.military.vehicles["Base.hmmwvtr"] = nil;
        VehicleZoneDistribution.trafficjamw.vehicles["Base.hmmwvtr"] = nil;

        VehicleZoneDistribution.military.vehicles["Base.m35a2bed"] = nil;
        VehicleZoneDistribution.trafficjamw.vehicles["Base.m35a2bed"] = nil;

        VehicleZoneDistribution.military.vehicles["Base.m35a2covered"] = nil;
        VehicleZoneDistribution.trafficjamw.vehicles["Base.m35a2covered"] = nil;

        VehicleZoneDistribution.military.vehicles["Base.m151canvas"] = nil;
        VehicleZoneDistribution.trafficjamw.vehicles["Base.m151canvas"] = nil;

        -- Remove Filibuster Bus
        VehicleZoneDistribution.trailerpark.vehicles["Base.schoolbus"] = nil;
        VehicleZoneDistribution.trailerpark.vehicles["Base.schoolbusshort"] = nil;
        VehicleZoneDistribution.bad.vehicles["Base.schoolbus"] = nil;
        VehicleZoneDistribution.bad.vehicles["Base.schoolbusshort"] = nil;
        VehicleZoneDistribution.medium.vehicles["Base.schoolbus"] = nil;
        VehicleZoneDistribution.medium.vehicles["Base.schoolbusshort"] = nil;
        VehicleZoneDistribution.junkyard.vehicles["Base.schoolbus"] = nil;
        VehicleZoneDistribution.junkyard.vehicles["Base.schoolbusshort"] = nil;
        VehicleZoneDistribution.trafficjamw.vehicles["Base.schoolbus"] = nil;
        VehicleZoneDistribution.trafficjamw.vehicles["Base.schoolbusshort"] = nil;
    end
end