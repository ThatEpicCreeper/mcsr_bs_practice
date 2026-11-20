clear @a
effect clear @a minecraft:wither
gamerule doFireTick false
gamerule doMobLoot false
gamemode adventure @a
spawnpoint @a 85 7 -19

# reset gravel


scoreboard players set dummy wsirInPrac 1
scoreboard players set dummy wsirStarted 0

scoreboard players set dummy wsirTimeSec 0
scoreboard players set dummy wsirTimeMs 0

scoreboard players set dummy wsirHighDist 0
scoreboard players set dummy wsirGenPos -166

effect give @s fire_resistance 20 5 true
effect give @s regeneration 20 5 true
effect give @s resistance 20 5 true
effect give @a minecraft:saturation 2 5 true

#delete items
kill @e[type=item,nbt={Item:{id:"minecraft:gravel"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:flint"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:snowball"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:stone_axe"}}]

# reset wither skeles
kill @e[type=minecraft:wither_skeleton]

#base map
setblock 80 25 -197 air
setblock 80 25 -228 air
setblock 80 25 -259 air
setblock 80 24 -197 air
setblock 80 24 -228 air
setblock 80 24 -259 air

setblock 80 25 -197 minecraft:structure_block{mode:"LOAD",name:"minecraft:fort1",posX:0,posY:1,posZ:0,ignoreEntities:0b}
setblock 80 25 -228 minecraft:structure_block{mode:"LOAD",name:"minecraft:fort2",posX:0,posY:1,posZ:0,ignoreEntities:0b}
setblock 80 25 -259 minecraft:structure_block{mode:"LOAD",name:"minecraft:fort3",posX:0,posY:1,posZ:0,ignoreEntities:0b}
setblock 80 24 -197 redstone_block
setblock 80 24 -228 redstone_block
setblock 80 24 -259 redstone_block

# go to map
tp @a 86 38 -150 180 0

#give items

give @a stone_axe
give @a snowball{display:{Name:'[{"text":"Reset","bold":true,"italic":false,"color":"gold"}]',Lore:['[{"text":"(Throw to reset)","italic":false,"color":"gray"}]']}}
give @a iron_pickaxe
give @a gravel{CanPlaceOn:[nether_brick_fence,nether_bricks,gravel],HideFlags:24} 16

tellraw @a {"text":"Warning: Please play on 14+ Render Distance!","bold":true,"color":"red"}