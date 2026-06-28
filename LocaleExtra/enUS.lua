if GetLocale() ~= "enUS" then return end
-- This file is for optional modifications which are specific to a locale.


local ADDON_NAME, Data = ...

local Addon = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)




-- override the default stat rewords for this locale
do
  if Addon.expansionLevel <= Addon.expansions.cata then
    -- Addon:AddDefaultRewordByLocale(stat, val)
    Addon:AddDefaultRewordByLocale("BonusArmor", "Bonus Armor")
    
    Addon:AddDefaultRewordByLocale("All Resistance",    "All Resist")
    Addon:AddDefaultRewordByLocale("Arcane Resistance", "Arcane Resist")
    Addon:AddDefaultRewordByLocale("Fire Resistance",   "Fire Resist")
    Addon:AddDefaultRewordByLocale("Nature Resistance", "Nature Resist")
    Addon:AddDefaultRewordByLocale("Frost Resistance",  "Frost Resist")
    Addon:AddDefaultRewordByLocale("Shadow Resistance", "Shadow Resist")
    
    Addon:AddDefaultRewordByLocale("Attack Power In Forms",    "Feral Attack Power")
    Addon:AddDefaultRewordByLocale("Defense Rating",           "Defense")
    Addon:AddDefaultRewordByLocale("Parry Rating",             "Parry")
    Addon:AddDefaultRewordByLocale("Dodge Rating",             "Dodge")
    Addon:AddDefaultRewordByLocale("Armor Penetration Rating", "Armor Pen")
    Addon:AddDefaultRewordByLocale("Expertise Rating",         "Expertise")
    Addon:AddDefaultRewordByLocale("Resilience Rating",        "Resilience")
    
    Addon:AddDefaultRewordByLocale("Spell Damage", "Spell Damage")
    Addon:AddDefaultRewordByLocale("Healing",      "Healing")
    
    Addon:AddDefaultRewordByLocale("Hit Rating",             "Hit")
    Addon:AddDefaultRewordByLocale("Critical Strike Rating", "Crit")
    Addon:AddDefaultRewordByLocale("Haste Rating",           "Haste")
    
    Addon:AddDefaultRewordByLocale("Physical Hit Rating",             "Physical Hit")
    Addon:AddDefaultRewordByLocale("Physical Critical Strike Rating", "Physical Crit")
    Addon:AddDefaultRewordByLocale("Physical Haste Rating",           "Physical Haste")
    Addon:AddDefaultRewordByLocale("Spell Hit Rating",                "Spell Hit")
    Addon:AddDefaultRewordByLocale("Spell Critical Strike Rating",    "Spell Crit")
    Addon:AddDefaultRewordByLocale("Spell Haste Rating",              "Spell Haste")
  end
    
  Addon:AddDefaultRewordByLocale("Health Regeneration", "Health per Minute")
  Addon:AddDefaultRewordByLocale("Mana Regeneration",   "Mana per Minute")
end

-- override the default stat mods for this locale
do
  -- Addon:AddDefaultModByLocale(stat, val)
  
  Addon:AddDefaultModByLocale("Health Regeneration", 12)
  Addon:AddDefaultModByLocale("Mana Regeneration",   12)
end


-- override the default stat precision for this locale
do
  -- Addon:AddDefaultPrecisionByLocale(stat, val)
end



-- These functions define additional pattern captures that can be used to recognize a stat in this locale.
-- A line of text is matched against INPUT. If the match is successful, the line is recognized as that stat.
-- The results of the match as then used to reword the line.
-- OUTPUT can also be defined (in the same table as INPUT). It must be a function.
-- OUTPUT accepts the results of matching INPUT, and returns them. They could be returned in a different order.








Addon:AddExtraStatCapture("Arcane Damage",
  {INPUT = "%+([%d,]+) Arcane Spell Damage"})

Addon:AddExtraStatCapture("Fire Damage",
  {INPUT = "%+([%d,]+) Fire Spell Damage"})

Addon:AddExtraStatCapture("Nature Damage",
  {INPUT = "%+([%d,]+) Nature Spell Damage"})

Addon:AddExtraStatCapture("Frost Damage",
  {INPUT = "%+([%d,]+) Frost Spell Damage"})

Addon:AddExtraStatCapture("Shadow Damage",
  {INPUT = "%+([%d,]+) Shadow Spell Damage"})

Addon:AddExtraStatCapture("Holy Damage",
  {INPUT = "%+([%d,]+) Holy Spell Damage"})

Addon:AddExtraStatCapture("Health Regeneration",
  {INPUT = "^%+([%d,]+) health every 5 sec%.$"})



if Addon.isEra then
  Addon:AddExtraStatCapture("Defense Rating",
    {INPUT = "^Increased Defense %+([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Dodge Rating",
    {INPUT = "^Increases your chance to dodge an attack by ([%d,]+%%)%.$"})
  
  Addon:AddExtraStatCapture("Parry Rating",
    {INPUT = "^Increases your chance to parry an attack by ([%d,]+%%)%.$"})
  
  Addon:AddExtraStatCapture("Block Rating",
    {INPUT = "^Increases your chance to block attacks with a shield by ([%d,]+%%)%.$"})
  
  Addon:AddExtraStatCapture("Attack Power In Forms",
    {INPUT = "^%+([%d,]+) Attack Power in Cat, Bear, and Dire Bear forms only%.$"})
  
  Addon:SetDefaultStatPattern("Expertise Rating", "Reduces the chance for your attacks to be dodged or parried by %s.")
  
  Addon:AddExtraStatCapture("Healing",
    {INPUT = "^Increases healing done by spells and effects by up to ([%d,]+)%.$"},
    {INPUT = "^%+([%d,]+) Healing Spells$"})
  
  Addon:AddExtraStatCapture("Spell Penetration",
    {INPUT = "^Decreases the magical resistances of your spell targets by ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Hit Rating",
    {INPUT = "^Improves your chance to hit with all spells and attacks by ([%d,]+%%)%.$"})
  
  Addon:AddExtraStatCapture("Critical Strike Rating",
    {INPUT = "^Improves your chance to get a critical strike with all spells and attacks by ([%d,]+%%)%.$"},
    {INPUT = "^Improves your chance to get a critical strike with melee and ranged attacks and with spells by ([%d,]+%%)%.$"},
    {INPUT = "^Increases your critical strike chance with spells and attacks by ([%d,]+%%)%.$"})
  
  Addon:AddExtraStatCapture("Physical Hit Rating",
    {INPUT = "^Improves your chance to hit by ([%d,]+%%)%.$"})
  
  Addon:AddExtraStatCapture("Physical Critical Strike Rating",
    {INPUT = "^Improves your chance to get a critical strike by ([%d,]+%%)%.$"})
  
  Addon:SetDefaultStatPattern("Physical Haste Rating", "Increases your attack speed by %s.")
  
  Addon:AddExtraStatCapture("Spell Hit Rating",
    {INPUT = "^Improves your chance to hit with spells by ([%d,]+%%)%.$"})
  
  Addon:AddExtraStatCapture("Spell Critical Strike Rating",
    {INPUT = "^Improves your chance to get a critical strike with spells by ([%d,]+%%)%.$"})
  
  Addon:SetDefaultStatPattern("Spell Haste Rating", "Increases your casting speed by %s.")
else
  Addon:AddExtraStatCapture("Block Rating",
    {INPUT = "^Increases your block rating by ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Spell Power",
    {INPUT = "^Increases your spell power by ([%d,]+)%.$"}) -- Atiesh 22631
  
  Addon:AddExtraStatCapture("Hit Rating",
    {INPUT = "^Increases your hit rating by ([%d,]+)%.$"}) -- Maexxna's Fang 22804
  
  Addon:AddExtraStatCapture("Critical Strike Rating",
    {INPUT = "^Increases your critical strike rating by ([%d,]+)%.$"}) -- Staff of Balzaphon 23124
  
  Addon:AddExtraStatCapture("Armor Penetration Rating",
    {INPUT = "^Increases armor penetration rating by ([%d,]+)%.$"}) -- Maexxna's Femur 39226
  
  Addon:AddExtraStatCapture("Spell Penetration",
    {INPUT = "^Increases your spell penetration by ([%d,]+)%.$"}) -- Hatefury Mantle 30884
end

if Addon.expansionLevel <= Addon.expansions.tbc then
  Addon:AddExtraStatCapture("Dodge Rating",
    {INPUT = "^%+([%d,]+) Dodge Rating$"})
  
  Addon:AddExtraStatCapture("Block Rating",
    {INPUT = "^%+([%d,]+) Block Rating$"})
  
  Addon:AddExtraStatCapture("Healing",
    {INPUT = "^%+([%d,]+) Healing$"},
    {INPUT = "^%+([%d,]+) Healing Spells and %+[%d,]+ Damage Spells$"},
    {INPUT = "^Increases your spell damage by up to [%d,]+ and your healing by up to ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Spell Power",
    {INPUT = "^Increases damage and healing done by magical spells and effects by up to ([%d,]+)%.$"},
    {INPUT = "^%+([%d,]+) Damage and Healing Spells$"},
    {INPUT = "^%+([%d,]+) Spell Damage and Healing$"})
  
  Addon:AddExtraStatCapture("Arcane Damage",
    {INPUT = "^Increases damage done by Arcane spells and effects by up to ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Fire Damage",
    {INPUT = "^Increases damage done by Fire spells and effects by up to ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Nature Damage",
    {INPUT = "^Increases damage done by Nature spells and effects by up to ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Frost Damage",
    {INPUT = "^Increases damage done by Frost spells and effects by up to ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Shadow Damage",
    {INPUT = "^Increases damage done by Shadow spells and effects by up to ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Holy Damage",
    {INPUT = "^Increases damage done by Holy spells and effects by up to ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Physical Hit Rating",
    {INPUT = "^Increases your hit rating by ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Spell Hit Rating",
    {INPUT = "^Increases your spell hit rating by ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Physical Critical Strike Rating",
    {INPUT = "^Increases your critical strike rating by ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Spell Critical Strike Rating",
    {INPUT = "^Increases your spell critical strike rating by ([%d,]+)%.$"})
  
  Addon:AddExtraStatCapture("Armor Penetration Rating",
    {INPUT = "^Your attacks ignore ([%d,]+) of your opponent's armor%.$"})
  
  Addon:AddExtraStatCapture("Health Regeneration",
    {INPUT = "^Restores ([%d,]+) health every 5 sec%.$"})
  
  Addon:AddExtraStatCapture("Mana Regeneration",
    {INPUT = "^%+([%d,]+) mana every 5 sec%.$"},
    {INPUT = "^%+([%d,]+) Mana Per 5 sec%.$"})
end

if Addon.isSoD or Addon.isTBC then
  Addon:AddExtraStatCapture("Healing",
    {INPUT = "^Increases healing done by up to ([%d,]+) and damage done by up to %d+ for all magical spells and effects%.$"})
end







-- These tables define additional text replacements that can take place in certain lines.
-- Partial matches are found and replaced with gsub().

Addon:AddExtraReplacement("Run Speed",
  {
    INPUT  = "Engage the rocket boots to greatly increase your speed%.", -- Rocket Boots Xtreme Lite 35581
    OUTPUT = "+300%% Run Speed for 3 sec",
  },
  {
    INPUT  = "Activate a set of jets to increase your movement speed by up to 160%%, for up to 8 sec%.", -- Tinkerbox: Nitro Boosts 238735
    OUTPUT = "+140%% (120%%-160%%) Run Speed for 8 sec",
  },
  {
    INPUT  = "Minor Speed Increase", -- Enchant Boots - Minor Speed
    OUTPUT = "+8%% Run Speed",
  },
  {
    INPUT  = "Minor Run Speed Increase", -- Meta gems
    OUTPUT = "+8%% Run Speed",
  },
  {
    INPUT  = "Minor Speed ", -- Enchant Boots - Boar's Speed
    OUTPUT = "+8%% Run Speed ",
  },
  {
    INPUT  = "Minor increase to running and swimming speed", -- Primal Batskin set
    OUTPUT = "+8%% Run Speed and +8%% Swim Speed",
  },
  {
    INPUT  = "Increases run speed by (%d+)%%", -- Swiftness Potion
    OUTPUT = "+%1%% Run Speed",
  },
  {
    INPUT  = "Run speed increased slightly", -- Highlander's / Defiler's PvP boots
    OUTPUT = "+8%% Run Speed",
  },
  {
    INPUT  = "Greatly increase your run speed", -- Nitro Boosts
    OUTPUT = "+150%% Run Speed",
  }
)

-- Swim Speed
Addon:AddExtraReplacement("Swim Speed",
  {
    INPUT  = "Increases swim speed by (%d+)%%", -- Azure Silk Belt
    OUTPUT = "+%1%% Swim Speed",
  }
)

-- Mount Speed
Addon:AddExtraReplacement("Mount Speed",
  {
    INPUT  = "Increases mount speed by (%d+)%%", -- Carrot on a Stick
    OUTPUT = "+%1%% Mount Speed",
  }
)
if Addon.isTBC then
  Addon:AddExtraReplacement("Mount Speed",
    {
      INPUT  = "Increases speed in Flight Form and Swift Flight Form by (%d+)%%", -- Charm of Swift Flight Form
      OUTPUT = "+%1%% Speed in Flight Forms",
    }
  )
end
if Addon.isEra then
  Addon:AddExtraReplacement("Mount Speed",
    {
      INPUT  = "^Mithril Spurs", -- Mithril Spurs Enchantment (Mithril Spurs (464))
      OUTPUT = "+4%% Mount Speed",
    },
    {
      INPUT  = "^Minor Mount Speed Increase", -- Enchant Gloves - Riding (Minor Mount Speed Increase (930))
      OUTPUT = "+2%% Mount Speed",
    },
    {
      INPUT  = "Attaches spurs to your boots that increase your mounted movement speed slightly", -- Mithril Spurs
      OUTPUT = "+4%% Mount Speed when attached to boots",
    }
  )
end

-- Fishing Skill
Addon:AddExtraReplacement("Fishing Skill",
  {
    INPUT  = "Replaces the fishing line on your fishing pole with a high test eternium line", -- High Test Eternium Fishing Line
    OUTPUT = "Adds +5 Fishing to an owned Fishing Pole",
  },
  {
    INPUT  = "^Eternium Line$", -- Eternium Fishing Line (Eternium Line (2603))
    OUTPUT = "+5 Fishing",
  }
)

-- Mana Regen
Addon:AddExtraReplacement("Mana Regen",
  {
    INPUT  = "Allow (%d+)%% of your Mana regeneration to continue while casting", -- Primal Mooncloth set
    OUTPUT = "+%1%% of Mana Regen continues while casting",
  }
)

-- Hp5
Addon:AddExtraReplacement("Hp5",
  {
    INPUT  = "restores (%d+) health every 5 seconds", -- Nightfin Soup
    OUTPUT = function(amount) return format("+%s health per minute (%s Hp5)", Addon:ToFormattedNumber(Addon:ToNumber(amount)*12), Addon:ToFormattedNumber(amount)) end,
  }
)

-- Mp5
Addon:AddExtraReplacement("Mp5",
  {
    INPUT  = "restores (%d+) Mana every 5 seconds", -- Nightfin Soup
    OUTPUT = function(amount) return format("+%s mana per minute (%s Mp5)", Addon:ToFormattedNumber(Addon:ToNumber(amount)*12), Addon:ToFormattedNumber(amount)) end,
  }
)






-- Food and Drink
Addon:AddExtraReplacement("Food And Drink",
  {
    INPUT  = "Restores? ([%d,]+) health and ([%d,]+) mana over (%d+) sec%.%s+Must remain seated while eating", -- Conjured Mana Biscuit
    OUTPUT = function(healthAmount, manaAmount, duration) return format("+%s health (+%s/s) and +%s mana (+%s/s) over %ds while seated", Addon:ToFormattedNumber(healthAmount), Addon:ToFormattedNumber(Addon:Round(Addon:ToNumber(healthAmount)/duration, 1)), Addon:ToFormattedNumber(manaAmount), Addon:ToFormattedNumber(Addon:Round(Addon:ToNumber(manaAmount)/duration, 1)), duration) end,
  }
)

Addon:AddExtraReplacement("Buff Food",
  {
    INPUT  = "Restores? ([%d,]+) health over (%d+) sec%.%s+Must remain seated while eating.%s+If you spend at least 10 seconds eating you will become well fed and (.+) for (%d+) min", -- Golden Fish Sticks
    OUTPUT = function(amount, duration, buff, buffDuration) return format("+%s health (+%s/s) over %ds while seated. After 10s, %s for %dm", Addon:ToFormattedNumber(amount), Addon:ToFormattedNumber(Addon:Round(Addon:ToNumber(amount)/duration, 1)), duration, buff, buffDuration) end,
  }
)

Addon:AddExtraReplacement("Food",
  {
    INPUT  = "Restores? ([%d,]+) health over (%d+) sec%.%s+Must remain seated while eating", -- Telaari Grapes
    OUTPUT = function(amount, duration) return format("+%s health (+%s/s) over %ds while seated", Addon:ToFormattedNumber(amount), Addon:ToFormattedNumber(Addon:Round(Addon:ToNumber(amount)/duration, 1)), duration) end,
  }
)

Addon:AddExtraReplacement("Buff Drink",
  {
    INPUT  = "Restores? ([%d,]+) mana over (%d+) sec%.%s+Must remain seated while drinking.%s+If you spend at least 10 seconds drinking you will become well fed and (.+) for (%d+) min", -- Hot Apple Cider
    OUTPUT = function(amount, duration, buff, buffDuration) return format("+%s mana (+%s/s) over %ds while seated. After 10s, %s for %dm", Addon:ToFormattedNumber(amount), Addon:ToFormattedNumber(Addon:Round(Addon:ToNumber(amount)/duration, 1)), duration, buff, buffDuration) end,
  },
  {
    INPUT  = "Restores? ([%d,]+) mana over (%d+) sec%.%s+Must remain seated while drinking.%s+If you spend at least 10 seconds drinking you will become enlightened and (.+) for (%d+) min", -- Skullfish Soup
    OUTPUT = function(amount, duration, buff, buffDuration) return format("+%s mana (+%s/s) over %ds while seated. After 10s, %s for %dm", Addon:ToFormattedNumber(amount), Addon:ToFormattedNumber(Addon:Round(Addon:ToNumber(amount)/duration, 1)), duration, buff, buffDuration) end,
  }
  -- {
  --   INPUT  = "Restores? ([%d,]+) mana over (%d+) sec%.%s+Must remain seated while drinking.%s+ Also (.+) for (%d+) min",
  --   OUTPUT = function(amount, duration, buff, buffDuration) return format("+%s mana (+%s/s) over %ds while seated. Also %s for %dm", Addon:ToFormattedNumber(amount), Addon:ToFormattedNumber(Addon:Round(Addon:ToNumber(amount)/duration, 1)), duration, buff, buffDuration) end,
  -- }
)

Addon:AddExtraReplacement("Drink",
  {
    INPUT  = "Restores ([%d,]+) mana over (%d+) sec%.%s+Must remain seated while drinking", -- Purified Draenic Water
    OUTPUT = function(amount, duration) return format("+%s mana (+%s/s) over %ds while seated", Addon:ToFormattedNumber(amount), Addon:ToFormattedNumber(Addon:Round(Addon:ToNumber(amount)/duration, 1)), duration) end,
  }
)

Addon:AddExtraReplacement("Bandage",
  {
    INPUT  = "Heals ([%d,]+) damage over (%d+) sec",
    OUTPUT = function(amount, duration) return format("+%s health (+%s/s) over %ds", Addon:ToFormattedNumber(amount), Addon:ToFormattedNumber(Addon:Round(Addon:ToNumber(amount)/duration, 1)), duration) end,
  }
)


Addon:AddExtraReplacement("Average Range",
  {
    INPUT  = "([%d,]+) to (%d*,?%d+)", -- don't capture trailing commas
    OUTPUT = function(amount1, amount2) return format("%s (%s-%s)", Addon:ToFormattedNumber(Addon:Round((Addon:ToNumber(amount1)+Addon:ToNumber(amount2))/2, 1)), Addon:ToFormattedNumber(amount1), Addon:ToFormattedNumber(amount2)) end, -- Health/mana Potions, Demonic Rune
  }
)


-- Spellpower
Addon:AddExtraReplacement("Spell Power Proc",
  {
    INPUT  = "[Ii]ncreases damage and healing done by magical spells and effects by up to (%d+)",
    OUTPUT = function(power)
      return "+" .. power .. " " .. Addon.statsInfo["Spell Power"]:GetAlias()
    end,
  }
)

if Addon.isTBC then
    Addon:AddExtraReplacement("Enchants",
    {
      -- Spell Crit and Spell Power Enchant
      INPUT  = "Spell Critical Strike Rating and %+([%d,]+) Spell Damage and Healing",
      OUTPUT = function(power)
        return Addon.statsInfo["Spell Critical Strike Rating"]:GetAlias() .. " and +" .. power .. " " .. Addon.statsInfo["Spell Power"]:GetAlias()
      end,
    },
    {
      -- Spell Power and Spell Hit Enchant
      INPUT  = "Spell Power and %+([%d,]+) Spell Hit Rating",
      OUTPUT = function(hit)
        return Addon.statsInfo["Spell Power"]:GetAlias() .. " and +" .. hit .. " " .. Addon.statsInfo["Spell Hit Rating"]:GetAlias()
      end,
    },
    {
      -- Healing and Spell Damage and Mana Regen Enchant (Classic)
      INPUT  = "%+([%d,]+) Healing Spells and %+([%d,]+) Damage Spells and (%d+) Mana [Pp]er 5 sec%.?",
      OUTPUT = function(healing, damage, mp5)
        return "+" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias() .. " +" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias() .. " +" .. mp5 .. " " .. Addon.statsInfo["Mana Regeneration"]:GetAlias()
      end,
    },
    {
      -- Healing and Spell Damage and Mana Regen Enchant
      INPUT  = "%+([%d,]+) Healing and %+([%d,]+) Spell Damage and (%d+) Mana [Pp]er 5 sec%.?",
      OUTPUT = function(healing, damage, mp5)
        return "+" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias() .. " +" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias() .. " and +" .. mp5 .. " " .. Addon.statsInfo["Mana Regeneration"]:GetAlias()
      end,
    },
    {
      -- Healing, Spell Damage and Mana Regen Enchant
      INPUT  = "%+([%d,]+) Healing %+([%d,]+) Spell Damage and (%d+) Mana [Pp]er 5 sec%.?",
      OUTPUT = function(healing, damage, mp5)
        return "+" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias() .. " +" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias() .. " and +" .. mp5 .. " " .. Addon.statsInfo["Mana Regeneration"]:GetAlias()
      end,
    },
    {
      -- Healing, Spell Damage and Mana Regen Enchant (2)
      INPUT  = "%+([%d,]+) Healing and %+([%d,]+) Spell Damage and %+(%d+) Mana Regen",
      OUTPUT = function(healing, damage, mp5)
        return "+" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias() .. " +" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias() .. " and +" .. mp5 .. " " .. Addon.statsInfo["Mana Regeneration"]:GetAlias()
      end,
    },
    {
      -- Healing, Spell Damage and Stamina Enchant
      INPUT  = "%+([%d,]+) Healing and %+([%d,]+) Spell Damage and %+([%d,]+) Stamina",
      OUTPUT = function(healing, damage, stamina)
        return "+" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias() .. " +" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias() .. " and +" .. stamina .. " " .. Addon.statsInfo["Stamina"]:GetAlias()
      end,
    },
    {
      -- Healing, Spell Damage and Stamina Enchant (2)
      INPUT  = "%+([%d,]+) Healing %+([%d,]+) Spell Damage and %+([%d,]+) Stamina",
      OUTPUT = function(healing, damage, stamina)
        return "+" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias() .. " +" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias() .. " and +" .. stamina .. " " .. Addon.statsInfo["Stamina"]:GetAlias()
      end,
    },
    {
      -- Healing, Spell Damage and Stamina Enchant (Classic Spells)
      INPUT  = "%+([%d,]+) Healing Spells and %+([%d,]+) Damage Spells and %+([%d,]+) Stamina",
      OUTPUT = function(healing, damage, stamina)
        return "+" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias() .. " +" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias() .. " and +" .. stamina .. " " .. Addon.statsInfo["Stamina"]:GetAlias()
      end,
    },
    {
      -- Healing and Spell Damage Enchant
      INPUT  = "%+([%d,]+) Healing Spells and %+([%d,]+) Damage Spells",
      OUTPUT = function(healing, damage)
        return "+" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias() .. " +" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias()
      end,
    },
    {
      -- Healing and Spell Damage Enchant
      INPUT  = "%+([%d,]+) Healing and %+([%d,]+) Spell Damage",
      OUTPUT = function(healing, damage)
        return "+" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias() .. " +" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias()
      end,
    },
    {
      -- Spell Damage and Healing Enchant
      INPUT  = "%+([%d,]+) Spell Damage and %+([%d,]+) Healing",
      OUTPUT = function(damage, healing)
        return "+" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias() .. " +" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias()
      end,
    },
    {
      -- Defense Rating and Dodge Rating Enchant
      INPUT  = "%+([%d,]+) Defense Rating and %+([%d,]+) Dodge Rating",
      OUTPUT = function(defense, dodge)
        return "+" .. defense .. " " .. Addon.statsInfo["Defense Rating"]:GetAlias() .. " and +" .. dodge .. " " .. Addon.statsInfo["Dodge Rating"]:GetAlias()
      end,
    },
    {
      -- Dodge Rating and Defense Rating Enchant
      INPUT  = "%+([%d,]+) Dodge Rating and %+([%d,]+) Defense Rating",
      OUTPUT = function(dodge, defense)
        return "+" .. dodge .. " " .. Addon.statsInfo["Dodge Rating"]:GetAlias() .. " and +" .. defense .. " " .. Addon.statsInfo["Defense Rating"]:GetAlias()
      end,
    },
    {
      -- Attack Power and Hit Rating Enchant
      INPUT  = "%+([%d,]+) Attack Power and %+([%d,]+) Hit Rating",
      OUTPUT = function(ap, hit)
        return "+" .. ap .. " " .. Addon.statsInfo["Attack Power"]:GetAlias() .. " and +" .. hit .. " " .. Addon.statsInfo["Physical Hit Rating"]:GetAlias()
      end,
    },
    {
      -- Hit Rating and Attack Power Enchant
      INPUT  = "%+([%d,]+) Hit Rating and %+([%d,]+) Attack Power",
      OUTPUT = function(hit, ap)
        return "+" .. hit .. " " .. Addon.statsInfo["Physical Hit Rating"]:GetAlias() .. " and +" .. ap .. " " .. Addon.statsInfo["Attack Power"]:GetAlias()
      end,
    },
    {
      -- Spell Damage and Healing Enchant (to Spell Power)
      INPUT  = "%+([%d,]+) Spell Damage and Healing",
      OUTPUT = function(power)
        return "+" .. power .. " " .. Addon.statsInfo["Spell Power"]:GetAlias()
      end,
    },
    {
      -- Spell Penetration Enchant
      INPUT  = "%+([%d,]+) Spell Penetration",
      OUTPUT = function(pen)
        return "+" .. pen .. " " .. Addon.statsInfo["Spell Penetration"]:GetAlias()
      end,
    },
    {
      -- Spell Critical Strike Rating Enchant
      INPUT  = "%+([%d,]+) Spell Critical Strike Rating",
      OUTPUT = function(crit)
        return "+" .. crit .. " " .. Addon.statsInfo["Spell Critical Strike Rating"]:GetAlias()
      end,
    },
    {
      -- Critical Strike Rating Enchant
      INPUT  = "%+([%d,]+) Critical Strike Rating",
      OUTPUT = function(crit)
        return "+" .. crit .. " " .. Addon.statsInfo["Physical Critical Strike Rating"]:GetAlias()
      end,
    },
    {
      -- Spell Hit Rating Enchant
      INPUT  = "%+([%d,]+) Spell Hit Rating",
      OUTPUT = function(hit)
        return "+" .. hit .. " " .. Addon.statsInfo["Spell Hit Rating"]:GetAlias()
      end,
    },
    {
      -- Attack Power and Critical Strike Rating Enchant
      INPUT  = "%+([%d,]+) Attack Power and %+([%d,]+) Critical Strike Rating",
      OUTPUT = function(ap, crit)
        return "+" .. ap .. " " .. Addon.statsInfo["Attack Power"]:GetAlias() .. " and +" .. crit .. " " .. Addon.statsInfo["Physical Critical Strike Rating"]:GetAlias()
      end,
    },
    {
      -- Critical Strike Rating and Attack Power Enchant
      INPUT  = "%+([%d,]+) Critical Strike Rating and %+([%d,]+) Attack Power",
      OUTPUT = function(crit, ap)
        return "+" .. crit .. " " .. Addon.statsInfo["Physical Critical Strike Rating"]:GetAlias() .. " and +" .. ap .. " " .. Addon.statsInfo["Attack Power"]:GetAlias()
      end,
    },
    {
      -- Mana every 5 sec. Enchant
      INPUT  = "%+([%d,]+) mana every 5 sec%.?",
      OUTPUT = function(regen)
        return "+" .. regen .. " " .. Addon.statsInfo["Mana Regeneration"]:GetAlias()
      end,
    }
  )
  
  Addon:AddExtraReplacement("Spell Damage and Healing Trinket Procs",
    {
      -- Spell Damage and Healing Trinket
      INPUT  = "Increases spell damage by up to (%d+) and healing by up to (%d+) for (%d+) sec%.%s*(.*)",
      OUTPUT = function(damage, healing, duration, cooldown)
        return "+" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias() .. " +" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias() .. " for " .. duration .. " sec. " .. cooldown
      end,
    },
    {
      -- Healing and Spell Damage Trinket
      INPUT  = "Increases healing done by spells.-by up to (%d+) and damage done by spells by up to (%d+) for (%d+) sec%.%s*(.*)",
      OUTPUT = function(healing, damage, duration, cooldown)
        return "+" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias() .. " +" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias() .. " for " .. duration .. " sec. " .. cooldown
      end,
    },
    {
      -- Eye of the Dead Trinket
      INPUT  = "Increases healing done by the next (%d+) spells by up to (%d+) and damage done by up to (%d+) for (%d+) sec%.%s*(.*)",
      OUTPUT = function(count, healing, damage, duration, cooldown)
        return "Your next " .. count .. " spells have +" .. healing .. " " .. Addon.statsInfo["Healing"]:GetAlias() .. " +" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias() .. " for " .. duration .. " sec. " .. cooldown
      end,
    }
  )

  Addon:AddExtraReplacement("Haste Trinket Procs",
    {
      -- Spell Haste Trinket Proc (1)
      INPUT  = "increase your spell haste rating by (%d+)",
      OUTPUT = function(haste)
        return "+" .. haste .. " " .. Addon.statsInfo["Spell Haste Rating"]:GetAlias()
      end,
    },
    {
      -- Spell Haste Trinket Proc (2)
      INPUT  = "increasing spell haste rating by (%d+)",
      OUTPUT = function(haste)
        return "+" .. haste .. " " .. Addon.statsInfo["Spell Haste Rating"]:GetAlias()
      end,
    },
    {
      -- Physical Haste Trinket Proc (1)
      INPUT  = "Increases haste rating by (%d+)",
      OUTPUT = function(haste)
        return "+" .. haste .. " " .. Addon.statsInfo["Physical Haste Rating"]:GetAlias()
      end,
    },
    {
      -- Physical Haste Trinket Proc (2)
      INPUT  = "Increases your haste rating by (%d+)",
      OUTPUT = function(haste)
        return "+" .. haste .. " " .. Addon.statsInfo["Physical Haste Rating"]:GetAlias()
      end,
    },
    {
      -- Physical Haste Trinket Proc (3)
      INPUT  = "increase your haste rating by (%d+)",
      OUTPUT = function(haste)
        return "+" .. haste .. " " .. Addon.statsInfo["Physical Haste Rating"]:GetAlias()
      end,
    }
  )

  Addon:AddExtraReplacement("Spell Damage Trinket Proc",
    {
      INPUT  = "[Gg]rants (%d+) increased spell damage",
      OUTPUT = function(damage)
        return "+" .. damage .. " " .. Addon.statsInfo["Spell Damage"]:GetAlias()
      end,
    }
  )

  Addon:AddExtraReplacement("Attack Power Trinket Procs",
    {
      -- Attack Power Trinket Proc (1)
      INPUT  = "[Ii]ncreases? your attack power by (%d+)",
      OUTPUT = function(ap)
        return "+" .. ap .. " " .. Addon.statsInfo["Attack Power"]:GetAlias()
      end,
    },
    {
      -- Attack Power Trinket Proc (2)
      INPUT  = "[Ii]ncreases? attack power by (%d+)",
      OUTPUT = function(ap)
        return "+" .. ap .. " " .. Addon.statsInfo["Attack Power"]:GetAlias()
      end,
    },
    {
      -- Attack Power Penalty Proc
      INPUT  = "decreases your melee and ranged attack power by (%d+)",
      OUTPUT = function(ap)
        return "-" .. ap .. " " .. Addon.statsInfo["Attack Power"]:GetAlias()
      end,
    }
  )

  Addon:AddExtraReplacement("Armor Penetration Trinket Proc",
    {
      INPUT  = "gives?%s+you%s+([%d,]+)%s+[Aa]rmor%s+[Pp]enetration",
      OUTPUT = function(ap)
        return "+" .. ap .. " " .. Addon.statsInfo["Armor Penetration Rating"]:GetAlias()
      end,
    }
  )

  Addon:AddExtraReplacement("Spell Power Trinket Procs",
    {
      -- Spell Power Trinket Proc
      INPUT  = "[Ii]ncreases? your spell damage and healing by (%d+)",
      OUTPUT = function(power)
        return "+" .. power .. " " .. Addon.statsInfo["Spell Power"]:GetAlias()
      end,
    },
    {
      -- Spell damage and healing Proc
      INPUT  = "you will gain up to (%d+) spell damage and healing",
      OUTPUT = function(power)
        return "to +" .. power .. " " .. Addon.statsInfo["Spell Power"]:GetAlias()
      end,
    }
  )

  Addon:AddExtraReplacement("Spirit Trinket Proc",
    {
      INPUT  = "[Ii]ncreases? your Spirit by %+?(%d+)",
      OUTPUT = function(spirit)
        return "+" .. spirit .. " " .. Addon.statsInfo["Spirit"]:GetAlias()
      end,
    }
  )

  Addon:AddExtraReplacement("Tank Trinket Procs",
    {
      -- Dodge Trinket Proc
      INPUT  = "Increases dodge rating by (%d+)",
      OUTPUT = function(dodge)
        return "+" .. dodge .. " " .. Addon.statsInfo["Dodge Rating"]:GetAlias()
      end,
    },
    {
      -- Defense Trinket Proc
      INPUT  = "Increases your defense rating by (%d+)",
      OUTPUT = function(defense)
        return "+" .. defense .. " " .. Addon.statsInfo["Defense Rating"]:GetAlias()
      end,
    },
    {
      -- Block Value Proc (1)
      INPUT  = "[Ii]ncreases your shield block value by (%d+)",
      OUTPUT = function(value)
        return "+" .. value .. " " .. Addon.statsInfo["Block Value"]:GetAlias()
      end,
    },
    {
      -- Block Value Proc (2)
      INPUT  = "[Ii]ncreases the block value of your shield by (%d+)",
      OUTPUT = function(value)
        return "+" .. value .. " " .. Addon.statsInfo["Block Value"]:GetAlias()
      end,
    },
    {
      -- Block Rating Proc
      INPUT  = "Increases block rating by (%d+)",
      OUTPUT = function(value)
        return "+" .. value .. " " .. Addon.statsInfo["Block Rating"]:GetAlias()
      end,
    }
  )

  Addon:AddExtraReplacement("Mana Regen Trinket Proc",
    {
      INPUT  = "bonus%s+of%s+(%d+)%s+mana%s+regen%s+per%s+5%s+sec",
      OUTPUT = function(regen)
        return "+" .. regen .. " " .. Addon.statsInfo["Mana Regeneration"]:GetAlias()
      end,
    }
  )
end

-- Temp Stat Buff
Addon:AddExtraReplacement("Temp Stat Buff",
  {
    INPUT  = "Increases the ([^%d]-) by ([%d,]+%%?) (for %d+ sec%.?)", -- 236337
    OUTPUT = "+%2 %1 %3",
  },
  {
    INPUT  = "Increases ?y?o?u?r? ([^%d]-) by ([%d,]+%%?) (for %d+ sec%.?)", -- Shadowmoon Insignia, Steely Naaru Sliver
    OUTPUT = "+%2 %1 %3",
  },
  {
    INPUT  = "Increases ?y?o?u?r? ([^%d]-) by up to ([%d,]+%%?) (for %d+ sec%.?)", -- Dark Iron Smoking Pipe
    OUTPUT = "+%2 %1 %3",
  }
)