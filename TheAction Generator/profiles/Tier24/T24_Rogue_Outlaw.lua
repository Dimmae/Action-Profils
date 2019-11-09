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
  MarkedForDeath                         = Action.Create({Type = "Spell", ID = 137619 }),
  Stealth                                = Action.Create({Type = "Spell", ID =  }),
  CyclotronicBlast                       = Action.Create({Type = "Spell", ID =  }),
  RolltheBones                           = Action.Create({Type = "Spell", ID = 193316 }),
  SliceandDiceBuff                       = Action.Create({Type = "Spell", ID = 5171 }),
  SliceandDice                           = Action.Create({Type = "Spell", ID = 5171 }),
  AdrenalineRushBuff                     = Action.Create({Type = "Spell", ID = 13750 }),
  AdrenalineRush                         = Action.Create({Type = "Spell", ID = 13750 }),
  PistolShot                             = Action.Create({Type = "Spell", ID = 185763 }),
  OpportunityBuff                        = Action.Create({Type = "Spell", ID = 195627 }),
  KeepYourWitsAboutYouBuff               = Action.Create({Type = "Spell", ID =  }),
  DeadshotBuff                           = Action.Create({Type = "Spell", ID =  }),
  SinisterStrike                         = Action.Create({Type = "Spell", ID =  }),
  LatentArcana                           = Action.Create({Type = "Spell", ID =  }),
  BladeFlurry                            = Action.Create({Type = "Spell", ID = 13877 }),
  BladeFlurryBuff                        = Action.Create({Type = "Spell", ID = 13877 }),
  GhostlyStrike                          = Action.Create({Type = "Spell", ID = 196937 }),
  BroadsideBuff                          = Action.Create({Type = "Spell", ID =  }),
  KillingSpree                           = Action.Create({Type = "Spell", ID = 51690 }),
  BladeRush                              = Action.Create({Type = "Spell", ID =  }),
  Vanish                                 = Action.Create({Type = "Spell", ID = 1856 }),
  Shadowmeld                             = Action.Create({Type = "Spell", ID = 58984 }),
  BloodFury                              = Action.Create({Type = "Spell", ID = 20572 }),
  Berserking                             = Action.Create({Type = "Spell", ID = 26297 }),
  Fireblood                              = Action.Create({Type = "Spell", ID = 265221 }),
  AncestralCall                          = Action.Create({Type = "Spell", ID = 274738 }),
  MemoryofLucidDreamsBuff                = Action.Create({Type = "Spell", ID =  }),
  RazorCoralDeBuffDebuff                 = Action.Create({Type = "Spell", ID =  }),
  ConductiveInkDeBuffDebuff              = Action.Create({Type = "Spell", ID =  }),
  BloodoftheEnemyDebuff                  = Action.Create({Type = "Spell", ID =  }),
  ConcentratedFlame                      = Action.Create({Type = "Spell", ID =  }),
  ConcentratedFlameBurnDebuff            = Action.Create({Type = "Spell", ID =  }),
  BloodoftheEnemy                        = Action.Create({Type = "Spell", ID =  }),
  BetweentheEyes                         = Action.Create({Type = "Spell", ID = 199804 }),
  GuardianofAzeroth                      = Action.Create({Type = "Spell", ID =  }),
  FocusedAzeriteBeam                     = Action.Create({Type = "Spell", ID =  }),
  PurifyingBlast                         = Action.Create({Type = "Spell", ID =  }),
  TheUnboundForce                        = Action.Create({Type = "Spell", ID =  }),
  RecklessForceBuff                      = Action.Create({Type = "Spell", ID =  }),
  RecklessForceCounterBuff               = Action.Create({Type = "Spell", ID =  }),
  RippleInSpace                          = Action.Create({Type = "Spell", ID =  }),
  WorldveinResonance                     = Action.Create({Type = "Spell", ID =  }),
  LifebloodBuff                          = Action.Create({Type = "Spell", ID =  }),
  MemoryofLucidDreams                    = Action.Create({Type = "Spell", ID =  }),
  RolltheBonesBuff                       = Action.Create({Type = "Spell", ID =  }),
  AceUpYourSleeve                        = Action.Create({Type = "Spell", ID =  }),
  Deadshot                               = Action.Create({Type = "Spell", ID =  }),
  Dispatch                               = Action.Create({Type = "Spell", ID =  }),
  Ambush                                 = Action.Create({Type = "Spell", ID = 8676 }),
  LoadedDiceBuff                         = Action.Create({Type = "Spell", ID = 240837 }),
  GrandMeleeBuff                         = Action.Create({Type = "Spell", ID =  }),
  RuthlessPrecisionBuff                  = Action.Create({Type = "Spell", ID =  }),
  SnakeEyes                              = Action.Create({Type = "Spell", ID =  }),
  SnakeEyesBuff                          = Action.Create({Type = "Spell", ID =  }),
  SkullandCrossbonesBuff                 = Action.Create({Type = "Spell", ID =  }),
  QuickDraw                              = Action.Create({Type = "Spell", ID = 196938 }),
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
Action:CreateEssencesFor(ACTION_CONST_ROGUE_OUTLAW)  -- where PLAYERSPEC is Constance (example: ACTION_CONST_MONK_BM)
local A = setmetatable(Action[ACTION_CONST_ROGUE_OUTLAW], { __index = Action })


-- Variables
local VarBladeFlurrySync = 0;
local VarAmbushCondition = 0;
local VarBteCondition = 0;
local VarRtbReroll = 0;

HL:RegisterForEvent(function()
  VarBladeFlurrySync = 0
  VarAmbushCondition = 0
  VarBteCondition = 0
  VarRtbReroll = 0
end, "PLAYER_REGEN_ENABLED")

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


local function EvaluateTargetIfFilterMarkedForDeath55(unit)
  return Unit(unit):TimeToDie()
end

local function EvaluateTargetIfMarkedForDeath60(unit)
  return (MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) and (Unit(unit):TimeToDie() < Player:ComboPointsDeficit() or not Player:IsStealthedP(true, false) and Player:ComboPointsDeficit() >= Rogue.CPMaxSpend() - 1)
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
     local Precombat, Build, Cds, Essences, Finish, Stealth
   UpdateRanges()
   Everyone.AoEToggleEnemiesUpdate()
       local function Precombat(unit)
        -- flask
    -- augmentation
    -- food
    -- snapshot_stats
    -- potion
    if A.ProlongedPower:IsReady(unit) and Action.GetToggle(1, "Potion") then
      A.ProlongedPower:Show(icon)
    end
    -- marked_for_death,precombat_seconds=5,if=raid_event.adds.in>40
    if A.MarkedForDeath:IsReady(unit) and (10000000000 > 40) then
        return A.MarkedForDeath:Show(icon)
    end
    -- stealth,if=(!equipped.pocketsized_computation_device|!cooldown.cyclotronic_blast.duration|raid_event.invulnerable.exists)
    if A.Stealth:IsReady(unit) and ((not A.PocketsizedComputationDevice:IsEquipped or not bool(A.CyclotronicBlast:BaseDuration) or bool(raid_event.invulnerable.exists))) then
        return A.Stealth:Show(icon)
    end
    -- roll_the_bones,precombat_seconds=2
    if A.RolltheBones:IsReady(unit) then
        return A.RolltheBones:Show(icon)
    end
    -- slice_and_dice,precombat_seconds=2
    if A.SliceandDice:IsReady(unit) and Player:HasBuffsDown(A.SliceandDiceBuff) then
        return A.SliceandDice:Show(icon)
    end
    -- adrenaline_rush,precombat_seconds=1,if=(!equipped.pocketsized_computation_device|!cooldown.cyclotronic_blast.duration|raid_event.invulnerable.exists)
    if A.AdrenalineRush:IsReady(unit) and Player:HasBuffsDown(A.AdrenalineRushBuff) and ((not A.PocketsizedComputationDevice:IsEquipped or not bool(A.CyclotronicBlast:BaseDuration) or bool(raid_event.invulnerable.exists))) then
        return A.AdrenalineRush:Show(icon)
    end
    -- use_item,name=azsharas_font_of_power
    if A.AzsharasFontofPower:IsReady(unit) then
      A.AzsharasFontofPower:Show(icon)
    end
    -- use_item,effect_name=cyclotronic_blast,if=!raid_event.invulnerable.exists
    if A.:IsReady(unit) and (not bool(raid_event.invulnerable.exists)) then
      A.:Show(icon)
    end
    end
    local function Build(unit)
        -- pistol_shot,if=buff.opportunity.up&(buff.keep_your_wits_about_you.stack<14|buff.deadshot.up|energy<45)
    if A.PistolShot:IsReady(unit) and (Unit("player"):HasBuffs(A.OpportunityBuff) and (Unit("player"):HasBuffsStacks(A.KeepYourWitsAboutYouBuff) < 14 or Unit("player"):HasBuffs(A.DeadshotBuff) or Player:EnergyPredicted() < 45)) then
        return A.PistolShot:Show(icon)
    end
    -- sinister_strike
    if A.SinisterStrike:IsReady(unit) then
        return A.SinisterStrike:Show(icon)
    end
    end
    local function Cds(unit)
        -- call_action_list,name=essences,if=!stealthed.all
    if (not Player:IsStealthedP(true, true)) then
      local ShouldReturn = Essences(unit); if ShouldReturn then return ShouldReturn; end
    end
    -- adrenaline_rush,if=!buff.adrenaline_rush.up&energy.time_to_max>1&(!equipped.azsharas_font_of_power|cooldown.latent_arcana.remains>20)
    if A.AdrenalineRush:IsReady(unit) and (not Unit("player"):HasBuffs(A.AdrenalineRushBuff) and Player:EnergyTimeToMaxPredicted() > 1 and (not A.AzsharasFontofPower:IsEquipped or A.LatentArcana:GetCooldown() > 20)) then
        return A.AdrenalineRush:Show(icon)
    end
    -- marked_for_death,target_if=min:target.time_to_die,if=raid_event.adds.up&(target.time_to_die<combo_points.deficit|!stealthed.rogue&combo_points.deficit>=cp_max_spend-1)
    if A.MarkedForDeath:IsReady(unit) then
        if Action.Utils.CastTargetIf(A.MarkedForDeath, 40, "min", EvaluateTargetIfFilterMarkedForDeath55, EvaluateTargetIfMarkedForDeath60) then 
            return A.MarkedForDeath:Show(icon) 
        end
    end
    -- marked_for_death,if=raid_event.adds.in>30-raid_event.adds.duration&!stealthed.rogue&combo_points.deficit>=cp_max_spend-1
    if A.MarkedForDeath:IsReady(unit) and (10000000000 > 30 - raid_event.adds.duration and not Player:IsStealthedP(true, false) and Player:ComboPointsDeficit() >= Rogue.CPMaxSpend() - 1) then
        return A.MarkedForDeath:Show(icon)
    end
    -- blade_flurry,if=spell_targets>=2&!buff.blade_flurry.up&(!raid_event.adds.exists|raid_event.adds.remains>8|raid_event.adds.in>(2-cooldown.blade_flurry.charges_fractional)*25)
    if A.BladeFlurry:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) >= 2 and not Unit("player"):HasBuffs(A.BladeFlurryBuff) and (not (MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) or 0 > 8 or 10000000000 > (2 - A.BladeFlurry:ChargesFractionalP()) * 25)) then
        return A.BladeFlurry:Show(icon)
    end
    -- ghostly_strike,if=variable.blade_flurry_sync&combo_points.deficit>=1+buff.broadside.up
    if A.GhostlyStrike:IsReady(unit) and (bool(VarBladeFlurrySync) and Player:ComboPointsDeficit() >= 1 + num(Unit("player"):HasBuffs(A.BroadsideBuff))) then
        return A.GhostlyStrike:Show(icon)
    end
    -- killing_spree,if=variable.blade_flurry_sync&(energy.time_to_max>5|energy<15)
    if A.KillingSpree:IsReady(unit) and (bool(VarBladeFlurrySync) and (Player:EnergyTimeToMaxPredicted() > 5 or Player:EnergyPredicted() < 15)) then
        return A.KillingSpree:Show(icon)
    end
    -- blade_rush,if=variable.blade_flurry_sync&energy.time_to_max>1
    if A.BladeRush:IsReady(unit) and (bool(VarBladeFlurrySync) and Player:EnergyTimeToMaxPredicted() > 1) then
        return A.BladeRush:Show(icon)
    end
    -- vanish,if=!stealthed.all&variable.ambush_condition
    if A.Vanish:IsReady(unit) and (not Player:IsStealthedP(true, true) and bool(VarAmbushCondition)) then
        return A.Vanish:Show(icon)
    end
    -- shadowmeld,if=!stealthed.all&variable.ambush_condition
    if A.Shadowmeld:IsReady(unit) and A.BurstIsON(unit) and (not Player:IsStealthedP(true, true) and bool(VarAmbushCondition)) then
        return A.Shadowmeld:Show(icon)
    end
    -- potion,if=buff.bloodlust.react|buff.adrenaline_rush.up
    if A.ProlongedPower:IsReady(unit) and Action.GetToggle(1, "Potion") and (Unit("player"):HasHeroism or Unit("player"):HasBuffs(A.AdrenalineRushBuff)) then
      A.ProlongedPower:Show(icon)
    end
    -- blood_fury
    if A.BloodFury:IsReady(unit) and A.BurstIsON(unit) then
        return A.BloodFury:Show(icon)
    end
    -- berserking
    if A.Berserking:IsReady(unit) and A.BurstIsON(unit) then
        return A.Berserking:Show(icon)
    end
    -- fireblood
    if A.Fireblood:IsReady(unit) and A.BurstIsON(unit) then
        return A.Fireblood:Show(icon)
    end
    -- ancestral_call
    if A.AncestralCall:IsReady(unit) and A.BurstIsON(unit) then
        return A.AncestralCall:Show(icon)
    end
    -- use_item,effect_name=cyclotronic_blast,if=!stealthed.all&buff.adrenaline_rush.down&buff.memory_of_lucid_dreams.down&energy.time_to_max>4&rtb_buffs<5
    if A.:IsReady(unit) and (not Player:IsStealthedP(true, true) and bool(Unit("player"):HasBuffsDown(A.AdrenalineRushBuff)) and bool(Unit("player"):HasBuffsDown(A.MemoryofLucidDreamsBuff)) and Player:EnergyTimeToMaxPredicted() > 4 and RtB_Buffs < 5) then
      A.:Show(icon)
    end
    -- use_item,name=azsharas_font_of_power,if=!buff.adrenaline_rush.up&!buff.blade_flurry.up&cooldown.adrenaline_rush.remains<15
    if A.AzsharasFontofPower:IsReady(unit) and (not Unit("player"):HasBuffs(A.AdrenalineRushBuff) and not Unit("player"):HasBuffs(A.BladeFlurryBuff) and A.AdrenalineRush:GetCooldown() < 15) then
      A.AzsharasFontofPower:Show(icon)
    end
    -- use_item,name=ashvanes_razor_coral,if=debuff.razor_coral_debuff.down|debuff.conductive_ink_debuff.up&target.health.pct<32&target.health.pct>=30|!debuff.conductive_ink_debuff.up&(debuff.razor_coral_debuff.stack>=20-10*debuff.blood_of_the_enemy.up|target.time_to_die<60)&buff.adrenaline_rush.remains>18
    if A.AshvanesRazorCoral:IsReady(unit) and (bool(Unit(unit):HasDeBuffsDown(A.RazorCoralDeBuffDebuff)) or Unit(unit):HasDeBuffs(A.ConductiveInkDeBuffDebuff) and Unit(unit):HealthPercent < 32 and Unit(unit):HealthPercent >= 30 or not Unit(unit):HasDeBuffs(A.ConductiveInkDeBuffDebuff) and (Unit(unit):HasDeBuffsStacks(A.RazorCoralDeBuffDebuff) >= 20 - 10 * num(Unit(unit):HasDeBuffs(A.BloodoftheEnemyDebuff)) or Unit(unit):TimeToDie() < 60) and Unit("player"):HasBuffs(A.AdrenalineRushBuff) > 18) then
      A.AshvanesRazorCoral:Show(icon)
    end
    -- use_items,if=buff.bloodlust.react|target.time_to_die<=20|combo_points.deficit<=2
    end
    local function Essences(unit)
        -- concentrated_flame,if=energy.time_to_max>1&!buff.blade_flurry.up&(!dot.concentrated_flame_burn.ticking&!action.concentrated_flame.in_flight|full_recharge_time<gcd.max)
    if A.ConcentratedFlame:IsReady(unit) and (Player:EnergyTimeToMaxPredicted() > 1 and not Unit("player"):HasBuffs(A.BladeFlurryBuff) and (not Unit(unit):HasDeBuffs(A.ConcentratedFlameBurnDebuff) and not A.ConcentratedFlame:IsSpellInFlight() or A.ConcentratedFlame:FullRechargeTimeP() < A.GetGCD())) then
        return A.ConcentratedFlame:Show(icon)
    end
    -- blood_of_the_enemy,if=variable.blade_flurry_sync&cooldown.between_the_eyes.up&variable.bte_condition
    if A.BloodoftheEnemy:IsReady(unit) and (bool(VarBladeFlurrySync) and A.BetweentheEyes:HasCooldownUps and bool(VarBteCondition)) then
        return A.BloodoftheEnemy:Show(icon)
    end
    -- guardian_of_azeroth
    if A.GuardianofAzeroth:IsReady(unit) then
        return A.GuardianofAzeroth:Show(icon)
    end
    -- focused_azerite_beam,if=spell_targets.blade_flurry>=2|raid_event.adds.in>60&!buff.adrenaline_rush.up
    if A.FocusedAzeriteBeam:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) >= 2 or 10000000000 > 60 and not Unit("player"):HasBuffs(A.AdrenalineRushBuff)) then
        return A.FocusedAzeriteBeam:Show(icon)
    end
    -- purifying_blast,if=spell_targets.blade_flurry>=2|raid_event.adds.in>60
    if A.PurifyingBlast:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) >= 2 or 10000000000 > 60) then
        return A.PurifyingBlast:Show(icon)
    end
    -- the_unbound_force,if=buff.reckless_force.up|buff.reckless_force_counter.stack<10
    if A.TheUnboundForce:IsReady(unit) and (Unit("player"):HasBuffs(A.RecklessForceBuff) or Unit("player"):HasBuffsStacks(A.RecklessForceCounterBuff) < 10) then
        return A.TheUnboundForce:Show(icon)
    end
    -- ripple_in_space
    if A.RippleInSpace:IsReady(unit) then
        return A.RippleInSpace:Show(icon)
    end
    -- worldvein_resonance,if=buff.lifeblood.stack<3
    if A.WorldveinResonance:IsReady(unit) and (Unit("player"):HasBuffsStacks(A.LifebloodBuff) < 3) then
        return A.WorldveinResonance:Show(icon)
    end
    -- memory_of_lucid_dreams,if=energy<45
    if A.MemoryofLucidDreams:IsReady(unit) and (Player:EnergyPredicted() < 45) then
        return A.MemoryofLucidDreams:Show(icon)
    end
    end
    local function Finish(unit)
        -- between_the_eyes,if=variable.bte_condition
    if A.BetweentheEyes:IsReady(unit) and (bool(VarBteCondition)) then
        return A.BetweentheEyes:Show(icon)
    end
    -- slice_and_dice,if=buff.slice_and_dice.remains<target.time_to_die&buff.slice_and_dice.remains<(1+combo_points)*1.8
    if A.SliceandDice:IsReady(unit) and (Unit("player"):HasBuffs(A.SliceandDiceBuff) < Unit(unit):TimeToDie() and Unit("player"):HasBuffs(A.SliceandDiceBuff) < (1 + Player:ComboPoints()) * 1.8) then
        return A.SliceandDice:Show(icon)
    end
    -- roll_the_bones,if=buff.roll_the_bones.remains<=3|variable.rtb_reroll
    if A.RolltheBones:IsReady(unit) and (Unit("player"):HasBuffs(A.RolltheBonesBuff) <= 3 or bool(VarRtbReroll)) then
        return A.RolltheBones:Show(icon)
    end
    -- between_the_eyes,if=azerite.ace_up_your_sleeve.enabled|azerite.deadshot.enabled
    if A.BetweentheEyes:IsReady(unit) and (A.AceUpYourSleeve:GetAzeriteRank or A.Deadshot:GetAzeriteRank) then
        return A.BetweentheEyes:Show(icon)
    end
    -- dispatch
    if A.Dispatch:IsReady(unit) then
        return A.Dispatch:Show(icon)
    end
    end
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
     if Everyone.TargetIsValid() then
          -- stealth
    if A.Stealth:IsReady(unit) then
        return A.Stealth:Show(icon)
    end
    -- variable,name=rtb_reroll,value=rtb_buffs<2&(buff.loaded_dice.up|!buff.grand_melee.up&!buff.ruthless_precision.up)
    if (true) then
      VarRtbReroll = num(RtB_Buffs < 2 and (Unit("player"):HasBuffs(A.LoadedDiceBuff) or not Unit("player"):HasBuffs(A.GrandMeleeBuff) and not Unit("player"):HasBuffs(A.RuthlessPrecisionBuff)))
    end
    -- variable,name=rtb_reroll,op=set,if=azerite.deadshot.enabled|azerite.ace_up_your_sleeve.enabled,value=rtb_buffs<2&(buff.loaded_dice.up|buff.ruthless_precision.remains<=cooldown.between_the_eyes.remains)
    if (A.Deadshot:GetAzeriteRank or A.AceUpYourSleeve:GetAzeriteRank) then
      VarRtbReroll = num(RtB_Buffs < 2 and (Unit("player"):HasBuffs(A.LoadedDiceBuff) or Unit("player"):HasBuffs(A.RuthlessPrecisionBuff) <= A.BetweentheEyes:GetCooldown()))
    end
    -- variable,name=rtb_reroll,op=set,if=azerite.snake_eyes.rank>=2,value=rtb_buffs<2
    if (A.SnakeEyes:GetAzeriteRank >= 2) then
      VarRtbReroll = num(RtB_Buffs < 2)
    end
    -- variable,name=rtb_reroll,op=reset,if=azerite.snake_eyes.rank>=2&buff.snake_eyes.stack>=2-buff.broadside.up
    if (A.SnakeEyes:GetAzeriteRank >= 2 and Unit("player"):HasBuffsStacks(A.SnakeEyesBuff) >= 2 - num(Unit("player"):HasBuffs(A.BroadsideBuff))) then
      VarRtbReroll = 0
    end
    -- variable,name=rtb_reroll,op=set,if=buff.blade_flurry.up,value=rtb_buffs-buff.skull_and_crossbones.up<2&(buff.loaded_dice.up|!buff.grand_melee.up&!buff.ruthless_precision.up&!buff.broadside.up)
    if (Unit("player"):HasBuffs(A.BladeFlurryBuff)) then
      VarRtbReroll = num(RtB_Buffs - num(Unit("player"):HasBuffs(A.SkullandCrossbonesBuff)) < 2 and (Unit("player"):HasBuffs(A.LoadedDiceBuff) or not Unit("player"):HasBuffs(A.GrandMeleeBuff) and not Unit("player"):HasBuffs(A.RuthlessPrecisionBuff) and not Unit("player"):HasBuffs(A.BroadsideBuff)))
    end
    -- variable,name=ambush_condition,value=combo_points.deficit>=2+2*(talent.ghostly_strike.enabled&cooldown.ghostly_strike.remains<1)+buff.broadside.up&energy>60&!buff.skull_and_crossbones.up&!buff.keep_your_wits_about_you.up
    if (true) then
      VarAmbushCondition = num(Player:ComboPointsDeficit() >= 2 + 2 * num((A.GhostlyStrike:IsSpellLearned() and A.GhostlyStrike:GetCooldown() < 1)) + num(Unit("player"):HasBuffs(A.BroadsideBuff)) and Player:EnergyPredicted() > 60 and not Unit("player"):HasBuffs(A.SkullandCrossbonesBuff) and not Unit("player"):HasBuffs(A.KeepYourWitsAboutYouBuff))
    end
    -- variable,name=bte_condition,value=buff.ruthless_precision.up|(azerite.deadshot.enabled|azerite.ace_up_your_sleeve.enabled)&buff.roll_the_bones.up
    if (true) then
      VarBteCondition = num(Unit("player"):HasBuffs(A.RuthlessPrecisionBuff) or (A.Deadshot:GetAzeriteRank or A.AceUpYourSleeve:GetAzeriteRank) and Unit("player"):HasBuffs(A.RolltheBonesBuff))
    end
    -- variable,name=blade_flurry_sync,value=spell_targets.blade_flurry<2&raid_event.adds.in>20|buff.blade_flurry.up
    if (true) then
      VarBladeFlurrySync = num(MultiUnits:GetByRangeInCombat(40, 5, 10) < 2 and 10000000000 > 20 or Unit("player"):HasBuffs(A.BladeFlurryBuff))
    end
    -- call_action_list,name=stealth,if=stealthed.all
    if (Player:IsStealthedP(true, true)) then
      local ShouldReturn = Stealth(unit); if ShouldReturn then return ShouldReturn; end
    end
    -- call_action_list,name=cds
    if (true) then
      local ShouldReturn = Cds(unit); if ShouldReturn then return ShouldReturn; end
    end
    -- run_action_list,name=finish,if=combo_points>=cp_max_spend-(buff.broadside.up+buff.opportunity.up)*(talent.quick_draw.enabled&(!talent.marked_for_death.enabled|cooldown.marked_for_death.remains>1))*(azerite.ace_up_your_sleeve.rank<2|!cooldown.between_the_eyes.up|!buff.roll_the_bones.up)
    if (Player:ComboPoints() >= Rogue.CPMaxSpend() - (num(Unit("player"):HasBuffs(A.BroadsideBuff)) + num(Unit("player"):HasBuffs(A.OpportunityBuff))) * num((A.QuickDraw:IsSpellLearned() and (not A.MarkedForDeath:IsSpellLearned() or A.MarkedForDeath:GetCooldown() > 1))) * num((A.AceUpYourSleeve:GetAzeriteRank < 2 or not A.BetweentheEyes:HasCooldownUps or not Unit("player"):HasBuffs(A.RolltheBonesBuff)))) then
      return Finish(unit);
    end
    -- call_action_list,name=build
    if (true) then
      local ShouldReturn = Build(unit); if ShouldReturn then return ShouldReturn; end
    end
    -- arcane_torrent,if=energy.deficit>=15+energy.regen
    if A.ArcaneTorrent:IsReady(unit) and A.BurstIsON(unit) and (Player:EnergyDeficitPredicted() >= 15 + Player:EnergyRegen()) then
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
 