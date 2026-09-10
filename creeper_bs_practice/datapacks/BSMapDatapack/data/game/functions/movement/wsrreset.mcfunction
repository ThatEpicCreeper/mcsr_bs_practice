clear @a
effect clear @a minecraft:wither
gamerule doFireTick false
gamerule doMobLoot false
gamemode adventure @a
spawnpoint @a 85 7 -19

# reset gravel
fill 78 40 -37 93 17 -120 air replace gravel

# reset gate
fill 86 31 -120 84 33 -120 minecraft:nether_brick_fence[west=true,east=true]

scoreboard players set dummy wsrInPrac 1
scoreboard players set dummy wsrStarted 0

scoreboard players set dummy wsrTimeSec 0
scoreboard players set dummy wsrTimeMs 0

scoreboard players set dummy wsrDroppedSkeles 0
scoreboard players set dummy wsrStage 1

effect give @s fire_resistance 20 5 true
effect give @s regeneration 20 5 true
effect give @s resistance 20 5 true
effect give @a minecraft:saturation 2 5 true

#delete items
kill @e[type=item,nbt={Item:{id:"minecraft:gravel"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:flint"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:snowball"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:stone_axe"}}]

# reset hoglins
kill @e[type=minecraft:wither_skeleton]

summon wither_skeleton 85 31 -55
summon wither_skeleton 79 31 -67
summon wither_skeleton 91 31 -66
summon wither_skeleton 79 31 -80
summon wither_skeleton 90 31 -78
summon wither_skeleton 84 31 -116
summon wither_skeleton 86 31 -117
summon wither_skeleton 87 32 -116
summon wither_skeleton 83 32 -114
summon wither_skeleton 85 31 -113

# go to map
tp @a 85 31 -39 180 0

#give items

give @a stone_axe
give @a snowball{display:{Name:'[{"text":"Reset","bold":true,"italic":false,"color":"gold"}]',Lore:['[{"text":"(Throw to reset)","italic":false,"color":"gray"}]']}}
