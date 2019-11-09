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
Action[ACTION_CONST_ROGUE_ASSASSINATION] = {
  ApplyPoison                            = Action.Create({Type = "Spell", ID =  }),
  Stealth                                = Action.Create({Type = "Spell", ID =  }),
  MarkedForDeath                         = Action.Create({Type = "Spell", ID = 137619 }),
  VendettaDebuff                         = Action.Create({Type = "Spell", ID = 79140 }),
  Vendetta                               = Action.Create({Type = "Spell", ID = 79140 }),
  Subterfuge                             = Action.Create({Type = "Spell", ID = 108208 }),
  GarroteDebuff                          = Action.Create({Type = "Spell", ID = 703 }),
  Garrote                                = Action.Create({Type = "Spell", ID = 703 }),
  BloodFury                              = Action.Create({Type = "Spell", ID = 20572 }),
  Berserking                             = Action.Create({Type = "Spell", ID = 26297 }),
  Fireblood                              = Action.Create({Type = "Spell", ID = 265221 }),
  AncestralCall                          = Action.Create({Type = "Spell", ID = 274738 }),
  RuptureDebuff                          = Action.Create({Type = "Spell", ID = 1943 }),
  ShroudedSuffocation                    = Action.Create({Type = "Spell", ID =  }),
  Nightstalker                           = Action.Create({Type = "Spell", ID = 14062 }),
  Exsanguinate                           = Action.Create({Type = "Spell", ID = 200806 }),
  DeeperStratagem                        = Action.Create({Type = "Spell", ID = 193531 }),
  Vanish                                 = Action.Create({Type = "Spell", ID = 1856 }),
  MasterAssassin                         = Action.Create({Type = "Spell", ID =  }),
  Shadowmeld                             = Action.Create({Type = "Spell", ID = 58984 }),
  ToxicBlade                             = Action.Create({Type = "Spell", ID = 245388 }),
  Envenom                                = Action.Create({Type = "Spell", ID = 32645 }),
  ToxicBladeDebuff                       = Action.Create({Type = "Spell", ID = 245389 }),
  FanofKnives                            = Action.Create({Type = "Spell", ID = 51723 }),
  EchoingBlades                          = Action.Create({Type = "Spell", ID =  }),
  HiddenBladesBuff                       = Action.Create({Type = "Spell", ID =  }),
  DoubleDose                             = Action.Create({Type = "Spell", ID =  }),
  DeadlyPoisonDotDebuff                  = Action.Create({Type = "Spell", ID = 177918 }),
  Blindside                              = Action.Create({Type = "Spell", ID =  }),
  BlindsideBuff                          = Action.Create({Type = "Spell", ID =  }),
  VenomRush                              = Action.Create({Type = "Spell", ID = 152152 }),
  Mutilate                               = Action.Create({Type = "Spell", ID = 1329 }),
  Rupture                                = Action.Create({Type = "Spell", ID = 1943 }),
  PoolResource                           = Action.Create({Type = "Spell", ID = 9999000010 }),
  CrimsonTempest                         = Action.Create({Type = "Spell", ID = 121411 }),
  CrimsonTempestBuff                     = Action.Create({Type = "Spell", ID = 121411 }),
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
};

-- To create essences use next code:
Action:CreateEssencesFor(ACTION_CONST_ROGUE_ASSASSINATION)  -- where PLAYERSPEC is Constance (example: ACTION_CONST_MONK_BM)
local A = setmetatable(Action[ACTION_CONST_ROGUE_ASSASSINATION], { __index = Action })


-- Variables
local VarSingleTarget = 0;
local VarEnergyRegenCombined = 0;
local VarUseFiller = 0;

HL:RegisterForEvent(function()
  VarSingleTarget = 0
  VarEnergyRegenCombined = 0
  VarUseFiller = 0
end, "PLAYER_REGEN_ENABLED")

local EnemyRanges = {40, 10}
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


local function EvaluateTargetIfFilterMarkedForDeath47(unit)
  return Unit(unit):TimeToDie()
end

local function EvaluateTargetIfMarkedForDeath52(unit)
  return (MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) and (Unit(unit):TimeToDie() < Player:ComboPointsDeficit() * 1.5 or Player:ComboPointsDeficit() >= Rogue.CPMaxSpend())
end

local function EvaluateCycleFanofKnives191(unit)
    return (not Unit(unit):HasDeBuffs(A.DeadlyPoisonDotDebuff)) and (bool(VarUseFiller) and MultiUnits:GetByRangeInCombat(40, 5, 10) >= 3)
end

local function EvaluateCycleMutilate212(unit)
    return (not Unit(unit):HasDeBuffs(A.DeadlyPoisonDotDebuff)) and (bool(VarUseFiller) and MultiUnits:GetByRangeInCombat(40, 5, 10) == 2)
end

local function EvaluateCycleGarrote241(unit)
  return (not A.Subterfuge:IsSpellLearned() or not (A.Vanish:HasCooldownUps and A.Vendetta:GetCooldown() <= 4)) and Player:ComboPointsDeficit() >= 1 and Unit(unit):HasDeBuffsRefreshable(A.GarroteDebuff) and (Unit(unit):PMultiplier(A.Garrote) <= 1 or Unit(unit):HasDeBuffs(A.GarroteDebuff) <= A.GarroteDebuff:TickTime and MultiUnits:GetByRangeInCombat(40, 5, 10) >= 3 + num(A.ShroudedSuffocation:GetAzeriteRank)) and (not HL.Exsanguinated(Unit(unit), "Garrote") or Unit(unit):HasDeBuffs(A.GarroteDebuff) <= A.GarroteDebuff:TickTime * 2 and MultiUnits:GetByRangeInCombat(40, 5, 10) >= 3 + num(A.ShroudedSuffocation:GetAzeriteRank)) and not bool(ss_buffed) and (Unit(unit):TimeToDie() - Unit(unit):HasDeBuffs(A.GarroteDebuff) > 4 and MultiUnits:GetByRangeInCombat(40, 5, 10) <= 1 or Unit(unit):TimeToDie() - Unit(unit):HasDeBuffs(A.GarroteDebuff) > 12)
end

local function EvaluateCycleRupture332(unit)
  return Player:ComboPoints() >= 4 and Unit(unit):HasDeBuffsRefreshable(A.RuptureDebuff) and (Unit(unit):PMultiplier(A.Rupture) <= 1 or Unit(unit):HasDeBuffs(A.RuptureDebuff) <= A.RuptureDebuff:TickTime and MultiUnits:GetByRangeInCombat(40, 5, 10) >= 3 + num(A.ShroudedSuffocation:GetAzeriteRank)) and (not HL.Exsanguinated(Unit(unit), "Rupture") or Unit(unit):HasDeBuffs(A.RuptureDebuff) <= A.RuptureDebuff:TickTime * 2 and MultiUnits:GetByRangeInCombat(40, 5, 10) >= 3 + num(A.ShroudedSuffocation:GetAzeriteRank)) and Unit(unit):TimeToDie() - Unit(unit):HasDeBuffs(A.RuptureDebuff) > 4
end

local function EvaluateCycleGarrote411(unit)
  return A.Subterfuge:IsSpellLearned() and Unit(unit):HasDeBuffsRefreshable(A.GarroteDebuff) and Unit(unit):TimeToDie() - Unit(unit):HasDeBuffs(A.GarroteDebuff) > 2
end

local function EvaluateCycleGarrote432(unit)
  return A.Subterfuge:IsSpellLearned() and Unit(unit):HasDeBuffs(A.GarroteDebuff) <= 10 and Unit(unit):PMultiplier(A.Garrote) <= 1 and Unit(unit):TimeToDie() - Unit(unit):HasDeBuffs(A.GarroteDebuff) > 2
end

local function EvaluateCycleGarrote469(unit)
  return A.Subterfuge:IsSpellLearned() and A.ShroudedSuffocation:GetAzeriteRank and Unit(unit):TimeToDie() > Unit(unit):HasDeBuffs(A.GarroteDebuff) and Player:ComboPointsDeficit() > 1
end
--- ======= ACTION LISTS =======
-- [3] Single Rotation
A[3] = function(icon, isMulti)
	--------------------
	---  VARIABLES   ---
	--------------------
   local isMoving = A.Player:IsMoving()
   local inCombat = Unit("player"):CombatTime() > 0
   local ShouldStop = Action.ShouldStop()
   local Pull = Action.BossMods_Pulling()
   local CanMultidot = HandleMultidots()
   local unit = "player"
   ------------------------------------------------------
   ---------------- ENEMY UNIT ROTATION -----------------
   ------------------------------------------------------
   local function EnemyRotation(unit)
     local Precombat, Cds, Direct, Dot, Stealthed
   UpdateRanges()
   Everyone.AoEToggleEnemiesUpdate()
       local function Precombat(unit)
        -- flask
    -- augmentation
    -- food
    -- snapshot_stats
    -- apply_poison
    if A.ApplyPoison:IsReady(unit) then
        return A.ApplyPoison:Show(icon)
    end
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
    end
    local function Cds(unit)
        -- potion,if=buff.bloodlust.react|debuff.vendetta.up
    if A.ProlongedPower:IsReady(unit) and Action.GetToggle(1, "Potion") and (Unit("player"):HasHeroism or Target:HasDeBuffs(A.VendettaDebuff)) then
      A.ProlongedPower:Show(icon)
    end
    -- use_item,name=galecallers_boon,if=cooldown.vendetta.remains<=1&(!talent.subterfuge.enabled|dot.garrote.pmultiplier>1)|cooldown.vendetta.remains>45
    if A.GalecallersBoon:IsReady(unit) and (A.Vendetta:GetCooldown() <= 1 and (not A.Subterfuge:IsSpellLearned() or Target:PMultiplier(A.Garrote) > 1) or A.Vendetta:GetCooldown() > 45) then
      A.GalecallersBoon:Show(icon)
    end
    -- blood_fury,if=debuff.vendetta.up
    if A.BloodFury:IsReady(unit) and A.BurstIsON(unit) and (Target:HasDeBuffs(A.VendettaDebuff)) then
        return A.BloodFury:Show(icon)
    end
    -- berserking,if=debuff.vendetta.up
    if A.Berserking:IsReady(unit) and A.BurstIsON(unit) and (Target:HasDeBuffs(A.VendettaDebuff)) then
        return A.Berserking:Show(icon)
    end
    -- fireblood,if=debuff.vendetta.up
    if A.Fireblood:IsReady(unit) and A.BurstIsON(unit) and (Target:HasDeBuffs(A.VendettaDebuff)) then
        return A.Fireblood:Show(icon)
    end
    -- ancestral_call,if=debuff.vendetta.up
    if A.AncestralCall:IsReady(unit) and A.BurstIsON(unit) and (Target:HasDeBuffs(A.VendettaDebuff)) then
        return A.AncestralCall:Show(icon)
    end
    -- marked_for_death,target_if=min:target.time_to_die,if=raid_event.adds.up&(target.time_to_die<combo_points.deficit*1.5|combo_points.deficit>=cp_max_spend)
    if A.MarkedForDeath:IsReady(unit) then
        if Action.Utils.CastTargetIf(A.MarkedForDeath, 40, "min", EvaluateTargetIfFilterMarkedForDeath47, EvaluateTargetIfMarkedForDeath52) then 
            return A.MarkedForDeath:Show(icon) 
        end
    end
    -- marked_for_death,if=raid_event.adds.in>30-raid_event.adds.duration&combo_points.deficit>=cp_max_spend
    if A.MarkedForDeath:IsReady(unit) and (10000000000 > 30 - raid_event.adds.duration and Player:ComboPointsDeficit() >= Rogue.CPMaxSpend()) then
        return A.MarkedForDeath:Show(icon)
    end
    -- vendetta,if=!stealthed.rogue&dot.rupture.ticking&(!talent.subterfuge.enabled|!azerite.shrouded_suffocation.enabled|dot.garrote.pmultiplier>1)&(!talent.nightstalker.enabled|!talent.exsanguinate.enabled|cooldown.exsanguinate.remains<5-2*talent.deeper_stratagem.enabled)
    if A.Vendetta:IsReady(unit) and (not Player:IsStealthedP(true, false) and Unit(unit):HasDeBuffs(A.RuptureDebuff) and (not A.Subterfuge:IsSpellLearned() or not A.ShroudedSuffocation:GetAzeriteRank or Unit(unit):PMultiplier(A.Garrote) > 1) and (not A.Nightstalker:IsSpellLearned() or not A.Exsanguinate:IsSpellLearned() or A.Exsanguinate:GetCooldown() < 5 - 2 * num(A.DeeperStratagem:IsSpellLearned()))) then
        return A.Vendetta:Show(icon)
    end
    -- vanish,if=talent.subterfuge.enabled&!dot.garrote.ticking&variable.single_target
    if A.Vanish:IsReady(unit) and (A.Subterfuge:IsSpellLearned() and not Unit(unit):HasDeBuffs(A.GarroteDebuff) and bool(VarSingleTarget)) then
        return A.Vanish:Show(icon)
    end
    -- vanish,if=talent.exsanguinate.enabled&(talent.nightstalker.enabled|talent.subterfuge.enabled&variable.single_target)&combo_points>=cp_max_spend&cooldown.exsanguinate.remains<1&(!talent.subterfuge.enabled|!azerite.shrouded_suffocation.enabled|dot.garrote.pmultiplier<=1)
    if A.Vanish:IsReady(unit) and (A.Exsanguinate:IsSpellLearned() and (A.Nightstalker:IsSpellLearned() or A.Subterfuge:IsSpellLearned() and bool(VarSingleTarget)) and Player:ComboPoints() >= Rogue.CPMaxSpend() and A.Exsanguinate:GetCooldown() < 1 and (not A.Subterfuge:IsSpellLearned() or not A.ShroudedSuffocation:GetAzeriteRank or Unit(unit):PMultiplier(A.Garrote) <= 1)) then
        return A.Vanish:Show(icon)
    end
    -- vanish,if=talent.nightstalker.enabled&!talent.exsanguinate.enabled&combo_points>=cp_max_spend&debuff.vendetta.up
    if A.Vanish:IsReady(unit) and (A.Nightstalker:IsSpellLearned() and not A.Exsanguinate:IsSpellLearned() and Player:ComboPoints() >= Rogue.CPMaxSpend() and Unit(unit):HasDeBuffs(A.VendettaDebuff)) then
        return A.Vanish:Show(icon)
    end
    -- vanish,if=talent.subterfuge.enabled&(!talent.exsanguinate.enabled|!variable.single_target)&!stealthed.rogue&cooldown.garrote.up&dot.garrote.refreshable&(spell_targets.fan_of_knives<=3&combo_points.deficit>=1+spell_targets.fan_of_knives|spell_targets.fan_of_knives>=4&combo_points.deficit>=4)
    if A.Vanish:IsReady(unit) and (A.Subterfuge:IsSpellLearned() and (not A.Exsanguinate:IsSpellLearned() or not bool(VarSingleTarget)) and not Player:IsStealthedP(true, false) and A.Garrote:HasCooldownUps and Unit(unit):HasDeBuffsRefreshable(A.GarroteDebuff) and (MultiUnits:GetByRangeInCombat(40, 5, 10) <= 3 and Player:ComboPointsDeficit() >= 1 + MultiUnits:GetByRangeInCombat(40, 5, 10) or MultiUnits:GetByRangeInCombat(40, 5, 10) >= 4 and Player:ComboPointsDeficit() >= 4)) then
        return A.Vanish:Show(icon)
    end
    -- vanish,if=talent.master_assassin.enabled&!stealthed.all&master_assassin_remains<=0&!dot.rupture.refreshable
    if A.Vanish:IsReady(unit) and (A.MasterAssassin:IsSpellLearned() and not Player:IsStealthedP(true, true) and MasterAssassinRemains <= 0 and not Unit(unit):HasDeBuffsRefreshable(A.RuptureDebuff)) then
        return A.Vanish:Show(icon)
    end
    -- shadowmeld,if=!stealthed.all&azerite.shrouded_suffocation.enabled&dot.garrote.refreshable&dot.garrote.pmultiplier<=1&combo_points.deficit>=1
    if A.Shadowmeld:IsReady(unit) and A.BurstIsON(unit) and (not Player:IsStealthedP(true, true) and A.ShroudedSuffocation:GetAzeriteRank and Unit(unit):HasDeBuffsRefreshable(A.GarroteDebuff) and Unit(unit):PMultiplier(A.Garrote) <= 1 and Player:ComboPointsDeficit() >= 1) then
        return A.Shadowmeld:Show(icon)
    end
    -- exsanguinate,if=dot.rupture.remains>4+4*cp_max_spend&!dot.garrote.refreshable
    if A.Exsanguinate:IsReady(unit) and (Unit(unit):HasDeBuffs(A.RuptureDebuff) > 4 + 4 * Rogue.CPMaxSpend() and not Unit(unit):HasDeBuffsRefreshable(A.GarroteDebuff)) then
        return A.Exsanguinate:Show(icon)
    end
    -- toxic_blade,if=dot.rupture.ticking
    if A.ToxicBlade:IsReady(unit) and (Unit(unit):HasDeBuffs(A.RuptureDebuff)) then
        return A.ToxicBlade:Show(icon)
    end
    end
    local function Direct(unit)
        -- envenom,if=combo_points>=4+talent.deeper_stratagem.enabled&(debuff.vendetta.up|debuff.toxic_blade.up|energy.deficit<=25+variable.energy_regen_combined|!variable.single_target)&(!talent.exsanguinate.enabled|cooldown.exsanguinate.remains>2)
    if A.Envenom:IsReady(unit) and (Player:ComboPoints() >= 4 + num(A.DeeperStratagem:IsSpellLearned()) and (Unit(unit):HasDeBuffs(A.VendettaDebuff) or Unit(unit):HasDeBuffs(A.ToxicBladeDebuff) or Player:EnergyDeficitPredicted() <= 25 + VarEnergyRegenCombined or not bool(VarSingleTarget)) and (not A.Exsanguinate:IsSpellLearned() or A.Exsanguinate:GetCooldown() > 2)) then
        return A.Envenom:Show(icon)
    end
    -- variable,name=use_filler,value=combo_points.deficit>1|energy.deficit<=25+variable.energy_regen_combined|!variable.single_target
    if (true) then
      VarUseFiller = num(Player:ComboPointsDeficit() > 1 or Player:EnergyDeficitPredicted() <= 25 + VarEnergyRegenCombined or not bool(VarSingleTarget))
    end
    -- fan_of_knives,if=variable.use_filler&azerite.echoing_blades.enabled&spell_targets.fan_of_knives>=2
    if A.FanofKnives:IsReady(unit) and (bool(VarUseFiller) and A.EchoingBlades:GetAzeriteRank and MultiUnits:GetByRangeInCombat(40, 5, 10) >= 2) then
        return A.FanofKnives:Show(icon)
    end
    -- fan_of_knives,if=variable.use_filler&(buff.hidden_blades.stack>=19|spell_targets.fan_of_knives>=4+(azerite.double_dose.rank>2)+stealthed.rogue)
    if A.FanofKnives:IsReady(unit) and (bool(VarUseFiller) and (Unit("player"):HasBuffsStacks(A.HiddenBladesBuff) >= 19 or MultiUnits:GetByRangeInCombat(40, 5, 10) >= 4 + num((A.DoubleDose:GetAzeriteRank > 2)) + num(Player:IsStealthedP(true, false)))) then
        return A.FanofKnives:Show(icon)
    end
    -- fan_of_knives,target_if=!dot.deadly_poison_dot.ticking,if=variable.use_filler&spell_targets.fan_of_knives>=3
    if A.FanofKnives:IsReady(unit) then
        if Action.Utils.CastTargetIf(A.FanofKnives, 10, EvaluateCycleFanofKnives191) then
            return A.FanofKnives:Show(icon) 
        end
    end
    -- blindside,if=variable.use_filler&(buff.blindside.up|!talent.venom_rush.enabled&!azerite.double_dose.enabled)
    if A.Blindside:IsReady(unit) and (bool(VarUseFiller) and (Unit("player"):HasBuffs(A.BlindsideBuff) or not A.VenomRush:IsSpellLearned() and not A.DoubleDose:GetAzeriteRank)) then
        return A.Blindside:Show(icon)
    end
    -- mutilate,target_if=!dot.deadly_poison_dot.ticking,if=variable.use_filler&spell_targets.fan_of_knives=2
    if A.Mutilate:IsReady(unit) then
        if Action.Utils.CastTargetIf(A.Mutilate, 40, EvaluateCycleMutilate212) then
            return A.Mutilate:Show(icon) 
        end
    end
    -- mutilate,if=variable.use_filler
    if A.Mutilate:IsReady(unit) and (bool(VarUseFiller)) then
        return A.Mutilate:Show(icon)
    end
    end
    local function Dot(unit)
        -- rupture,if=talent.exsanguinate.enabled&((combo_points>=cp_max_spend&cooldown.exsanguinate.remains<1)|(!ticking&(time>10|combo_points>=2)))
    if A.Rupture:IsReady(unit) and (A.Exsanguinate:IsSpellLearned() and ((Player:ComboPoints() >= Rogue.CPMaxSpend() and A.Exsanguinate:GetCooldown() < 1) or (not Unit(unit):HasDeBuffs(A.RuptureDebuff) and (Unit("player"):CombatTime > 10 or Player:ComboPoints() >= 2)))) then
        return A.Rupture:Show(icon)
    end
    -- pool_resource,for_next=1
    -- garrote,cycle_targets=1,if=(!talent.subterfuge.enabled|!(cooldown.vanish.up&cooldown.vendetta.remains<=4))&combo_points.deficit>=1&refreshable&(pmultiplier<=1|remains<=tick_time&spell_targets.fan_of_knives>=3+azerite.shrouded_suffocation.enabled)&(!exsanguinated|remains<=tick_time*2&spell_targets.fan_of_knives>=3+azerite.shrouded_suffocation.enabled)&!ss_buffed&(target.time_to_die-remains>4&spell_targets.fan_of_knives<=1|target.time_to_die-remains>12)
    if A.Garrote:IsReady(unit) then
        if Action.Utils.CastTargetIf(A.Garrote, 40, EvaluateCycleGarrote241) then
            return A.Garrote:Show(icon) 
        end
    end
    -- crimson_tempest,if=spell_targets>=2&remains<2+(spell_targets>=5)&combo_points>=4
    if A.CrimsonTempest:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) >= 2 and Unit("player"):HasBuffs(A.CrimsonTempestBuff) < 2 + num((MultiUnits:GetByRangeInCombat(40, 5, 10) >= 5)) and Player:ComboPoints() >= 4) then
        return A.CrimsonTempest:Show(icon)
    end
    -- rupture,cycle_targets=1,if=combo_points>=4&refreshable&(pmultiplier<=1|remains<=tick_time&spell_targets.fan_of_knives>=3+azerite.shrouded_suffocation.enabled)&(!exsanguinated|remains<=tick_time*2&spell_targets.fan_of_knives>=3+azerite.shrouded_suffocation.enabled)&target.time_to_die-remains>4
    if A.Rupture:IsReady(unit) then
        if Action.Utils.CastTargetIf(A.Rupture, 5, EvaluateCycleRupture332) then
            return A.Rupture:Show(icon) 
        end
    end
    end
    local function Stealthed(unit)
        -- rupture,if=combo_points>=4&(talent.nightstalker.enabled|talent.subterfuge.enabled&(talent.exsanguinate.enabled&cooldown.exsanguinate.remains<=2|!ticking)&variable.single_target)&target.time_to_die-remains>6
    if A.Rupture:IsReady(unit) and (Player:ComboPoints() >= 4 and (A.Nightstalker:IsSpellLearned() or A.Subterfuge:IsSpellLearned() and (A.Exsanguinate:IsSpellLearned() and A.Exsanguinate:GetCooldown() <= 2 or not Unit(unit):HasDeBuffs(A.RuptureDebuff)) and bool(VarSingleTarget)) and Unit(unit):TimeToDie() - Unit(unit):HasDeBuffs(A.RuptureDebuff) > 6) then
        return A.Rupture:Show(icon)
    end
    -- garrote,cycle_targets=1,if=talent.subterfuge.enabled&refreshable&target.time_to_die-remains>2
    if A.Garrote:IsReady(unit) then
        if Action.Utils.CastTargetIf(A.Garrote, 40, EvaluateCycleGarrote411) then
            return A.Garrote:Show(icon) 
        end
    end
    -- garrote,cycle_targets=1,if=talent.subterfuge.enabled&remains<=10&pmultiplier<=1&target.time_to_die-remains>2
    if A.Garrote:IsReady(unit) then
        if Action.Utils.CastTargetIf(A.Garrote, 40, EvaluateCycleGarrote432) then
            return A.Garrote:Show(icon) 
        end
    end
    -- rupture,if=talent.subterfuge.enabled&azerite.shrouded_suffocation.enabled&!dot.rupture.ticking
    if A.Rupture:IsReady(unit) and (A.Subterfuge:IsSpellLearned() and A.ShroudedSuffocation:GetAzeriteRank and not Unit(unit):HasDeBuffs(A.RuptureDebuff)) then
        return A.Rupture:Show(icon)
    end
    -- garrote,cycle_targets=1,if=talent.subterfuge.enabled&azerite.shrouded_suffocation.enabled&target.time_to_die>remains&combo_points.deficit>1
    if A.Garrote:IsReady(unit) then
        if Action.Utils.CastTargetIf(A.Garrote, 40, EvaluateCycleGarrote469) then
            return A.Garrote:Show(icon) 
        end
    end
    -- pool_resource,for_next=1
    -- garrote,if=talent.subterfuge.enabled&talent.exsanguinate.enabled&cooldown.exsanguinate.remains<1&prev_gcd.1.rupture&dot.rupture.remains>5+4*cp_max_spend
    if A.Garrote:IsReady(unit) and (A.Subterfuge:IsSpellLearned() and A.Exsanguinate:IsSpellLearned() and A.Exsanguinate:GetCooldown() < 1 and Unit("player"):GetSpellLastCast(A.Rupture) and Unit(unit):HasDeBuffs(A.RuptureDebuff) > 5 + 4 * Rogue.CPMaxSpend()) then
      if A.Garrote:IsUsablePPool() then
          return A.Garrote:Show(icon)
      else
          return A.PoolResource:Show(icon)
      end
    end
    end
     -- call precombat
  if not inCombat and Unit(unit):IsExists() and Action.GetToggle(1, "DBM") and unit ~= "mouseover" and not Unit(unit):IsTotem() then 
    local ShouldReturn = Precombat(unit); if ShouldReturn then return ShouldReturn; end
  end
     if Everyone.TargetIsValid() then
          -- stealth
    if A.Stealth:IsReady(unit) then
        return A.Stealth:Show(icon)
    end
    -- variable,name=energy_regen_combined,value=energy.regen+poisoned_bleeds*7%(2*spell_haste)
    if (true) then
      VarEnergyRegenCombined = Player:EnergyRegen() + Rogue.PoisonedBleeds() * 7 / (2 * Player:SpellHaste)
    end
    -- variable,name=single_target,value=spell_targets.fan_of_knives<2
    if (true) then
      VarSingleTarget = num(MultiUnits:GetByRangeInCombat(40, 5, 10) < 2)
    end
    -- call_action_list,name=stealthed,if=stealthed.rogue
    if (Player:IsStealthedP(true, false)) then
      local ShouldReturn = Stealthed(unit); if ShouldReturn then return ShouldReturn; end
    end
    -- call_action_list,name=cds
    if (true) then
      local ShouldReturn = Cds(unit); if ShouldReturn then return ShouldReturn; end
    end
    -- call_action_list,name=dot
    if (true) then
      local ShouldReturn = Dot(unit); if ShouldReturn then return ShouldReturn; end
    end
    -- call_action_list,name=direct
    if (true) then
      local ShouldReturn = Direct(unit); if ShouldReturn then return ShouldReturn; end
    end
    -- arcane_torrent,if=energy.deficit>=15+variable.energy_regen_combined
    if A.ArcaneTorrent:IsReady(unit) and A.BurstIsON(unit) and (Player:EnergyDeficitPredicted() >= 15 + VarEnergyRegenCombined) then
        return A.ArcaneTorrent:Show(icon)
    end
    -- arcane_pulse
    if A.ArcanePulse:IsReady(unit) then
        return A.ArcanePulse:Show(icon)
    end
    -- lights_judgment
    if A.LightsJudgment:IsReady(unit) and A.BurstIsON(unit) then
        return A.LightsJudgment:Show(icon)
    end
     end
    end

-- Finished

-- [4] AoE Rotation
A[4] = function(icon)
    return A[3](icon, true)
end
 