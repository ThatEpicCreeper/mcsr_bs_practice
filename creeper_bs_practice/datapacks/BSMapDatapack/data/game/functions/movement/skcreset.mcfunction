clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode adventure @a
spawnpoint @a 123 6 -20

#reset fire
fill 118 17 -49 135 23 -66 air replace gravel
fill 118 17 -49 135 17 -66 minecraft:soul_soil replace air

scoreboard players set dummy skcInPrac 1
scoreboard players set dummy skcStarted 0

scoreboard players set dummy skcTimeSec 0
scoreboard players set dummy skcTimeMs 0

effect give @s fire_resistance 20 5 true
effect give @s regeneration 20 5 true
effect give @s resistance 20 5 true
effect give @a minecraft:saturation 1 5 true
effect give @a minecraft:hunger 3 59 true

#delete items
kill @e[type=item,nbt={Item:{id:"minecraft:soul_soil"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:gravel"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:flint"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:snowball"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:stone_shovel"}}]

# change max hp
execute as @a at @s run attribute @s minecraft:generic.max_health base set 6

# get target coords
scoreboard players operation dummy skcSetX = dummy skcXTarget
scoreboard players operation dummy skcSetZ = dummy skcZTarget

# reset skeleton
kill @e[type=minecraft:skeleton]

summon skeleton 122 19 -61
effect give @e[type=skeleton] slowness 10000 10 true
effect give @e[type=skeleton] resistance 1000 4 true

#go to map
tp @a 127 18 -51 180 0

#give items
give @a stone_shovel{CanDestroy:[soul_soil,gravel],HideFlags:24}
give @a snowball{display:{Name:'[{"text":"Reset","bold":true,"italic":false,"color":"gold"}]',Lore:['[{"text":"(Throw to reset)","italic":false,"color":"gray"}]']}}
give @a gravel{CanPlaceOn:[gravel,soul_soil,soul_sand,bone_block],HideFlags:24} 64