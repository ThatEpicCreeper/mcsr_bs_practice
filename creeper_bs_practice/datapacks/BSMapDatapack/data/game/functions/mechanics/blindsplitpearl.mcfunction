
# vars
scoreboard objectives add bspTimeSec dummy
scoreboard objectives add bspTimeMs dummy
scoreboard objectives add bspPBTimeSec dummy
scoreboard objectives add bspPBTimeMs dummy
scoreboard objectives add bspInPrac dummy
scoreboard objectives add bspStarted dummy

execute if score dummy bspPBTimeMs matches 0 run data merge block -136 24 67 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"bspPBTimeSec"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"bspPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy bspPBTimeMs matches 1..99 run data merge block -136 24 67 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"bspPBTimeSec"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"bspPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy bspPBTimeMs matches 100.. run data merge block -136 24 67 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"bspPBTimeSec"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"bspPBTimeMs"},"bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=bspPBTime,limit=1] CustomName set from block -136 24 67 Text1

# movement to start map

execute if score dummy bspInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy bspStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy bspInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy bspStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy bspInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy bspStarted matches 0 run effect clear @a regeneration
execute if score dummy bspInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy bspStarted matches 0 run effect clear @a resistance
execute if score dummy bspInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy bspStarted matches 0 run effect clear @a fire_resistance

execute if score dummy bspInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy bspStarted matches 0 run effect clear @a regeneration
execute if score dummy bspInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy bspStarted matches 0 run effect clear @a resistance
execute if score dummy bspInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy bspStarted matches 0 run effect clear @a fire_resistance

execute if score dummy bspInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy bspStarted 1
execute if score dummy bspInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy bspStarted 1

# start practice
execute if block -138 16 71 minecraft:stone_button[powered=true] run function game:mechanics/bspreset
execute if block -138 16 71 minecraft:stone_button[powered=true] run setblock -138 16 71 minecraft:stone_button[powered=false,facing=north]

# timer
execute if score dummy bspInPrac matches 1 run execute if score dummy bspStarted matches 1 run scoreboard players add dummy bspTimeMs 50
execute if score dummy bspTimeMs matches 1000.. run scoreboard players add dummy bspTimeSec 1
execute if score dummy bspTimeMs matches 1000.. run scoreboard players set dummy bspTimeMs 0

execute if score dummy bspInPrac matches 1 run execute if score dummy bspTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"bspTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"bspTimeMs"},"color":"green"}]
execute if score dummy bspInPrac matches 1 run execute if score dummy bspTimeMs matches 1..99 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"bspTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"bspTimeMs"},"color":"green"}]
execute if score dummy bspInPrac matches 1 run execute if score dummy bspTimeMs matches 100.. run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"bspTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"bspTimeMs"},"color":"green"}]


# reach ending-55 21 132
execute if score dummy bspInPrac matches 1 run execute as @a at @s run execute if block ~ ~ ~ minecraft:nether_portal run execute if score dummy bspTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"bspTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"bspTimeMs"},"color":"green"}]
execute if score dummy bspInPrac matches 1 run execute as @a at @s run execute if block ~ ~ ~ minecraft:nether_portal run execute if score dummy bspTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"bspTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"bspTimeMs"},"color":"green"}]
execute if score dummy bspInPrac matches 1 run execute as @a at @s run execute if block ~ ~ ~ minecraft:nether_portal run execute if score dummy bspTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"bspTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"bspTimeMs"},"color":"green"}]
execute if score dummy bspInPrac matches 1 run execute as @a at @s run execute if block ~ ~ ~ minecraft:nether_portal run execute if score dummy bspTimeSec < dummy bspPBTimeSec run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy bspInPrac matches 1 run execute as @a at @s run execute if block ~ ~ ~ minecraft:nether_portal run execute if score dummy bspTimeSec < dummy bspPBTimeSec run scoreboard players operation dummy bspPBTimeMs = dummy bspTimeMs
execute if score dummy bspInPrac matches 1 run execute as @a at @s run execute if block ~ ~ ~ minecraft:nether_portal run execute if score dummy bspTimeSec < dummy bspPBTimeSec run scoreboard players operation dummy bspPBTimeSec = dummy bspTimeSec
execute if score dummy bspInPrac matches 1 run execute as @a at @s run execute if block ~ ~ ~ minecraft:nether_portal run execute if score dummy bspTimeSec = dummy bspPBTimeSec run execute if score dummy bspTimeMs < dummy bspPBTimeMs run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy bspInPrac matches 1 run execute as @a at @s run execute if block ~ ~ ~ minecraft:nether_portal run execute if score dummy bspTimeSec = dummy bspPBTimeSec run execute if score dummy bspTimeMs <= dummy bspPBTimeMs run scoreboard players operation dummy bspPBTimeMs = dummy bspTimeMs
execute if score dummy bspInPrac matches 1 run execute as @a at @s run execute if block ~ ~ ~ minecraft:nether_portal run execute if score dummy bspTimeSec = dummy bspPBTimeSec run execute if score dummy bspTimeMs <= dummy bspPBTimeMs run scoreboard players operation dummy bspPBTimeSec = dummy bspTimeSec
execute if score dummy bspInPrac matches 1 run execute as @a at @s run execute if block ~ ~ ~ minecraft:nether_portal run function game:mechanics/bspreset

execute if score dummy bspInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:mechanics/bspreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy bspInPrac matches 1 run scoreboard players set @a dropIronPickaxe 1

execute if score dummy bspInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run tp @s -138 15 65 0 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run clear @s
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy bspInPrac 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy bspStarted 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]

