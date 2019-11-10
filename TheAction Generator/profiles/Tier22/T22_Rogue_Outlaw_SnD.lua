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
Action[ACTION_CONST_ROGUE_OUTLAW] = {
    Stealth                                = Action.Create({Type = "Spell", ID =  }),
    MarkedForDeath                         = Action.Create({Type = "Spell", ID = 137619 }),
    RolltheBones                           = Action.Create({Type = "Spell", ID = 193316 }),
    SliceandDiceBuff                       = Action.Create({Type = "Spell", ID = 5171 }),
    SliceandDice                           = Action.Create({Type = "Spell", ID = 5171 }),
    AdrenalineRushBuff                     = Action.Create({Type = "Spell", ID = 13750 }),
    AdrenalineRush                         = Action.Create({Type = "Spell", ID = 13750 }),
    PistolShot                             = Action.Create({Type = "Spell", ID = 185763 }),
    BroadsideBuff                          = Action.Create({Type = "Spell", ID =  }),
    QuickDraw                              = Action.Create({Type = "Spell", ID = 196938 }),
    OpportunityBuff                        = Action.Create({Type = "Spell", ID = 195627 }),
    SinisterStrike                         = Action.Create({Type = "Spell", ID =  }),
    BloodFury                              = Action.Create({Type = "Spell", ID = 20572 }),
    Berserking                             = Action.Create({Type = "Spell", ID = 26297 }),
    Fireblood                              = Action.Create({Type = "Spell", ID = 265221 }),
    AncestralCall                          = Action.Create({Type = "Spell", ID = 274738 }),
    BladeFlurry                            = Action.Create({Type = "Spell", ID = 13877 }),
    BladeFlurryBuff                        = Action.Create({Type = "Spell", ID = 13877 }),
    GhostlyStrike                          = Action.Create({Type = "Spell", ID = 196937 }),
    KillingSpree                           = Action.Create({Type = "Spell", ID = 51690 }),
    BladeRush                              = Action.Create({Type = "Spell", ID =  }),
    Vanish                                 = Action.Create({Type = "Spell", ID = 1856 }),
    Shadowmeld                             = Action.Create({Type = "Spell", ID = 58984 }),
    BetweentheEyes                         = Action.Create({Type = "Spell", ID = 199804 }),
    RuthlessPrecisionBuff                  = Action.Create({Type = "Spell", ID =  }),
    Deadshot                               = Action.Create({Type = "Spell", ID =  }),
    AceUpYourSleeve                        = Action.Create({Type = "Spell", ID =  }),
    RolltheBonesBuff                       = Action.Create({Type = "Spell", ID =  }),
    Dispatch                               = Action.Create({Type = "Spell", ID =  }),
    Ambush                                 = Action.Create({Type = "Spell", ID = 8676 }),
    LoadedDiceBuff                         = Action.Create({Type = "Spell", ID = 240837 }),
    GrandMeleeBuff                         = Action.Create({Type = "Spell", ID =  }),
    SnakeEyes                              = Action.Create({Type = "Spell", ID =  }),
    SnakeEyesBuff                          = Action.Create({Type = "Spell", ID =  }),
    SkullandCrossbonesBuff                 = Action.Create({Type = "Spell", ID =  }),
    ArcaneTorrent                          = Action.Create({Type = "Spell", ID = 50613 }),
    ArcanePulse                            = Action.Create({Type = "Spell", ID =  }),
    LightsJudgment                         = Action.Create({Type = "Spell", ID = 255647 })
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
Action:CreateEssencesFor(ACTION_CONST_ROGUE_OUTLAW)  -- where PLAYERSPEC is Constance (example: ACTION_CONST_MONK_BM)
local A = setmetatable(Action[ACTION_CONST_ROGUE_OUTLAW], { __index = Action })


------------------------------------------
---------------- VARIABLES ---------------
------------------------------------------
local VarBladeFlurrySync = 0;
local VarAmbushCondition = 0;
local VarRtbReroll = 0;

A.Listener:Add("ACTION_EVENT_COMBAT_TRACKER", "PLAYER_REGEN_ENABLED", 				function()
  VarBladeFlurrySync = 0
  VarAmbushCondition = 0
  VarRtbReroll = 0
	end 
end)

local EnemyRanges = {40, 8}
local function UpdateRanges()
  for _, i in ipairs(EnemyRanges) do
    HL.GetEnemies(i);
  end
end


local function num(val)
    if val then return 1 else return 0 end
end

local function bool(val)
    return val ~= 0
end

------------------------------------------
-------------- PRE APL SETUP -------------
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

------------------------------------------
--------------- DEFENSIVES ---------------
------------------------------------------
local function SelfDefensives()
    if Unit("player"):CombatTime() == 0 then 
        return 
    end 
    
    local unit
    if A.IsUnitEnemy("mouseover") then 
        unit = "mouseover"
    elseif A.IsUnitEnemy("target") then 
        unit = "target"
    end  
		
    -- UnendingResolve
 --[[   local UnendingResolve = A.GetToggle(2, "UnendingResolve")
    if     UnendingResolve >= 0 and A.UnendingResolve:IsReady("player") and 
    (
        (     -- Auto 
            UnendingResolve >= 100 and 
            (
                -- HP lose per sec >= 20
                Unit("player"):GetDMG() * 100 / Unit("player"):HealthMax() >= 20 or 
                Unit("player"):GetRealTimeDMG() >= Unit("player"):HealthMax() * 0.20 or 
                -- TTD 
                Unit("player"):TimeToDieX(25) < 5 or 
                (
                    A.IsInPvP and 
                    (
                        Unit("player"):UseDeff() or 
                        (
                            Unit("player", 5):HasFlags() and 
                            Unit("player"):GetRealTimeDMG() > 0 and 
                            Unit("player"):IsFocused() 
                        )
                    )
                )
            ) and 
            Unit("player"):HasBuffs("DeffBuffs", true) == 0
        ) or 
        (    -- Custom
            UnendingResolve < 100 and 
            Unit("player"):HealthPercent() <= UnendingResolve
        )
    ) 
    then 
        return A.UnendingResolve
    end ]]--
    
    -- Stoneform on self dispel (only PvE)
    if A.Stoneform:IsRacialReady("player", true) and not A.IsInPvP and A.AuraIsValid("player", "UseDispel", "Dispel") then 
        return A.Stoneform
    end 
end 
SelfDefensives = A.MakeFunctionCachedStatic(SelfDefensives)

------------------------------------------
--------------- INTERRUPTS ---------------
------------------------------------------
local function Interrupts(unit)
    local useKick, useCC, useRacial = A.InterruptIsValid(unit, "TargetMouseover")    
    
  --  if useKick and A.PetKick:IsReady(unit) and A.PetKick:AbsentImun(unit, Temp.TotalAndMagKick, true) and Unit(unit):CanInterrupt(true, nil, 25, 70) then 
  --      return A.PetKick
  --  end 
    
  --  if useCC and A.Shadowfury:IsReady(unit) and MultiUnits:GetActiveEnemies() >= 2 and A.Shadowfury:AbsentImun(unit, Temp.TotalAndCC, true) and Unit(unit):IsControlAble("stun", 0) then 
  --      return A.Shadowfury              
  --  end          
	
	--if useCC and A.Fear:IsReady(unit) and A.Fear:AbsentImun(unit, Temp.TotalAndCC, true) and Unit(unit):IsControlAble("disorient", 0) then 
    --    return A.Fear              
    --end
    
    if useRacial and A.QuakingPalm:AutoRacial(unit) then 
        return A.QuakingPalm
    end 
    
    if useRacial and A.Haymaker:AutoRacial(unit) then 
        return A.Haymaker
    end 
    
    if useRacial and A.WarStomp:AutoRacial(unit) then 
        return A.WarStomp
    end 
    
    if useRacial and A.BullRush:AutoRacial(unit) then 
        return A.BullRush
    end      
end 
Interrupts = A.MakeFunctionCachedDynamic(Interrupts)

------------------------------------------
---------------- AntiFake ----------------
------------------------------------------

-- [1] CC AntiFake Rotation
--[[local function AntiFakeStun(unit) 
    return 
    A.IsUnitEnemy(unit) and  
    Unit(unit):GetRange() <= 5 + (A.TigerTailSweep:IsSpellLearned() and 2 or 0) and 
    Unit(unit):IsControlAble("stun", 0) and 
    A.LegSweepGreen:AbsentImun(unit, Temp.TotalAndPhysAndCCAndStun, true)          
end 
A[1] = function(icon)    
    if     A.LegSweepGreen:IsReady(nil, nil, nil, true) and 
    (
        AntiFakeStun("mouseover") or 
        AntiFakeStun("target") or 
        (
            not A.IsUnitEnemy("mouseover") and 
            not A.IsUnitEnemy("target") and                     
            (
                (A.IsInPvP and EnemyTeam():PlayersInRange(1, 5 + (A.TigerTailSweep:IsSpellLearned() and 2 or 0))) or 
                (not A.IsInPvP and MultiUnits:GetByRange(5 + (A.TigerTailSweep:IsSpellLearned() and 2 or 0), 1) >= 1)
            )
        )
    )
    then 
        return A.LegSweepGreen:Show(icon)         
    end                                                                     
end]]--

-- [2] Kick AntiFake Rotation
A[2] = function(icon)        
    local unit
    if A.IsUnitEnemy("mouseover") then 
        unit = "mouseover"
    elseif A.IsUnitEnemy("target") then 
        unit = "target"
    end 
    
    if unit then         
        local castLeft, _, _, _, notKickAble = Unit(unit):IsCastingRemains()
        if castLeft > 0 then             
        --    if not notKickAble and A.PetKick:IsReady(unit, nil, nil, true) and A.PetKick:AbsentImun(unit, Temp.TotalAndMag, true) then
        --        return A.PetKick:Show(icon)                                                  
        --    end 
            
            -- Racials 
            if A.QuakingPalm:IsRacialReadyP(unit, nil, nil, true) then 
                return A.QuakingPalm:Show(icon)
            end 
            
            if A.Haymaker:IsRacialReadyP(unit, nil, nil, true) then 
                return A.Haymaker:Show(icon)
            end 
            
            if A.WarStomp:IsRacialReadyP(unit, nil, nil, true) then 
                return A.WarStomp:Show(icon)
            end 
            
            if A.BullRush:IsRacialReadyP(unit, nil, nil, true) then 
                return A.BullRush:Show(icon)
            end                         
        end 
    end                                                                                 
end


local function EvaluateTargetIfFilterMarkedForDeath49(unit)
  return Unit(unit):TimeToDie()
end

local function EvaluateTargetIfMarkedForDeath54(unit)
  return (MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) and (Unit(unit):TimeToDie() < Unit("player"):ComboPointsDeficit() or not Unit("player"):IsStealthedP(true, false) and Unit("player"):ComboPointsDeficit() >= Rogue.CPMaxSpend() - 1)
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
        local Precombat, Build, Cds, Finish, Stealth
        --Precombat
        local function Precombat(unit)
            -- flask
            -- augmentation
            -- food
            -- snapshot_stats
            -- stealth
            if A.Stealth:IsReady(unit) then
                return A.Stealth:Show(icon)
            end
            -- potion
            if A.ProlongedPower:IsReady(unit) and Action.GetToggle(1, "Potion") then
                A.ProlongedPower:Show(icon)
            end
            -- marked_for_death,precombat_seconds=5,if=raid_event.adds.in>40
            if A.MarkedForDeath:IsReady(unit) and (10000000000 > 40) then
                return A.MarkedForDeath:Show(icon)
            end
            -- roll_the_bones,precombat_seconds=2
            if A.RolltheBones:IsReady(unit) then
                return A.RolltheBones:Show(icon)
            end
            -- slice_and_dice,precombat_seconds=2
            if A.SliceandDice:IsReady(unit) and Unit("player"):HasBuffsDown(A.SliceandDiceBuff.ID, true) then
                return A.SliceandDice:Show(icon)
            end
            -- adrenaline_rush,precombat_seconds=1
            if A.AdrenalineRush:IsReady(unit) and Unit("player"):HasBuffsDown(A.AdrenalineRushBuff.ID, true) then
                return A.AdrenalineRush:Show(icon)
            end
        end
        
        --Build
        local function Build(unit)
            -- pistol_shot,if=combo_points.deficit>=1+buff.broadside.up+talent.quick_draw.enabled&buff.opportunity.up
            if A.PistolShot:IsReady(unit) and (Unit("player"):ComboPointsDeficit() >= 1 + num(Unit("player"):HasBuffs(A.BroadsideBuff.ID, true)) + num(A.QuickDraw:IsSpellLearned()) and Unit("player"):HasBuffs(A.OpportunityBuff.ID, true)) then
                return A.PistolShot:Show(icon)
            end
            -- sinister_strike
            if A.SinisterStrike:IsReady(unit) then
                return A.SinisterStrike:Show(icon)
            end
        end
        
        --Cds
        local function Cds(unit)
            -- potion,if=buff.bloodlust.react|buff.adrenaline_rush.up
            if A.ProlongedPower:IsReady(unit) and Action.GetToggle(1, "Potion") and (Unit("player"):HasHeroism or Unit("player"):HasBuffs(A.AdrenalineRushBuff.ID, true)) then
                A.ProlongedPower:Show(icon)
            end
            -- blood_fury
            if A.BloodFury:AutoRacial(unit) and A.BurstIsON(unit) then
                return A.BloodFury:Show(icon)
            end
            -- berserking
            if A.Berserking:AutoRacial(unit) and A.BurstIsON(unit) then
                return A.Berserking:Show(icon)
            end
            -- fireblood
            if A.Fireblood:AutoRacial(unit) and A.BurstIsON(unit) then
                return A.Fireblood:Show(icon)
            end
            -- ancestral_call
            if A.AncestralCall:AutoRacial(unit) and A.BurstIsON(unit) then
                return A.AncestralCall:Show(icon)
            end
            -- adrenaline_rush,if=!buff.adrenaline_rush.up&energy.time_to_max>1
            if A.AdrenalineRush:IsReady(unit) and (not Unit("player"):HasBuffs(A.AdrenalineRushBuff.ID, true) and Unit("player"):EnergyTimeToMaxPredicted() > 1) then
                return A.AdrenalineRush:Show(icon)
            end
            -- marked_for_death,target_if=min:target.time_to_die,if=raid_event.adds.up&(target.time_to_die<combo_points.deficit|!stealthed.rogue&combo_points.deficit>=cp_max_spend-1)
            if A.MarkedForDeath:IsReady(unit) then
                if Action.Utils.CastTargetIf(A.MarkedForDeath, 40, "min", EvaluateTargetIfFilterMarkedForDeath49, EvaluateTargetIfMarkedForDeath54) then 
                    return A.MarkedForDeath:Show(icon) 
                end
            end
            -- marked_for_death,if=raid_event.adds.in>30-raid_event.adds.duration&!stealthed.rogue&combo_points.deficit>=cp_max_spend-1
            if A.MarkedForDeath:IsReady(unit) and (10000000000 > 30 - raid_event.adds.duration and not Unit("player"):IsStealthedP(true, false) and Unit("player"):ComboPointsDeficit() >= Rogue.CPMaxSpend() - 1) then
                return A.MarkedForDeath:Show(icon)
            end
            -- blade_flurry,if=spell_targets>=2&!buff.blade_flurry.up&(!raid_event.adds.exists|raid_event.adds.remains>8|raid_event.adds.in>(2-cooldown.blade_flurry.charges_fractional)*25)
            if A.BladeFlurry:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) >= 2 and not Unit("player"):HasBuffs(A.BladeFlurryBuff.ID, true) and (not (MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) or 0 > 8 or 10000000000 > (2 - A.BladeFlurry:ChargesFractionalP()) * 25)) then
                return A.BladeFlurry:Show(icon)
            end
            -- ghostly_strike,if=variable.blade_flurry_sync&combo_points.deficit>=1+buff.broadside.up
            if A.GhostlyStrike:IsReady(unit) and (bool(VarBladeFlurrySync) and Unit("player"):ComboPointsDeficit() >= 1 + num(Unit("player"):HasBuffs(A.BroadsideBuff.ID, true))) then
                return A.GhostlyStrike:Show(icon)
            end
            -- killing_spree,if=variable.blade_flurry_sync&(energy.time_to_max>5|energy<15)
            if A.KillingSpree:IsReady(unit) and (bool(VarBladeFlurrySync) and (Unit("player"):EnergyTimeToMaxPredicted() > 5 or Unit("player"):EnergyPredicted() < 15)) then
                return A.KillingSpree:Show(icon)
            end
            -- blade_rush,if=variable.blade_flurry_sync&energy.time_to_max>1
            if A.BladeRush:IsReady(unit) and (bool(VarBladeFlurrySync) and Unit("player"):EnergyTimeToMaxPredicted() > 1) then
                return A.BladeRush:Show(icon)
            end
            -- vanish,if=!stealthed.all&variable.ambush_condition
            if A.Vanish:IsReady(unit) and (not Unit("player"):IsStealthedP(true, true) and bool(VarAmbushCondition)) then
                return A.Vanish:Show(icon)
            end
            -- shadowmeld,if=!stealthed.all&variable.ambush_condition
            if A.Shadowmeld:AutoRacial(unit) and A.BurstIsON(unit) and (not Unit("player"):IsStealthedP(true, true) and bool(VarAmbushCondition)) then
                return A.Shadowmeld:Show(icon)
            end
        end
        
        --Finish
        local function Finish(unit)
            -- between_the_eyes,if=buff.ruthless_precision.up|(azerite.deadshot.enabled|azerite.ace_up_your_sleeve.enabled)&buff.roll_the_bones.up
            if A.BetweentheEyes:IsReady(unit) and (Unit("player"):HasBuffs(A.RuthlessPrecisionBuff.ID, true) or (bool(A.Deadshot:GetAzeriteRank()) or bool(A.AceUpYourSleeve:GetAzeriteRank())) and Unit("player"):HasBuffs(A.RolltheBonesBuff.ID, true)) then
                return A.BetweentheEyes:Show(icon)
            end
            -- slice_and_dice,if=buff.slice_and_dice.remains<target.time_to_die&buff.slice_and_dice.remains<(1+combo_points)*1.8
            if A.SliceandDice:IsReady(unit) and (Unit("player"):HasBuffs(A.SliceandDiceBuff.ID, true) < Unit(unit):TimeToDie() and Unit("player"):HasBuffs(A.SliceandDiceBuff.ID, true) < (1 + Unit("player"):ComboPoints()) * 1.8) then
                return A.SliceandDice:Show(icon)
            end
            -- roll_the_bones,if=buff.roll_the_bones.remains<=3|variable.rtb_reroll
            if A.RolltheBones:IsReady(unit) and (Unit("player"):HasBuffs(A.RolltheBonesBuff.ID, true) <= 3 or bool(VarRtbReroll)) then
                return A.RolltheBones:Show(icon)
            end
            -- between_the_eyes,if=azerite.ace_up_your_sleeve.enabled|azerite.deadshot.enabled
            if A.BetweentheEyes:IsReady(unit) and (bool(A.AceUpYourSleeve:GetAzeriteRank()) or bool(A.Deadshot:GetAzeriteRank())) then
                return A.BetweentheEyes:Show(icon)
            end
            -- dispatch
            if A.Dispatch:IsReady(unit) then
                return A.Dispatch:Show(icon)
            end
        end
        
        --Stealth
        local function Stealth(unit)
            -- ambush
            if A.Ambush:IsReady(unit) then
                return A.Ambush:Show(icon)
            end
        end
        
        
        -- call precombat
        if not inCombat and Unit(unit):IsExists() and Action.GetToggle(1, "DBM") and unit ~= "mouseover" and not Unit(unit):IsTotem() then 
            local ShouldReturn = Precombat(unit); if ShouldReturn then return ShouldReturn; end
        end

        -- In Combat
        if inCombat and Unit(unit):IsExists() and not Unit(unit):IsTotem() then
                    -- stealth
            if A.Stealth:IsReady(unit) then
                return A.Stealth:Show(icon)
            end
            -- variable,name=rtb_reroll,value=rtb_buffs<2&(buff.loaded_dice.up|!buff.grand_melee.up&!buff.ruthless_precision.up)
            if (true) then
                VarRtbReroll = num(RtB_Buffs < 2 and (Unit("player"):HasBuffs(A.LoadedDiceBuff.ID, true) or not Unit("player"):HasBuffs(A.GrandMeleeBuff.ID, true) and not Unit("player"):HasBuffs(A.RuthlessPrecisionBuff.ID, true)))
            end
            -- variable,name=rtb_reroll,op=set,if=azerite.deadshot.enabled|azerite.ace_up_your_sleeve.enabled,value=rtb_buffs<2&(buff.loaded_dice.up|buff.ruthless_precision.remains<=cooldown.between_the_eyes.remains)
            if (bool(A.Deadshot:GetAzeriteRank()) or bool(A.AceUpYourSleeve:GetAzeriteRank())) then
                VarRtbReroll = num(RtB_Buffs < 2 and (Unit("player"):HasBuffs(A.LoadedDiceBuff.ID, true) or Unit("player"):HasBuffs(A.RuthlessPrecisionBuff.ID, true) <= A.BetweentheEyes:GetCooldown()))
            end
            -- variable,name=rtb_reroll,op=set,if=azerite.snake_eyes.rank>=2,value=rtb_buffs<2
            if (A.SnakeEyes:GetAzeriteRank() >= 2) then
                VarRtbReroll = num(RtB_Buffs < 2)
            end
            -- variable,name=rtb_reroll,op=reset,if=azerite.snake_eyes.rank>=2&buff.snake_eyes.stack>=2-buff.broadside.up
            if (A.SnakeEyes:GetAzeriteRank() >= 2 and Unit("player"):HasBuffsStacks(A.SnakeEyesBuff.ID, true) >= 2 - num(Unit("player"):HasBuffs(A.BroadsideBuff.ID, true))) then
                VarRtbReroll = 0
            end
            -- variable,name=ambush_condition,value=combo_points.deficit>=2+2*(talent.ghostly_strike.enabled&cooldown.ghostly_strike.remains<1)+buff.broadside.up&energy>60&!buff.skull_and_crossbones.up
            if (true) then
                VarAmbushCondition = num(Unit("player"):ComboPointsDeficit() >= 2 + 2 * num((A.GhostlyStrike:IsSpellLearned() and A.GhostlyStrike:GetCooldown() < 1)) + num(Unit("player"):HasBuffs(A.BroadsideBuff.ID, true)) and Unit("player"):EnergyPredicted() > 60 and not Unit("player"):HasBuffs(A.SkullandCrossbonesBuff.ID, true))
            end
            -- variable,name=blade_flurry_sync,value=spell_targets.blade_flurry<2&raid_event.adds.in>20|buff.blade_flurry.up
            if (true) then
                VarBladeFlurrySync = num(MultiUnits:GetByRangeInCombat(40, 5, 10) < 2 and 10000000000 > 20 or Unit("player"):HasBuffs(A.BladeFlurryBuff.ID, true))
            end
            -- call_action_list,name=stealth,if=stealthed.all
            if (Unit("player"):IsStealthedP(true, true)) then
                local ShouldReturn = Stealth(unit); if ShouldReturn then return ShouldReturn; end
            end
            -- call_action_list,name=cds
            if (true) then
                local ShouldReturn = Cds(unit); if ShouldReturn then return ShouldReturn; end
            end
            -- call_action_list,name=finish,if=combo_points>=cp_max_spend-(buff.broadside.up+buff.opportunity.up)*(talent.quick_draw.enabled&(!talent.marked_for_death.enabled|cooldown.marked_for_death.remains>1))
            if (Unit("player"):ComboPoints() >= Rogue.CPMaxSpend() - (num(Unit("player"):HasBuffs(A.BroadsideBuff.ID, true)) + num(Unit("player"):HasBuffs(A.OpportunityBuff.ID, true))) * num((A.QuickDraw:IsSpellLearned() and (not A.MarkedForDeath:IsSpellLearned() or A.MarkedForDeath:GetCooldown() > 1)))) then
                local ShouldReturn = Finish(unit); if ShouldReturn then return ShouldReturn; end
            end
            -- call_action_list,name=build
            if (true) then
                local ShouldReturn = Build(unit); if ShouldReturn then return ShouldReturn; end
            end
            -- arcane_torrent,if=energy.deficit>=15+energy.regen
            if A.ArcaneTorrent:AutoRacial(unit) and A.BurstIsON(unit) and (Unit("player"):EnergyDeficitPredicted() >= 15 + Unit("player"):EnergyRegen()) then
                return A.ArcaneTorrent:Show(icon)
            end
            -- arcane_pulse
            if A.ArcanePulse:AutoRacial(unit) then
                return A.ArcanePulse:Show(icon)
            end
            -- lights_judgment
            if A.LightsJudgment:IsReady(unit) and A.BurstIsON(unit) then
                return A.LightsJudgment:Show(icon)
            end
        end
    end

    -- End on EnemyRotation()

    -- Defensive
    local SelfDefensive = SelfDefensives()
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
local function FreezingTrapUsedByEnemy()
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
end

