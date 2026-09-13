clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode adventure @a
spawnpoint @a -50 11 68

scoreboard players set dummy dspInPrac 1
scoreboard players set dummy dspStarted 0

scoreboard players set dummy dspTimeSec 0
scoreboard players set dummy dspTimeMs 0

effect give @s fire_resistance 20 5 true
effect give @s regeneration 20 5 true
effect give @s resistance 20 5 true
effect give @a minecraft:saturation 2 5 true

#delete items
execute positioned -57 22 116 run kill @e[type=item,distance=..20]

# reset piglins
kill @e[type=minecraft:piglin]
kill @e[type=boat]

#spawn pigs
summon piglin -52 21 109 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon piglin -57 23 120 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon piglin -59 21 127 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon piglin -52 21 109 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon piglin -57 23 120 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon piglin -59 21 127 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}


#go to map
tp @a -56 21 98 0 0

#give items
give @a iron_pickaxe
give @a gold_ingot 32
give @a snowball{display:{Name:'[{"text":"Reset","bold":true,"italic":false,"color":"gold"}]',Lore:['[{"text":"(Throw to reset)","italic":false,"color":"gray"}]']}}

