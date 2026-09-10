clear @a
gamerule doFireTick false
gamerule doMobLoot false
gamemode adventure @a
spawnpoint @a 48 7 -18

#reset fire
fill 37 25 -36 62 1 -81 air replace fire

scoreboard players set dummy hfsInPrac 1
scoreboard players set dummy hfsStarted 0

scoreboard players set dummy hfsTimeSec 0
scoreboard players set dummy hfsTimeMs 0

effect give @s fire_resistance 20 5 true
effect give @s regeneration 20 5 true
effect give @s resistance 20 5 true
effect give @a minecraft:saturation 2 5 true

#delete items
kill @e[type=item,nbt={Item:{id:"minecraft:flint_and_steel"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:snowball"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:porkchop"}}]

# reset hoglins
kill @e[type=minecraft:hoglin]

execute if score dummy hfsMap matches 1 run summon hoglin 47 7 -66 {IsImmuneToZombification:1b}
execute if score dummy hfsMap matches 1 run summon hoglin 52 7 -54 {IsImmuneToZombification:1b}

#go to map
execute if score dummy hfsMap matches 1 run tp @a 49 7 -43 180 0

#give items

give @a flint_and_steel{CanPlaceOn:[crimson_nylium,netherrack,crimson_hyphae,crimson_stem,nether_wart_block],CanDestroy:[fire],HideFlags:24}
give @a snowball{display:{Name:'[{"text":"Reset","bold":true,"italic":false,"color":"gold"}]',Lore:['[{"text":"(Throw to reset)","italic":false,"color":"gray"}]']}}

