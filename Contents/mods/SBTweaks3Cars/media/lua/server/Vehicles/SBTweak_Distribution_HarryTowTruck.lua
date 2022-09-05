if VehicleZoneDistribution then
    if getActivatedMods():contains("HTowTruckFix") then
        VehicleZoneDistribution.parkingstall.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 0.01};
        VehicleZoneDistribution.trailerpark.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 5};
        VehicleZoneDistribution.bad.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 1};
        VehicleZoneDistribution.good.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 0.5};
        VehicleZoneDistribution.junkyard.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 10};
        VehicleZoneDistribution.trafficjamw.vehicles["Base.Chevalier_Rhino_TowTruck"] = {index = -1, spawnChance = 1};
    end
end