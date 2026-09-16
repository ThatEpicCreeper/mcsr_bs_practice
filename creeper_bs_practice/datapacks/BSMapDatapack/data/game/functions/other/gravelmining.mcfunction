
# vars
scoreboard objectives add gvmTimeSec dummy
scoreboard objectives add gvmTimeMs dummy
scoreboard objectives add gvmPBTimeSec dummy
scoreboard objectives add gvmPBTimeMs dummy
scoreboard objectives add gvmInPrac dummy
scoreboard objectives add gvmStarted dummy
scoreboard objectives add gvmFlintCount dummy

execute if score dummy gvmPBTimeMs matches 0 run data merge block -75 26 0 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"gvmPBTimeSec"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"gvmPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy gvmPBTimeMs matches 1..99 run data merge block -75 26 0 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"gvmPBTimeSec"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"gvmPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy gvmPBTimeMs matches 100.. run data merge block -75 26 0 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"gvmPBTimeSec"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"gvmPBTimeMs"},"bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=gvmPBTime,limit=1] CustomName set from block -75 26 0 Text1

#count flint
execute as @a at @s run execute store result score @s gvmFlintCount run clear @s minecraft:flint 0


# movement to start map

execute if score dummy gvmInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy gvmStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy gvmInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy gvmStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy gvmInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy gvmStarted matches 0 run effect clear @a regeneration
execute if score dummy gvmInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy gvmStarted matches 0 run effect clear @a resistance
execute if score dummy gvmInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy gvmStarted matches 0 run effect clear @a fire_resistance

execute if score dummy gvmInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy gvmStarted matches 0 run effect clear @a regeneration
execute if score dummy gvmInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy gvmStarted matches 0 run effect clear @a resistance
execute if score dummy gvmInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy gvmStarted matches 0 run effect clear @a fire_resistance

execute if score dummy gvmInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy gvmStarted matches 0 run tellraw @a {"text":"Obtain 1+ Flint!","color":"green"}
execute if score dummy gvmInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy gvmStarted matches 0 run tellraw @a {"text":"Obtain 1+ Flint!","color":"green"}

execute if score dummy gvmInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy gvmStarted 1
execute if score dummy gvmInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy gvmStarted 1

# start practice
execute if block -75 19 3 minecraft:stone_button[powered=true] run function game:other/gvmreset
execute if block -75 19 3 minecraft:stone_button[powered=true] run setblock -75 19 3 minecraft:stone_button[powered=false,facing=north]

# timer
execute if score dummy gvmInPrac matches 1 run execute if score dummy gvmStarted matches 1 run scoreboard players add dummy gvmTimeMs 50
execute if score dummy gvmTimeMs matches 1000.. run scoreboard players add dummy gvmTimeSec 1
execute if score dummy gvmTimeMs matches 1000.. run scoreboard players set dummy gvmTimeMs 0

execute if score dummy gvmInPrac matches 1 run execute if score dummy gvmTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"gvmTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"gvmTimeMs"},"color":"green"}]
execute if score dummy gvmInPrac matches 1 run execute if score dummy gvmTimeMs matches 1..99 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"gvmTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"gvmTimeMs"},"color":"green"}]
execute if score dummy gvmInPrac matches 1 run execute if score dummy gvmTimeMs matches 100.. run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"gvmTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"gvmTimeMs"},"color":"green"}]


# get enough
execute if score dummy gvmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={gvmFlintCount=1..}] run execute if score dummy gvmTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"gvmTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"gvmTimeMs"},"color":"green"}]
execute if score dummy gvmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={gvmFlintCount=1..}] run execute if score dummy gvmTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"gvmTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"gvmTimeMs"},"color":"green"}]
execute if score dummy gvmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={gvmFlintCount=1..}] run execute if score dummy gvmTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"gvmTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"gvmTimeMs"},"color":"green"}]
execute if score dummy gvmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={gvmFlintCount=1..}] run execute if score dummy gvmTimeSec < dummy gvmPBTimeSec run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy gvmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={gvmFlintCount=1..}] run execute if score dummy gvmTimeSec < dummy gvmPBTimeSec run scoreboard players operation dummy gvmPBTimeMs = dummy gvmTimeMs
execute if score dummy gvmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={gvmFlintCount=1..}] run execute if score dummy gvmTimeSec < dummy gvmPBTimeSec run scoreboard players operation dummy gvmPBTimeSec = dummy gvmTimeSec
execute if score dummy gvmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={gvmFlintCount=1..}] run execute if score dummy gvmTimeSec = dummy gvmPBTimeSec run execute if score dummy gvmTimeMs < dummy gvmPBTimeMs run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy gvmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={gvmFlintCount=1..}] run execute if score dummy gvmTimeSec = dummy gvmPBTimeSec run execute if score dummy gvmTimeMs <= dummy gvmPBTimeMs run scoreboard players operation dummy gvmPBTimeMs = dummy gvmTimeMs
execute if score dummy gvmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={gvmFlintCount=1..}] run execute if score dummy gvmTimeSec = dummy gvmPBTimeSec run execute if score dummy gvmTimeMs <= dummy gvmPBTimeMs run scoreboard players operation dummy gvmPBTimeSec = dummy gvmTimeSec
execute if score dummy gvmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={gvmFlintCount=1..}] run function game:other/gvmreset

execute if score dummy gvmInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:other/gvmreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy gvmInPrac matches 1 run scoreboard players set @a dropIronPickaxe 1

execute if score dummy gvmInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run tp @s -75 18 -2 0 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run clear @s
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy gvmInPrac 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy gvmStarted 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]

