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
    ElementalBlast                         = Action.Create({ Type = "Spell", ID = 117014 }),
    LavaBurst                              = Action.Create({ Type = "Spell", ID = 51505 }),
    FlameShock                             = Action.Create({ Type = "Spell", ID = 188389 }),
    FlameShockDebuff                       = Action.Create({ Type = "Spell", ID = 188389 }),
    StormElemental                         = Action.Create({ Type = "Spell", ID = 192249 }),
    FireElemental                          = Action.Create({ Type = "Spell", ID = 198067 }),
    WindGustBuff                           = Action.Create({ Type = "Spell", ID = 263806 }),
    Ascendance                             = Action.Create({ Type = "Spell", ID = 114050 }),
    Icefury                                = Action.Create({ Type = "Spell", ID = 210714 }),
    IcefuryBuff                            = Action.Create({ Type = "Spell", ID = 210714 }),
    LiquidMagmaTotem                       = Action.Create({ Type = "Spell", ID = 192222 }),
    Earthquake                             = Action.Create({ Type = "Spell", ID = 61882 }),
    MasteroftheElements                    = Action.Create({ Type = "Spell", ID = 16166 }),
    MasteroftheElementsBuff                = Action.Create({ Type = "Spell", ID = 260734 }),
    PrimalElementalist                     = Action.Create({ Type = "Spell", ID =  }),
    ChainLightning                         = Action.Create({ Type = "Spell", ID = 188443 }),
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
    ReapingFlames                          = Action.Create({ Type = "Spell", ID =  }),
    ResonanceTotemBuff                     = Action.Create({ Type = "Spell", ID = 202192 }),
    TectonicThunder                        = Action.Create({ Type = "Spell", ID = 286949 }),
    LightningLasso                         = Action.Create({ Type = "Spell", ID =  }),
    TectonicThunderBuff                    = Action.Create({ Type = "Spell", ID = 286949 }),
    WindShear                              = Action.Create({ Type = "Spell", ID = 57994 }),
    UnlimitedPower                         = Action.Create({ Type = "Spell", ID =  }),
    BloodFury                              = Action.Create({ Type = "Spell", ID = 20572 }),
    Berserking                             = Action.Create({ Type = "Spell", ID = 26297 }),
    Fireblood                              = Action.Create({ Type = "Spell", ID = 265221 }),
    AncestralCall                          = Action.Create({ Type = "Spell", ID = 274738 }),
    BagofTricks                            = Action.Create({ Type = "Spell", ID =  })
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
    BloodoftheEnemy                        = Action.Create({ Type = "HeartOfAzeroth", ID = 297108, Hidden = true}),
    BloodoftheEnemy2                       = Action.Create({ Type = "HeartOfAzeroth", ID = 298273, Hidden = true}),
    BloodoftheEnemy3                       = Action.Create({ Type = "HeartOfAzeroth", ID = 298277, Hidden = true}),
    ConcentratedFlame                      = Action.Create({ Type = "HeartOfAzeroth", ID = 295373, Hidden = true}),
    ConcentratedFlame2                     = Action.Create({ Type = "HeartOfAzeroth", ID = 299349, Hidden = true}),
    ConcentratedFlame3                     = Action.Create({ Type = "HeartOfAzeroth", ID = 299353, Hidden = true}),
    GuardianofAzeroth                      = Action.Create({ Type = "HeartOfAzeroth", ID = 295840, Hidden = true}),
    GuardianofAzeroth2                     = Action.Create({ Type = "HeartOfAzeroth", ID = 299355, Hidden = true}),
    GuardianofAzeroth3                     = Action.Create({ Type = "HeartOfAzeroth", ID = 299358, Hidden = true}),
    FocusedAzeriteBeam                     = Action.Create({ Type = "HeartOfAzeroth", ID = 295258, Hidden = true}),
    FocusedAzeriteBeam2                    = Action.Create({ Type = "HeartOfAzeroth", ID = 299336, Hidden = true}),
    FocusedAzeriteBeam3                    = Action.Create({ Type = "HeartOfAzeroth", ID = 299338, Hidden = true}),
    PurifyingBlast                         = Action.Create({ Type = "HeartOfAzeroth", ID = 295337, Hidden = true}),
    PurifyingBlast2                        = Action.Create({ Type = "HeartOfAzeroth", ID = 299345, Hidden = true}),
    PurifyingBlast3                        = Action.Create({ Type = "HeartOfAzeroth", ID = 299347, Hidden = true}),
    TheUnboundForce                        = Action.Create({ Type = "HeartOfAzeroth", ID = 298452, Hidden = true}),
    TheUnboundForce2                       = Action.Create({ Type = "HeartOfAzeroth", ID = 299376, Hidden = true}),
    TheUnboundForce3                       = Action.Create({ Type = "HeartOfAzeroth", ID = 299378, Hidden = true}),
    RippleInSpace                          = Action.Create({ Type = "HeartOfAzeroth", ID = 302731, Hidden = true}),
    RippleInSpace2                         = Action.Create({ Type = "HeartOfAzeroth", ID = 302982, Hidden = true}),
    RippleInSpace3                         = Action.Create({ Type = "HeartOfAzeroth", ID = 302983, Hidden = true}),
    WorldveinResonance                     = Action.Create({ Type = "HeartOfAzeroth", ID = 295186, Hidden = true}),
    WorldveinResonance2                    = Action.Create({ Type = "HeartOfAzeroth", ID = 298628, Hidden = true}),
    WorldveinResonance3                    = Action.Create({ Type = "HeartOfAzeroth", ID = 299334, Hidden = true}),
    MemoryofLucidDreams                    = Action.Create({ Type = "HeartOfAzeroth", ID = 298357, Hidden = true}),
    MemoryofLucidDreams2                   = Action.Create({ Type = "HeartOfAzeroth", ID = 299372, Hidden = true}),
    MemoryofLucidDreams3                   = Action.Create({ Type = "HeartOfAzeroth", ID = 299374, Hidden = true}), 
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


local function EvaluateCycleFlameShock39(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true) and (MultiUnits:GetByRangeInCombat(40, 5, 10) < (5 - num(not A.TotemMastery:IsSpellLearned())) or not A.StormElemental:IsSpellLearned() and (A.FireElemental:GetCooldown() > (A.StormElemental:BaseDuration() - 30 + 14 * Player:SpellHaste()) or A.FireElemental:GetCooldown() < (24 - 14 * Player:SpellHaste()))) and (not A.StormElemental:IsSpellLearned() or A.StormElemental:GetCooldown() < (A.StormElemental:BaseDuration() - 30) or MultiUnits:GetByRangeInCombat(40, 5, 10) == 3 and Unit("player"):HasBuffsStacks(A.WindGustBuff.ID, true) < 14)
end

local function EvaluateCycleFlameShock156(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true)
end

local function EvaluateCycleFlameShock171(unit)
    return (not Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) or Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) <= A.GetGCD() or A.Ascendance:IsSpellLearned() and Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) < (A.Ascendance:GetCooldown() + A.AscendanceBuff.ID, true:BaseDuration()) and A.Ascendance:GetCooldown() < 4 and (not A.StormElemental:IsSpellLearned() or A.StormElemental:IsSpellLearned() and A.StormElemental:GetCooldown() < 120)) and (Unit("player"):HasBuffsStacks(A.WindGustBuff.ID, true) < 14 or A.IgneousPotential:GetAzeriteRank() >= 2 or Unit("player"):HasBuffs(A.LavaSurgeBuff.ID, true) or not Unit("player"):HasHeroism) and not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)
end

local function EvaluateCycleFlameShock406(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true) and MultiUnits:GetByRangeInCombat(40, 5, 10) > 1 and Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)
end

local function EvaluateCycleFlameShock557(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true) and not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)
end

local function EvaluateCycleFlameShock603(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true)
end

local function EvaluateCycleFlameShock620(unit)
    return (not Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) or Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) <= A.GetGCD() or A.Ascendance:IsSpellLearned() and Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) < (A.Ascendance:GetCooldown() + A.AscendanceBuff.ID, true:BaseDuration()) and A.Ascendance:GetCooldown() < 4 and (not A.StormElemental:IsSpellLearned() or A.StormElemental:IsSpellLearned() and A.StormElemental:GetCooldown() < 120)) and (Unit("player"):HasBuffsStacks(A.WindGustBuff.ID, true) < 14 or A.IgneousPotential:GetAzeriteRank() >= 2 or Unit("player"):HasBuffs(A.LavaSurgeBuff.ID, true) or not Unit("player"):HasHeroism) and not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)
end

local function EvaluateCycleFlameShock887(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true) and MultiUnits:GetByRangeInCombat(40, 5, 10) > 1 and Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)
end

local function EvaluateCycleFlameShock1038(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true) and not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true)
end

local function EvaluateCycleFlameShock1090(unit)
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

    ------------------------------------------------------
    ---------------- ENEMY UNIT ROTATION -----------------
    ------------------------------------------------------
    local function EnemyRotation(unit)
        local Precombat, Aoe, Funnel, SingleUnit(unit)
        --Precombat
        local function Precombat(unit)
            -- flask
            -- food
            -- augmentation
            -- snapshot_stats
            -- totem_mastery
            if A.TotemMastery:IsReady(unit) then
                return A.TotemMastery:Show(icon)
            end
            -- earth_elemental,if=!talent.primal_elementalist.enabled
            -- use_item,name=azsharas_font_of_power
            if A.AzsharasFontofPower:IsReady(unit) then
                A.AzsharasFontofPower:Show(icon)
            end
            -- stormkeeper,if=talent.stormkeeper.enabled&(raid_event.adds.count<3|raid_event.adds.in>50)
            if A.Stormkeeper:IsReady(unit) and Unit("player"):HasBuffsDown(A.StormkeeperBuff.ID, true) and (A.Stormkeeper:IsSpellLearned() and ((MultiUnits:GetByRangeInCombat(40, 5, 10) - 1) < 3 or 10000000000 > 50)) then
                return A.Stormkeeper:Show(icon)
            end
            -- potion
            if A.BattlePotionofIntellect:IsReady(unit) and Action.GetToggle(1, "Potion") then
                A.BattlePotionofIntellect:Show(icon)
            end
            -- elemental_blast,if=talent.elemental_blast.enabled
            if A.ElementalBlast:IsReady(unit) and (A.ElementalBlast:IsSpellLearned()) then
                return A.ElementalBlast:Show(icon)
            end
            -- lava_burst,if=!talent.elemental_blast.enabled
            if A.LavaBurst:IsReady(unit) and (not A.ElementalBlast:IsSpellLearned()) then
                return A.LavaBurst:Show(icon)
            end
        end
        
        --Aoe
        local function Aoe(unit)
            -- stormkeeper,if=talent.stormkeeper.enabled
            if A.Stormkeeper:IsReady(unit) and (A.Stormkeeper:IsSpellLearned()) then
                return A.Stormkeeper:Show(icon)
            end
            -- flame_shock,target_if=refreshable&(spell_targets.chain_lightning<(5-!talent.totem_mastery.enabled)|!talent.storm_elemental.enabled&(cooldown.fire_elemental.remains>(cooldown.storm_elemental.duration-30+14*spell_haste)|cooldown.fire_elemental.remains<(24-14*spell_haste)))&(!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<(cooldown.storm_elemental.duration-30)|spell_targets.chain_lightning=3&buff.wind_gust.stack<14)
            if A.FlameShock:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock39) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- ascendance,if=talent.ascendance.enabled&(talent.storm_elemental.enabled&cooldown.storm_elemental.remains<(cooldown.storm_elemental.duration-30)&cooldown.storm_elemental.remains>15|!talent.storm_elemental.enabled)&(!talent.icefury.enabled|!buff.icefury.up&!cooldown.icefury.up)
            if A.Ascendance:IsReady(unit) and A.BurstIsON(unit) and (A.Ascendance:IsSpellLearned() and (A.StormElemental:IsSpellLearned() and A.StormElemental:GetCooldown() < (A.StormElemental:BaseDuration() - 30) and A.StormElemental:GetCooldown() > 15 or not A.StormElemental:IsSpellLearned()) and (not A.Icefury:IsSpellLearned() or not Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and not A.Icefury:GetCooldown() == 0)) then
                return A.Ascendance:Show(icon)
            end
            -- liquid_magma_totem,if=talent.liquid_magma_totem.enabled
            if A.LiquidMagmaTotem:IsReady(unit) and (A.LiquidMagmaTotem:IsSpellLearned()) then
                return A.LiquidMagmaTotem:Show(icon)
            end
            -- earthquake,if=!talent.master_of_the_elements.enabled|buff.stormkeeper.up|maelstrom>=(100-4*spell_targets.chain_lightning)|buff.master_of_the_elements.up|spell_targets.chain_lightning>3
            if A.Earthquake:IsReady(unit) and (not A.MasteroftheElements:IsSpellLearned() or Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) or Player:Maelstrom() >= (100 - 4 * MultiUnits:GetByRangeInCombat(40, 5, 10)) or Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) or MultiUnits:GetByRangeInCombat(40, 5, 10) > 3) then
                return A.Earthquake:Show(icon)
            end
            -- blood_of_the_enemy,if=!talent.primal_elementalist.enabled|!talent.storm_elemental.enabled
            if A.BloodoftheEnemy:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") and (not A.PrimalElementalist:IsSpellLearned() or not A.StormElemental:IsSpellLearned()) then
                return A.BloodoftheEnemy:Show(icon)
            end
            -- chain_lightning,if=buff.stormkeeper.remains<3*gcd*buff.stormkeeper.stack
            if A.ChainLightning:IsReady(unit) and (Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) < 3 * A.GetGCD() * Unit("player"):HasBuffsStacks(A.StormkeeperBuff.ID, true)) then
                return A.ChainLightning:Show(icon)
            end
            -- lava_burst,if=buff.lava_surge.up&spell_targets.chain_lightning<4&(!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<(cooldown.storm_elemental.duration-30))&dot.flame_shock.ticking
            if A.LavaBurst:IsReady(unit) and (Unit("player"):HasBuffs(A.LavaSurgeBuff.ID, true) and MultiUnits:GetByRangeInCombat(40, 5, 10) < 4 and (not A.StormElemental:IsSpellLearned() or A.StormElemental:GetCooldown() < (A.StormElemental:BaseDuration() - 30)) and Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true)) then
                return A.LavaBurst:Show(icon)
            end
            -- icefury,if=spell_targets.chain_lightning<4&!buff.ascendance.up
            if A.Icefury:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) < 4 and not Unit("player"):HasBuffs(A.AscendanceBuff.ID, true)) then
                return A.Icefury:Show(icon)
            end
            -- frost_shock,if=spell_targets.chain_lightning<4&buff.icefury.up&!buff.ascendance.up
            if A.FrostShock:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) < 4 and Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and not Unit("player"):HasBuffs(A.AscendanceBuff.ID, true)) then
                return A.FrostShock:Show(icon)
            end
            -- elemental_blast,if=talent.elemental_blast.enabled&spell_targets.chain_lightning<4&(!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<(cooldown.storm_elemental.duration-30))
            if A.ElementalBlast:IsReady(unit) and (A.ElementalBlast:IsSpellLearned() and MultiUnits:GetByRangeInCombat(40, 5, 10) < 4 and (not A.StormElemental:IsSpellLearned() or A.StormElemental:GetCooldown() < (A.StormElemental:BaseDuration() - 30))) then
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
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock156) then
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
            -- flame_shock,target_if=(!ticking|dot.flame_shock.remains<=gcd|talent.ascendance.enabled&dot.flame_shock.remains<(cooldown.ascendance.remains+buff.ascendance.duration)&cooldown.ascendance.remains<4&(!talent.storm_elemental.enabled|talent.storm_elemental.enabled&cooldown.storm_elemental.remains<120))&(buff.wind_gust.stack<14|azerite.igneous_potential.rank>=2|buff.lava_surge.up|!buff.bloodlust.up)&!buff.surge_of_power.up
            if A.FlameShock:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock171) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- blood_of_the_enemy,if=!talent.ascendance.enabled&(!talent.storm_elemental.enabled|!talent.primal_elementalist.enabled)|talent.ascendance.enabled&(time>=60|buff.bloodlust.up)&cooldown.lava_burst.remains>0&(cooldown.storm_elemental.remains<(cooldown.storm_elemental.duration-30)|!talent.storm_elemental.enabled)&(!talent.icefury.enabled|!buff.icefury.up&!cooldown.icefury.up)
            if A.BloodoftheEnemy:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") and (not A.Ascendance:IsSpellLearned() and (not A.StormElemental:IsSpellLearned() or not A.PrimalElementalist:IsSpellLearned()) or A.Ascendance:IsSpellLearned() and (Unit("player"):CombatTime() >= 60 or Unit("player"):HasHeroism) and A.LavaBurst:GetCooldown() > 0 and (A.StormElemental:GetCooldown() < (A.StormElemental:BaseDuration() - 30) or not A.StormElemental:IsSpellLearned()) and (not A.Icefury:IsSpellLearned() or not Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and not A.Icefury:GetCooldown() == 0)) then
                return A.BloodoftheEnemy:Show(icon)
            end
            -- ascendance,if=talent.ascendance.enabled&(time>=60|buff.bloodlust.up)&cooldown.lava_burst.remains>0&(cooldown.storm_elemental.remains<(cooldown.storm_elemental.duration-30)|!talent.storm_elemental.enabled)&(!talent.icefury.enabled|!buff.icefury.up&!cooldown.icefury.up)
            if A.Ascendance:IsReady(unit) and A.BurstIsON(unit) and (A.Ascendance:IsSpellLearned() and (Unit("player"):CombatTime() >= 60 or Unit("player"):HasHeroism) and A.LavaBurst:GetCooldown() > 0 and (A.StormElemental:GetCooldown() < (A.StormElemental:BaseDuration() - 30) or not A.StormElemental:IsSpellLearned()) and (not A.Icefury:IsSpellLearned() or not Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and not A.Icefury:GetCooldown() == 0)) then
                return A.Ascendance:Show(icon)
            end
            -- elemental_blast,if=talent.elemental_blast.enabled&(talent.master_of_the_elements.enabled&buff.master_of_the_elements.up&maelstrom<60|!talent.master_of_the_elements.enabled)&(!(cooldown.storm_elemental.remains>(cooldown.storm_elemental.duration-30)&talent.storm_elemental.enabled)|azerite.natural_harmony.rank=3&buff.wind_gust.stack<14)
            if A.ElementalBlast:IsReady(unit) and (A.ElementalBlast:IsSpellLearned() and (A.MasteroftheElements:IsSpellLearned() and Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) and Player:Maelstrom() < 60 or not A.MasteroftheElements:IsSpellLearned()) and (not (A.StormElemental:GetCooldown() > (A.StormElemental:BaseDuration() - 30) and A.StormElemental:IsSpellLearned()) or A.NaturalHarmony:GetAzeriteRank() == 3 and Unit("player"):HasBuffsStacks(A.WindGustBuff.ID, true) < 14)) then
                return A.ElementalBlast:Show(icon)
            end
            -- stormkeeper,if=talent.stormkeeper.enabled&(raid_event.adds.count<3|raid_event.adds.in>50)&(!talent.surge_of_power.enabled|buff.surge_of_power.up|maelstrom>=44)
            if A.Stormkeeper:IsReady(unit) and (A.Stormkeeper:IsSpellLearned() and ((MultiUnits:GetByRangeInCombat(40, 5, 10) - 1) < 3 or 10000000000 > 50) and (not A.SurgeofPower:IsSpellLearned() or Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) or Player:Maelstrom() >= 44)) then
                return A.Stormkeeper:Show(icon)
            end
            -- liquid_magma_totem,if=talent.liquid_magma_totem.enabled&(raid_event.adds.count<3|raid_event.adds.in>50)
            if A.LiquidMagmaTotem:IsReady(unit) and (A.LiquidMagmaTotem:IsSpellLearned() and ((MultiUnits:GetByRangeInCombat(40, 5, 10) - 1) < 3 or 10000000000 > 50)) then
                return A.LiquidMagmaTotem:Show(icon)
            end
            -- lightning_bolt,if=buff.stormkeeper.up&spell_targets.chain_lightning<6&(azerite.lava_shock.rank*buff.lava_shock.stack)<36&(buff.master_of_the_elements.up&!talent.surge_of_power.enabled|buff.surge_of_power.up)
            if A.LightningBolt:IsReady(unit) and (Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) and MultiUnits:GetByRangeInCombat(40, 5, 10) < 6 and (A.LavaShock:GetAzeriteRank() * Unit("player"):HasBuffsStacks(A.LavaShockBuff.ID, true)) < 36 and (Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) and not A.SurgeofPower:IsSpellLearned() or Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true))) then
                return A.LightningBolt:Show(icon)
            end
            -- earth_shock,if=!buff.surge_of_power.up&talent.master_of_the_elements.enabled&(buff.master_of_the_elements.up|cooldown.lava_burst.remains>0&maelstrom>=92+30*talent.call_the_thunder.enabled|(azerite.lava_shock.rank*buff.lava_shock.stack<36)&buff.stormkeeper.up&cooldown.lava_burst.remains<=gcd)
            if A.EarthShock:IsReady(unit) and (not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and A.MasteroftheElements:IsSpellLearned() and (Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) or A.LavaBurst:GetCooldown() > 0 and Player:Maelstrom() >= 92 + 30 * num(A.CalltheThunder:IsSpellLearned()) or (A.LavaShock:GetAzeriteRank() * Unit("player"):HasBuffsStacks(A.LavaShockBuff.ID, true) < 36) and Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) and A.LavaBurst:GetCooldown() <= A.GetGCD())) then
                return A.EarthShock:Show(icon)
            end
            -- earth_shock,if=!talent.master_of_the_elements.enabled&!(azerite.igneous_potential.rank>2&buff.ascendance.up)&(buff.stormkeeper.up|maelstrom>=90+30*talent.call_the_thunder.enabled|!(cooldown.storm_elemental.remains>(cooldown.storm_elemental.duration-30)&talent.storm_elemental.enabled)&expected_combat_length-time-cooldown.storm_elemental.remains-cooldown.storm_elemental.duration*floor((expected_combat_length-time-cooldown.storm_elemental.remains)%cooldown.storm_elemental.duration)>=30*(1+(azerite.echo_of_the_elementals.rank>=2)))
            if A.EarthShock:IsReady(unit) and (not A.MasteroftheElements:IsSpellLearned() and not (A.IgneousPotential:GetAzeriteRank() > 2 and Unit("player"):HasBuffs(A.AscendanceBuff.ID, true)) and (Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) or Player:Maelstrom() >= 90 + 30 * num(A.CalltheThunder:IsSpellLearned()) or not (A.StormElemental:GetCooldown() > (A.StormElemental:BaseDuration() - 30) and A.StormElemental:IsSpellLearned()) and expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown() - A.StormElemental:BaseDuration() * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown()) / A.StormElemental:BaseDuration()) >= 30 * (1 + num((A.EchooftheElementals:GetAzeriteRank() >= 2))))) then
                return A.EarthShock:Show(icon)
            end
            -- earth_shock,if=talent.surge_of_power.enabled&!buff.surge_of_power.up&cooldown.lava_burst.remains<=gcd&(!talent.storm_elemental.enabled&!(cooldown.fire_elemental.remains>(cooldown.storm_elemental.duration-30))|talent.storm_elemental.enabled&!(cooldown.storm_elemental.remains>(cooldown.storm_elemental.duration-30)))
            if A.EarthShock:IsReady(unit) and (A.SurgeofPower:IsSpellLearned() and not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and A.LavaBurst:GetCooldown() <= A.GetGCD() and (not A.StormElemental:IsSpellLearned() and not (A.FireElemental:GetCooldown() > (A.StormElemental:BaseDuration() - 30)) or A.StormElemental:IsSpellLearned() and not (A.StormElemental:GetCooldown() > (A.StormElemental:BaseDuration() - 30)))) then
                return A.EarthShock:Show(icon)
            end
            -- lightning_bolt,if=cooldown.storm_elemental.remains>(cooldown.storm_elemental.duration-30)&talent.storm_elemental.enabled&(azerite.igneous_potential.rank<2|!buff.lava_surge.up&buff.bloodlust.up)
            if A.LightningBolt:IsReady(unit) and (A.StormElemental:GetCooldown() > (A.StormElemental:BaseDuration() - 30) and A.StormElemental:IsSpellLearned() and (A.IgneousPotential:GetAzeriteRank() < 2 or not Unit("player"):HasBuffs(A.LavaSurgeBuff.ID, true) and Unit("player"):HasHeroism)) then
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
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock406) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- lava_burst,if=talent.storm_elemental.enabled&cooldown_react&buff.surge_of_power.up&(expected_combat_length-time-cooldown.storm_elemental.remains-(cooldown.storm_elemental.duration-30)*floor((expected_combat_length-time-cooldown.storm_elemental.remains)%(cooldown.storm_elemental.duration-30))<30*(1+(azerite.echo_of_the_elementals.rank>=2))|(1.16*(expected_combat_length-time)-cooldown.storm_elemental.remains-cooldown.storm_elemental.duration*floor((1.16*(expected_combat_length-time)-cooldown.storm_elemental.remains)%cooldown.storm_elemental.duration))<(expected_combat_length-time-cooldown.storm_elemental.remains-cooldown.storm_elemental.duration*floor((expected_combat_length-time-cooldown.storm_elemental.remains)%cooldown.storm_elemental.duration)))
            if A.LavaBurst:IsReady(unit) and (A.StormElemental:IsSpellLearned() and A.LavaBurst:GetCooldown() == 0 and Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and (expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown() - (A.StormElemental:BaseDuration() - 30) * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown()) / (A.StormElemental:BaseDuration() - 30)) < 30 * (1 + num((A.EchooftheElementals:GetAzeriteRank() >= 2))) or (1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.StormElemental:GetCooldown() - A.StormElemental:BaseDuration() * math.floor ((1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.StormElemental:GetCooldown()) / A.StormElemental:BaseDuration())) < (expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown() - A.StormElemental:BaseDuration() * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown()) / A.StormElemental:BaseDuration())))) then
                return A.LavaBurst:Show(icon)
            end
            -- lava_burst,if=!talent.storm_elemental.enabled&cooldown_react&buff.surge_of_power.up&(expected_combat_length-time-cooldown.fire_elemental.remains-cooldown.fire_elemental.duration*floor((expected_combat_length-time-cooldown.fire_elemental.remains)%cooldown.fire_elemental.duration)<30*(1+(azerite.echo_of_the_elementals.rank>=2))|(1.16*(expected_combat_length-time)-cooldown.fire_elemental.remains-cooldown.fire_elemental.duration*floor((1.16*(expected_combat_length-time)-cooldown.fire_elemental.remains)%cooldown.fire_elemental.duration))<(expected_combat_length-time-cooldown.fire_elemental.remains-cooldown.fire_elemental.duration*floor((expected_combat_length-time-cooldown.fire_elemental.remains)%cooldown.fire_elemental.duration)))
            if A.LavaBurst:IsReady(unit) and (not A.StormElemental:IsSpellLearned() and A.LavaBurst:GetCooldown() == 0 and Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and (expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown() - A.FireElemental:BaseDuration() * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown()) / A.FireElemental:BaseDuration()) < 30 * (1 + num((A.EchooftheElementals:GetAzeriteRank() >= 2))) or (1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.FireElemental:GetCooldown() - A.FireElemental:BaseDuration() * math.floor ((1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.FireElemental:GetCooldown()) / A.FireElemental:BaseDuration())) < (expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown() - A.FireElemental:BaseDuration() * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown()) / A.FireElemental:BaseDuration())))) then
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
            -- icefury,if=talent.icefury.enabled&!(maelstrom>75&cooldown.lava_burst.remains<=0)&(!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<cooldown.storm_elemental.duration)
            if A.Icefury:IsReady(unit) and (A.Icefury:IsSpellLearned() and not (Player:Maelstrom() > 75 and A.LavaBurst:GetCooldown() <= 0) and (not A.StormElemental:IsSpellLearned() or A.StormElemental:GetCooldown() < A.StormElemental:BaseDuration())) then
                return A.Icefury:Show(icon)
            end
            -- lava_burst,if=cooldown_react&charges>talent.echo_of_the_elements.enabled
            if A.LavaBurst:IsReady(unit) and (A.LavaBurst:GetCooldown() == 0 and A.LavaBurst:ChargesP() > num(A.EchooftheElements:IsSpellLearned())) then
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
            -- concentrated_flame
            if A.ConcentratedFlame:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") then
                return A.ConcentratedFlame:Show(icon)
            end
            -- reaping_flames
            if A.ReapingFlames:IsReady(unit) then
                return A.ReapingFlames:Show(icon)
            end
            -- flame_shock,target_if=refreshable&!buff.surge_of_power.up
            if A.FlameShock:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock557) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- totem_mastery,if=talent.totem_mastery.enabled&(buff.resonance_totem.remains<6|(buff.resonance_totem.remains<(buff.ascendance.duration+cooldown.ascendance.remains)&cooldown.ascendance.remains<15))
            if A.TotemMastery:IsReady(unit) and (A.TotemMastery:IsSpellLearned() and (Unit("player"):HasBuffs(A.ResonanceTotemBuff.ID, true) < 6 or (Unit("player"):HasBuffs(A.ResonanceTotemBuff.ID, true) < (A.AscendanceBuff.ID, true:BaseDuration() + A.Ascendance:GetCooldown()) and A.Ascendance:GetCooldown() < 15))) then
                return A.TotemMastery:Show(icon)
            end
            -- frost_shock,if=talent.icefury.enabled&buff.icefury.up&(buff.icefury.remains<gcd*4*buff.icefury.stack|buff.stormkeeper.up|!talent.master_of_the_elements.enabled)
            if A.FrostShock:IsReady(unit) and (A.Icefury:IsSpellLearned() and Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and (Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) < A.GetGCD() * 4 * Unit("player"):HasBuffsStacks(A.IcefuryBuff.ID, true) or Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) or not A.MasteroftheElements:IsSpellLearned())) then
                return A.FrostShock:Show(icon)
            end
            -- earth_elemental,if=!talent.primal_elementalist.enabled|talent.primal_elementalist.enabled&(cooldown.fire_elemental.remains<(cooldown.fire_elemental.duration-30)&!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<(cooldown.storm_elemental.duration-30)&talent.storm_elemental.enabled)
            -- lightning_bolt
            if A.LightningBolt:IsReady(unit) then
                return A.LightningBolt:Show(icon)
            end
            -- flame_shock,moving=1,target_if=refreshable
            if A.FlameShock:IsReady(unit) and isMoving then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock603) then
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
        
        --SingleUnit(unit)
        local function SingleUnit(unit)(unit)
            -- flame_shock,target_if=(!ticking|dot.flame_shock.remains<=gcd|talent.ascendance.enabled&dot.flame_shock.remains<(cooldown.ascendance.remains+buff.ascendance.duration)&cooldown.ascendance.remains<4&(!talent.storm_elemental.enabled|talent.storm_elemental.enabled&cooldown.storm_elemental.remains<120))&(buff.wind_gust.stack<14|azerite.igneous_potential.rank>=2|buff.lava_surge.up|!buff.bloodlust.up)&!buff.surge_of_power.up
            if A.FlameShock:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock620) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- blood_of_the_enemy,if=!talent.ascendance.enabled&!talent.storm_elemental.enabled|talent.ascendance.enabled&(time>=60|buff.bloodlust.up)&cooldown.lava_burst.remains>0&(cooldown.storm_elemental.remains<(cooldown.storm_elemental.duration-30)|!talent.storm_elemental.enabled)&(!talent.icefury.enabled|!buff.icefury.up&!cooldown.icefury.up)
            if A.BloodoftheEnemy:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") and (not A.Ascendance:IsSpellLearned() and not A.StormElemental:IsSpellLearned() or A.Ascendance:IsSpellLearned() and (Unit("player"):CombatTime() >= 60 or Unit("player"):HasHeroism) and A.LavaBurst:GetCooldown() > 0 and (A.StormElemental:GetCooldown() < (A.StormElemental:BaseDuration() - 30) or not A.StormElemental:IsSpellLearned()) and (not A.Icefury:IsSpellLearned() or not Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and not A.Icefury:GetCooldown() == 0)) then
                return A.BloodoftheEnemy:Show(icon)
            end
            -- ascendance,if=talent.ascendance.enabled&(time>=60|buff.bloodlust.up)&cooldown.lava_burst.remains>0&(cooldown.storm_elemental.remains<(cooldown.storm_elemental.duration-30)|!talent.storm_elemental.enabled)&(!talent.icefury.enabled|!buff.icefury.up&!cooldown.icefury.up)
            if A.Ascendance:IsReady(unit) and A.BurstIsON(unit) and (A.Ascendance:IsSpellLearned() and (Unit("player"):CombatTime() >= 60 or Unit("player"):HasHeroism) and A.LavaBurst:GetCooldown() > 0 and (A.StormElemental:GetCooldown() < (A.StormElemental:BaseDuration() - 30) or not A.StormElemental:IsSpellLearned()) and (not A.Icefury:IsSpellLearned() or not Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and not A.Icefury:GetCooldown() == 0)) then
                return A.Ascendance:Show(icon)
            end
            -- elemental_blast,if=talent.elemental_blast.enabled&(talent.master_of_the_elements.enabled&(buff.master_of_the_elements.up&maelstrom<60|!buff.master_of_the_elements.up)|!talent.master_of_the_elements.enabled)&(!(cooldown.storm_elemental.remains>(cooldown.storm_elemental.duration-30)&talent.storm_elemental.enabled)|azerite.natural_harmony.rank=3&buff.wind_gust.stack<14)
            if A.ElementalBlast:IsReady(unit) and (A.ElementalBlast:IsSpellLearned() and (A.MasteroftheElements:IsSpellLearned() and (Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) and Player:Maelstrom() < 60 or not Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true)) or not A.MasteroftheElements:IsSpellLearned()) and (not (A.StormElemental:GetCooldown() > (A.StormElemental:BaseDuration() - 30) and A.StormElemental:IsSpellLearned()) or A.NaturalHarmony:GetAzeriteRank() == 3 and Unit("player"):HasBuffsStacks(A.WindGustBuff.ID, true) < 14)) then
                return A.ElementalBlast:Show(icon)
            end
            -- stormkeeper,if=talent.stormkeeper.enabled&(raid_event.adds.count<3|raid_event.adds.in>50)&(!talent.surge_of_power.enabled|buff.surge_of_power.up|maelstrom>=44)
            if A.Stormkeeper:IsReady(unit) and (A.Stormkeeper:IsSpellLearned() and ((MultiUnits:GetByRangeInCombat(40, 5, 10) - 1) < 3 or 10000000000 > 50) and (not A.SurgeofPower:IsSpellLearned() or Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) or Player:Maelstrom() >= 44)) then
                return A.Stormkeeper:Show(icon)
            end
            -- liquid_magma_totem,if=talent.liquid_magma_totem.enabled&(raid_event.adds.count<3|raid_event.adds.in>50)
            if A.LiquidMagmaTotem:IsReady(unit) and (A.LiquidMagmaTotem:IsSpellLearned() and ((MultiUnits:GetByRangeInCombat(40, 5, 10) - 1) < 3 or 10000000000 > 50)) then
                return A.LiquidMagmaTotem:Show(icon)
            end
            -- lightning_bolt,if=buff.stormkeeper.up&spell_targets.chain_lightning<2&(azerite.lava_shock.rank*buff.lava_shock.stack)<26&(buff.master_of_the_elements.up&!talent.surge_of_power.enabled|buff.surge_of_power.up)
            if A.LightningBolt:IsReady(unit) and (Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) and MultiUnits:GetByRangeInCombat(40, 5, 10) < 2 and (A.LavaShock:GetAzeriteRank() * Unit("player"):HasBuffsStacks(A.LavaShockBuff.ID, true)) < 26 and (Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) and not A.SurgeofPower:IsSpellLearned() or Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true))) then
                return A.LightningBolt:Show(icon)
            end
            -- earthquake,if=(spell_targets.chain_lightning>1|azerite.tectonic_thunder.rank>=3&!talent.surge_of_power.enabled&azerite.lava_shock.rank<1)&azerite.lava_shock.rank*buff.lava_shock.stack<(36+3*azerite.tectonic_thunder.rank*spell_targets.chain_lightning)&(!talent.surge_of_power.enabled|!dot.flame_shock.refreshable|cooldown.storm_elemental.remains>(cooldown.storm_elemental.duration-30))&(!talent.master_of_the_elements.enabled|buff.master_of_the_elements.up|cooldown.lava_burst.remains>0&maelstrom>=92+30*talent.call_the_thunder.enabled)
            if A.Earthquake:IsReady(unit) and ((MultiUnits:GetByRangeInCombat(40, 5, 10) > 1 or A.TectonicThunder:GetAzeriteRank() >= 3 and not A.SurgeofPower:IsSpellLearned() and A.LavaShock:GetAzeriteRank() < 1) and A.LavaShock:GetAzeriteRank() * Unit("player"):HasBuffsStacks(A.LavaShockBuff.ID, true) < (36 + 3 * A.TectonicThunder:GetAzeriteRank() * MultiUnits:GetByRangeInCombat(40, 5, 10)) and (not A.SurgeofPower:IsSpellLearned() or not Unit(unit):HasDeBuffsRefreshable(A.FlameShockDebuff.ID, true) or A.StormElemental:GetCooldown() > (A.StormElemental:BaseDuration() - 30)) and (not A.MasteroftheElements:IsSpellLearned() or Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) or A.LavaBurst:GetCooldown() > 0 and Player:Maelstrom() >= 92 + 30 * num(A.CalltheThunder:IsSpellLearned()))) then
                return A.Earthquake:Show(icon)
            end
            -- earth_shock,if=!buff.surge_of_power.up&talent.master_of_the_elements.enabled&(buff.master_of_the_elements.up|cooldown.lava_burst.remains>0&maelstrom>=92+30*talent.call_the_thunder.enabled|spell_targets.chain_lightning<2&(azerite.lava_shock.rank*buff.lava_shock.stack<26)&buff.stormkeeper.up&cooldown.lava_burst.remains<=gcd)
            if A.EarthShock:IsReady(unit) and (not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and A.MasteroftheElements:IsSpellLearned() and (Unit("player"):HasBuffs(A.MasteroftheElementsBuff.ID, true) or A.LavaBurst:GetCooldown() > 0 and Player:Maelstrom() >= 92 + 30 * num(A.CalltheThunder:IsSpellLearned()) or MultiUnits:GetByRangeInCombat(40, 5, 10) < 2 and (A.LavaShock:GetAzeriteRank() * Unit("player"):HasBuffsStacks(A.LavaShockBuff.ID, true) < 26) and Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) and A.LavaBurst:GetCooldown() <= A.GetGCD())) then
                return A.EarthShock:Show(icon)
            end
            -- earth_shock,if=!talent.master_of_the_elements.enabled&!(azerite.igneous_potential.rank>2&buff.ascendance.up)&(buff.stormkeeper.up|maelstrom>=90+30*talent.call_the_thunder.enabled|!(cooldown.storm_elemental.remains>cooldown.storm_elemental.duration&talent.storm_elemental.enabled)&expected_combat_length-time-cooldown.storm_elemental.remains-cooldown.storm_elemental.duration*floor((expected_combat_length-time-cooldown.storm_elemental.remains)%cooldown.storm_elemental.duration)>=30*(1+(azerite.echo_of_the_elementals.rank>=2)))
            if A.EarthShock:IsReady(unit) and (not A.MasteroftheElements:IsSpellLearned() and not (A.IgneousPotential:GetAzeriteRank() > 2 and Unit("player"):HasBuffs(A.AscendanceBuff.ID, true)) and (Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) or Player:Maelstrom() >= 90 + 30 * num(A.CalltheThunder:IsSpellLearned()) or not (A.StormElemental:GetCooldown() > A.StormElemental:BaseDuration() and A.StormElemental:IsSpellLearned()) and expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown() - A.StormElemental:BaseDuration() * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown()) / A.StormElemental:BaseDuration()) >= 30 * (1 + num((A.EchooftheElementals:GetAzeriteRank() >= 2))))) then
                return A.EarthShock:Show(icon)
            end
            -- earth_shock,if=talent.surge_of_power.enabled&!buff.surge_of_power.up&cooldown.lava_burst.remains<=gcd&(!talent.storm_elemental.enabled&!(cooldown.fire_elemental.remains>(cooldown.fire_elemental.duration-30))|talent.storm_elemental.enabled&!(cooldown.storm_elemental.remains>(cooldown.storm_elemental.duration-30)))
            if A.EarthShock:IsReady(unit) and (A.SurgeofPower:IsSpellLearned() and not Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and A.LavaBurst:GetCooldown() <= A.GetGCD() and (not A.StormElemental:IsSpellLearned() and not (A.FireElemental:GetCooldown() > (A.FireElemental:BaseDuration() - 30)) or A.StormElemental:IsSpellLearned() and not (A.StormElemental:GetCooldown() > (A.StormElemental:BaseDuration() - 30)))) then
                return A.EarthShock:Show(icon)
            end
            -- lightning_lasso
            if A.LightningLasso:IsReady(unit) then
                return A.LightningLasso:Show(icon)
            end
            -- lightning_bolt,if=cooldown.storm_elemental.remains>(cooldown.storm_elemental.duration-30)&talent.storm_elemental.enabled&(azerite.igneous_potential.rank<2|!buff.lava_surge.up&buff.bloodlust.up)
            if A.LightningBolt:IsReady(unit) and (A.StormElemental:GetCooldown() > (A.StormElemental:BaseDuration() - 30) and A.StormElemental:IsSpellLearned() and (A.IgneousPotential:GetAzeriteRank() < 2 or not Unit("player"):HasBuffs(A.LavaSurgeBuff.ID, true) and Unit("player"):HasHeroism)) then
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
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock887) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- lava_burst,if=talent.storm_elemental.enabled&cooldown_react&buff.surge_of_power.up&(expected_combat_length-time-cooldown.storm_elemental.remains-cooldown.storm_elemental.duration*floor((expected_combat_length-time-cooldown.storm_elemental.remains)%cooldown.storm_elemental.duration)<30*(1+(azerite.echo_of_the_elementals.rank>=2))|(1.16*(expected_combat_length-time)-cooldown.storm_elemental.remains-cooldown.storm_elemental.duration*floor((1.16*(expected_combat_length-time)-cooldown.storm_elemental.remains)%cooldown.storm_elemental.duration))<(expected_combat_length-time-cooldown.storm_elemental.remains-cooldown.storm_elemental.duration*floor((expected_combat_length-time-cooldown.storm_elemental.remains)%cooldown.storm_elemental.duration)))
            if A.LavaBurst:IsReady(unit) and (A.StormElemental:IsSpellLearned() and A.LavaBurst:GetCooldown() == 0 and Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and (expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown() - A.StormElemental:BaseDuration() * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown()) / A.StormElemental:BaseDuration()) < 30 * (1 + num((A.EchooftheElementals:GetAzeriteRank() >= 2))) or (1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.StormElemental:GetCooldown() - A.StormElemental:BaseDuration() * math.floor ((1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.StormElemental:GetCooldown()) / A.StormElemental:BaseDuration())) < (expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown() - A.StormElemental:BaseDuration() * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.StormElemental:GetCooldown()) / A.StormElemental:BaseDuration())))) then
                return A.LavaBurst:Show(icon)
            end
            -- lava_burst,if=!talent.storm_elemental.enabled&cooldown_react&buff.surge_of_power.up&(expected_combat_length-time-cooldown.fire_elemental.remains-cooldown.fire_elemental.duration*floor((expected_combat_length-time-cooldown.fire_elemental.remains)%cooldown.fire_elemental.duration)<30*(1+(azerite.echo_of_the_elementals.rank>=2))|(1.16*(expected_combat_length-time)-cooldown.fire_elemental.remains-cooldown.fire_elemental.duration*floor((1.16*(expected_combat_length-time)-cooldown.fire_elemental.remains)%cooldown.fire_elemental.duration))<(expected_combat_length-time-cooldown.fire_elemental.remains-cooldown.fire_elemental.duration*floor((expected_combat_length-time-cooldown.fire_elemental.remains)%cooldown.fire_elemental.duration)))
            if A.LavaBurst:IsReady(unit) and (not A.StormElemental:IsSpellLearned() and A.LavaBurst:GetCooldown() == 0 and Unit("player"):HasBuffs(A.SurgeofPowerBuff.ID, true) and (expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown() - A.FireElemental:BaseDuration() * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown()) / A.FireElemental:BaseDuration()) < 30 * (1 + num((A.EchooftheElementals:GetAzeriteRank() >= 2))) or (1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.FireElemental:GetCooldown() - A.FireElemental:BaseDuration() * math.floor ((1.16 * (expected_combat_length - Unit("player"):CombatTime()) - A.FireElemental:GetCooldown()) / A.FireElemental:BaseDuration())) < (expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown() - A.FireElemental:BaseDuration() * math.floor ((expected_combat_length - Unit("player"):CombatTime() - A.FireElemental:GetCooldown()) / A.FireElemental:BaseDuration())))) then
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
            -- icefury,if=talent.icefury.enabled&!(maelstrom>75&cooldown.lava_burst.remains<=0)&(!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<cooldown.storm_elemental.duration-30)
            if A.Icefury:IsReady(unit) and (A.Icefury:IsSpellLearned() and not (Player:Maelstrom() > 75 and A.LavaBurst:GetCooldown() <= 0) and (not A.StormElemental:IsSpellLearned() or A.StormElemental:GetCooldown() < A.StormElemental:BaseDuration() - 30)) then
                return A.Icefury:Show(icon)
            end
            -- lava_burst,if=cooldown_react&charges>talent.echo_of_the_elements.enabled
            if A.LavaBurst:IsReady(unit) and (A.LavaBurst:GetCooldown() == 0 and A.LavaBurst:ChargesP() > num(A.EchooftheElements:IsSpellLearned())) then
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
            -- concentrated_flame
            if A.ConcentratedFlame:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") then
                return A.ConcentratedFlame:Show(icon)
            end
            -- reaping_flames
            if A.ReapingFlames:IsReady(unit) then
                return A.ReapingFlames:Show(icon)
            end
            -- flame_shock,target_if=refreshable&!buff.surge_of_power.up
            if A.FlameShock:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock1038) then
                    return A.FlameShock:Show(icon) 
                end
            end
            -- totem_mastery,if=talent.totem_mastery.enabled&(buff.resonance_totem.remains<6|(buff.resonance_totem.remains<(buff.ascendance.duration+cooldown.ascendance.remains)&cooldown.ascendance.remains<15))
            if A.TotemMastery:IsReady(unit) and (A.TotemMastery:IsSpellLearned() and (Unit("player"):HasBuffs(A.ResonanceTotemBuff.ID, true) < 6 or (Unit("player"):HasBuffs(A.ResonanceTotemBuff.ID, true) < (A.AscendanceBuff.ID, true:BaseDuration() + A.Ascendance:GetCooldown()) and A.Ascendance:GetCooldown() < 15))) then
                return A.TotemMastery:Show(icon)
            end
            -- frost_shock,if=talent.icefury.enabled&buff.icefury.up&(buff.icefury.remains<gcd*4*buff.icefury.stack|buff.stormkeeper.up|!talent.master_of_the_elements.enabled)
            if A.FrostShock:IsReady(unit) and (A.Icefury:IsSpellLearned() and Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and (Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) < A.GetGCD() * 4 * Unit("player"):HasBuffsStacks(A.IcefuryBuff.ID, true) or Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) or not A.MasteroftheElements:IsSpellLearned())) then
                return A.FrostShock:Show(icon)
            end
            -- earth_elemental,if=!talent.primal_elementalist.enabled|talent.primal_elementalist.enabled&(cooldown.fire_elemental.remains<(cooldown.fire_elemental.duration-30)&!talent.storm_elemental.enabled|cooldown.storm_elemental.remains<(cooldown.storm_elemental.duration-30)&talent.storm_elemental.enabled)
            -- chain_lightning,if=buff.tectonic_thunder.up&!buff.stormkeeper.up&spell_targets.chain_lightning>1
            if A.ChainLightning:IsReady(unit) and (Unit("player"):HasBuffs(A.TectonicThunderBuff.ID, true) and not Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) and MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) then
                return A.ChainLightning:Show(icon)
            end
            -- lightning_bolt
            if A.LightningBolt:IsReady(unit) then
                return A.LightningBolt:Show(icon)
            end
            -- flame_shock,moving=1,target_if=refreshable
            if A.FlameShock:IsReady(unit) and isMoving then
                if Action.Utils.CastTargetIf(A.FlameShock, 40, "min", EvaluateCycleFlameShock1090) then
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
        
        
        -- call precombat
        if not inCombat and Unit(unit):IsExists() and unit ~= "mouseover" and not Unit(unit):IsTotem() then 
            local ShouldReturn = Precombat(unit); if ShouldReturn then return ShouldReturn; end
        end

        -- In Combat
        if inCombat and Unit(unit):IsExists() and not Unit(unit):IsTotem() then
                    -- bloodlust,if=azerite.ancestral_resonance.enabled
            -- potion,if=expected_combat_length-time<60|cooldown.guardian_of_azeroth.remains<30
            if A.BattlePotionofIntellect:IsReady(unit) and Action.GetToggle(1, "Potion") and (expected_combat_length - Unit("player"):CombatTime() < 60 or A.GuardianofAzeroth:GetCooldown() < 30) then
                A.BattlePotionofIntellect:Show(icon)
            end
            -- wind_shear
            if A.WindShear:IsReady(unit) and Action.GetToggle.InterruptEnabled then
                return A.WindShear:Show(icon)
            end
            -- flame_shock,if=!ticking&spell_targets.chainlightning<4&(cooldown.storm_elemental.remains<cooldown.storm_elemental.duration-30|buff.wind_gust.stack<14)
            if A.FlameShock:IsReady(unit) and (not Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) and MultiUnits:GetByRangeInCombat(5, 5, 10) < 4 and (A.StormElemental:GetCooldown() < A.StormElemental:BaseDuration() - 30 or Unit("player"):HasBuffsStacks(A.WindGustBuff.ID, true) < 14)) then
                return A.FlameShock:Show(icon)
            end
            -- totem_mastery,if=talent.totem_mastery.enabled&buff.resonance_totem.remains<2
            if A.TotemMastery:IsReady(unit) and (A.TotemMastery:IsSpellLearned() and Unit("player"):HasBuffs(A.ResonanceTotemBuff.ID, true) < 2) then
                return A.TotemMastery:Show(icon)
            end
            -- use_items
            -- guardian_of_azeroth,if=dot.flame_shock.ticking&(!talent.storm_elemental.enabled&(cooldown.fire_elemental.duration-30<cooldown.fire_elemental.remains|expected_combat_length-time>190|expected_combat_length-time<32|!(cooldown.fire_elemental.remains+30<expected_combat_length-time)|cooldown.fire_elemental.remains<2)|talent.storm_elemental.enabled&(cooldown.storm_elemental.duration-30<cooldown.storm_elemental.remains|expected_combat_length-time>190|expected_combat_length-time<35|!(cooldown.storm_elemental.remains+30<expected_combat_length-time)|cooldown.storm_elemental.remains<2))
            if A.GuardianofAzeroth:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") and (Unit(unit):HasDeBuffs(A.FlameShockDebuff.ID, true) and (not A.StormElemental:IsSpellLearned() and (A.FireElemental:BaseDuration() - 30 < A.FireElemental:GetCooldown() or expected_combat_length - Unit("player"):CombatTime() > 190 or expected_combat_length - Unit("player"):CombatTime() < 32 or not (A.FireElemental:GetCooldown() + 30 < expected_combat_length - Unit("player"):CombatTime()) or A.FireElemental:GetCooldown() < 2) or A.StormElemental:IsSpellLearned() and (A.StormElemental:BaseDuration() - 30 < A.StormElemental:GetCooldown() or expected_combat_length - Unit("player"):CombatTime() > 190 or expected_combat_length - Unit("player"):CombatTime() < 35 or not (A.StormElemental:GetCooldown() + 30 < expected_combat_length - Unit("player"):CombatTime()) or A.StormElemental:GetCooldown() < 2))) then
                return A.GuardianofAzeroth:Show(icon)
            end
            -- fire_elemental,if=!talent.storm_elemental.enabled&(!essence.condensed_lifeforce.major|cooldown.guardian_of_azeroth.remains>150|expected_combat_length-time<30|expected_combat_length-time<60|expected_combat_length-time>155|!(cooldown.guardian_of_azeroth.remains+30<expected_combat_length-time))
            if A.FireElemental:IsReady(unit) and A.BurstIsON(unit) and (not A.StormElemental:IsSpellLearned() and (not bool(Azerite:EssenceHasMajor(A.CondensedLifeforce.ID)) or A.GuardianofAzeroth:GetCooldown() > 150 or expected_combat_length - Unit("player"):CombatTime() < 30 or expected_combat_length - Unit("player"):CombatTime() < 60 or expected_combat_length - Unit("player"):CombatTime() > 155 or not (A.GuardianofAzeroth:GetCooldown() + 30 < expected_combat_length - Unit("player"):CombatTime()))) then
                return A.FireElemental:Show(icon)
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
            if A.RippleInSpace:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") then
                return A.RippleInSpace:Show(icon)
            end
            -- worldvein_resonance,if=(talent.unlimited_power.enabled|buff.stormkeeper.up|talent.ascendance.enabled&((talent.storm_elemental.enabled&cooldown.storm_elemental.remains<(cooldown.storm_elemental.duration-30)&cooldown.storm_elemental.remains>15|!talent.storm_elemental.enabled)&(!talent.icefury.enabled|!buff.icefury.up&!cooldown.icefury.up))|!cooldown.ascendance.up)
            if A.WorldveinResonance:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") and ((A.UnlimitedPower:IsSpellLearned() or Unit("player"):HasBuffs(A.StormkeeperBuff.ID, true) or A.Ascendance:IsSpellLearned() and ((A.StormElemental:IsSpellLearned() and A.StormElemental:GetCooldown() < (A.StormElemental:BaseDuration() - 30) and A.StormElemental:GetCooldown() > 15 or not A.StormElemental:IsSpellLearned()) and (not A.Icefury:IsSpellLearned() or not Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and not A.Icefury:GetCooldown() == 0)) or not A.Ascendance:GetCooldown() == 0)) then
                return A.WorldveinResonance:Show(icon)
            end
            -- blood_of_the_enemy,if=talent.storm_elemental.enabled&pet.primal_storm_elemental.active
            if A.BloodoftheEnemy:AutoHeartOfAzerothP(unit, true) and Action.GetToggle(1, "HeartOfAzeroth") and (A.StormElemental:IsSpellLearned() and bool(pet.primal_storm_elemental.active)) then
                return A.BloodoftheEnemy:Show(icon)
            end
            -- storm_elemental,if=talent.storm_elemental.enabled&(!cooldown.stormkeeper.up|!talent.stormkeeper.enabled)&(!talent.icefury.enabled|!buff.icefury.up&!cooldown.icefury.up)&(!talent.ascendance.enabled|!buff.ascendance.up|expected_combat_length-time<32)&(!essence.condensed_lifeforce.major|cooldown.guardian_of_azeroth.remains>150|expected_combat_length-time<30|expected_combat_length-time<60|expected_combat_length-time>155|!(cooldown.guardian_of_azeroth.remains+30<expected_combat_length-time))
            if A.StormElemental:IsReady(unit) and A.BurstIsON(unit) and (A.StormElemental:IsSpellLearned() and (not A.Stormkeeper:GetCooldown() == 0 or not A.Stormkeeper:IsSpellLearned()) and (not A.Icefury:IsSpellLearned() or not Unit("player"):HasBuffs(A.IcefuryBuff.ID, true) and not A.Icefury:GetCooldown() == 0) and (not A.Ascendance:IsSpellLearned() or not Unit("player"):HasBuffs(A.AscendanceBuff.ID, true) or expected_combat_length - Unit("player"):CombatTime() < 32) and (not bool(Azerite:EssenceHasMajor(A.CondensedLifeforce.ID)) or A.GuardianofAzeroth:GetCooldown() > 150 or expected_combat_length - Unit("player"):CombatTime() < 30 or expected_combat_length - Unit("player"):CombatTime() < 60 or expected_combat_length - Unit("player"):CombatTime() > 155 or not (A.GuardianofAzeroth:GetCooldown() + 30 < expected_combat_length - Unit("player"):CombatTime()))) then
                return A.StormElemental:Show(icon)
            end
            -- blood_fury,if=!talent.ascendance.enabled|buff.ascendance.up|cooldown.ascendance.remains>50
            if A.BloodFury:AutoRacial(unit) and Action.GetToggle(1, "Racial") and A.BurstIsON(unit) and (not A.Ascendance:IsSpellLearned() or Unit("player"):HasBuffs(A.AscendanceBuff.ID, true) or A.Ascendance:GetCooldown() > 50) then
                return A.BloodFury:Show(icon)
            end
            -- berserking,if=!talent.ascendance.enabled|buff.ascendance.up
            if A.Berserking:AutoRacial(unit) and Action.GetToggle(1, "Racial") and A.BurstIsON(unit) and (not A.Ascendance:IsSpellLearned() or Unit("player"):HasBuffs(A.AscendanceBuff.ID, true)) then
                return A.Berserking:Show(icon)
            end
            -- fireblood,if=!talent.ascendance.enabled|buff.ascendance.up|cooldown.ascendance.remains>50
            if A.Fireblood:AutoRacial(unit) and Action.GetToggle(1, "Racial") and A.BurstIsON(unit) and (not A.Ascendance:IsSpellLearned() or Unit("player"):HasBuffs(A.AscendanceBuff.ID, true) or A.Ascendance:GetCooldown() > 50) then
                return A.Fireblood:Show(icon)
            end
            -- ancestral_call,if=!talent.ascendance.enabled|buff.ascendance.up|cooldown.ascendance.remains>50
            if A.AncestralCall:AutoRacial(unit) and Action.GetToggle(1, "Racial") and A.BurstIsON(unit) and (not A.Ascendance:IsSpellLearned() or Unit("player"):HasBuffs(A.AscendanceBuff.ID, true) or A.Ascendance:GetCooldown() > 50) then
                return A.AncestralCall:Show(icon)
            end
            -- bag_of_tricks,if=!talent.ascendance.enabled|!buff.ascendance.up
            if A.BagofTricks:IsReady(unit) and (not A.Ascendance:IsSpellLearned() or not Unit("player"):HasBuffs(A.AscendanceBuff.ID, true)) then
                return A.BagofTricks:Show(icon)
            end
            -- run_action_list,name=aoe,if=active_enemies>2&(spell_targets.chain_lightning>2|spell_targets.lava_beam>2)
            if (MultiUnits:GetByRangeInCombat(40, 5, 10) > 2 and (MultiUnits:GetByRangeInCombat(40, 5, 10) > 2 or MultiUnits:GetByRangeInCombat(5, 5, 10) > 2)) then
                return Aoe(unit);
            end
            -- run_action_list,name=funnel,if=active_enemies>=2&(spell_targets.chain_lightning<2|spell_targets.lava_beam<2)
            if (MultiUnits:GetByRangeInCombat(40, 5, 10) >= 2 and (MultiUnits:GetByRangeInCombat(40, 5, 10) < 2 or MultiUnits:GetByRangeInCombat(5, 5, 10) < 2)) then
                return Funnel(unit);
            end
            -- run_action_list,name=single_target,if=active_enemies<=2
            if (MultiUnits:GetByRangeInCombat(40, 5, 10) <= 2) then
                return SingleUnitunit(unit);
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

