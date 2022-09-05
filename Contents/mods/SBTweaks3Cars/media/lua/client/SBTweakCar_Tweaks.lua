require "VehicleTweaker_Core";

-- ATA Bus 2592358528
if getActivatedMods():contains("ATA_Bus") then
    TweakVehicle("Base.ATASchoolBus", "engineForce", 5500);
    TweakVehicle("Base.ATAArmyBus", "engineForce", 5500);
    TweakVehicle("Base.ATAPrisonBus", "engineForce", 5500);
    TweakVehicle("Base.ATASchoolBus", "maxSpeed", 60f);
    TweakVehicle("Base.ATAArmyBus", "maxSpeed", 60f);
    TweakVehicle("Base.ATAPrisonBus", "maxSpeed", 60f);
end

-- ATA Dadge 2743496289
if getActivatedMods():contains("ATA_Dadge") then
    TweakVehicle("Base.ATADodge", "rearEndHealth", 500);
    TweakVehicle("Base.ATADodgePpg", "rearEndHealth", 500);
    TweakVehicle("Base.ATADodgePpg", "lightbar", "VehicleSiren,leftCol=1;0;0,rightCol= 0;0;1,");
end

-- ATA Jeep 2636100523
if getActivatedMods():contains("ATA_Jeep") then
    -- Increase rear health
    TweakVehicle("Base.ATAJeepArcher", "rearEndHealth", 500);
    TweakVehicle("Base.ATAJeepClassic", "rearEndHealth", 500);
    TweakVehicle("Base.ATAJeepRubicon", "rearEndHealth", 500);
end

-- ATA Mustang 2681635926
if getActivatedMods():contains("ATA_Mustang") then
    TweakVehicle("Base.ATAMustangClassic", "rearEndHealth", 500);
    TweakVehicle("Base.ATAMustangPolice", "rearEndHealth", 500);
end
