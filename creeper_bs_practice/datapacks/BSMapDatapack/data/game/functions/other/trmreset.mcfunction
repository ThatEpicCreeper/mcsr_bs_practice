clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode survival @a
spawnpoint @a -73 20 -61

# reset map
clone -102 37 -42 -127 14 -17 -83 14 -42

scoreboard players set dummy trmInPrac 1
scoreboard players set dummy trmStarted 0

scoreboard players set dummy trmTimeSec 0
scoreboard players set dummy trmTimeMs 0

effect give @s fire_resistance 20 5 true
effect give @s regeneration 20 5 true
effect give @s resistance 20 5 true
effect give @a minecraft:saturation 2 5 true

#delete items
execute positioned -71 20 -28 run kill @e[type=item,distance=..20]

# reset crystal
kill @e[type=minecraft:end_crystal]
kill @e[type=minecraft:boat]
kill @e[type=minecraft:ender_pearl]

#go to map
tp @a -71 19 -39 0 0

#give items
clone -69 20 -58 -69 20 -58 -71 20 -39
setblock -71 20 -39 air destroy
kill @e[type=item,nbt={Item:{id:"minecraft:chest"}}]
execute positioned -71 20 -39 run execute as @e[type=item,distance=..1] run data modify entity @s PickupDelay set value 0s

execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2


effect clear @a regeneration
effect clear @a resistance