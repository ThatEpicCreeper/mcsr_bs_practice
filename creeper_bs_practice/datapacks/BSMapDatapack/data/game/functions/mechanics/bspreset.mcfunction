clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode survival @a
spawnpoint @a -138 15 65

# reset map
clone -127 38 166 -151 9 135 -151 9 92
fill -150 39 122 -128 80 93 air
fill -150 81 122 -128 87 93 air

scoreboard players set dummy bspInPrac 1
scoreboard players set dummy bspStarted 0

scoreboard players set dummy bspTimeSec 0
scoreboard players set dummy bspTimeMs 0

effect give @s fire_resistance 20 5 true
effect give @s regeneration 20 5 true
effect give @s resistance 20 5 true
effect give @a minecraft:saturation 2 5 true

#delete items
execute positioned -139 23 108 run kill @e[type=item,distance=..20]

# reset crystal
kill @e[type=minecraft:end_crystal]
kill @e[type=minecraft:boat]
kill @e[type=minecraft:ender_pearl]

#go to map
tp @a -138 28 107 40 -25

summon minecraft:item -147 37 118 {Item:{id:"minecraft:ender_eye",Count:1b}}

#give items
clone -136 15 66 -136 15 66 -138 29 108
setblock -138 29 108 air destroy
kill @e[type=item,nbt={Item:{id:"minecraft:chest"}}]
execute positioned -138 29 108 run execute as @e[type=item,distance=..1] run data modify entity @s PickupDelay set value 0s

scoreboard players set dummy bspStarted 1
execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2


effect clear @a regeneration
effect clear @a resistance