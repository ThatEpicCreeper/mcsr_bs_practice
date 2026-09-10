clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode survival @a
spawnpoint @a 77 13 105

#reset map
clone 131 21 111 119 13 99 91 13 99

scoreboard players set dummy mpoInPrac 1
scoreboard players set dummy mpoStarted 0

scoreboard players set dummy mpoTimeSec 0
scoreboard players set dummy mpoTimeMs 0

effect give @a fire_resistance 200 6 true
effect give @a regeneration 20 5 true
effect give @a resistance 20 5 true
effect give @a minecraft:saturation 1 5 true

#delete items
execute positioned 97 15 105 run kill @e[type=item,distance=..8]
kill @e[type=boat]

# reset blaze
kill @e[type=minecraft:blaze]

#summon blaze
summon blaze 97 15 102
effect give @e[type=blaze] slowness 10000 10 true

#go to map
tp @a 94 15 105 -90 0

#give items
clone 78 13 107 78 13 107 94 16 105
setblock 94 16 105 air destroy
kill @e[type=item,nbt={Item:{id:"minecraft:chest"}}]
execute positioned 94 16 105 run execute as @e[type=item,distance=..1] run data modify entity @s PickupDelay set value 0s

