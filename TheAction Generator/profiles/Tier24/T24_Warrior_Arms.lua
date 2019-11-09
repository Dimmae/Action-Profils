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
Action[ACTION_CONST_WARRIOR_ARMS] = {
  MemoryofLucidDreams                    = Action.Create({Type = "Spell", ID =  }),
  GuardianofAzeroth                      = Action.Create({Type = "Spell", ID =  }),
  Skullsplitter                          = Action.Create({Type = "Spell", ID = 260643 }),
  DeadlyCalmBuff                         = Action.Create({Type = "Spell", ID = 262228 }),
  MemoryofLucidDreamsBuff                = Action.Create({Type = "Spell", ID =  }),
  Ravager                                = Action.Create({Type = "Spell", ID = 152277 }),
  ColossusSmash                          = Action.Create({Type = "Spell", ID = 167105 }),
  Warbreaker                             = Action.Create({Type = "Spell", ID = 262161 }),
  DeadlyCalm                             = Action.Create({Type = "Spell", ID = 262228 }),
  Bladestorm                             = Action.Create({Type = "Spell", ID = 227847 }),
  TestofMightBuff                        = Action.Create({Type = "Spell", ID = 275540 }),
  Cleave                                 = Action.Create({Type = "Spell", ID = 845 }),
  Slam                                   = Action.Create({Type = "Spell", ID = 1464 }),
  CrushingAssaultBuff                    = Action.Create({Type = "Spell", ID = 278826 }),
  MortalStrike                           = Action.Create({Type = "Spell", ID = 12294 }),
  OverpowerBuff                          = Action.Create({Type = "Spell", ID = 7384 }),
  Dreadnaught                            = Action.Create({Type = "Spell", ID = 262150 }),
  ExecutionersPrecisionBuff              = Action.Create({Type = "Spell", ID = 242188 }),
  Execute                                = Action.Create({Type = "Spell", ID = 163201 }),
  Overpower                              = Action.Create({Type = "Spell", ID = 7384 }),
  ColossusSmashDebuff                    = Action.Create({Type = "Spell", ID = 208086 }),
  SweepingStrikesBuff                    = Action.Create({Type = "Spell", ID = 260708 }),
  TestofMight                            = Action.Create({Type = "Spell", ID = 275529 }),
  DeepWoundsDebuff                       = Action.Create({Type = "Spell", ID = 262115 }),
  SuddenDeathBuff                        = Action.Create({Type = "Spell", ID = 52437 }),
  StoneHeartBuff                         = Action.Create({Type = "Spell", ID = 225947 }),
  SweepingStrikes                        = Action.Create({Type = "Spell", ID = 260708 }),
  Whirlwind                              = Action.Create({Type = "Spell", ID = 1680 }),
  FervorofBattle                         = Action.Create({Type = "Spell", ID = 202316 }),
  Rend                                   = Action.Create({Type = "Spell", ID = 772 }),
  RendDebuff                             = Action.Create({Type = "Spell", ID = 772 }),
  AngerManagement                        = Action.Create({Type = "Spell", ID = 152278 }),
  SeismicWave                            = Action.Create({Type = "Spell", ID = 277639 }),
  Charge                                 = Action.Create({Type = "Spell", ID = 100 }),
  BloodFury                              = Action.Create({Type = "Spell", ID = 20572 }),
  Berserking                             = Action.Create({Type = "Spell", ID = 26297 }),
  ArcaneTorrent                          = Action.Create({Type = "Spell", ID = 50613 }),
  LightsJudgment                         = Action.Create({Type = "Spell", ID = 255647 }),
  Fireblood                              = Action.Create({Type = "Spell", ID = 265221 }),
  AncestralCall                          = Action.Create({Type = "Spell", ID = 274738 }),
  RazorCoralDeBuffDebuff                 = Action.Create({Type = "Spell", ID =  }),
  ConductiveInkDeBuffDebuff              = Action.Create({Type = "Spell", ID =  }),
  Avatar                                 = Action.Create({Type = "Spell", ID = 107574 }),
  BloodoftheEnemy                        = Action.Create({Type = "Spell", ID =  }),
  PurifyingBlast                         = Action.Create({Type = "Spell", ID =  }),
  RippleInSpace                          = Action.Create({Type = "Spell", ID =  }),
  WorldveinResonance                     = Action.Create({Type = "Spell", ID =  }),
  FocusedAzeriteBeam                     = Action.Create({Type = "Spell", ID =  }),
  ConcentratedFlame                      = Action.Create({Type = "Spell", ID =  }),
  ConcentratedFlameBurnDebuff            = Action.Create({Type = "Spell", ID =  }),
  TheUnboundForce                        = Action.Create({Type = "Spell", ID =  }),
  RecklessForceBuff                      = Action.Create({Type = "Spell", ID =  }),
  Massacre                               = Action.Create({Type = "Spell", ID = 281001 })
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
Action:CreateEssencesFor(ACTION_CONST_WARRIOR_ARMS)  -- where PLAYERSPEC is Constance (example: ACTION_CONST_MONK_BM)
local A = setmetatable(Action[ACTION_CONST_WARRIOR_ARMS], { __index = Action })



local EnemyRanges = {8}
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

S.ExecuteDefault    = Spell(163201)
S.ExecuteMassacre   = Spell(281000)

local function UpdateExecuteID()
    S.Execute = S.Massacre:IsAvailable() and S.ExecuteMassacre or S.ExecuteDefault
end

--- ======= ACTION LISTS =======
local function APL()
  local Precombat, Execute, FiveTarget, Hac, SingleTarget
  UpdateRanges()
  Everyone.AoEToggleEnemiesUpdate()
  UpdateExecuteID()
    local function Precombat(unit)
        -- flask
    -- food
    -- augmentation
    -- snapshot_stats
    -- use_item,name=azsharas_font_of_power
    if A.AzsharasFontofPower:IsReady(unit) then
      A.AzsharasFontofPower:Show(icon)
    end
    -- memory_of_lucid_dreams
    if A.MemoryofLucidDreams:IsReady(unit) then
        return A.MemoryofLucidDreams:Show(icon)
    end
    -- guardian_of_azeroth
    if A.GuardianofAzeroth:IsReady(unit) then
        return A.GuardianofAzeroth:Show(icon)
    end
    -- potion
    if A.BattlePotionofStrength:IsReady(unit) and Action.GetToggle(1, "Potion") then
      A.BattlePotionofStrength:Show(icon)
    end
    end
    local function Execute(unit)
        -- skullsplitter,if=rage<60&buff.deadly_calm.down&buff.memory_of_lucid_dreams.down
    if A.Skullsplitter:IsReady(unit) and (Player:Rage() < 60 and bool(Unit("player"):HasBuffsDown(A.DeadlyCalmBuff)) and bool(Unit("player"):HasBuffsDown(A.MemoryofLucidDreamsBuff))) then
        return A.Skullsplitter:Show(icon)
    end
    -- ravager,if=!buff.deadly_calm.up&(cooldown.colossus_smash.remains<2|(talent.warbreaker.enabled&cooldown.warbreaker.remains<2))
    if A.Ravager:IsReady(unit) and A.BurstIsON(unit) and (not Unit("player"):HasBuffs(A.DeadlyCalmBuff) and (A.ColossusSmash:GetCooldown() < 2 or (A.Warbreaker:IsSpellLearned() and A.Warbreaker:GetCooldown() < 2))) then
        return A.Ravager:Show(icon)
    end
    -- colossus_smash,if=!essence.memory_of_lucid_dreams.major|(buff.memory_of_lucid_dreams.up|cooldown.memory_of_lucid_dreams.remains>10)
    if A.ColossusSmash:IsReady(unit) and (not bool(essence.memory_of_lucid_dreams.major) or (Unit("player"):HasBuffs(A.MemoryofLucidDreamsBuff) or A.MemoryofLucidDreams:GetCooldown() > 10)) then
        return A.ColossusSmash:Show(icon)
    end
    -- warbreaker,if=!essence.memory_of_lucid_dreams.major|(buff.memory_of_lucid_dreams.up|cooldown.memory_of_lucid_dreams.remains>10)
    if A.Warbreaker:IsReady(unit) and A.BurstIsON(unit) and (not bool(essence.memory_of_lucid_dreams.major) or (Unit("player"):HasBuffs(A.MemoryofLucidDreamsBuff) or A.MemoryofLucidDreams:GetCooldown() > 10)) then
        return A.Warbreaker:Show(icon)
    end
    -- deadly_calm
    if A.DeadlyCalm:IsReady(unit) then
        return A.DeadlyCalm:Show(icon)
    end
    -- bladestorm,if=!buff.memory_of_lucid_dreams.up&buff.test_of_might.up&rage<30&!buff.deadly_calm.up
    if A.Bladestorm:IsReady(unit) and A.BurstIsON(unit) and (not Unit("player"):HasBuffs(A.MemoryofLucidDreamsBuff) and Unit("player"):HasBuffs(A.TestofMightBuff) and Player:Rage() < 30 and not Unit("player"):HasBuffs(A.DeadlyCalmBuff)) then
        return A.Bladestorm:Show(icon)
    end
    -- cleave,if=spell_targets.whirlwind>2
    if A.Cleave:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) > 2) then
        return A.Cleave:Show(icon)
    end
    -- slam,if=buff.crushing_assault.up&buff.memory_of_lucid_dreams.down
    if A.Slam:IsReady(unit) and (Unit("player"):HasBuffs(A.CrushingAssaultBuff) and bool(Unit("player"):HasBuffsDown(A.MemoryofLucidDreamsBuff))) then
        return A.Slam:Show(icon)
    end
    -- mortal_strike,if=buff.overpower.stack=2&talent.dreadnaught.enabled|buff.executioners_precision.stack=2
    if A.MortalStrike:IsReady(unit) and (Unit("player"):HasBuffsStacks(A.OverpowerBuff) == 2 and A.Dreadnaught:IsSpellLearned() or Unit("player"):HasBuffsStacks(A.ExecutionersPrecisionBuff) == 2) then
        return A.MortalStrike:Show(icon)
    end
    -- execute,if=buff.memory_of_lucid_dreams.up|buff.deadly_calm.up
    if A.Execute:IsReady(unit) and (Unit("player"):HasBuffs(A.MemoryofLucidDreamsBuff) or Unit("player"):HasBuffs(A.DeadlyCalmBuff)) then
        return A.Execute:Show(icon)
    end
    -- overpower
    if A.Overpower:IsReady(unit) then
        return A.Overpower:Show(icon)
    end
    -- execute
    if A.Execute:IsReady(unit) then
        return A.Execute:Show(icon)
    end
    end
    local function FiveTarget(unit)
        -- skullsplitter,if=rage<60&(!talent.deadly_calm.enabled|buff.deadly_calm.down)
    if A.Skullsplitter:IsReady(unit) and (Player:Rage() < 60 and (not A.DeadlyCalm:IsSpellLearned() or bool(Unit("player"):HasBuffsDown(A.DeadlyCalmBuff)))) then
        return A.Skullsplitter:Show(icon)
    end
    -- ravager,if=(!talent.warbreaker.enabled|cooldown.warbreaker.remains<2)
    if A.Ravager:IsReady(unit) and A.BurstIsON(unit) and ((not A.Warbreaker:IsSpellLearned() or A.Warbreaker:GetCooldown() < 2)) then
        return A.Ravager:Show(icon)
    end
    -- colossus_smash,if=debuff.colossus_smash.down
    if A.ColossusSmash:IsReady(unit) and (bool(Target:HasDeBuffsDown(A.ColossusSmashDebuff))) then
        return A.ColossusSmash:Show(icon)
    end
    -- warbreaker,if=debuff.colossus_smash.down
    if A.Warbreaker:IsReady(unit) and A.BurstIsON(unit) and (bool(Target:HasDeBuffsDown(A.ColossusSmashDebuff))) then
        return A.Warbreaker:Show(icon)
    end
    -- bladestorm,if=buff.sweeping_strikes.down&(!talent.deadly_calm.enabled|buff.deadly_calm.down)&((debuff.colossus_smash.remains>4.5&!azerite.test_of_might.enabled)|buff.test_of_might.up)
    if A.Bladestorm:IsReady(unit) and A.BurstIsON(unit) and (bool(Unit("player"):HasBuffsDown(A.SweepingStrikesBuff)) and (not A.DeadlyCalm:IsSpellLearned() or bool(Unit("player"):HasBuffsDown(A.DeadlyCalmBuff))) and ((Target:HasDeBuffs(A.ColossusSmashDebuff) > 4.5 and not A.TestofMight:GetAzeriteRank) or Unit("player"):HasBuffs(A.TestofMightBuff))) then
        return A.Bladestorm:Show(icon)
    end
    -- deadly_calm
    if A.DeadlyCalm:IsReady(unit) then
        return A.DeadlyCalm:Show(icon)
    end
    -- cleave
    if A.Cleave:IsReady(unit) then
        return A.Cleave:Show(icon)
    end
    -- execute,if=(!talent.cleave.enabled&dot.deep_wounds.remains<2)|(buff.sudden_death.react|buff.stone_heart.react)&(buff.sweeping_strikes.up|cooldown.sweeping_strikes.remains>8)
    if A.Execute:IsReady(unit) and ((not A.Cleave:IsSpellLearned() and Target:HasDeBuffs(A.DeepWoundsDebuff) < 2) or (bool(Unit("player"):HasBuffsStacks(A.SuddenDeathBuff)) or bool(Unit("player"):HasBuffsStacks(A.StoneHeartBuff))) and (Unit("player"):HasBuffs(A.SweepingStrikesBuff) or A.SweepingStrikes:GetCooldown() > 8)) then
        return A.Execute:Show(icon)
    end
    -- mortal_strike,if=(!talent.cleave.enabled&dot.deep_wounds.remains<2)|buff.sweeping_strikes.up&buff.overpower.stack=2&(talent.dreadnaught.enabled|buff.executioners_precision.stack=2)
    if A.MortalStrike:IsReady(unit) and ((not A.Cleave:IsSpellLearned() and Target:HasDeBuffs(A.DeepWoundsDebuff) < 2) or Unit("player"):HasBuffs(A.SweepingStrikesBuff) and Unit("player"):HasBuffsStacks(A.OverpowerBuff) == 2 and (A.Dreadnaught:IsSpellLearned() or Unit("player"):HasBuffsStacks(A.ExecutionersPrecisionBuff) == 2)) then
        return A.MortalStrike:Show(icon)
    end
    -- whirlwind,if=debuff.colossus_smash.up|(buff.crushing_assault.up&talent.fervor_of_battle.enabled)
    if A.Whirlwind:IsReady(unit) and (Target:HasDeBuffs(A.ColossusSmashDebuff) or (Unit("player"):HasBuffs(A.CrushingAssaultBuff) and A.FervorofBattle:IsSpellLearned())) then
        return A.Whirlwind:Show(icon)
    end
    -- whirlwind,if=buff.deadly_calm.up|rage>60
    if A.Whirlwind:IsReady(unit) and (Unit("player"):HasBuffs(A.DeadlyCalmBuff) or Player:Rage() > 60) then
        return A.Whirlwind:Show(icon)
    end
    -- overpower
    if A.Overpower:IsReady(unit) then
        return A.Overpower:Show(icon)
    end
    -- whirlwind
    if A.Whirlwind:IsReady(unit) then
        return A.Whirlwind:Show(icon)
    end
    end
    local function Hac(unit)
        -- rend,if=remains<=duration*0.3&(!raid_event.adds.up|buff.sweeping_strikes.up)
    if A.Rend:IsReady(unit) and (Unit(unit):HasDeBuffs(A.RendDebuff) <= A.RendDebuff:BaseDuration * 0.3 and (not (MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) or Unit("player"):HasBuffs(A.SweepingStrikesBuff))) then
        return A.Rend:Show(icon)
    end
    -- skullsplitter,if=rage<60&(cooldown.deadly_calm.remains>3|!talent.deadly_calm.enabled)
    if A.Skullsplitter:IsReady(unit) and (Player:Rage() < 60 and (A.DeadlyCalm:GetCooldown() > 3 or not A.DeadlyCalm:IsSpellLearned())) then
        return A.Skullsplitter:Show(icon)
    end
    -- deadly_calm,if=(cooldown.bladestorm.remains>6|talent.ravager.enabled&cooldown.ravager.remains>6)&(cooldown.colossus_smash.remains<2|(talent.warbreaker.enabled&cooldown.warbreaker.remains<2))
    if A.DeadlyCalm:IsReady(unit) and ((A.Bladestorm:GetCooldown() > 6 or A.Ravager:IsSpellLearned() and A.Ravager:GetCooldown() > 6) and (A.ColossusSmash:GetCooldown() < 2 or (A.Warbreaker:IsSpellLearned() and A.Warbreaker:GetCooldown() < 2))) then
        return A.DeadlyCalm:Show(icon)
    end
    -- ravager,if=(raid_event.adds.up|raid_event.adds.in>target.time_to_die)&(cooldown.colossus_smash.remains<2|(talent.warbreaker.enabled&cooldown.warbreaker.remains<2))
    if A.Ravager:IsReady(unit) and A.BurstIsON(unit) and (((MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) or 10000000000 > Unit(unit):TimeToDie()) and (A.ColossusSmash:GetCooldown() < 2 or (A.Warbreaker:IsSpellLearned() and A.Warbreaker:GetCooldown() < 2))) then
        return A.Ravager:Show(icon)
    end
    -- colossus_smash,if=raid_event.adds.up|raid_event.adds.in>40|(raid_event.adds.in>20&talent.anger_management.enabled)
    if A.ColossusSmash:IsReady(unit) and ((MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) or 10000000000 > 40 or (10000000000 > 20 and A.AngerManagement:IsSpellLearned())) then
        return A.ColossusSmash:Show(icon)
    end
    -- warbreaker,if=raid_event.adds.up|raid_event.adds.in>40|(raid_event.adds.in>20&talent.anger_management.enabled)
    if A.Warbreaker:IsReady(unit) and A.BurstIsON(unit) and ((MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) or 10000000000 > 40 or (10000000000 > 20 and A.AngerManagement:IsSpellLearned())) then
        return A.Warbreaker:Show(icon)
    end
    -- bladestorm,if=(debuff.colossus_smash.up&raid_event.adds.in>target.time_to_die)|raid_event.adds.up&((debuff.colossus_smash.remains>4.5&!azerite.test_of_might.enabled)|buff.test_of_might.up)
    if A.Bladestorm:IsReady(unit) and A.BurstIsON(unit) and ((Target:HasDeBuffs(A.ColossusSmashDebuff) and 10000000000 > Unit(unit):TimeToDie()) or (MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) and ((Target:HasDeBuffs(A.ColossusSmashDebuff) > 4.5 and not A.TestofMight:GetAzeriteRank) or Unit("player"):HasBuffs(A.TestofMightBuff))) then
        return A.Bladestorm:Show(icon)
    end
    -- overpower,if=!raid_event.adds.up|(raid_event.adds.up&azerite.seismic_wave.enabled)
    if A.Overpower:IsReady(unit) and (not (MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) or ((MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) and A.SeismicWave:GetAzeriteRank)) then
        return A.Overpower:Show(icon)
    end
    -- cleave,if=spell_targets.whirlwind>2
    if A.Cleave:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) > 2) then
        return A.Cleave:Show(icon)
    end
    -- execute,if=!raid_event.adds.up|(!talent.cleave.enabled&dot.deep_wounds.remains<2)|buff.sudden_death.react
    if A.Execute:IsReady(unit) and (not (MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) or (not A.Cleave:IsSpellLearned() and Target:HasDeBuffs(A.DeepWoundsDebuff) < 2) or bool(Unit("player"):HasBuffsStacks(A.SuddenDeathBuff))) then
        return A.Execute:Show(icon)
    end
    -- mortal_strike,if=!raid_event.adds.up|(!talent.cleave.enabled&dot.deep_wounds.remains<2)
    if A.MortalStrike:IsReady(unit) and (not (MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) or (not A.Cleave:IsSpellLearned() and Target:HasDeBuffs(A.DeepWoundsDebuff) < 2)) then
        return A.MortalStrike:Show(icon)
    end
    -- whirlwind,if=raid_event.adds.up
    if A.Whirlwind:IsReady(unit) and ((MultiUnits:GetByRangeInCombat(40, 5, 10) > 1)) then
        return A.Whirlwind:Show(icon)
    end
    -- overpower
    if A.Overpower:IsReady(unit) then
        return A.Overpower:Show(icon)
    end
    -- whirlwind,if=talent.fervor_of_battle.enabled
    if A.Whirlwind:IsReady(unit) and (A.FervorofBattle:IsSpellLearned()) then
        return A.Whirlwind:Show(icon)
    end
    -- slam,if=!talent.fervor_of_battle.enabled&!raid_event.adds.up
    if A.Slam:IsReady(unit) and (not A.FervorofBattle:IsSpellLearned() and not (MultiUnits:GetByRangeInCombat(40, 5, 10) > 1)) then
        return A.Slam:Show(icon)
    end
    end
    local function SingleTarget(unit)
        -- rend,if=remains<=duration*0.3&debuff.colossus_smash.down
    if A.Rend:IsReady(unit) and (Unit(unit):HasDeBuffs(A.RendDebuff) <= A.RendDebuff:BaseDuration * 0.3 and bool(Target:HasDeBuffsDown(A.ColossusSmashDebuff))) then
        return A.Rend:Show(icon)
    end
    -- skullsplitter,if=rage<60&buff.deadly_calm.down&buff.memory_of_lucid_dreams.down
    if A.Skullsplitter:IsReady(unit) and (Player:Rage() < 60 and bool(Unit("player"):HasBuffsDown(A.DeadlyCalmBuff)) and bool(Unit("player"):HasBuffsDown(A.MemoryofLucidDreamsBuff))) then
        return A.Skullsplitter:Show(icon)
    end
    -- ravager,if=!buff.deadly_calm.up&(cooldown.colossus_smash.remains<2|(talent.warbreaker.enabled&cooldown.warbreaker.remains<2))
    if A.Ravager:IsReady(unit) and A.BurstIsON(unit) and (not Unit("player"):HasBuffs(A.DeadlyCalmBuff) and (A.ColossusSmash:GetCooldown() < 2 or (A.Warbreaker:IsSpellLearned() and A.Warbreaker:GetCooldown() < 2))) then
        return A.Ravager:Show(icon)
    end
    -- colossus_smash,if=!essence.memory_of_lucid_dreams.major|(buff.memory_of_lucid_dreams.up|cooldown.memory_of_lucid_dreams.remains>10)
    if A.ColossusSmash:IsReady(unit) and (not bool(essence.memory_of_lucid_dreams.major) or (Unit("player"):HasBuffs(A.MemoryofLucidDreamsBuff) or A.MemoryofLucidDreams:GetCooldown() > 10)) then
        return A.ColossusSmash:Show(icon)
    end
    -- warbreaker,if=!essence.memory_of_lucid_dreams.major|(buff.memory_of_lucid_dreams.up|cooldown.memory_of_lucid_dreams.remains>10)
    if A.Warbreaker:IsReady(unit) and A.BurstIsON(unit) and (not bool(essence.memory_of_lucid_dreams.major) or (Unit("player"):HasBuffs(A.MemoryofLucidDreamsBuff) or A.MemoryofLucidDreams:GetCooldown() > 10)) then
        return A.Warbreaker:Show(icon)
    end
    -- deadly_calm
    if A.DeadlyCalm:IsReady(unit) then
        return A.DeadlyCalm:Show(icon)
    end
    -- execute,if=buff.sudden_death.react
    if A.Execute:IsReady(unit) and (bool(Unit("player"):HasBuffsStacks(A.SuddenDeathBuff))) then
        return A.Execute:Show(icon)
    end
    -- bladestorm,if=cooldown.mortal_strike.remains&(!talent.deadly_calm.enabled|buff.deadly_calm.down)&((debuff.colossus_smash.up&!azerite.test_of_might.enabled)|buff.test_of_might.up)&buff.memory_of_lucid_dreams.down
    if A.Bladestorm:IsReady(unit) and A.BurstIsON(unit) and (bool(A.MortalStrike:GetCooldown()) and (not A.DeadlyCalm:IsSpellLearned() or bool(Unit("player"):HasBuffsDown(A.DeadlyCalmBuff))) and ((Target:HasDeBuffs(A.ColossusSmashDebuff) and not A.TestofMight:GetAzeriteRank) or Unit("player"):HasBuffs(A.TestofMightBuff)) and bool(Unit("player"):HasBuffsDown(A.MemoryofLucidDreamsBuff))) then
        return A.Bladestorm:Show(icon)
    end
    -- cleave,if=spell_targets.whirlwind>2
    if A.Cleave:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) > 2) then
        return A.Cleave:Show(icon)
    end
    -- overpower,if=rage<30&buff.memory_of_lucid_dreams.up&debuff.colossus_smash.up
    if A.Overpower:IsReady(unit) and (Player:Rage() < 30 and Unit("player"):HasBuffs(A.MemoryofLucidDreamsBuff) and Target:HasDeBuffs(A.ColossusSmashDebuff)) then
        return A.Overpower:Show(icon)
    end
    -- mortal_strike
    if A.MortalStrike:IsReady(unit) then
        return A.MortalStrike:Show(icon)
    end
    -- whirlwind,if=talent.fervor_of_battle.enabled&(buff.memory_of_lucid_dreams.up|buff.deadly_calm.up)
    if A.Whirlwind:IsReady(unit) and (A.FervorofBattle:IsSpellLearned() and (Unit("player"):HasBuffs(A.MemoryofLucidDreamsBuff) or Unit("player"):HasBuffs(A.DeadlyCalmBuff))) then
        return A.Whirlwind:Show(icon)
    end
    -- overpower
    if A.Overpower:IsReady(unit) then
        return A.Overpower:Show(icon)
    end
    -- whirlwind,if=talent.fervor_of_battle.enabled
    if A.Whirlwind:IsReady(unit) and (A.FervorofBattle:IsSpellLearned()) then
        return A.Whirlwind:Show(icon)
    end
    -- slam,if=!talent.fervor_of_battle.enabled
    if A.Slam:IsReady(unit) and (not A.FervorofBattle:IsSpellLearned()) then
        return A.Slam:Show(icon)
    end
    end
  -- call precombat
  if not inCombat and Unit(unit):IsExists() and Action.GetToggle(1, "DBM") and unit ~= "mouseover" and not Unit(unit):IsTotem() then 
    local ShouldReturn = Precombat(unit); if ShouldReturn then return ShouldReturn; end
  end
  if Everyone.TargetIsValid() then
    -- charge
    if A.Charge:IsReady(unit) then
        return A.Charge:Show(icon)
    end
    -- auto_attack
    -- potion
    if A.BattlePotionofStrength:IsReady(unit) and Action.GetToggle(1, "Potion") then
      A.BattlePotionofStrength:Show(icon)
    end
    -- blood_fury,if=debuff.colossus_smash.up
    if A.BloodFury:IsReady(unit) and A.BurstIsON(unit) and (Target:HasDeBuffs(A.ColossusSmashDebuff)) then
        return A.BloodFury:Show(icon)
    end
    -- berserking,if=debuff.colossus_smash.up
    if A.Berserking:IsReady(unit) and A.BurstIsON(unit) and (Target:HasDeBuffs(A.ColossusSmashDebuff)) then
        return A.Berserking:Show(icon)
    end
    -- arcane_torrent,if=debuff.colossus_smash.down&cooldown.mortal_strike.remains>1.5&rage<50
    if A.ArcaneTorrent:IsReady(unit) and A.BurstIsON(unit) and (bool(Target:HasDeBuffsDown(A.ColossusSmashDebuff)) and A.MortalStrike:GetCooldown() > 1.5 and Player:Rage() < 50) then
        return A.ArcaneTorrent:Show(icon)
    end
    -- lights_judgment,if=debuff.colossus_smash.down
    if A.LightsJudgment:IsReady(unit) and A.BurstIsON(unit) and (bool(Target:HasDeBuffsDown(A.ColossusSmashDebuff))) then
        return A.LightsJudgment:Show(icon)
    end
    -- fireblood,if=debuff.colossus_smash.up
    if A.Fireblood:IsReady(unit) and A.BurstIsON(unit) and (Target:HasDeBuffs(A.ColossusSmashDebuff)) then
        return A.Fireblood:Show(icon)
    end
    -- ancestral_call,if=debuff.colossus_smash.up
    if A.AncestralCall:IsReady(unit) and A.BurstIsON(unit) and (Target:HasDeBuffs(A.ColossusSmashDebuff)) then
        return A.AncestralCall:Show(icon)
    end
    -- use_item,name=ashvanes_razor_coral,if=!debuff.razor_coral_debuff.up|(target.health.pct<30.1&debuff.conductive_ink_debuff.up)|(!debuff.conductive_ink_debuff.up&(buff.memory_of_lucid_dreams.up|(debuff.colossus_smash.up&!essence.memory_of_lucid_dreams.major)))
    if A.AshvanesRazorCoral:IsReady(unit) and (not Target:HasDeBuffs(A.RazorCoralDeBuffDebuff) or (Unit(unit):HealthPercent < 30.1 and Target:HasDeBuffs(A.ConductiveInkDeBuffDebuff)) or (not Target:HasDeBuffs(A.ConductiveInkDeBuffDebuff) and (Unit("player"):HasBuffs(A.MemoryofLucidDreamsBuff) or (Target:HasDeBuffs(A.ColossusSmashDebuff) and not bool(essence.memory_of_lucid_dreams.major))))) then
      A.AshvanesRazorCoral:Show(icon)
    end
    -- avatar,if=cooldown.colossus_smash.remains<8|(talent.warbreaker.enabled&cooldown.warbreaker.remains<8)
    if A.Avatar:IsReady(unit) and A.BurstIsON(unit) and (A.ColossusSmash:GetCooldown() < 8 or (A.Warbreaker:IsSpellLearned() and A.Warbreaker:GetCooldown() < 8)) then
        return A.Avatar:Show(icon)
    end
    -- sweeping_strikes,if=spell_targets.whirlwind>1&(cooldown.bladestorm.remains>10|cooldown.colossus_smash.remains>8|azerite.test_of_might.enabled)
    if A.SweepingStrikes:IsReady(unit) and (MultiUnits:GetByRangeInCombat(40, 5, 10) > 1 and (A.Bladestorm:GetCooldown() > 10 or A.ColossusSmash:GetCooldown() > 8 or A.TestofMight:GetAzeriteRank)) then
        return A.SweepingStrikes:Show(icon)
    end
    -- blood_of_the_enemy,if=buff.test_of_might.up|(debuff.colossus_smash.up&!azerite.test_of_might.enabled)
    if A.BloodoftheEnemy:IsReady(unit) and (Unit("player"):HasBuffs(A.TestofMightBuff) or (Target:HasDeBuffs(A.ColossusSmashDebuff) and not A.TestofMight:GetAzeriteRank)) then
        return A.BloodoftheEnemy:Show(icon)
    end
    -- purifying_blast,if=!debuff.colossus_smash.up&!buff.test_of_might.up
    if A.PurifyingBlast:IsReady(unit) and (not Target:HasDeBuffs(A.ColossusSmashDebuff) and not Unit("player"):HasBuffs(A.TestofMightBuff)) then
        return A.PurifyingBlast:Show(icon)
    end
    -- ripple_in_space,if=!debuff.colossus_smash.up&!buff.test_of_might.up
    if A.RippleInSpace:IsReady(unit) and (not Target:HasDeBuffs(A.ColossusSmashDebuff) and not Unit("player"):HasBuffs(A.TestofMightBuff)) then
        return A.RippleInSpace:Show(icon)
    end
    -- worldvein_resonance,if=!debuff.colossus_smash.up&!buff.test_of_might.up
    if A.WorldveinResonance:IsReady(unit) and (not Target:HasDeBuffs(A.ColossusSmashDebuff) and not Unit("player"):HasBuffs(A.TestofMightBuff)) then
        return A.WorldveinResonance:Show(icon)
    end
    -- focused_azerite_beam,if=!debuff.colossus_smash.up&!buff.test_of_might.up
    if A.FocusedAzeriteBeam:IsReady(unit) and (not Target:HasDeBuffs(A.ColossusSmashDebuff) and not Unit("player"):HasBuffs(A.TestofMightBuff)) then
        return A.FocusedAzeriteBeam:Show(icon)
    end
    -- concentrated_flame,if=!debuff.colossus_smash.up&!buff.test_of_might.up&dot.concentrated_flame_burn.remains=0
    if A.ConcentratedFlame:IsReady(unit) and (not Target:HasDeBuffs(A.ColossusSmashDebuff) and not Unit("player"):HasBuffs(A.TestofMightBuff) and Target:HasDeBuffs(A.ConcentratedFlameBurnDebuff) == 0) then
        return A.ConcentratedFlame:Show(icon)
    end
    -- the_unbound_force,if=buff.reckless_force.up
    if A.TheUnboundForce:IsReady(unit) and (Unit("player"):HasBuffs(A.RecklessForceBuff)) then
        return A.TheUnboundForce:Show(icon)
    end
    -- guardian_of_azeroth,if=cooldown.colossus_smash.remains<10
    if A.GuardianofAzeroth:IsReady(unit) and (A.ColossusSmash:GetCooldown() < 10) then
        return A.GuardianofAzeroth:Show(icon)
    end
    -- memory_of_lucid_dreams,if=!talent.warbreaker.enabled&cooldown.colossus_smash.remains<3|cooldown.warbreaker.remains<3
    if A.MemoryofLucidDreams:IsReady(unit) and (not A.Warbreaker:IsSpellLearned() and A.ColossusSmash:GetCooldown() < 3 or A.Warbreaker:GetCooldown() < 3) then
        return A.MemoryofLucidDreams:Show(icon)
    end
    -- run_action_list,name=hac,if=raid_event.adds.exists
    if ((MultiUnits:GetByRangeInCombat(40, 5, 10) > 1)) then
      return Hac(unit);
    end
    -- run_action_list,name=five_target,if=spell_targets.whirlwind>4
    if (MultiUnits:GetByRangeInCombat(40, 5, 10) > 4) then
      return FiveTarget(unit);
    end
    -- run_action_list,name=execute,if=(talent.massacre.enabled&target.health.pct<35)|target.health.pct<20
    if ((A.Massacre:IsSpellLearned() and Unit(unit):HealthPercent < 35) or Unit(unit):HealthPercent < 20) then
      return Execute(unit);
    end
    -- run_action_list,name=single_target
    if (true) then
      return SingleTarget(unit);
    end
  end
end

-- Finished

-- [4] AoE Rotation
A[4] = function(icon)
    return A[3](icon, true)
end
 