clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode survival @a
spawnpoint @a -75 18 -2

# reset map
clone -119 33 16 -95 14 38 -83 14 16

scoreboard players set dummy gvmInPrac 1
scoreboard players set dummy gvmStarted 0

scoreboard players set dummy gvmTimeSec 0
scoreboard players set dummy gvmTimeMs 0

effect give @s fire_resistance 20 5 true
effect give @s regeneration 20 5 true
effect give @s resistance 20 5 true
effect give @a minecraft:saturation 2 5 true

#delete items
execute positioned -71 20 28 run kill @e[type=item,distance=..20]

# reset crystal
kill @e[type=minecraft:end_crystal]
kill @e[type=minecraft:boat]
kill @e[type=minecraft:ender_pearl]

#go to map
tp @a -71 19 19 0 0

#give items
clone -71 18 0 -71 18 0 -71 20 19
setblock -71 20 19 air destroy
kill @e[type=item,nbt={Item:{id:"minecraft:chest"}}]
execute positioned -71 20 19 run execute as @e[type=item,distance=..1] run data modify entity @s PickupDelay set value 0s

execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2


effect clear @a regeneration
effect clear @a resistance