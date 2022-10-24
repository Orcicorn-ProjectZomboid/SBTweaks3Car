if VehicleZoneDistribution then
    if getActivatedMods():contains("HTowTruckFix") then
        VehicleZoneDistribution.parkingstall.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 2};
        VehicleZoneDistribution.trailerpark.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 30};
        VehicleZoneDistribution.bad.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 1};
        VehicleZoneDistribution.good.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 1};
        VehicleZoneDistribution.junkyard.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 15};
        VehicleZoneDistribution.trafficjamw.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 1};
    end
end