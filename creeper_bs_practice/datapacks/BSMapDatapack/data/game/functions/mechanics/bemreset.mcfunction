clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode survival @a
spawnpoint @a -92 15 67

#reset map
clone -200 42 243 -173 33 220 -200 20 220

scoreboard players set dummy bemInPrac 1
scoreboard players set dummy bemStarted 0

scoreboard players set dummy bemTimeSec 0
scoreboard players set dummy bemTimeMs 0

scoreboard players set @a bemKillEman 0

effect give @s fire_resistance 20 5 true
effect give @s regeneration 20 5 true
effect give @s resistance 20 5 true
effect give @a minecraft:saturation 2 5 true

#delete items
execute positioned -185 21 232 run kill @e[type=item,distance=..20]

# reset enderman
kill @e[type=minecraft:enderman]
kill @e[type=boat]

#spawn enderman
summon minecraft:enderman -197 21 232

effect give @e[type=enderman] slowness 1000 5 true


#go to map
tp @a -176 21 232 90 -2.7

#give items
clone -90 15 70 -90 15 70 -176 22 232
setblock -176 22 232 air destroy
kill @e[type=item,nbt={Item:{id:"minecraft:chest"}}]
execute positioned -176 22 232 run execute as @e[type=item,distance=..1] run data modify entity @s PickupDelay set value 0s
