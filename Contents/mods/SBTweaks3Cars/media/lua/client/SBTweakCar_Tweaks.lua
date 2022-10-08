require "VehicleTweaker_Core";

-- 74 M151A2 (Mutt)
if getActivatedMods():contains("74amgeneralM151A2") then
    TweakVehicle("Base.74amgeneralM151A2", "engineForce", 5500);
    TweakVehicle("Base.74amgeneralM151A2", "rearEndHealth", 500);
end

-- 78 M35A2 (Deuce)
if getActivatedMods():contains("78amgeneralM35A2") then
    TweakVehicle("Base.78amgeneralM35A2", "maxSpeed", 69f)
    TweakVehicle("Base.78amgeneralM35A2", "mass", 950);
    TweakVehicle("Base.78amgeneralM35A2", "isSmallVehicle", False);
    TweakVehicle("Base.78amgeneralM35A2", "offRoadEfficiency", 4.0);
    -- Copied Gear ratios from the Hummer
    TweakVehicle("Base.78amgeneralM35A2", "rollInfluence", 0.95f);
    TweakVehicle("Base.78amgeneralM35A2", "gearRatioR", 14.4);
    TweakVehicle("Base.78amgeneralM35A2", "gearRatio1", 13.3);
    TweakVehicle("Base.78amgeneralM35A2", "gearRatio2", 9.6);
    TweakVehicle("Base.78amgeneralM35A2", "gearRatio3", 5.93);
    TweakVehicle("Base.78amgeneralM35A2", "gearRatio4", 3.94);
end

-- 92 M998 Hummer 2642541073
if getActivatedMods():contains("92amgeneralM998") then
    TweakVehicle("Base.92amgeneralM998", "engineForce", 6200);
end

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

-- Riding Mower
if getActivatedMods():contains("RidingMower") then
    TweakVehicle("Base.RidingMower", "engineLoudness", 110);
    TweakVehicle("Base.RidingMower", "engineLoudness", 110);
    TweakVehicle("Base.MiniMower", "engineLoudness", 110);
    TweakVehicle("Base.RidingMower", "engineRPMType", "van");
    TweakVehicle("Base.RacingMower", "engineRPMType", "van");
    TweakVehicle("Base.MiniMower", "engineRPMType", "van");
end
