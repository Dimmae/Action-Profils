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
Action[ACTION_CONST_DRUID_GUARDIAN] = {
  MemoryofLucidDreams                    = Action.Create({Type = "Spell", ID =  }),
  BearFormBuff                           = Action.Create({Type = "Spell", ID = 5487 }),
  BearForm                               = Action.Create({Type = "Spell", ID = 5487 }),
  HeartEssence                           = Action.Create({Type = "Spell", ID =  }),
  BloodFury                              = Action.Create({Type = "Spell", ID = 20572 }),
  Berserking                             = Action.Create({Type = "Spell", ID = 26297 }),
  ArcaneTorrent                          = Action.Create({Type = "Spell", ID = 50613 }),
  LightsJudgment                         = Action.Create({Type = "Spell", ID = 255647 }),
  Fireblood                              = Action.Create({Type = "Spell", ID = 265221 }),
  AncestralCall                          = Action.Create({Type = "Spell", ID = 274738 }),
  Barkskin                               = Action.Create({Type = "Spell", ID = 22812 }),
  LunarBeam                              = Action.Create({Type = "Spell", ID = 204066 }),
  BristlingFur                           = Action.Create({Type = "Spell", ID = 155835 }),
  Incarnation                            = Action.Create({Type = "Spell", ID = 102558 }),
  MoonfireDebuff                         = Action.Create({Type = "Spell", ID = 164812 }),
  IncarnationBuff                        = Action.Create({Type = "Spell", ID = 102558 }),
  ThrashBearDebuff                       = Action.Create({Type = "Spell", ID = 192090 }),
  RazorCoralDeBuffDebuff                 = Action.Create({Type = "Spell", ID =  }),
  ConductiveInkDeBuffDebuff              = Action.Create({Type = "Spell", ID =  }),
  Maul                                   = Action.Create({Type = "Spell", ID = 6807 }),
  SharpenedClawsBuff                     = Action.Create({Type = "Spell", ID =  }),
  Ironfur                                = Action.Create({Type = "Spell", ID = 192081 }),
  IronfurBuff                            = Action.Create({Type = "Spell", ID = 192081 }),
  LayeredMane                            = Action.Create({Type = "Spell", ID = 279552 }),
  Pulverize                              = Action.Create({Type = "Spell", ID = 80313 }),
  Moonfire                               = Action.Create({Type = "Spell", ID = 8921 }),
  ThrashCat                              = Action.Create({Type = "Spell", ID = 106830 }),
  ThrashBear                             = Action.Create({Type = "Spell", ID = 77758 }),
  SwipeCat                               = Action.Create({Type = "Spell", ID = 106785 }),
  SwipeBear                              = Action.Create({Type = "Spell", ID = 213771 }),
  Mangle                                 = Action.Create({Type = "Spell", ID = 33917 }),
  GalacticGuardianBuff                   = Action.Create({Type = "Spell", ID = 213708 })
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
Action:CreateEssencesFor(ACTION_CONST_DRUID_GUARDIAN)  -- where PLAYERSPEC is Constance (example: ACTION_CONST_MONK_BM)
local A = setmetatable(Action[ACTION_CONST_DRUID_GUARDIAN], { __index = Action })



local EnemyRanges = {40}
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

local function Swipe()
  if Player:Buff(S.CatForm) then
    return S.SwipeCat;
  else
    return S.SwipeBear;
  end
end

local function Thrash()
  if Player:Buff(S.CatForm) then
    return S.ThrashCat;
  else
    return S.ThrashBear;
  end
end


local function EvaluateCyclePulverize105(unit)
    return Unit(unit):HasDeBuffsStacks(A.ThrashBearDebuff) == dot.thrash_bear.max_stacks
end

local function EvaluateCycleMoonfire116(unit)
    return Unit(unit):HasDeBuffsRefreshable(A.MoonfireDebuff) and MultiUnits:GetByRangeInCombat(40, 5, 10) < 2
end

local function EvaluateCycleMoonfire165(unit)
    return Unit("player"):HasBuffs(A.GalacticGuardianBuff) and MultiUnits:GetByRangeInCombat(40, 5, 10) < 2
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
     local Precombat, Cooldowns
   UpdateRanges()
   Everyone.AoEToggleEnemiesUpdate()
       local function Precombat(unit)
        -- flask
    -- food
    -- augmentation
    -- snapshot_stats
    -- memory_of_lucid_dreams
    if A.MemoryofLucidDreams:IsReady(unit) then
        return A.MemoryofLucidDreams:Show(icon)
    end
    -- bear_form
    if A.BearForm:IsReady(unit) and Player:HasBuffsDown(A.BearFormBuff) then
        return A.BearForm:Show(icon)
    end
    -- potion
    if A.BattlePotionofAgility:IsReady(unit) and Action.GetToggle(1, "Potion") then
      A.BattlePotionofAgility:Show(icon)
    end
    end
    local function Cooldowns(unit)
        -- potion
    if A.BattlePotionofAgility:IsReady(unit) and Action.GetToggle(1, "Potion") then
      A.BattlePotionofAgility:Show(icon)
    end
    -- heart_essence
    if A.HeartEssence:IsReady(unit) then
        return A.HeartEssence:Show(icon)
    end
    -- blood_fury
    if A.BloodFury:IsReady(unit) and A.BurstIsON(unit) then
        return A.BloodFury:Show(icon)
    end
    -- berserking
    if A.Berserking:IsReady(unit) and A.BurstIsON(unit) then
        return A.Berserking:Show(icon)
    end
    -- arcane_torrent
    if A.ArcaneTorrent:IsReady(unit) and A.BurstIsON(unit) then
        return A.ArcaneTorrent:Show(icon)
    end
    -- lights_judgment
    if A.LightsJudgment:IsReady(unit) and A.BurstIsON(unit) then
        return A.LightsJudgment:Show(icon)
    end
    -- fireblood
    if A.Fireblood:IsReady(unit) and A.BurstIsON(unit) then
        return A.Fireblood:Show(icon)
    end
    -- ancestral_call
    if A.AncestralCall:IsReady(unit) and A.BurstIsON(unit) then
        return A.AncestralCall:Show(icon)
    end
    -- barkskin,if=buff.bear_form.up
    if A.Barkskin:IsReady(unit) and (Unit("player"):HasBuffs(A.BearFormBuff)) then
        return A.Barkskin:Show(icon)
    end
    -- lunar_beam,if=buff.bear_form.up
    if A.LunarBeam:IsReady(unit) and (Unit("player"):HasBuffs(A.BearFormBuff)) then
        return A.LunarBeam:Show(icon)
    end
    -- bristling_fur,if=buff.bear_form.up
    if A.BristlingFur:IsReady(unit) and (Unit("player"):HasBuffs(A.BearFormBuff)) then
        return A.BristlingFur:Show(icon)
    end
    -- incarnation,if=(dot.moonfire.ticking|active_enemies>1)&dot.thrash_bear.ticking
    if A.Incarnation:IsReady(unit) and ((Target:HasDeBuffs(A.MoonfireDebuff) or MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) and Target:HasDeBuffs(A.ThrashBearDebuff)) then
        return A.Incarnation:Show(icon)
    end
    -- use_item,name=ashvanes_razor_coral,if=debuff.razor_coral_debuff.down|debuff.conductive_ink_debuff.up&target.health.pct<31|target.time_to_die<20
    if A.AshvanesRazorCoral:IsReady(unit) and (bool(Target:HasDeBuffsDown(A.RazorCoralDeBuffDebuff)) or Target:HasDeBuffs(A.ConductiveInkDeBuffDebuff) and Unit(unit):HealthPercent < 31 or Unit(unit):TimeToDie() < 20) then
      A.AshvanesRazorCoral:Show(icon)
    end
    -- use_items
    end
     -- call precombat
  if not inCombat and Unit(unit):IsExists() and Action.GetToggle(1, "DBM") and unit ~= "mouseover" and not Unit(unit):IsTotem() then 
    local ShouldReturn = Precombat(unit); if ShouldReturn then return ShouldReturn; end
  end
     if Everyone.TargetIsValid() then
          -- auto_attack
    -- call_action_list,name=cooldowns
    if (true) then
      local ShouldReturn = Cooldowns(unit); if ShouldReturn then return ShouldReturn; end
    end
    -- maul,if=rage.deficit<10&active_enemies<4
    if A.Maul:IsReady(unit) and (Player:RageDeficit() < 10 and MultiUnits:GetByRangeInCombat(40, 5, 10) < 4) then
        return A.Maul:Show(icon)
    end
    -- maul,if=essence.conflict_and_strife.major&!buff.sharpened_claws.up
    if A.Maul:IsReady(unit) and (bool(essence.conflict_and_strife.major) and not Unit("player"):HasBuffs(A.SharpenedClawsBuff)) then
        return A.Maul:Show(icon)
    end
    -- ironfur,if=cost=0|(rage>cost&azerite.layered_mane.enabled&active_enemies>2)
    if A.Ironfur:IsReady(unit) and (A.Ironfur:Cost() == 0 or (Player:Rage() > A.Ironfur:Cost() and A.LayeredMane:GetAzeriteRank and MultiUnits:GetByRangeInCombat(40, 5, 10) > 2)) then
        return A.Ironfur:Show(icon)
    end
    -- pulverize,target_if=dot.thrash_bear.stack=dot.thrash_bear.max_stacks
    if A.Pulverize:IsReady(unit) then
        if Action.Utils.CastTargetIf(A.Pulverize, 40, EvaluateCyclePulverize105) then
            return A.Pulverize:Show(icon) 
        end
    end
    -- moonfire,target_if=dot.moonfire.refreshable&active_enemies<2
    if A.Moonfire:IsReady(unit) then
        if Action.Utils.CastTargetIf(A.Moonfire, 40, EvaluateCycleMoonfire116) then
            return A.Moonfire:Show(icon) 
        end
    end
    -- thrash,if=(buff.incarnation.down&active_enemies>1)|(buff.incarnation.up&active_enemies>4)
    if Thrash():IsReady(unit) and ((bool(Unit("player"):HasBuffsDown(A.IncarnationBuff)) and MultiUnits:GetByRangeInCombat(40, 5, 10) > 1) or (Unit("player"):HasBuffs(A.IncarnationBuff) and MultiUnits:GetByRangeInCombat(40, 5, 10) > 4)) then
        return Thrash:Show(icon)
    end
    -- swipe,if=buff.incarnation.down&active_enemies>4
    if Swipe():IsReady(unit) and (bool(Unit("player"):HasBuffsDown(A.IncarnationBuff)) and MultiUnits:GetByRangeInCombat(40, 5, 10) > 4) then
        return Swipe:Show(icon)
    end
    -- mangle,if=dot.thrash_bear.ticking
    if A.Mangle:IsReady(unit) and (Unit(unit):HasDeBuffs(A.ThrashBearDebuff)) then
        return A.Mangle:Show(icon)
    end
    -- moonfire,target_if=buff.galactic_guardian.up&active_enemies<2
    if A.Moonfire:IsReady(unit) then
        if Action.Utils.CastTargetIf(A.Moonfire, 40, EvaluateCycleMoonfire165) then
            return A.Moonfire:Show(icon) 
        end
    end
    -- thrash
    if Thrash():IsReady(unit) then
        return Thrash:Show(icon)
    end
    -- maul
    if A.Maul:IsReady(unit) then
        return A.Maul:Show(icon)
    end
    -- swipe
    if Swipe():IsReady(unit) then
        return Swipe:Show(icon)
    end
     end
    end

-- Finished

-- [4] AoE Rotation
A[4] = function(icon)
    return A[3](icon, true)
end
 