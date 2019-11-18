--- ====================== ACTION HEADER ============================ ---
local Action                                 = Action
local TeamCache                              = Action.TeamCache
local EnemyTeam                              = Action.EnemyTeam
local FriendlyTeam                           = Action.FriendlyTeam
--local HealingEngine                        = Action.HealingEngine
local LoC                                    = Action.LossOfControl
local Player                                 = Action.Player
local MultiUnits                             = Action.MultiUnits
local UnitCooldown                           = Action.UnitCooldown
local Unit                                   = Action.Unit
local Pet                                    = LibStub("PetLibrary")
local Azerite                                = LibStub("AzeriteTraits")
local setmetatable                           = setmetatable

--- ============================ CONTENT ===========================
--- ======= APL LOCALS =======
-- luacheck: max_line_length 9999

-- Spells
Action[ACTION_CONST_SHAMAN_ELEMENTAL] = {
    -- Racial
    ArcaneTorrent                          = Action.Create({ Type = "Spell", ID = 50613     }),
    BloodFury                              = Action.Create({ Type = "Spell", ID = 20572      }),
    Fireblood                              = Action.Create({ Type = "Spell", ID = 265221     }),
    AncestralCall                          = Action.Create({ Type = "Spell", ID = 274738     }),
    Berserking                             = Action.Create({ Type = "Spell", ID = 26297    }),
    ArcanePulse                            = Action.Create({ Type = "Spell", ID = 260364    }),
    QuakingPalm                            = Action.Create({ Type = "Spell", ID = 107079     }),
    Haymaker                               = Action.Create({ Type = "Spell", ID = 287712     }), 
    WarStomp                               = Action.Create({ Type = "Spell", ID = 20549     }),
    BullRush                               = Action.Create({ Type = "Spell", ID = 255654     }),  
    GiftofNaaru                            = Action.Create({ Type = "Spell", ID = 59544    }),
    Shadowmeld                             = Action.Create({ Type = "Spell", ID = 58984    }), -- usable in Action Core 
    Stoneform                              = Action.Create({ Type = "Spell", ID = 20594    }), 
    WilloftheForsaken                      = Action.Create({ Type = "Spell", ID = 7744        }), -- not usable in APL but user can Queue it   
    EscapeArtist                           = Action.Create({ Type = "Spell", ID = 20589    }), -- not usable in APL but user can Queue it
    EveryManforHimself                     = Action.Create({ Type = "Spell", ID = 59752    }), -- not usable in APL but user can Queue it
    -- Generics
    TotemMastery                           = Action.Create({ Type = "Spell", ID = 210643 }),
    StormkeeperBuff                        = Action.Create({ Type = "Spell", ID = 191634 }),
    Stormkeeper                            = Action.Create({ Type = "Spell", ID = 191634 }),
    FireElemental                          = Action.Create({ Type = "Spell", ID = 198067 }),
    StormElemental                         = Action.Create({ Type = "Spell", ID = 192249 }),
    ElementalBlast                         = Action.Create({ Type = "Spell", ID = 117014 }),
    LavaBurst                              = Action.Create({ Type = "Spell", ID = 51505 }),
    ChainLightning                         = Action.Create({ Type = "Spell", ID = 188443 }),
    FlameShock                             = Action.Create({ Type = "Spell", ID = 188389 }),
    FlameShockDebuff                       = Action.Create({ Type = "Spell", ID = 188389 }),
    WindGustBuff                           = Action.Create({ Type = "Spell", ID = 263806 }),
    Ascendance                             = Action.Create({ Type = "Spell", ID = 114050 }),
    Icefury                                = Action.Create({ Type = "Spell", ID = 210714 }),
    IcefuryBuff                            = Action.Create({ Type = "Spell", ID = 210714 }),
    LiquidMagmaTotem                       = Action.Create({ Type = "Spell", ID = 192222 }),
    Earthquake                             = Action.Create({ Type = "Spell", ID = 61882 }),
    MasteroftheElements                    = Action.Create({ Type = "Spell", ID = 16166 }),
    MasteroftheElementsBuff                = Action.Create({ Type = "Spell", ID = 260734 }),
    LavaSurgeBuff                          = Action.Create({ Type = "Spell", ID = 77762 }),
    AscendanceBuff                         = Action.Create({ Type = "Spell", ID = 114050 }),
    FrostShock                             = Action.Create({ Type = "Spell", ID = 196840 }),
    LavaBeam                               = Action.Create({ Type = "Spell", ID = 114074 }),
    IgneousPotential                       = Action.Create({ Type = "Spell", ID = 279829 }),
    SurgeofPowerBuff                       = Action.Create({ Type = "Spell", ID = 285514 }),
    NaturalHarmony                         = Action.Create({ Type = "Spell", ID = 278697 }),
    SurgeofPower                           = Action.Create({ Type = "Spell", ID = 262303 }),
    LightningBolt                          = Action.Create({ Type = "Spell", ID = 188196 }),
    LavaShock                              = Action.Create({ Type = "Spell", ID = 273448 }),
    LavaShockBuff                          = Action.Create({ Type = "Spell", ID = 273453 }),
    EarthShock                             = Action.Create({ Type = "Spell", ID = 8042 }),
    CalltheThunder                         = Action.Create({ Type = "Spell", ID = 260897 }),
    EchooftheElementals                    = Action.Create({ Type = "Spell", ID = 275381 }),
    EchooftheElements                      = Action.Create({ Type = "Spell", ID = 108283 }),
    ResonanceTotemBuff                     = Action.Create({ Type = "Spell", ID = 202192 }),
    TectonicThunder                        = Action.Create({ Type = "Spell", ID = 286949 }),
    TectonicThunderBuff                    = Action.Create({ Type = "Spell", ID = 286949 }),
    WindShear                              = Action.Create({ Type = "Spell", ID = 57994 }),
    BloodFury                              = Action.Create({ Type = "Spell", ID = 20572 }),
    Berserking                             = Action.Create({ Type = "Spell", ID = 26297 }),
    Fireblood                              = Action.Create({ Type = "Spell", ID = 265221 }),
    AncestralCall                          = Action.Create({ Type = "Spell", ID = 274738 }),
	-- Utilities
    LightningLasso                        = Action.Create({ Type = "Spell", ID = 305483     }),
    CapacitorTotem                        = Action.Create({ Type = "Spell", ID = 192058     }),
    Purge                                 = Action.Create({ Type = "Spell", ID = 370     }),
    GhostWolf                             = Action.Create({ Type = "Spell", ID = 2645     }),
    EarthShield                           = Action.Create({ Type = "Spell", ID = 974     }),
    HealingSurge                          = Action.Create({ Type = "Spell", ID = 8004     }),
	PrimalElementalist                    = Action.Create({ Type = "Spell", ID = 117013 , Hidden = true     }),
    GhostWolfBuff                         = Action.Create({ Type = "Spell", ID = 2645, Hidden = true     }),	
    -- Storm Elemental   
    EyeOfTheStorm                         = Action.Create({ Type = "Spell", ID = 157375 , Hidden = true     }), 
    CallLightning                         = Action.Create({ Type = "Spell", ID = 157348 , Hidden = true     }),
    -- Defensive
	AstralShift                           = Action.Create({ Type = "Spell", ID = 108271     }),	
    -- Trinkets
    TrinketTest                            = Action.Create({ Type = "Trinket", ID = 122530, QueueForbidden = true }), 
    TrinketTest2                           = Action.Create({ Type = "Trinket", ID = 159611, QueueForbidden = true }), 
    AzsharasFontofPower                    = Action.Create({ Type = "Trinket", ID = 169314, QueueForbidden = true }), 
    PocketsizedComputationDevice           = Action.Create({ Type = "Trinket", ID = 167555, QueueForbidden = true }), 
    RotcrustedVoodooDoll                   = Action.Create({ Type = "Trinket", ID = 159624, QueueForbidden = true }), 
    ShiverVenomRelic                       = Action.Create({ Type = "Trinket", ID = 168905, QueueForbidden = true }), 
    AquipotentNautilus                     = Action.Create({ Type = "Trinket", ID = 169305, QueueForbidden = true }), 
    TidestormCodex                         = Action.Create({ Type = "Trinket", ID = 165576, QueueForbidden = true }), 
    VialofStorms                           = Action.Create({ Type = "Trinket", ID = 158224, QueueForbidden = true }), 
    -- Potions
    PotionofUnbridledFury                  = Action.Create({ Type = "Potion", ID = 169299, QueueForbidden = true }), 
    BattlePotionOfAgility                  = Action.Create({ Type = "Potion", ID = 163223, QueueForbidden = true }), 
    SuperiorBattlePotionOfAgility          = Action.Create({ Type = "Potion", ID = 168489, QueueForbidden = true }), 
    PotionTest                             = Action.Create({ Type = "Potion", ID = 142117, QueueForbidden = true }), 
    -- Trinkets
    GenericTrinket1                        = Action.Create({ Type = "Trinket", ID = 114616, QueueForbidden = true }),
    GenericTrinket2                        = Action.Create({ Type = "Trinket", ID = 114081, QueueForbidden = true }),
    TrinketTest                            = Action.Create({ Type = "Trinket", ID = 122530, QueueForbidden = true }),
    TrinketTest2                           = Action.Create({ Type = "Trinket", ID = 159611, QueueForbidden = true }), 
    AzsharasFontofPower                    = Action.Create({ Type = "Trinket", ID = 169314, QueueForbidden = true }),
    PocketsizedComputationDevice           = Action.Create({ Type = "Trinket", ID = 167555, QueueForbidden = true }),
    RotcrustedVoodooDoll                   = Action.Create({ Type = "Trinket", ID = 159624, QueueForbidden = true }),
    ShiverVenomRelic                       = Action.Create({ Type = "Trinket", ID = 168905, QueueForbidden = true }),
    AquipotentNautilus                     = Action.Create({ Type = "Trinket", ID = 169305, QueueForbidden = true }),
    TidestormCodex                         = Action.Create({ Type = "Trinket", ID = 165576, QueueForbidden = true }),
    VialofStorms                           = Action.Create({ Type = "Trinket", ID = 158224, QueueForbidden = true }),
    GalecallersBoon                        = Action.Create({ Type = "Trinket", ID = 159614, QueueForbidden = true }),
    InvocationOfYulon                      = Action.Create({ Type = "Trinket", ID = 165568, QueueForbidden = true }),
    LustrousGoldenPlumage                  = Action.Create({ Type = "Trinket", ID = 159617, QueueForbidden = true }),
    ComputationDevice                      = Action.Create({ Type = "Trinket", ID = 167555, QueueForbidden = true }),
    VigorTrinket                           = Action.Create({ Type = "Trinket", ID = 165572, QueueForbidden = true }),
    FontOfPower                            = Action.Create({ Type = "Trinket", ID = 169314, QueueForbidden = true }),
    RazorCoral                             = Action.Create({ Type = "Trinket", ID = 169311, QueueForbidden = true }),
    AshvanesRazorCoral                     = Action.Create({ Type = "Trinket", ID = 169311, QueueForbidden = true }),
    -- Misc
    Channeling                             = Action.Create({ Type = "Spell", ID = 209274, Hidden = true     }),	-- Show an icon during channeling
    TargetEnemy                            = Action.Create({ Type = "Spell", ID = 44603, Hidden = true     }),	-- Change Target (Tab button)
    StopCast                               = Action.Create({ Type = "Spell", ID = 61721, Hidden = true     }),		-- spell_magic_polymorphrabbit
    CyclotronicBlast                       = Action.Create({ Type = "Spell", ID = 293491, Hidden = true}),
    ConcentratedFlameBurn                  = Action.Create({ Type = "Spell", ID = 295368, Hidden = true}),
    RazorCoralDebuff                       = Action.Create({ Type = "Spell", ID = 303568, Hidden = true     }),
    ConductiveInkDebuff                    = Action.Create({ Type = "Spell", ID = 302565, Hidden = true     }),
    -- Hidden Heart of Azeroth
    -- added all 3 ranks ids in case used by rotation
    VisionofPerfectionMinor                = Action.Create({ Type = "Spell", ID = 296320, Hidden = true}),
    VisionofPerfectionMinor2               = Action.Create({ Type = "Spell", ID = 299367, Hidden = true}),
    VisionofPerfectionMinor3               = Action.Create({ Type = "Spell", ID = 299369, Hidden = true}),
    UnleashHeartOfAzeroth                  = Action.Create({ Type = "Spell", ID = 280431, Hidden = true}),
    RecklessForceBuff                      = Action.Create({ Type = "Spell", ID = 302932, Hidden = true     }),	 
};

-- To create essences use next code:
Action:CreateEssencesFor(ACTION_CONST_SHAMAN_ELEMENTAL)  -- where PLAYERSPEC is Constance (example: ACTION_CONST_MONK_BM)
local A = setmetatable(Action[ACTION_CONST_SHAMAN_ELEMENTAL], { __index = Action })

local function num(val)
    if val then return 1 else return 0 end
end

local function bool(val)
    return val ~= 0
end

------------------------------------------
------------ ELEMENTAL PREAPL ------------
------------------------------------------

-- Pet functions
local PetType = {
  [77942] = {"Primal Storm Elemental", 30},
};

Action.ElementalGuardiansTable = {
    --{PetType,petID,dateEvent,UnitPetGUID,CastsLeft}
    Pets = {
    },
    PetList={
    [77942]="Primal Storm Elemental",
    }
};

Action:RegisterForSelfCombatEvent( 
function (...)
    local dateEvent,_,_,_,_,_,_,UnitPetGUID = select(1,...)
    local t={} ; i = 1
  
    for str in string.gmatch(UnitPetGUID, "([^-]+)") do
        t[i] = str
        i = i + 1
    end
    
	local PetType = Action.ElementalGuardiansTable.PetList[tonumber(t[6])]
    if PetType then
        table.insert(Action.ElementalGuardiansTable.Pets,{PetType,tonumber(t[6]),TMW.time,UnitPetGUID,5})
    end
end
    , "SPELL_SUMMON"
);
        
-- Summoned pet duration
local function PetDuration(PetType)
    if not PetType then 
        return 0 
    end
    local PetsInfo = {
        [77942] = {"Primal Storm Elemental", 30},
    }
    local maxduration = 0
    for key, Value in pairs(Action.ElementalGuardiansTable.Pets) do
        if Action.ElementalGuardiansTable.Pets[key][1] == PetType then
            if (PetsInfo[Action.ElementalGuardiansTable.Pets[key][2]][2] - (TMW.time - Action.ElementalGuardiansTable.Pets[key][3])) > maxduration then
                maxduration = Action.OffsetRemains((PetsInfo[Action.ElementalGuardiansTable.Pets[key][2]][2] - (TMW.time - Action.ElementalGuardiansTable.Pets[key][3])), "Auto" );
            end
        end
    end
    return maxduration
end

local function StormElementalIsActive()
    if PetDuration("Primal Storm Elemental") > 0.1 then
        return true
    else
        return false
    end
end

local function ResonanceTotemTime()
  for index = 1, 4 do
    local _, totemName, startTime, duration = GetTotemInfo(index)
        if totemName == S.TotemMastery:Name() then
            return (floor(startTime + duration - TMW.time + 0.5)) or 0
        end
    end
    return 0
end

local function FutureMaelstromPower()
    local castName, castStartTime, castEndTime, notInterruptable, spellID, isChannel = Unit("player"):IsCasting()
    local castLeft, _, _, _, notKickAble = Unit("player"):IsCastingRemains()
    local MaelstromPower = Player:Maelstrom()
    local overloadChance = Player:MasteryPct() / 100
    local factor = 1 + 0.75 * overloadChance
    local resonance = 0

    if Unit("player"):CombatTime() > 0 then
        if A.TotemMastery:IsReady(unit) then
            resonance = castLeft
        end
        if not castLeft then
            return MaelstromPower
        else
            if spellID == A.LightningBolt.ID then
                return MaelstromPower + 8 + resonance
            elseif spellID == A.LavaBurst.ID then
                return MaelstromPower + 10 + resonance
            elseif spellID == A.ChainLightning.ID then
                local enemiesHit = min(MultiUnits:GetByRangeInCombat(40, 5, 10), 3)
                    return MaelstromPower + 4 * enemiesHit * factor + resonance
            elseif spellID == A.Icefury.ID then
                return MaelstromPower + 25 * factor + resonance
            else
                return MaelstromPower
            end
        end
    end
end

local function HandleMultidots()
    local choice = Action.GetToggle(2, "AutoDotSelection")
       
    if choice == "In Raid" then
		if IsInRaid() then
    		return true
		else
		    return false
		end
    elseif choice == "In Dungeon" then 
		if Player:InDungeon() then
    		return true
		else
		    return false
		end
	elseif choice == "In PvP" then 	
		if Player:InPvP() then 
    		return true
		else
		    return false
		end		
    elseif choice == "Everywhere" then 
        return true
    else
		return false
    end
	--print(choice)
end

local function ExpectedCombatLength()
    local BossTTD = 0
	if not A.IsInPvP then 
        for i = 1, MAX_BOSS_FRAMES do 
            if Unit("boss" .. i):IsExists() and not Unit("boss" .. i):IsDead() then 
                BossTTD = Unit("boss" .. i):TimeToDie()
            end 
        end 
    end 
    return BossTTD
end 
ExpectedCombatLength = A.MakeFunctionCachedStatic(ExpectedCombatLength)

------------------------------------------
-------------- COMMON PREAPL -------------
------------------------------------------
local Temp = {
    TotalAndPhys                            = {"TotalImun", "DamagePhysImun"},
	TotalAndCC                              = {"TotalImun", "CCTotalImun"},
    TotalAndPhysKick                        = {"TotalImun", "DamagePhysImun", "KickImun"},
    TotalAndPhysAndCC                       = {"TotalImun", "DamagePhysImun", "CCTotalImun"},
    TotalAndPhysAndStun                     = {"TotalImun", "DamagePhysImun", "StunImun"},
    TotalAndPhysAndCCAndStun                = {"TotalImun", "DamagePhysImun", "CCTotalImun", "StunImun"},
    TotalAndMag                             = {"TotalImun", "DamageMagicImun"},
	TotalAndMagKick                         = {"TotalImun", "DamageMagicImun", "KickImun"},
    DisablePhys                             = {"TotalImun", "DamagePhysImun", "Freedom", "CCTotalImun"},
    DisableMag                              = {"TotalImun", "DamageMagicImun", "Freedom", "CCTotalImun"},
}

local IsIndoors, UnitIsUnit = IsIndoors, UnitIsUnit

local function IsSchoolFree()
	return LoC:IsMissed("SILENCE") and LoC:Get("SCHOOL_INTERRUPT", "SHADOW") == 0
end 


local function EvaluateCycleFlameShock47(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true) and (MultiUnits:GetByRangeInCombat(40, 5, 10) < (5 - num(not A.TotemMastery:IsSpellLearned())) or not A.StormElemental:IsSpellLearned() and (A.FireElemental:GetCooldown() > (120 + 14 * Player:SpellHaste()) or A.FireElemental:GetCooldown() < (24 - 14 * Player:SpellHaste()))) and (not A.StormElemental:IsSpellLearned() or A.StormElemental:GetCooldown() < 120 or MultiUnits:GetByRangeInCombat(40, 5, 10) == 3 and Unit("player"):HasBuffsStacks(A.WindGustBuff.ID, true) < 14)
end

local function EvaluateCycleFlameShock148(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true)
end

local function EvaluateCycleFlameShock163(unit)
    return (not Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) or A.StormElemental:IsSpellLearned() and A.StormElemental:GetCooldown() < 2 * A.GetGCD() or Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) <= A.GetGCD() or A.Ascendance:IsSpellLearned() and Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) < (A.Ascendance:GetCooldown() + 15) and A.Ascendance:GetCooldown() < 4 and (not A.StormElemental:IsSpellLearned() or A.StormElemental:IsSpellLearned() and A.StormElemental:GetCooldown() < 120)) and (Unit("player"):HasBuffsStacks(A.WindGustBuff.ID, true) < 14 or A.IgneousPotential:GetAzeriteRank() >= 2 or Unit("player"):HasBuffs(A.LavaSurgeBuff.ID, true) or not Unit("player"):HasHeroism()) and not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)
end

local function EvaluateCycleFlameShock362(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true) and MultiUnits:GetByRangeInCombat(40, 5, 10) > 1 and Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)
end

local function EvaluateCycleFlameShock483(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true) and not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)
end

local function EvaluateCycleFlameShock528(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true)
end

local function EvaluateCycleFlameShock545(unit)
    return (not Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) or A.StormElemental:IsSpellLearned() and A.StormElemental:GetCooldown() < 2 * A.GetGCD() or Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) <= A.GetGCD() or A.Ascendance:IsSpellLearned() and Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) < (A.Ascendance:GetCooldown() + 15) and A.Ascendance:GetCooldown() < 4 and (not A.StormElemental:IsSpellLearned() or A.StormElemental:IsSpellLearned() and A.StormElemental:GetCooldown() < 120)) and (Unit("player"):HasBuffsStacks(A.WindGustBuff.ID, true) < 14 or A.IgneousPotential:GetAzeriteRank() >= 2 or Unit("player"):HasBuffs(A.LavaSurgeBuff.ID, true) or not Unit("player"):HasHeroism()) and not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)
end

local function EvaluateCycleFlameShock774(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true) and MultiUnits:GetByRangeInCombat(40, 5, 10) > 1 and Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)
end

local function EvaluateCycleFlameShock895(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true) and not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)
end

local function EvaluateCycleFlameShock946(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true)
end

--- ======= ACTION LISTS =======
-- [3] Single Rotation
A[3] = function(icon, isMulti)
    --------------------
    --- ROTATION VAR ---
    --------------------
    local isMoving = A.Player:IsMoving()
    local inCombat = Unit("player"):CombatTime() > 0
    local ShouldStop = Action.ShouldStop()
    local Pull = Action.BossMods_Pulling()
    local unit = "player"
    local AppliedFlameShock = MultiUnits:GetByRangeAppliedDoTs(40, 5, 188389) --MultiDots(40, S.FlameShockDebuff, 15, 4) --MultiUnits:GetByRangeMissedDoTs(40, 10, 188389)  MultiUnits:GetByRangeMissedDoTs(range, stop, dots, ttd)
    local FlameShockToRefresh = MultiUnits:GetByRangeDoTsToRefresh(40, 5, 188389, 5)
    local MissingFlameShock = MultiUnits:GetByRangeMissedDoTs(40, 5, 188389) --MultiDots(40, S.FlameShockDebuff, 15, 4) --MultiUnits:GetByRangeMissedDoTs(40, 10, 188389)  MultiUnits:GetByRangeMissedDoTs(range, stop, dots, ttd)
	local CanMultidot = HandleMultidots()
	local expected_combat_length = ExpectedCombatLength()
    ------------------------------------------------------
    ---------------- ENEMY UNIT ROTATION -----------------
    ------------------------------------------------------
    local function EnemyRotation(unit)
        local Precombat, Aoe, Funnel, SingleUnit
        --Precombat
        local function Precombat(unit)
            -- flask
            -- food
            -- augmentation
            -- snapshot_stats
            -- totem_mastery
            if A.TotemMastery:IsReady(unit) and ResonanceTotemTime() < 6 then
                return A.TotemMastery:Show(icon)
            end
            -- earth_elemental,if=!talent.primal_elementalist.enabled
            -- stormkeeper,if=talent.stormkeeper.enabled&(raid_event.adds.count<3|raid_event.adds.in>50)
            if A.Stormkeeper:IsReady(unit) and Unit("player"):HasBuffsDown(A.StormkeeperBuff.ID, true) and (A.Stormkeeper:IsSpellLearned() and ((MultiUnits:GetByRangeInCombat(40, 5, 10) - 1) < 3 or 10000000000 > 50)) then
                return A.Stormkeeper:Show(icon)
            end
            -- fire_elemental,if=!talent.storm_elemental.enabled
            if A.FireElemental:IsReady(unit) and A.BurstIsON(unit) and (not A.StormElemental:IsSpellLearned()) then
                return A.FireElemental:Show(icon)
            end
            -- storm_elemental,if=talent.storm_elemental.enabled
            if A.StormElemental:IsReady(unit) and A.BurstIsON(unit) and (A.StormElemental:IsSpellLearned()) then
                return A.StormElemental:Show(icon)
            end
            -- potion
            if A.PotionofUnbridledFury:IsReady(unit) and Action.GetToggle(1, "Potion") and
			((Pull > 0.1 and Pull <= A.LavaBurst:GetSpellCastTime() + A.GetGCD()) or not Action.GetToggle(1, "DBM")) then
                return A.PotionofUnbridledFury:Show(icon)
            end
            -- elemental_blast,if=talent.elemental_blast.enabled
            if A.ElementalBlast:IsReady(unit) and (A.ElementalBlast:IsSpellLearned()) and
			((Pull > 0.1 and Pull <= A.ElementalBlast:GetSpellCastTime()) or not Action.GetToggle(1, "DBM")) then
                return A.ElementalBlast:Show(icon)
            end
            -- lava_burst,if=!talent.elemental_blast.enabled&spell_targets.chain_lightning<3
            if A.LavaBurst:IsReady(unit) and (not A.ElementalBlast:IsSpellLearned() and MultiUnits:GetByRangeInCombat(40, 5, 10) < 3) and
			((Pull > 0.1 and Pull <= A.LavaBurst:GetSpellCastTime()) or not Action.GetToggle(1, "DBM")) then
                return A.LavaBurst:Show(icon)
            end
            -- chain_lightning,if=spell_targets.chain_lightning>2
            if A.ChainLightning:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) > 2) and
			((Pull > 0.1 and Pull <= A.ChainLightning:GetSpellCastTime()) or not Action.GetToggle(1, "DBM")) then
                return A.ChainLightning:Show(icon)
            end
        end
        
        --Aoe
        local function Aoe(unit)
            -- stormkeeper,if=talent.stormkeeper.enabled
            if A.Stormkeeper:IsReady(unit) and (A.Stormkeeper:IsSpellLearned()) then
                return A.Stormkeeper:Show(icon)
            end
            -- flame_shock,target_if=refreshable&(spell_targets.chain_lightning<(5-!talent.totem_mastery.enabled)|!talent.storm_elemental.enabled&(cooldown.fire_elemental.remains>(120+14*spell_haste)|cooldown.fire_elemental.remains<(24-14*spell_haste)))&(!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<120|spell_targets.chain_lightning=3&buff.wind_gust.stack<14)
            if A.FlameShock:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock47) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- ascendance,if=talent.ascendance.enabled&(talent.storm_elemental.enabled&cooldown.storm_elemental.remains<120&cooldown.storm_elemental.remains>15|!talent.storm_elemental.enabled)&(!talent.icefury.enabled|!buff.icefury.up&!cooldown.icefury.up)
            if A.Ascendance:IsReady(unit) and A.BurstIsON(unit) and (A.Ascendance:IsSpellLearned() and (A.StormElemental:IsSpellLearned() and A.StormElemental:GetCooldown() < 120 and A.StormElemental:GetCooldown() > 15 or not A.StormElemental:IsSpellLearned()) and (not A.Icefury:IsSpellLearned() or not Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and not A.Icefury:GetCooldown() == 0)) then
                return A.Ascendance:Show(icon)
            end
            -- liquid_magma_totem,if=talent.liquid_magma_totem.enabled
            if A.LiquidMagmaTotem:IsReady(unit) and (A.LiquidMagmaTotem:IsSpellLearned()) then
                return A.LiquidMagmaTotem:Show(icon)
            end
            -- earthquake,if=!talent.master_of_the_elements.enabled|buff.stormkeeper.up|maelstrom>=(100-4*spell_targets.chain_lightning)|buff.master_of_the_elements.up|spell_targets.chain_lightning>3
            if A.Earthquake:IsReady(unit) and (not A.MasteroftheElements:IsSpellLearned() or Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) > 0  or Player:Maelstrom() >= (100 - 4 * MultiUnits:GetByRangeInCombat(40, 5, 10)) or Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) or MultiUnits:GetByRangeInCombat(40, 5, 10) > 3) then
                return A.Earthquake:Show(icon)
            end
            -- chain_lightning,if=buff.stormkeeper.remains<3*gcd*buff.stormkeeper.stack
            if A.ChainLightning:IsReady(unit) and (Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) < 3 * A.GetGCD() * Unit("player"):HasBuffsStacks(A.StormkeeperBuff.ID, true)) then
                return A.ChainLightning:Show(icon)
            end
            -- lava_burst,if=buff.lava_surge.up&spell_targets.chain_lightning<4&(!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<120)&dot.flame_shock.ticking
            if A.LavaBurst:IsReady(unit) and (Unit("player"):HasBuffs(A.LavaSurgeBuff.ID, true) > 0 and MultiUnits:GetByRangeInCombat(40, 5, 10) < 4 and (not A.StormElemental:IsSpellLearned() or A.StormElemental:GetCooldown() < 120) and Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true)) then
                return A.LavaBurst:Show(icon)
            end
            -- icefury,if=spell_targets.chain_lightning<4&!buff.ascendance.up
            if A.Icefury:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) < 4 and Unit("player"):HasBuffs(A.AscendanceBuff.ID, true) == 0) then
                return A.Icefury:Show(icon)
            end
            -- frost_shock,if=spell_targets.chain_lightning<4&buff.icefury.up&!buff.ascendance.up
            if A.FrostShock:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) < 4 and Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) > 0 and not Unit("player"):HasBuffs(A.AscendanceBuff.ID, true) > 0) then
                return A.FrostShock:Show(icon)
            end
            -- elemental_blast,if=talent.elemental_blast.enabled&spell_targets.chain_lightning<4&(!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<120)
            if A.ElementalBlast:IsReady(unit) and (A.ElementalBlast:IsSpellLearned() and MultiUnits:GetByRangeInCombat(40, 5, 10) < 4 and (not A.StormElemental:IsSpellLearned() or A.StormElemental:GetCooldown() < 120)) then
                return A.ElementalBlast:Show(icon)
            end
            -- lava_beam,if=talent.ascendance.enabled
            if A.LavaBeam:IsReady(unit) and (A.Ascendance:IsSpellLearned()) then
                return A.LavaBeam:Show(icon)
            end
            -- chain_lightning
            if A.ChainLightning:IsReady(unit) then
                return A.ChainLightning:Show(icon)
            end
            -- lava_burst,moving=1,if=talent.ascendance.enabled
            if A.LavaBurst:IsReady(unit) and isMoving and (A.Ascendance:IsSpellLearned()) then
                return A.LavaBurst:Show(icon)
            end
            -- flame_shock,moving=1,target_if=refreshable
            if A.FlameShock:IsReady(unit) and isMoving then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock148) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- frost_shock,moving=1
            if A.FrostShock:IsReady(unit) and isMoving then
                return A.FrostShock:Show(icon)
            end
        end
        
        --Funnel
        local function Funnel(unit)
            -- flame_shock,target_if=(!ticking|talent.storm_elemental.enabled&cooldown.storm_elemental.remains<2*gcd|dot.flame_shock.remains<=gcd|talent.ascendance.enabled&dot.flame_shock.remains<(cooldown.ascendance.remains+buff.ascendance.duration)&cooldown.ascendance.remains<4&(!talent.storm_elemental.enabled|talent.storm_elemental.enabled&cooldown.storm_elemental.remains<120))&(buff.wind_gust.stack<14|azerite.igneous_potential.rank>=2|buff.lava_surge.up|!buff.bloodlust.up)&!buff.surge_of_power.up
            if A.FlameShock:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock163) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- ascendance,if=talent.ascendance.enabled&(time>=60|buff.bloodlust.up)&cooldown.lava_burst.remains>0&(cooldown.storm_elemental.remains<120|!talent.storm_elemental.enabled)&(!talent.icefury.enabled|!buff.icefury.up&!cooldown.icefury.up)
            if A.Ascendance:IsReady(unit) and A.BurstIsON(unit) and (A.Ascendance:IsSpellLearned() and (Unit("player"):CombatTime() >= 60 or Unit("player"):HasHeroism()) and A.LavaBurst:GetCooldown() > 0 and (A.StormElemental:GetCooldown() < 120 or not A.StormElemental:IsSpellLearned()) and (not A.Icefury:IsSpellLearned() or not Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and not A.Icefury:GetCooldown() == 0)) then
                return A.Ascendance:Show(icon)
            end
            -- elemental_blast,if=talent.elemental_blast.enabled&(talent.master_of_the_elements.enabled&buff.master_of_the_elements.up&maelstrom<60|!talent.master_of_the_elements.enabled)&(!(cooldown.storm_elemental.remains>120&talent.storm_elemental.enabled)|azerite.natural_harmony.rank=3&buff.wind_gust.stack<14)
            if A.ElementalBlast:IsReady(unit) and (A.ElementalBlast:IsSpellLearned() and (A.MasteroftheElements:IsSpellLearned() and Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) > 0 and Player:Maelstrom() < 60 or not A.MasteroftheElements:IsSpellLearned()) and (not (A.StormElemental:GetCooldown() > 120 and A.StormElemental:IsSpellLearned()) or A.NaturalHarmony:GetAzeriteRank() == 3 and Unit("player"):HasBuffsStacks(A.WindGustBuff.ID, true) < 14)) then
                return A.ElementalBlast:Show(icon)
            end
            -- stormkeeper,if=talent.stormkeeper.enabled&(raid_event.adds.count<3|raid_event.adds.in>50)&(!talent.surge_of_power.enabled|buff.surge_of_power.up|maelstrom>=44)
            if A.Stormkeeper:IsReady(unit) and (A.Stormkeeper:IsSpellLearned() and ((MultiUnits:GetByRangeInCombat(40, 5, 10) - 1) < 3) and (not A.SurgeofPower:IsSpellLearned() or Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) > 0 or Player:Maelstrom() >= 44)) then
                return A.Stormkeeper:Show(icon)
            end
            -- liquid_magma_totem,if=talent.liquid_magma_totem.enabled&(raid_event.adds.count<3|raid_event.adds.in>50)
            if A.LiquidMagmaTotem:IsReady(unit) and (A.LiquidMagmaTotem:IsSpellLearned() and ((MultiUnits:GetByRangeInCombat(40, 5, 10) - 1) < 3)) then
                return A.LiquidMagmaTotem:Show(icon)
            end
            -- lightning_bolt,if=buff.stormkeeper.up&spell_targets.chain_lightning<6&(azerite.lava_shock.rank*buff.lava_shock.stack)<36&(buff.master_of_the_elements.up&!talent.surge_of_power.enabled|buff.surge_of_power.up)
            if A.LightningBolt:IsReady(unit) and (Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) and MultiUnits:GetByRangeInCombat(40, 5, 10) < 6 and (A.LavaShock:GetAzeriteRank() * Unit("player"):HasBuffsStacks(A.LavaShockBuff.ID, true)) < 36 and (Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) > 0 and not A.SurgeofPower:IsSpellLearned() or Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) > 0)) then
                return A.LightningBolt:Show(icon)
            end
            -- earth_shock,if=!buff.surge_of_power.up&talent.master_of_the_elements.enabled&(buff.master_of_the_elements.up|cooldown.lava_burst.remains>0&maelstrom>=92+30*talent.call_the_thunder.enabled|(azerite.lava_shock.rank*buff.lava_shock.stack<36)&buff.stormkeeper.up&cooldown.lava_burst.remains<=gcd)
            if A.EarthShock:IsReady(unit) and (not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and A.MasteroftheElements:IsSpellLearned() and (Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) or A.LavaBurst:GetCooldown() > 0 and Player:Maelstrom() >= 92 + 30 * num(A.CalltheThunder:IsSpellLearned()) or (A.LavaShock:GetAzeriteRank() * Unit("player"):HasBuffsStacks(A.LavaShockBuff.ID, true) < 36) and Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) > 0 and A.LavaBurst:GetCooldown() <= A.GetGCD())) then
                return A.EarthShock:Show(icon)
            end
            -- earth_shock,if=!talent.master_of_the_elements.enabled&!(azerite.igneous_potential.rank>2&buff.ascendance.up)&(buff.stormkeeper.up|maelstrom>=90+30*talent.call_the_thunder.enabled|!(cooldown.storm_elemental.remains>120&talent.storm_elemental.enabled)&expected_combat_length-time-cooldown.storm_elemental.remains-150*floor((expected_combat_length-time-cooldown.storm_elemental.remains)%150)>=30*(1+(azerite.echo_of_the_elementals.rank>=2)))
            if A.EarthShock:IsReady(unit) and (not A.MasteroftheElements:IsSpellLearned() and not (A.IgneousPotential:GetAzeriteRank() > 2 and Unit("player"):HasBuffs(A.AscendanceBuff.ID, true)) and (Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) or Player:Maelstrom() >= 90 + 30 * num(A.CalltheThunder:IsSpellLearned()) or not (A.StormElemental:GetCooldown() > 120 and A.StormElemental:IsSpellLearned()) and expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown() - 150 * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown()) / 150) >= 30 * (1 + num((A.EchooftheElementals:GetAzeriteRank() >= 2))))) then
                return A.EarthShock:Show(icon)
            end
            -- earth_shock,if=talent.surge_of_power.enabled&!buff.surge_of_power.up&cooldown.lava_burst.remains<=gcd&(!talent.storm_elemental.enabled&!(cooldown.fire_elemental.remains>120)|talent.storm_elemental.enabled&!(cooldown.storm_elemental.remains>120))
            if A.EarthShock:IsReady(unit) and (A.SurgeofPower:IsSpellLearned() and not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and A.LavaBurst:GetCooldown() <= A.GetGCD() and (not A.StormElemental:IsSpellLearned() and not (A.FireElemental:GetCooldown() > 120) or A.StormElemental:IsSpellLearned() and not (A.StormElemental:GetCooldown() > 120))) then
                return A.EarthShock:Show(icon)
            end
            -- lightning_bolt,if=cooldown.storm_elemental.remains>120&talent.storm_elemental.enabled&(azerite.igneous_potential.rank<2|!buff.lava_surge.up&buff.bloodlust.up)
            if A.LightningBolt:IsReady(unit) and (A.StormElemental:GetCooldown() > 120 and A.StormElemental:IsSpellLearned() and (A.IgneousPotential:GetAzeriteRank() < 2 or not Unit("player"):HasBuffs(A.LavaSurgeBuff.ID, true) and Unit("player"):HasHeroism())) then
                return A.LightningBolt:Show(icon)
            end
            -- lightning_bolt,if=(buff.stormkeeper.remains<1.1*gcd*buff.stormkeeper.stack|buff.stormkeeper.up&buff.master_of_the_elements.up)
            if A.LightningBolt:IsReady(unit) and ((Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) < 1.1 * A.GetGCD() * Unit("player"):HasBuffsStacks(A.StormkeeperBuff.ID, true) or Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) and Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true))) then
                return A.LightningBolt:Show(icon)
            end
            -- frost_shock,if=talent.icefury.enabled&talent.master_of_the_elements.enabled&buff.icefury.up&buff.master_of_the_elements.up
            if A.FrostShock:IsReady(unit) and (A.Icefury:IsSpellLearned() and A.MasteroftheElements:IsSpellLearned() and Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true)) then
                return A.FrostShock:Show(icon)
            end
            -- lava_burst,if=buff.ascendance.up
            if A.LavaBurst:IsReady(unit) and (Unit("player"):HasBuffs(A.AscendanceBuff.ID, true)) then
                return A.LavaBurst:Show(icon)
            end
            -- flame_shock,target_if=refreshable&active_enemies>1&buff.surge_of_power.up
            if A.FlameShock:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock362) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- lava_burst,if=talent.storm_elemental.enabled&cooldown_react&buff.surge_of_power.up&(expected_combat_length-time-cooldown.storm_elemental.remains-150*floor((expected_combat_length-time-cooldown.storm_elemental.remains)%150)<30*(1+(azerite.echo_of_the_elementals.rank>=2))|(1.16*(expected_combat_length-time)-cooldown.storm_elemental.remains-150*floor((1.16*(expected_combat_length-time)-cooldown.storm_elemental.remains)%150))<(expected_combat_length-time-cooldown.storm_elemental.remains-150*floor((expected_combat_length-time-cooldown.storm_elemental.remains)%150)))
            if A.LavaBurst:IsReady(unit) and (A.StormElemental:IsSpellLearned() and A.LavaBurst:GetCooldown() == 0 and Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and (expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown() - 150 * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown()) / 150) < 30 * (1 + num((A.EchooftheElementals:GetAzeriteRank() >= 2))) or (1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.StormElemental:GetCooldown() - 150 * math.floor ((1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.StormElemental:GetCooldown()) / 150)) < (expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown() - 150 * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown()) / 150)))) then
                return A.LavaBurst:Show(icon)
            end
            -- lava_burst,if=!talent.storm_elemental.enabled&cooldown_react&buff.surge_of_power.up&(expected_combat_length-time-cooldown.fire_elemental.remains-150*floor((expected_combat_length-time-cooldown.fire_elemental.remains)%150)<30*(1+(azerite.echo_of_the_elementals.rank>=2))|(1.16*(expected_combat_length-time)-cooldown.fire_elemental.remains-150*floor((1.16*(expected_combat_length-time)-cooldown.fire_elemental.remains)%150))<(expected_combat_length-time-cooldown.fire_elemental.remains-150*floor((expected_combat_length-time-cooldown.fire_elemental.remains)%150)))
            if A.LavaBurst:IsReady(unit) and (not A.StormElemental:IsSpellLearned() and A.LavaBurst:GetCooldown() == 0 and Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and (expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown() - 150 * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown()) / 150) < 30 * (1 + num((A.EchooftheElementals:GetAzeriteRank() >= 2))) or (1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.FireElemental:GetCooldown() - 150 * math.floor ((1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.FireElemental:GetCooldown()) / 150)) < (expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown() - 150 * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown()) / 150)))) then
                return A.LavaBurst:Show(icon)
            end
            -- lightning_bolt,if=buff.surge_of_power.up
            if A.LightningBolt:IsReady(unit) and (Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)) then
                return A.LightningBolt:Show(icon)
            end
            -- lava_burst,if=cooldown_react&!talent.master_of_the_elements.enabled
            if A.LavaBurst:IsReady(unit) and (A.LavaBurst:GetCooldown() == 0 and not A.MasteroftheElements:IsSpellLearned()) then
                return A.LavaBurst:Show(icon)
            end
            -- icefury,if=talent.icefury.enabled&!(maelstrom>75&cooldown.lava_burst.remains<=0)&(!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<120)
            if A.Icefury:IsReady(unit) and (A.Icefury:IsSpellLearned() and not (Player:Maelstrom() > 75 and A.LavaBurst:GetCooldown() <= 0) and (not A.StormElemental:IsSpellLearned() or A.StormElemental:GetCooldown() < 120)) then
                return A.Icefury:Show(icon)
            end
            -- lava_burst,if=cooldown_react&charges>talent.echo_of_the_elements.enabled
            if A.LavaBurst:IsReady(unit) and (A.LavaBurst:GetCooldown() == 0 and A.LavaBurst:GetSpellCharges() > num(A.EchooftheElements:IsSpellLearned())) then
                return A.LavaBurst:Show(icon)
            end
            -- frost_shock,if=talent.icefury.enabled&buff.icefury.up&buff.icefury.remains<1.1*gcd*buff.icefury.stack
            if A.FrostShock:IsReady(unit) and (A.Icefury:IsSpellLearned() and Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) < 1.1 * A.GetGCD() * Unit("player"):HasBuffsStacks(A.IcefuryBuff.ID, true)) then
                return A.FrostShock:Show(icon)
            end
            -- lava_burst,if=cooldown_react
            if A.LavaBurst:IsReady(unit) and (A.LavaBurst:GetCooldown() == 0) then
                return A.LavaBurst:Show(icon)
            end
            -- flame_shock,target_if=refreshable&!buff.surge_of_power.up
            if A.FlameShock:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock483) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- totem_mastery,if=talent.totem_mastery.enabled&(buff.resonance_totem.remains<6|(buff.resonance_totem.remains<(buff.ascendance.duration+cooldown.ascendance.remains)&cooldown.ascendance.remains<15))
            if A.TotemMastery:IsReady(unit) and (A.TotemMastery:IsSpellLearned() and (ResonanceTotemTime() < 6 or (ResonanceTotemTime() < (15 + A.Ascendance:GetCooldown()) and A.Ascendance:GetCooldown() < 15))) then
                return A.TotemMastery:Show(icon)
            end
            -- frost_shock,if=talent.icefury.enabled&buff.icefury.up&(buff.icefury.remains<gcd*4*buff.icefury.stack|buff.stormkeeper.up|!talent.master_of_the_elements.enabled)
            if A.FrostShock:IsReady(unit) and (A.Icefury:IsSpellLearned() and Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and (Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) < A.GetGCD() * 4 * Unit("player"):HasBuffsStacks(A.IcefuryBuff.ID, true) or Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) or not A.MasteroftheElements:IsSpellLearned())) then
                return A.FrostShock:Show(icon)
            end
            -- lightning_bolt
            if A.LightningBolt:IsReady(unit) then
                return A.LightningBolt:Show(icon)
            end
            -- flame_shock,moving=1,target_if=refreshable
            if A.FlameShock:IsReady(unit) and isMoving then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock528) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- flame_shock,moving=1,if=movement.distance>6
            if A.FlameShock:IsReady(unit) and isMoving and (Unit(unit):GetRange() > 6) then
                return A.FlameShock:Show(icon)
            end
            -- frost_shock,moving=1
            if A.FrostShock:IsReady(unit) and isMoving then
                return A.FrostShock:Show(icon)
            end
        end
        
        --SingleUnit
        local function SingleUnit(unit)
            -- flame_shock,target_if=(!ticking|talent.storm_elemental.enabled&cooldown.storm_elemental.remains<2*gcd|dot.flame_shock.remains<=gcd|talent.ascendance.enabled&dot.flame_shock.remains<(cooldown.ascendance.remains+buff.ascendance.duration)&cooldown.ascendance.remains<4&(!talent.storm_elemental.enabled|talent.storm_elemental.enabled&cooldown.storm_elemental.remains<120))&(buff.wind_gust.stack<14|azerite.igneous_potential.rank>=2|buff.lava_surge.up|!buff.bloodlust.up)&!buff.surge_of_power.up
            if A.FlameShock:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock545) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- ascendance,if=talent.ascendance.enabled&(time>=60|buff.bloodlust.up)&cooldown.lava_burst.remains>0&(cooldown.storm_elemental.remains<120|!talent.storm_elemental.enabled)&(!talent.icefury.enabled|!buff.icefury.up&!cooldown.icefury.up)
            if A.Ascendance:IsReady(unit) and A.BurstIsON(unit) and (A.Ascendance:IsSpellLearned() and (Unit("player"):CombatTime() >= 60 or Unit("player"):HasHeroism()) and A.LavaBurst:GetCooldown() > 0 and (A.StormElemental:GetCooldown() < 120 or not A.StormElemental:IsSpellLearned()) and (not A.Icefury:IsSpellLearned() or Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) == 0 and not A.Icefury:GetCooldown() == 0)) then
                return A.Ascendance:Show(icon)
            end
            -- elemental_blast,if=talent.elemental_blast.enabled&(talent.master_of_the_elements.enabled&buff.master_of_the_elements.up&maelstrom<60|!talent.master_of_the_elements.enabled)&(!(cooldown.storm_elemental.remains>120&talent.storm_elemental.enabled)|azerite.natural_harmony.rank=3&buff.wind_gust.stack<14)
            if A.ElementalBlast:IsReady(unit) and (A.ElementalBlast:IsSpellLearned() and (A.MasteroftheElements:IsSpellLearned() and Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) > 0 and Player:Maelstrom() < 60 or not A.MasteroftheElements:IsSpellLearned()) and (not (A.StormElemental:GetCooldown() > 120 and A.StormElemental:IsSpellLearned()) or A.NaturalHarmony:GetAzeriteRank() == 3 and Unit("player"):HasBuffsStacks(A.WindGustBuff.ID, true) < 14)) then
                return A.ElementalBlast:Show(icon)
            end
            -- stormkeeper,if=talent.stormkeeper.enabled&(raid_event.adds.count<3|raid_event.adds.in>50)&(!talent.surge_of_power.enabled|buff.surge_of_power.up|maelstrom>=44)
            if A.Stormkeeper:IsReady(unit) and (A.Stormkeeper:IsSpellLearned() and ((MultiUnits:GetByRangeInCombat(40, 5, 10) - 1) < 3) and (not A.SurgeofPower:IsSpellLearned() or Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) or Player:Maelstrom() >= 44)) then
                return A.Stormkeeper:Show(icon)
            end
            -- liquid_magma_totem,if=talent.liquid_magma_totem.enabled&(raid_event.adds.count<3|raid_event.adds.in>50)
            if A.LiquidMagmaTotem:IsReady(unit) and (A.LiquidMagmaTotem:IsSpellLearned() and ((MultiUnits:GetByRangeInCombat(40, 5, 10) - 1) < 3)) then
                return A.LiquidMagmaTotem:Show(icon)
            end
            -- lightning_bolt,if=buff.stormkeeper.up&spell_targets.chain_lightning<2&(azerite.lava_shock.rank*buff.lava_shock.stack)<26&(buff.master_of_the_elements.up&!talent.surge_of_power.enabled|buff.surge_of_power.up)
            if A.LightningBolt:IsReady(unit) and (Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) > 0 and MultiUnits:GetByRangeInCombat(40, 5, 10) < 2 and (A.LavaShock:GetAzeriteRank() * Unit("player"):HasBuffsStacks(A.LavaShockBuff.ID, true)) < 26 and (Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) > 0 and not A.SurgeofPower:IsSpellLearned() or Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) > 0)) then
                return A.LightningBolt:Show(icon)
            end
            -- earthquake,if=(spell_targets.chain_lightning>1|azerite.tectonic_thunder.rank>=3&!talent.surge_of_power.enabled&azerite.lava_shock.rank<1)&azerite.lava_shock.rank*buff.lava_shock.stack<(36+3*azerite.tectonic_thunder.rank*spell_targets.chain_lightning)&(!talent.surge_of_power.enabled|!dot.flame_shock.refreshable|cooldown.storm_elemental.remains>120)&(!talent.master_of_the_elements.enabled|buff.master_of_the_elements.up|cooldown.lava_burst.remains>0&maelstrom>=92+30*talent.call_the_thunder.enabled)
            if A.Earthquake:IsReady(unit) and ((MultiUnits:GetByRangeInCombat(40, 5, 10) > 1 or A.TectonicThunder:GetAzeriteRank() >= 3 and not A.SurgeofPower:IsSpellLearned() and A.LavaShock:GetAzeriteRank() < 1) and A.LavaShock:GetAzeriteRank() * Unit("player"):HasBuffsStacks(A.LavaShockBuff.ID, true) < (36 + 3 * A.TectonicThunder:GetAzeriteRank() * MultiUnits:GetByRangeInCombat(40, 5, 10)) and (not A.SurgeofPower:IsSpellLearned() or not Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true) or A.StormElemental:GetCooldown() > 120) and (not A.MasteroftheElements:IsSpellLearned() or Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) or A.LavaBurst:GetCooldown() > 0 and Player:Maelstrom() >= 92 + 30 * num(A.CalltheThunder:IsSpellLearned()))) then
                return A.Earthquake:Show(icon)
            end
            -- earth_shock,if=!buff.surge_of_power.up&talent.master_of_the_elements.enabled&(buff.master_of_the_elements.up|cooldown.lava_burst.remains>0&maelstrom>=92+30*talent.call_the_thunder.enabled|spell_targets.chain_lightning<2&(azerite.lava_shock.rank*buff.lava_shock.stack<26)&buff.stormkeeper.up&cooldown.lava_burst.remains<=gcd)
            if A.EarthShock:IsReady(unit) and (Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) == 0 and A.MasteroftheElements:IsSpellLearned() and (Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) > 0 or A.LavaBurst:GetCooldown() > 0 and Player:Maelstrom() >= 92 + 30 * num(A.CalltheThunder:IsSpellLearned()) or MultiUnits:GetByRangeInCombat(40, 5, 10) < 2 and (A.LavaShock:GetAzeriteRank() * Unit("player"):HasBuffsStacks(A.LavaShockBuff.ID, true) < 26) and Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) > 0 and A.LavaBurst:GetCooldown() <= A.GetGCD())) then
                return A.EarthShock:Show(icon)
            end
            -- earth_shock,if=!talent.master_of_the_elements.enabled&!(azerite.igneous_potential.rank>2&buff.ascendance.up)&(buff.stormkeeper.up|maelstrom>=90+30*talent.call_the_thunder.enabled|!(cooldown.storm_elemental.remains>120&talent.storm_elemental.enabled)&expected_combat_length-time-cooldown.storm_elemental.remains-150*floor((expected_combat_length-time-cooldown.storm_elemental.remains)%150)>=30*(1+(azerite.echo_of_the_elementals.rank>=2)))
            if A.EarthShock:IsReady(unit) and (not A.MasteroftheElements:IsSpellLearned() and not (A.IgneousPotential:GetAzeriteRank() > 2 and Unit("player"):HasBuffs(A.AscendanceBuff.ID, true) > 0) and (Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) > 0 or Player:Maelstrom() >= 90 + 30 * num(A.CalltheThunder:IsSpellLearned()) or not (A.StormElemental:GetCooldown() > 120 and A.StormElemental:IsSpellLearned()) and expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown() - 150 * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown()) / 150) >= 30 * (1 + num((A.EchooftheElementals:GetAzeriteRank() >= 2))))) then
                return A.EarthShock:Show(icon)
            end
            -- earth_shock,if=talent.surge_of_power.enabled&!buff.surge_of_power.up&cooldown.lava_burst.remains<=gcd&(!talent.storm_elemental.enabled&!(cooldown.fire_elemental.remains>120)|talent.storm_elemental.enabled&!(cooldown.storm_elemental.remains>120))
            if A.EarthShock:IsReady(unit) and (A.SurgeofPower:IsSpellLearned() and not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and A.LavaBurst:GetCooldown() <= A.GetGCD() and (not A.StormElemental:IsSpellLearned() and not (A.FireElemental:GetCooldown() > 120) or A.StormElemental:IsSpellLearned() and not (A.StormElemental:GetCooldown() > 120))) then
                return A.EarthShock:Show(icon)
            end
            -- lightning_lasso
            if A.LightningLasso:IsReady(unit) then
                return A.LightningLasso:Show(icon)
            end
            -- lightning_bolt,if=cooldown.storm_elemental.remains>120&talent.storm_elemental.enabled&(azerite.igneous_potential.rank<2|!buff.lava_surge.up&buff.bloodlust.up)
            if A.LightningBolt:IsReady(unit) and (A.StormElemental:GetCooldown() > 120 and A.StormElemental:IsSpellLearned() and (A.IgneousPotential:GetAzeriteRank() < 2 or not Unit("player"):HasBuffs(A.LavaSurgeBuff.ID, true) > 0 and Unit("player"):HasHeroism())) then
                return A.LightningBolt:Show(icon)
            end
            -- lightning_bolt,if=(buff.stormkeeper.remains<1.1*gcd*buff.stormkeeper.stack|buff.stormkeeper.up&buff.master_of_the_elements.up)
            if A.LightningBolt:IsReady(unit) and ((Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) < 1.1 * A.GetGCD() * Unit("player"):HasBuffsStacks(A.StormkeeperBuff.ID, true) or Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) > 0 and Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) > 0)) then
                return A.LightningBolt:Show(icon)
            end
            -- frost_shock,if=talent.icefury.enabled&talent.master_of_the_elements.enabled&buff.icefury.up&buff.master_of_the_elements.up
            if A.FrostShock:IsReady(unit) and (A.Icefury:IsSpellLearned() and A.MasteroftheElements:IsSpellLearned() and Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) > 0 and Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) > 0) then
                return A.FrostShock:Show(icon)
            end
            -- lava_burst,if=buff.ascendance.up
            if A.LavaBurst:IsReady(unit) and (Unit("player"):HasBuffs(A.AscendanceBuff.ID, true) > 0) then
                return A.LavaBurst:Show(icon)
            end
            -- flame_shock,target_if=refreshable&active_enemies>1&buff.surge_of_power.up
            if A.FlameShock:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock774) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- lava_burst,if=talent.storm_elemental.enabled&cooldown_react&buff.surge_of_power.up&(expected_combat_length-time-cooldown.storm_elemental.remains-150*floor((expected_combat_length-time-cooldown.storm_elemental.remains)%150)<30*(1+(azerite.echo_of_the_elementals.rank>=2))|(1.16*(expected_combat_length-time)-cooldown.storm_elemental.remains-150*floor((1.16*(expected_combat_length-time)-cooldown.storm_elemental.remains)%150))<(expected_combat_length-time-cooldown.storm_elemental.remains-150*floor((expected_combat_length-time-cooldown.storm_elemental.remains)%150)))
            if A.LavaBurst:IsReady(unit) and (A.StormElemental:IsSpellLearned() and A.LavaBurst:GetCooldown() == 0 and Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) > 0 and (expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown() - 150 * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown()) / 150) < 30 * (1 + num((A.EchooftheElementals:GetAzeriteRank() >= 2))) or (1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.StormElemental:GetCooldown() - 150 * math.floor ((1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.StormElemental:GetCooldown()) / 150)) < (expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown() - 150 * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown()) / 150)))) then
                return A.LavaBurst:Show(icon)
            end
            -- lava_burst,if=!talent.storm_elemental.enabled&cooldown_react&buff.surge_of_power.up&(expected_combat_length-time-cooldown.fire_elemental.remains-150*floor((expected_combat_length-time-cooldown.fire_elemental.remains)%150)<30*(1+(azerite.echo_of_the_elementals.rank>=2))|(1.16*(expected_combat_length-time)-cooldown.fire_elemental.remains-150*floor((1.16*(expected_combat_length-time)-cooldown.fire_elemental.remains)%150))<(expected_combat_length-time-cooldown.fire_elemental.remains-150*floor((expected_combat_length-time-cooldown.fire_elemental.remains)%150)))
            if A.LavaBurst:IsReady(unit) and (not A.StormElemental:IsSpellLearned() and A.LavaBurst:GetCooldown() == 0 and Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) > 0 and (expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown() - 150 * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown()) / 150) < 30 * (1 + num((A.EchooftheElementals:GetAzeriteRank() >= 2))) or (1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.FireElemental:GetCooldown() - 150 * math.floor ((1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.FireElemental:GetCooldown()) / 150)) < (expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown() - 150 * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown()) / 150)))) then
                return A.LavaBurst:Show(icon)
            end
            -- lightning_bolt,if=buff.surge_of_power.up
            if A.LightningBolt:IsReady(unit) and (Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) > 0) then
                return A.LightningBolt:Show(icon)
            end
            -- lava_burst,if=cooldown_react&!talent.master_of_the_elements.enabled
            if A.LavaBurst:IsReady(unit) and (A.LavaBurst:GetCooldown() == 0 and not A.MasteroftheElements:IsSpellLearned()) then
                return A.LavaBurst:Show(icon)
            end
            -- icefury,if=talent.icefury.enabled&!(maelstrom>75&cooldown.lava_burst.remains<=0)&(!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<120)
            if A.Icefury:IsReady(unit) and (A.Icefury:IsSpellLearned() and not (Player:Maelstrom() > 75 and A.LavaBurst:GetCooldown() <= 0) and (not A.StormElemental:IsSpellLearned() or A.StormElemental:GetCooldown() < 120)) then
                return A.Icefury:Show(icon)
            end
            -- lava_burst,if=cooldown_react&charges>talent.echo_of_the_elements.enabled
            if A.LavaBurst:IsReady(unit) and (A.LavaBurst:GetCooldown() == 0 and A.LavaBurst:GetSpellCharges() > num(A.EchooftheElements:IsSpellLearned())) then
                return A.LavaBurst:Show(icon)
            end
            -- frost_shock,if=talent.icefury.enabled&buff.icefury.up&buff.icefury.remains<1.1*gcd*buff.icefury.stack
            if A.FrostShock:IsReady(unit) and (A.Icefury:IsSpellLearned() and Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) > 0 and Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) < 1.1 * A.GetGCD() * Unit("player"):HasBuffsStacks(A.IcefuryBuff.ID, true)) then
                return A.FrostShock:Show(icon)
            end
            -- lava_burst,if=cooldown_react
            if A.LavaBurst:IsReady(unit) and (A.LavaBurst:GetCooldown() == 0) then
                return A.LavaBurst:Show(icon)
            end
            -- flame_shock,target_if=refreshable&!buff.surge_of_power.up
            if A.FlameShock:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock895) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- totem_mastery,if=talent.totem_mastery.enabled&(buff.resonance_totem.remains<6|(buff.resonance_totem.remains<(buff.ascendance.duration+cooldown.ascendance.remains)&cooldown.ascendance.remains<15))
            if A.TotemMastery:IsReady(unit) and (A.TotemMastery:IsSpellLearned() and (ResonanceTotemTime() < 6 or (ResonanceTotemTime() < (15 + A.Ascendance:GetCooldown()) and A.Ascendance:GetCooldown() < 15))) then
                return A.TotemMastery:Show(icon)
            end
            -- frost_shock,if=talent.icefury.enabled&buff.icefury.up&(buff.icefury.remains<gcd*4*buff.icefury.stack|buff.stormkeeper.up|!talent.master_of_the_elements.enabled)
            if A.FrostShock:IsReady(unit) and (A.Icefury:IsSpellLearned() and Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) > 0 and (Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) < A.GetGCD() * 4 * Unit("player"):HasBuffsStacks(A.IcefuryBuff.ID, true) or Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) or not A.MasteroftheElements:IsSpellLearned())) then
                return A.FrostShock:Show(icon)
            end
            -- chain_lightning,if=buff.tectonic_thunder.up&!buff.stormkeeper.up&spell_targets.chain_lightning>1
            if A.ChainLightning:IsReady(unit) and (Unit("player"):HasBuffs(A.TectonicThunderBuff.ID, true) > 0 and not Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) > 0 and MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) then
                return A.ChainLightning:Show(icon)
            end
            -- lightning_bolt
            if A.LightningBolt:IsReady(unit) then
                return A.LightningBolt:Show(icon)
            end
            -- flame_shock,moving=1,target_if=refreshable
            if A.FlameShock:IsReady(unit) and isMoving then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock946) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- flame_shock,moving=1,if=movement.distance>6
            if A.FlameShock:IsReady(unit) and isMoving and (Unit(unit):GetRange() > 6) then
                return A.FlameShock:Show(icon)
            end
            -- frost_shock,moving=1
            if A.FrostShock:IsReady(unit) and isMoving then
                return A.FrostShock:Show(icon)
            end
        end
        
 	   	-- Mouseover DPS Rotation
	   	-- Only handling mouseover multidots and dots refreshable
	   	local function MouseoverRotation(unit)
		
		   	-- Variables
          	inRange = A.ChainLightning:IsInRange(unit)
		
		   	-- Note: Toggles  ("UseDispel", "UsePurge", "UseExpelEnrage")
          	-- Category ("Dispel", "MagicMovement", "PurgeFriendly", "PurgeHigh", "PurgeLow", "Enrage")
          	-- Purge
		   	if A.Purge:IsReady(unit) and Action.GetToggle(2, "mouseover") and not ShouldStop and Action.AuraIsValid(unit, "UsePurge", "PurgeHigh") then
                return A.Purge:Show(icon)
          	end	
  	        
			-- WindShear
  	        if useKick and A.WindShear:IsReady(unit) and not ShouldStop then 
		  	    if Unit(unit):CanInterrupt(true, nil, 25, 70) then
          	        return A.WindShear:Show(icon)
         	    end 
         	end 		
				
		   	-- FlameShock
		   	if A.FlameShock:IsReady(unit) and Action.GetToggle(2, "mouseover") and MultiUnits:GetByRangeInCombat(40, 5, 10) <= 3 and not ShouldStop and (Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) <= 5 or Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) == 0) and not Unit("player"):GetSpellLastCast(A.FlameShock.ID, true) and Unit(unit):TimeToDie() >= 15 then
		   		return A.FlameShock:Show(icon)
		   	end			
		
	   	end
	
        -- call precombat
        if not inCombat and Unit(unit):IsExists() and unit ~= "mouseover" and not Unit(unit):IsTotem() then 
            local ShouldReturn = Precombat(unit); if ShouldReturn then return ShouldReturn; end
        end

        -- In Combat
        if inCombat and Unit(unit):IsExists() and not Unit(unit):IsTotem() then

		    -- Interrupt Handler 	 	
  		    local unit = "target"
   		    local useKick, useCC, useRacial = Action.InterruptIsValid(unit, "TargetMouseover")    
            local Trinket1IsAllowed, Trinket2IsAllowed = TrinketIsAllowed()
		
  	        -- WindShear
  	        if useKick and A.WindShear:IsReady(unit) and not ShouldStop then 
		  	    if Unit(unit):CanInterrupt(true, nil, 25, 70) then
          	        return A.WindShear:Show(icon)
         	    end 
      	    end	
     	    -- CapacitorTotem
      	    if useCC and Action.GetToggle(2, "UseCapacitorTotem") and A.WindShear:GetCooldown() > 0 and A.CapacitorTotem:IsReady(unit) and not ShouldStop then 
	  		    if Unit(unit):CanInterrupt(true, nil, 25, 70) then
     	            return A.CapacitorTotem:Show(icon)
     	        end 
     	    end 
            -- Mouseover         
            if Action.IsUnitEnemy("mouseover") and not Unit("mouseover"):IsDead() and Action.GetToggle(2, "mouseover") then 
                unit = "mouseover"
                
                if MouseoverRotation(unit) then 
                    return true 
                end 
            end
		    -- Purge
		    -- Note: Toggles  ("UseDispel", "UsePurge", "UseExpelEnrage")
            -- Category ("Dispel", "MagicMovement", "PurgeFriendly", "PurgeHigh", "PurgeLow", "Enrage")
            if A.Purge:IsReady(unit) and not ShouldStop and Action.AuraIsValid("target", "UsePurge", "PurgeHigh") then
                return A.Purge:Show(icon)
            end	
		    -- Ghost Wolf
		    if Unit(unit):GetRange() > 40 and A.GhostWolf:IsReady(unit) and not ShouldStop and not Unit("player"):HasBuffs(A.GhostWolfBuff.ID, true) > 0 and Action.GetToggle(2, "UseGhostWolf") then
		        return A.GhostWolf:Show(icon)
		    end
		    -- Earth Shield
            if A.EarthShield:IsReady("player") and Unit("player"):HealthPercent() <= Action.GetToggle(2, "EarthShieldHP") then
                return A.EarthShield:Show(icon)
            end
		    -- Healing Surge
            if A.HealingSurge:IsReady("player") and Unit("player"):HealthPercent() <= Action.GetToggle(2, "HealingSurgeHP") then
                return A.HealingSurge:Show(icon)
            end
		    -- Astral Shift
            if A.AstralShift:IsReady("player") and Unit("player"):HealthPercent() <= Action.GetToggle(2, "AstralShiftHP") then
                return A.AstralShift:Show(icon)
            end
            -- potion,if=expected_combat_length-time<30|cooldown.fire_elemental.remains>120|cooldown.storm_elemental.remains>120
            if A.PotionofUnbridledFury:IsReady(unit) and Action.GetToggle(1, "Potion") and (expected_combat_length - Unit("player"):CombatTime() < 30 or A.FireElemental:GetCooldown() > 120 or A.StormElemental:GetCooldown() > 120) then
                return A.PotionofUnbridledFury:Show(icon)
            end
            -- totem_mastery,if=talent.totem_mastery.enabled&buff.resonance_totem.remains<2
            if A.TotemMastery:IsReady(unit) and (A.TotemMastery:IsSpellLearned() and ResonanceTotemTime() < 2) then
                return A.TotemMastery:Show(icon)
            end
            -- use_items
            -- fire_elemental,if=!talent.storm_elemental.enabled
            if A.FireElemental:IsReady(unit) and A.BurstIsON(unit) and (not A.StormElemental:IsSpellLearned()) then
                return A.FireElemental:Show(icon)
            end
            -- storm_elemental,if=talent.storm_elemental.enabled&(!talent.icefury.enabled|!buff.icefury.up&!cooldown.icefury.up)&(!talent.ascendance.enabled|!cooldown.ascendance.up)
            if A.StormElemental:IsReady(unit) and A.BurstIsON(unit) and (A.StormElemental:IsSpellLearned() and (not A.Icefury:IsSpellLearned() or not Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) > 0 and not A.Icefury:GetCooldown() == 0) and (not A.Ascendance:IsSpellLearned() or not A.Ascendance:GetCooldown() == 0)) then
                return A.StormElemental:Show(icon)
            end
            -- earth_elemental,if=!talent.primal_elementalist.enabled|talent.primal_elementalist.enabled&(cooldown.fire_elemental.remains<120&!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<120&talent.storm_elemental.enabled)
            -- concentrated_flame
            if A.ConcentratedFlame:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") then
                return A.ConcentratedFlame:Show(icon)
            end
            -- blood_of_the_enemy
            if A.BloodoftheEnemy:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") then
                return A.BloodoftheEnemy:Show(icon)
            end
            -- guardian_of_azeroth
            if A.GuardianofAzeroth:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") then
                return A.GuardianofAzeroth:Show(icon)
            end
            -- focused_azerite_beam
            if A.FocusedAzeriteBeam:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") then
                return A.FocusedAzeriteBeam:Show(icon)
            end
            -- purifying_blast
            if A.PurifyingBlast:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") then
                return A.PurifyingBlast:Show(icon)
            end
            -- the_unbound_force
            if A.TheUnboundForce:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") then
                return A.TheUnboundForce:Show(icon)
            end
            -- memory_of_lucid_dreams
            if A.MemoryofLucidDreams:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") then
                return A.MemoryofLucidDreams:Show(icon)
            end
            -- ripple_in_space
            if A.RippleinSpace:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") then
                return A.RippleinSpace:Show(icon)
            end
            -- worldvein_resonance
            if A.WorldveinResonance:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") then
                return A.WorldveinResonance:Show(icon)
            end
            -- blood_fury,if=!talent.ascendance.enabled|buff.ascendance.up|cooldown.ascendance.remains>50
            if A.BloodFury:AutoRacial(unit) and Action.GetToggle(1, "Racial") and A.BurstIsON(unit) and (not A.Ascendance:IsSpellLearned() or Unit("player"):HasBuffs(A.AscendanceBuff.ID, true) > 0 or A.Ascendance:GetCooldown() > 50) then
                return A.BloodFury:Show(icon)
            end
            -- berserking,if=!talent.ascendance.enabled|buff.ascendance.up
            if A.Berserking:AutoRacial(unit) and Action.GetToggle(1, "Racial") and A.BurstIsON(unit) and (not A.Ascendance:IsSpellLearned() or Unit("player"):HasBuffs(A.AscendanceBuff.ID, true) > 0) then
                return A.Berserking:Show(icon)
            end
            -- fireblood,if=!talent.ascendance.enabled|buff.ascendance.up|cooldown.ascendance.remains>50
            if A.Fireblood:AutoRacial(unit) and Action.GetToggle(1, "Racial") and A.BurstIsON(unit) and (not A.Ascendance:IsSpellLearned() or Unit("player"):HasBuffs(A.AscendanceBuff.ID, true) > 0 or A.Ascendance:GetCooldown() > 50) then
                return A.Fireblood:Show(icon)
            end
            -- ancestral_call,if=!talent.ascendance.enabled|buff.ascendance.up|cooldown.ascendance.remains>50
            if A.AncestralCall:AutoRacial(unit) and Action.GetToggle(1, "Racial") and A.BurstIsON(unit) and (not A.Ascendance:IsSpellLearned() or Unit("player"):HasBuffs(A.AscendanceBuff.ID, true) > 0 or A.Ascendance:GetCooldown() > 50) then
                return A.AncestralCall:Show(icon)
            end
            -- run_action_list,name=aoe,if=active_enemies>2&(spell_targets.chain_lightning>2|spell_targets.lava_beam>2)
            if (MultiUnits:GetByRangeInCombat(40, 5, 10) > 2 and (MultiUnits:GetByRangeInCombat(40, 5, 10) > 2 or MultiUnits:GetByRangeInCombat(5, 5, 10) > 2)) then
                return Aoe(unit);
            end
            -- run_action_list,name=funnel,if=active_enemies>=2&(spell_targets.chain_lightning<2|spell_targets.lava_beam<2)
            if (MultiUnits:GetByRangeInCombat(40, 5, 10) >= 2 and (MultiUnits:GetByRangeInCombat(40, 5, 10) < 2 or MultiUnits:GetByRangeInCombat(5, 5, 10) < 2)) then
                return Funnel(unit);
            end
            -- run_action_list,name=single_target
            if (true) then
                return SingleUnit(unit);
            end
        end
    end

    -- End on EnemyRotation()

    -- Defensive
    --local SelfDefensive = SelfDefensives()
    if SelfDefensive then 
        return SelfDefensive:Show(icon)
    end 

    -- Mouseover
    if A.IsUnitEnemy("mouseover") then
        unit = "mouseover"
        if EnemyRotation(unit) then 
            return true 
        end 
    end 

    -- Target  
    if A.IsUnitEnemy("target") then 
        unit = "target"
        if EnemyRotation(unit) then 
            return true
        end 

    end
end
-- Finished

-- [4] AoE Rotation
A[4] = function(icon)
    return A[3](icon, true)
end
 -- [5] Trinket Rotation
-- No specialization trinket actions 
-- Passive 
--[[local function FreezingTrapUsedByEnemy()
    if     UnitCooldown:GetCooldown("arena", 3355) > UnitCooldown:GetMaxDuration("arena", 3355) - 2 and
    UnitCooldown:IsSpellInFly("arena", 3355) and 
    Unit("player"):GetDR("incapacitate") >= 50 
    then 
        local Caster = UnitCooldown:GetUnitID("arena", 3355)
        if Caster and Unit(Caster):GetRange() <= 40 then 
            return true 
        end 
    end 
end 
local function ArenaRotation(icon, unit)
    if A.IsInPvP and (A.Zone == "pvp" or A.Zone == "arena") and not Player:IsStealthed() and not Player:IsMounted() then
        -- Note: "arena1" is just identification of meta 6
        if unit == "arena1" and (Unit("player"):GetDMG() == 0 or not Unit("player"):IsFocused("DAMAGER")) then 
            -- Reflect Casting BreakAble CC
            if A.NetherWard:IsReady() and A.NetherWard:IsSpellLearned() and Action.ShouldReflect(EnemyTeam()) and EnemyTeam():IsCastingBreakAble(0.25) then 
                return A.NetherWard:Show(icon)
            end 
        end
    end 
end 
local function PartyRotation(unit)
    if (unit == "party1" and not A.GetToggle(2, "PartyUnits")[1]) or (unit == "party2" and not A.GetToggle(2, "PartyUnits")[2]) then 
        return false 
    end

  	-- SingeMagic
    if A.SingeMagic:IsCastable() and A.SingeMagic:AbsentImun(unit, Temp.TotalAndMag) and IsSchoolFree() and Action.AuraIsValid(unit, "UseDispel", "Magic") and not Unit(unit):InLOS() then
        return A.SingeMagic:Show(icon)
    end
end 

A[6] = function(icon)
    return ArenaRotation(icon, "arena1")
end

A[7] = function(icon)
    local Party = PartyRotation("party1") 
    if Party then 
        return Party:Show(icon)
    end 
    return ArenaRotation(icon, "arena2")
end

A[8] = function(icon)
    local Party = PartyRotation("party2") 
    if Party then 
        return Party:Show(icon)
    end     
    return ArenaRotation(icon, "arena3")
end]]--
