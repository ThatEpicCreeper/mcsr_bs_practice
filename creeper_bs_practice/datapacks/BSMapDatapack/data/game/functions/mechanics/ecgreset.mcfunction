clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode survival @a
spawnpoint @a 26 41 -17

# reset map
clone 14 101 -79 38 58 -60 14 58 -34

scoreboard players set dummy ecgInPrac 1
scoreboard players set dummy ecgStarted 0

scoreboard players set dummy ecgTimeSec 0
scoreboard players set dummy ecgTimeMs 0

effect give @s fire_resistance 20 5 true
effect give @s regeneration 20 5 true
effect give @s resistance 20 5 true
effect give @a minecraft:saturation 2 5 true

#delete items
execute positioned 26 76 -23 run kill @e[type=item,distance=..20]

# reset crystal
kill @e[type=minecraft:end_crystal]
kill @e[type=minecraft:boat]

#spawn crystal
summon minecraft:end_crystal 33 83 -25

#go to map
tp @a 31.9 82 -26 -90 75

#play dragon
execute as @a at @s run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 1 1

#give items
clone 29 41 -15 29 41 -15 32 83 -26
setblock 32 83 -26 air destroy
kill @e[type=item,nbt={Item:{id:"minecraft:chest"}}]
execute positioned 32 83 -26 run execute as @e[type=item,distance=..1] run data modify entity @s PickupDelay set value 0s

tellraw @a ["",{"text":"Get to the co-ordinates ","color":"green"},{"text":"28 95 -27!","color":"light_purple"}]
execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

scoreboard players set dummy ecgStarted 1

effect clear @a regeneration
effect clear @a resistance