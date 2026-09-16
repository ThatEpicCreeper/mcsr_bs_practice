
# vars
scoreboard objectives add trmTimeSec dummy
scoreboard objectives add trmTimeMs dummy
scoreboard objectives add trmPBTimeSec dummy
scoreboard objectives add trmPBTimeMs dummy
scoreboard objectives add trmInPrac dummy
scoreboard objectives add trmStarted dummy
scoreboard objectives add trmLogCount dummy

execute if score dummy trmPBTimeMs matches 0 run data merge block -73 27 -58 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"trmPBTimeSec"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"trmPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy trmPBTimeMs matches 1..99 run data merge block -73 27 -58 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"trmPBTimeSec"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"trmPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy trmPBTimeMs matches 100.. run data merge block -73 27 -58 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"trmPBTimeSec"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"trmPBTimeMs"},"bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=trmPBTime,limit=1] CustomName set from block -73 27 -58 Text1

#count logs
execute as @a at @s run execute store result score @s trmLogCount run clear @s minecraft:oak_log 0


# movement to start map

execute if score dummy trmInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy trmStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy trmInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy trmStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy trmInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy trmStarted matches 0 run effect clear @a regeneration
execute if score dummy trmInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy trmStarted matches 0 run effect clear @a resistance
execute if score dummy trmInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy trmStarted matches 0 run effect clear @a fire_resistance

execute if score dummy trmInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy trmStarted matches 0 run effect clear @a regeneration
execute if score dummy trmInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy trmStarted matches 0 run effect clear @a resistance
execute if score dummy trmInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy trmStarted matches 0 run effect clear @a fire_resistance

execute if score dummy trmInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy trmStarted matches 0 run tellraw @a {"text":"Obtain 12+ Logs!","color":"green"}
execute if score dummy trmInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy trmStarted matches 0 run tellraw @a {"text":"Obtain 12+ Logs!","color":"green"}

execute if score dummy trmInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy trmStarted 1
execute if score dummy trmInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy trmStarted 1

# start practice
execute if block -73 21 -55 minecraft:stone_button[powered=true] run function game:other/trmreset
execute if block -73 21 -55 minecraft:stone_button[powered=true] run setblock -73 21 -55 minecraft:stone_button[powered=false,facing=north]

# timer
execute if score dummy trmInPrac matches 1 run execute if score dummy trmStarted matches 1 run scoreboard players add dummy trmTimeMs 50
execute if score dummy trmTimeMs matches 1000.. run scoreboard players add dummy trmTimeSec 1
execute if score dummy trmTimeMs matches 1000.. run scoreboard players set dummy trmTimeMs 0

execute if score dummy trmInPrac matches 1 run execute if score dummy trmTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"trmTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"trmTimeMs"},"color":"green"}]
execute if score dummy trmInPrac matches 1 run execute if score dummy trmTimeMs matches 1..99 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"trmTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"trmTimeMs"},"color":"green"}]
execute if score dummy trmInPrac matches 1 run execute if score dummy trmTimeMs matches 100.. run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"trmTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"trmTimeMs"},"color":"green"}]


# get enough
execute if score dummy trmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={trmLogCount=12..}] run execute if score dummy trmTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"trmTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"trmTimeMs"},"color":"green"}]
execute if score dummy trmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={trmLogCount=12..}] run execute if score dummy trmTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"trmTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"trmTimeMs"},"color":"green"}]
execute if score dummy trmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={trmLogCount=12..}] run execute if score dummy trmTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"trmTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"trmTimeMs"},"color":"green"}]
execute if score dummy trmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={trmLogCount=12..}] run execute if score dummy trmTimeSec < dummy trmPBTimeSec run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy trmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={trmLogCount=12..}] run execute if score dummy trmTimeSec < dummy trmPBTimeSec run scoreboard players operation dummy trmPBTimeMs = dummy trmTimeMs
execute if score dummy trmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={trmLogCount=12..}] run execute if score dummy trmTimeSec < dummy trmPBTimeSec run scoreboard players operation dummy trmPBTimeSec = dummy trmTimeSec
execute if score dummy trmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={trmLogCount=12..}] run execute if score dummy trmTimeSec = dummy trmPBTimeSec run execute if score dummy trmTimeMs < dummy trmPBTimeMs run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy trmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={trmLogCount=12..}] run execute if score dummy trmTimeSec = dummy trmPBTimeSec run execute if score dummy trmTimeMs <= dummy trmPBTimeMs run scoreboard players operation dummy trmPBTimeMs = dummy trmTimeMs
execute if score dummy trmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={trmLogCount=12..}] run execute if score dummy trmTimeSec = dummy trmPBTimeSec run execute if score dummy trmTimeMs <= dummy trmPBTimeMs run scoreboard players operation dummy trmPBTimeSec = dummy trmTimeSec
execute if score dummy trmInPrac matches 1 run execute as @a at @s run execute if entity @a[scores={trmLogCount=12..}] run function game:other/trmreset

execute if score dummy trmInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:other/trmreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy trmInPrac matches 1 run scoreboard players set @a dropIronPickaxe 1

execute if score dummy trmInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run tp @s -73 20 -61 0 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run clear @s
execute as @a[scores={dropIronPickaxe=1..}] at @s run gamemode adventure @a
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy trmInPrac 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy trmStarted 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]

