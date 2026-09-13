clear @a
effect clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode survival @a
spawnpoint @a 80 11 55

#reset map
clone 126 20 52 117 9 59 94 9 52

scoreboard players set dummy phcInPrac 1
scoreboard players set dummy phcStarted 0

scoreboard players set dummy phcTimeSec 0
scoreboard players set dummy phcTimeMs 0

effect give @s fire_resistance 1 5 true
effect give @s instant_health 1 5 true
effect give @s resistance 1 5 true
effect give @a minecraft:saturation 1 5 true

#delete items
execute positioned 99 13 55 run kill @e[type=item,distance=..8]
kill @e[type=boat]

# reset pigs
kill @e[type=minecraft:piglin]

# go to map
tp @a 101 15 56 90 90

# give items
clone 77 11 56 77 11 56 101 15 56
setblock 101 15 56 air destroy
kill @e[type=item,nbt={Item:{id:"minecraft:chest"}}]
execute positioned 101 15 56 run execute as @e[type=item,distance=..1] run data modify entity @s PickupDelay set value 0s

#spawn pigs
summon minecraft:piglin 101 12 56 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon minecraft:piglin 101 12 56 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon minecraft:piglin 101 12 56 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon minecraft:piglin 101 12 56 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon minecraft:piglin 101 12 56 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon minecraft:piglin 101 12 56 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon minecraft:piglin 101 12 56 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon minecraft:piglin 101 12 56 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon minecraft:piglin 101 12 56 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon minecraft:piglin 101 12 56 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon minecraft:piglin 101 12 56 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}
summon minecraft:piglin 101 12 56 {IsImmuneToZombification:1b,HandItems:[{id:golden_sword,Count:1},{}]}

scoreboard players set dummy phcStarted 1
