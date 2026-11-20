scoreboard objectives add wsirTimeSec dummy
scoreboard objectives add wsirTimeMs dummy

scoreboard objectives add wsirInPrac dummy
scoreboard objectives add wsirStarted dummy

scoreboard objectives add wsirDist dummy
scoreboard objectives add wsirHighDist dummy
scoreboard objectives add wsirPBDist dummy

scoreboard objectives add wsirZPos dummy
scoreboard objectives add wsirYPos dummy
scoreboard objectives add wsirGenPos dummy
scoreboard objectives add wsirRandModule dummy

# scoreboard objectives add dropStoneAxe minecraft.dropped:minecraft.stone_axe

# save pb
data merge block 85 15 -19 {Text2:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"wsirPBDist"},"bold":true,"color":"yellow"},{"text":" Blocks","bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=wsirPBTime,limit=1] CustomName set from block 85 15 -19 Text2

# start map
execute if block 85 10 -16 minecraft:warped_button[powered=true] run function game:movement/wsirreset
execute if block 85 10 -16 minecraft:warped_button[powered=true] run setblock 85 10 -16 minecraft:warped_button[powered=false,facing=north]

# wither skeleton ai
execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 0 run execute as @e[type=wither_skeleton] at @s run execute as @e[type=!player] run data modify entity @s NoAi set value 1b
execute if score dummy wsirInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wsirStarted matches 0 run data modify entity @s NoAi set value 0b
execute if score dummy wsirInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wsirStarted matches 0 run data modify entity @s NoAi set value 0b

# movement to start map
execute if score dummy wsirInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wsirStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy wsirInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wsirStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy wsirInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wsirStarted matches 0 run effect clear @a regeneration
execute if score dummy wsirInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wsirStarted matches 0 run effect clear @a resistance
execute if score dummy wsirInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wsirStarted matches 0 run effect clear @a fire_resistance

execute if score dummy wsirInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wsirStarted matches 0 run effect clear @a regeneration
execute if score dummy wsirInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wsirStarted matches 0 run effect clear @a resistance
execute if score dummy wsirInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wsirStarted matches 0 run effect clear @a fire_resistance

execute if score dummy wsirInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy wsirStarted 1
execute if score dummy wsirInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy wsirStarted 1

# timer
execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run scoreboard players add dummy wsirTimeMs 50
execute if score dummy wsirTimeMs matches 1000.. run scoreboard players add dummy wsirTimeSec 1
execute if score dummy wsirTimeMs matches 1000.. run scoreboard players set dummy wsirTimeMs 0

# distance

execute as @a at @s run execute store result score @s wsirZPos run data get entity @s Pos[2]

scoreboard players set dummy wsirDist -152
scoreboard players operation dummy wsirDist -= @a wsirZPos

execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run execute if score dummy wsirDist > dummy wsirHighDist run scoreboard players operation dummy wsirHighDist = dummy wsirDist

execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirTimeMs matches 0 run title @a actionbar ["",{"text":"Score: ","color":"gold"},{"score":{"name":"dummy","objective":"wsirHighDist"},"color":"yellow"},{"text":" | ","bold":true,"color":"dark_gray"},{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"wsirTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"wsirTimeMs"},"color":"green"}]
execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirTimeMs matches 1..99 run title @a actionbar ["",{"text":"Score: ","color":"gold"},{"score":{"name":"dummy","objective":"wsirHighDist"},"color":"yellow"},{"text":" | ","bold":true,"color":"dark_gray"},{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"wsirTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"wsirTimeMs"},"color":"green"}]
execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirTimeMs matches 100.. run title @a actionbar ["",{"text":"Score: ","color":"gold"},{"score":{"name":"dummy","objective":"wsirHighDist"},"color":"yellow"},{"text":" | ","bold":true,"color":"dark_gray"},{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"wsirTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"wsirTimeMs"},"color":"green"}]

# low death
execute as @a at @s run execute store result score @s wsirYPos run data get entity @s Pos[1]

execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run execute if score @r wsirYPos matches ..33 run scoreboard players set @a onDeath 1

# generate map

scoreboard players add dummy wsirRandModule 1
execute if score dummy wsirRandModule matches 5.. run scoreboard players set dummy wsirRandModule 0

execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run execute as @a at @s run execute if score @s wsirZPos <= dummy wsirGenPos run give @a gravel{CanPlaceOn:[nether_brick_fence,nether_bricks,gravel],HideFlags:24} 5

execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run execute as @a at @s run execute if score @s wsirZPos <= dummy wsirGenPos run setblock 80 25 ~-123 air
execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run execute as @a at @s run execute if score @s wsirZPos <= dummy wsirGenPos run setblock 80 24 ~-123 air

execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run execute as @a at @s run execute if score @s wsirZPos <= dummy wsirGenPos run execute if score dummy wsirRandModule matches 0 run setblock 80 25 ~-123 minecraft:structure_block{mode:"LOAD",name:"minecraft:fort1",posX:0,posY:1,posZ:0,ignoreEntities:0b}
execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run execute as @a at @s run execute if score @s wsirZPos <= dummy wsirGenPos run execute if score dummy wsirRandModule matches 1 run setblock 80 25 ~-123 minecraft:structure_block{mode:"LOAD",name:"minecraft:fort2",posX:0,posY:1,posZ:0,ignoreEntities:0b}
execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run execute as @a at @s run execute if score @s wsirZPos <= dummy wsirGenPos run execute if score dummy wsirRandModule matches 2 run setblock 80 25 ~-123 minecraft:structure_block{mode:"LOAD",name:"minecraft:fort3",posX:0,posY:1,posZ:0,ignoreEntities:0b}
execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run execute as @a at @s run execute if score @s wsirZPos <= dummy wsirGenPos run execute if score dummy wsirRandModule matches 3 run setblock 80 25 ~-123 minecraft:structure_block{mode:"LOAD",name:"minecraft:fort4",posX:0,posY:1,posZ:0,ignoreEntities:0b}
execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run execute as @a at @s run execute if score @s wsirZPos <= dummy wsirGenPos run execute if score dummy wsirRandModule matches 4 run setblock 80 25 ~-123 minecraft:structure_block{mode:"LOAD",name:"minecraft:fort5",posX:0,posY:1,posZ:0,ignoreEntities:0b}


execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run execute as @a at @s run execute if score @s wsirZPos <= dummy wsirGenPos run setblock 80 24 ~-123 redstone_block
execute if score dummy wsirInPrac matches 1 run execute if score dummy wsirStarted matches 1 run execute as @a at @s run execute if score @s wsirZPos <= dummy wsirGenPos run scoreboard players operation dummy wsirGenPos -= 31 wsirGenPos


#execute if score dummy wsirInPrac matches 1 run spawnpoint @s ~ 150 ~

# on death end run
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={onDeath=1..}] run tellraw @a ["",{"text":"Score: ","color":"gold"},{"score":{"name":"dummy","objective":"wsirHighDist"},"color":"yellow"},{"text":" in ","color":"green"},{"score":{"name":"dummy","objective":"wsirTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"wsirTimeMs"},"color":"green"}]
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={onDeath=1..}] run execute if score dummy wsirHighDist > dummy wsirPBDist run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={onDeath=1..}] run execute if score dummy wsirHighDist > dummy wsirPBDist run scoreboard players operation dummy wsirPBDist = dummy wsirHighDist


execute if score dummy wsirInPrac matches 1 run execute as @a[scores={onDeath=1..}] at @s run scoreboard players set @s dropStoneAxe 1

# execute if score dummy wsirInPrac matches 1 run execute as @a[scores={onDeath=1..}] at @s run give @a stone_axe
# execute if score dummy wsirInPrac matches 1 run execute as @a[scores={onDeath=1..}] at @s run give @a snowball{display:{Name:'[{"text":"Reset","bold":true,"italic":false,"color":"gold"}]',Lore:['[{"text":"(Throw to reset)","italic":false,"color":"gray"}]']}}
# execute if score dummy wsirInPrac matches 1 run execute as @a[scores={onDeath=1..}] at @s run give @a iron_pickaxe

execute if score dummy wsirInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:movement/wsirreset

#execute as @a[scores={onDeath=1..}] at @s run execute if score dummy wsrInPrac matches 1 run scoreboard players set @a dropStoneAxe 1

execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropStoneAxe=1..}] at @s run tp @s 85 7 -19 0 0
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropStoneAxe=1..}] at @s run clear @s
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropStoneAxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropStoneAxe=1..}] at @s run effect give @s regeneration 20 5 true
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropStoneAxe=1..}] at @s run effect give @s resistance 20 5 true
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropStoneAxe=1..}] at @s run scoreboard players set dummy wsirInPrac 0
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropStoneAxe=1..}] at @s run scoreboard players set dummy wsirStarted 0
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropStoneAxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:stone_axe"}}]

execute as @a[scores={dropStoneAxe=1..}] at @s run scoreboard players set @s dropStoneAxe 0

execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run tp @s 85 7 -19 0 0
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run clear @s
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s regeneration 20 5 true
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s resistance 20 5 true
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy wsirInPrac 0
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy wsirStarted 0
execute if score dummy wsirInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]