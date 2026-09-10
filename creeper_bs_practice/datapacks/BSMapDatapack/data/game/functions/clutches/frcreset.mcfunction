clear @a
effect clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode survival @a
spawnpoint @a 77 14 74

#reset map
fill 103 40 80 94 10 71 air
fill 103 4 80 94 9 71 lava

scoreboard players set dummy frcInPrac 1
scoreboard players set dummy frcStarted 0

effect give @s fire_resistance 1 5 true
effect give @s instant_health 1 5 true
effect give @s resistance 1 5 true
effect give @a minecraft:saturation 1 5 true

#delete items
kill @e[type=boat]

# go to map
tp @a 98.5 37 75.5 -90 90

# give items
clone 79 14 75 79 14 75 98 37 75
setblock 98 37 75 air destroy
kill @e[type=item,nbt={Item:{id:"minecraft:chest"}}]
execute positioned 98 37 75 run execute as @e[type=item,distance=..1] run data modify entity @s PickupDelay set value 0s

scoreboard players set dummy frcStarted 1
