clear @a
effect clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode survival @a
spawnpoint @a 2 11 68

#reset map
clone 14 41 185 -20 21 144 -20 21 86

scoreboard players set dummy kiaInPrac 1
scoreboard players set dummy kiaStarted 0

scoreboard players set dummy kiaTimeSec 0
scoreboard players set dummy kiaTimeMs 0

effect give @s fire_resistance 1 5 true
effect give @s instant_health 1 5 true
effect give @s resistance 1 5 true
effect give @a minecraft:saturation 1 5 true

#delete items
execute positioned -4 27 106 run kill @e[type=item,distance=..20]
kill @e[type=boat]

# reset animals
kill @e[type=minecraft:cow]
kill @e[type=minecraft:pig]
kill @e[type=minecraft:chicken]
kill @e[type=minecraft:sheep]

# go to map
tp @a 5 26 94 30 0

# give items
clone -1 11 70 -1 11 70 5 27 94
setblock 5 27 94 air destroy
kill @e[type=item,nbt={Item:{id:"minecraft:chest"}}]
execute positioned 5 27 94 run execute as @e[type=item,distance=..1] run data modify entity @s PickupDelay set value 0s

# spawn animals
execute if score dummy kiaAnimalType matches 0 run summon cow -1 26 109
execute if score dummy kiaAnimalType matches 0 run summon cow -7 26 109
execute if score dummy kiaAnimalType matches 0 run summon cow -3 26 104
execute if score dummy kiaAnimalType matches 0 run summon cow -4 26 98
execute if score dummy kiaAnimalType matches 0 run summon cow 5 25 104

execute if score dummy kiaAnimalType matches 1 run summon pig -1 26 109
execute if score dummy kiaAnimalType matches 1 run summon pig -7 26 109
execute if score dummy kiaAnimalType matches 1 run summon pig -3 26 104
execute if score dummy kiaAnimalType matches 1 run summon pig -4 26 98
execute if score dummy kiaAnimalType matches 1 run summon pig 5 25 104

execute if score dummy kiaAnimalType matches 2 run summon chicken -1 26 109
execute if score dummy kiaAnimalType matches 2 run summon chicken -7 26 109
execute if score dummy kiaAnimalType matches 2 run summon chicken -3 26 104
execute if score dummy kiaAnimalType matches 2 run summon chicken -4 26 98
execute if score dummy kiaAnimalType matches 2 run summon chicken 5 25 104

execute if score dummy kiaAnimalType matches 3 run summon sheep -1 26 109
execute if score dummy kiaAnimalType matches 3 run summon sheep -7 26 109
execute if score dummy kiaAnimalType matches 3 run summon sheep -3 26 104
execute if score dummy kiaAnimalType matches 3 run summon sheep -4 26 98
execute if score dummy kiaAnimalType matches 3 run summon sheep 5 25 104
