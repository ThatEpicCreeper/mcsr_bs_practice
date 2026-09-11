clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode survival @a
spawnpoint @a 76 15 132

#reset map
clone 138 26 125 124 17 140 91 13 125

#execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

scoreboard players set dummy wlsInPrac 1
scoreboard players set dummy wlsStarted 0

# scoreboard players set dummy wlsTimeSec 0
# scoreboard players set dummy wlsTimeMs 0

effect give @a fire_resistance 20 5 true
effect give @a regeneration 20 5 true
effect give @a resistance 20 5 true
effect give @a minecraft:saturation 2 5 true

#delete items
execute positioned 98 16 133 run kill @e[type=item,distance=..8]
kill @e[type=boat]

#go to map
tp @a 100 15 132.5 90 0

#give items
clone 80 15 135 80 15 135 100 16 132
setblock 100 16 132 air destroy
kill @e[type=item,nbt={Item:{id:"minecraft:chest"}}]
execute positioned 100 16 132 run execute as @e[type=item,distance=..1] run data modify entity @s PickupDelay set value 0s

