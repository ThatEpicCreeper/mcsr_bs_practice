
scoreboard objectives add wsrTimeSec dummy
scoreboard objectives add wsrTimeMs dummy
scoreboard objectives add wsrPBTimeSec dummy
scoreboard objectives add wsrPBTimeMs dummy
scoreboard objectives add wsrInPrac dummy
scoreboard objectives add wsrStarted dummy
scoreboard objectives add wsrDroppedSkeles dummy
scoreboard objectives add wsrStage dummy
scoreboard objectives add dropStoneAxe minecraft.dropped:minecraft.stone_axe

execute if score dummy wsrPBTimeMs matches 0 run data merge block 85 15 -19 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"wsrPBTimeSec"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"wsrPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy wsrPBTimeMs matches 1..99 run data merge block 85 15 -19 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"wsrPBTimeSec"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"wsrPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy wsrPBTimeMs matches 100.. run data merge block 85 15 -19 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"wsrPBTimeSec"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"wsrPBTimeMs"},"bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=wsrPBTime,limit=1] CustomName set from block 85 15 -19 Text1

# wither skeleton ai
execute if score dummy wsrInPrac matches 1 run execute if score dummy wsrStarted matches 0 run execute as @e[type=wither_skeleton] at @s run execute as @e[type=!player] run data modify entity @s NoAi set value 1b
execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wsrStarted matches 0 run data modify entity @s NoAi set value 0b
execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wsrStarted matches 0 run data modify entity @s NoAi set value 0b

# movement to start map
execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wsrStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wsrStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wsrStarted matches 0 run tellraw @a ["",{"text":"Stage 1: ","bold":true,"color":"light_purple"},{"text":"Run Past the Wither Skeleton! (or kill it)","bold":true,"color":"red"}]
execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wsrStarted matches 0 run tellraw @a ["",{"text":"Stage 1: ","bold":true,"color":"light_purple"},{"text":"Run Past the Wither Skeleton! (or kill it)","bold":true,"color":"red"}]

execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wsrStarted matches 0 run effect clear @a regeneration
execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wsrStarted matches 0 run effect clear @a resistance
execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wsrStarted matches 0 run effect clear @a fire_resistance

execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wsrStarted matches 0 run effect clear @a regeneration
execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wsrStarted matches 0 run effect clear @a resistance
execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wsrStarted matches 0 run effect clear @a fire_resistance

execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy wsrStarted 1
execute if score dummy wsrInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy wsrStarted 1

# stages
execute if score dummy wsrInPrac matches 1 run execute if score dummy wsrStage matches 1 run execute if entity @r[x=79,y=20,z=-61,dx=12,dy=20,dz=-5] run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.6
execute if score dummy wsrInPrac matches 1 run execute if score dummy wsrStage matches 1 run execute if entity @r[x=79,y=20,z=-61,dx=12,dy=20,dz=-5] run tellraw @a ["",{"text":"Stage 2: ","bold":true,"color":"light_purple"},{"text":"4-way Blockoff!","bold":true,"color":"red"}]
execute if score dummy wsrInPrac matches 1 run execute if score dummy wsrStage matches 1 run execute if entity @r[x=79,y=20,z=-61,dx=12,dy=20,dz=-5] run give @a gravel{CanPlaceOn:[nether_brick_fence,nether_bricks,gravel],HideFlags:24} 64
execute if score dummy wsrInPrac matches 1 run execute if score dummy wsrStage matches 1 run execute if entity @r[x=79,y=20,z=-61,dx=12,dy=20,dz=-5] run scoreboard players set dummy wsrStage 2

execute if score dummy wsrInPrac matches 1 run execute if score dummy wsrStage matches 2 run execute if entity @r[x=79,y=20,z=-88,dx=12,dy=20,dz=-5] run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.3
execute if score dummy wsrInPrac matches 1 run execute if score dummy wsrStage matches 2 run execute if entity @r[x=79,y=20,z=-88,dx=12,dy=20,dz=-5] run tellraw @a ["",{"text":"Stage 3: ","bold":true,"color":"light_purple"},{"text":"Knock-off 5+ Wither Skeletons!","bold":true,"color":"red"}]
execute if score dummy wsrInPrac matches 1 run execute if score dummy wsrStage matches 2 run execute if entity @r[x=79,y=20,z=-88,dx=12,dy=20,dz=-5] run scoreboard players set dummy wsrStage 3

# final stage skeleton count hit off
execute if score dummy wsrStarted matches 1 run execute if score dummy wsrStage matches 3 run execute as @e[type=minecraft:wither_skeleton,x=79,y=18,z=-88,dx=12,dy=3,dz=-32] at @s run scoreboard players add dummy wsrDroppedSkeles 1
execute if score dummy wsrStarted matches 1 run execute if score dummy wsrStage matches 3 run execute if score dummy wsrDroppedSkeles matches 5.. run execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.6
execute if score dummy wsrStarted matches 1 run execute if score dummy wsrStage matches 3 run execute if score dummy wsrDroppedSkeles matches 5.. run tellraw @a {"text":"5+ Wither Skeletons Cleared!","bold":true,"color":"gray"}
execute if score dummy wsrStarted matches 1 run execute if score dummy wsrStage matches 3 run execute if score dummy wsrDroppedSkeles matches 5.. run fill 84 31 -120 86 33 -120 air
execute if score dummy wsrStarted matches 1 run execute if score dummy wsrStage matches 3 run execute if score dummy wsrDroppedSkeles matches 5.. run scoreboard players set dummy wsrStage 4
execute if score dummy wsrStarted matches 1 run execute unless score dummy wsrDroppedSkeles matches 5.. run scoreboard players set dummy wsrDroppedSkeles 0

# start practice
execute if block 85 8 -17 minecraft:polished_blackstone_button[powered=true] run function game:movement/wsrreset
execute if block 85 8 -17 minecraft:polished_blackstone_button[powered=true] run setblock 85 8 -17 minecraft:polished_blackstone_button[powered=false,facing=north]

execute if score dummy wsrInPrac matches 1 run kill @a[x=79,y=20,z=-38,dx=12,dz=-82,dy=-2]

# timer
execute if score dummy wsrInPrac matches 1 run execute if score dummy wsrStarted matches 1 run scoreboard players add dummy wsrTimeMs 50
execute if score dummy wsrTimeMs matches 1000.. run scoreboard players add dummy wsrTimeSec 1
execute if score dummy wsrTimeMs matches 1000.. run scoreboard players set dummy wsrTimeMs 0

execute if score dummy wsrInPrac matches 1 run execute if score dummy wsrTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"wsrTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"wsrTimeMs"},"color":"green"}]
execute if score dummy wsrInPrac matches 1 run execute if score dummy wsrTimeMs matches 1..99 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"wsrTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"wsrTimeMs"},"color":"green"}]
execute if score dummy wsrInPrac matches 1 run execute if score dummy wsrTimeMs matches 100.. run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"wsrTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"wsrTimeMs"},"color":"green"}]

# reach ending
execute if score dummy wsrInPrac matches 1 run execute as @a at @s run execute if entity @s[x=86,y=31,z=-121,dx=-2,dz=-1,dy=1] run execute if score dummy wsrTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"wsrTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"wsrTimeMs"},"color":"green"}]
execute if score dummy wsrInPrac matches 1 run execute as @a at @s run execute if entity @s[x=86,y=31,z=-121,dx=-2,dz=-1,dy=1] run execute if score dummy wsrTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"wsrTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"wsrTimeMs"},"color":"green"}]
execute if score dummy wsrInPrac matches 1 run execute as @a at @s run execute if entity @s[x=86,y=31,z=-121,dx=-2,dz=-1,dy=1] run execute if score dummy wsrTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"wsrTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"wsrTimeMs"},"color":"green"}]
execute if score dummy wsrInPrac matches 1 run execute as @a at @s run execute if entity @s[x=86,y=31,z=-121,dx=-2,dz=-1,dy=1] run execute if score dummy wsrTimeSec < dummy wsrPBTimeSec run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy wsrInPrac matches 1 run execute as @a at @s run execute if entity @s[x=86,y=31,z=-121,dx=-2,dz=-1,dy=1] run execute if score dummy wsrTimeSec < dummy wsrPBTimeSec run scoreboard players operation dummy wsrPBTimeMs = dummy wsrTimeMs
execute if score dummy wsrInPrac matches 1 run execute as @a at @s run execute if entity @s[x=86,y=31,z=-121,dx=-2,dz=-1,dy=1] run execute if score dummy wsrTimeSec < dummy wsrPBTimeSec run scoreboard players operation dummy wsrPBTimeSec = dummy wsrTimeSec
execute if score dummy wsrInPrac matches 1 run execute as @a at @s run execute if entity @s[x=86,y=31,z=-121,dx=-2,dz=-1,dy=1] run execute if score dummy wsrTimeSec = dummy wsrPBTimeSec run execute if score dummy wsrTimeMs < dummy wsrPBTimeMs run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy wsrInPrac matches 1 run execute as @a at @s run execute if entity @s[x=86,y=31,z=-121,dx=-2,dz=-1,dy=1] run execute if score dummy wsrTimeSec = dummy wsrPBTimeSec run execute if score dummy wsrTimeMs <= dummy wsrPBTimeMs run scoreboard players operation dummy wsrPBTimeMs = dummy wsrPBTimeMs
execute if score dummy wsrInPrac matches 1 run execute as @a at @s run execute if entity @s[x=86,y=31,z=-121,dx=-2,dz=-1,dy=1] run execute if score dummy wsrTimeSec = dummy wsrPBTimeSec run execute if score dummy wsrTimeMs <= dummy wsrPBTimeMs run scoreboard players operation dummy wsrPBTimeSec = dummy wsrTimeSec
execute if score dummy wsrInPrac matches 1 run execute as @a at @s run execute if entity @s[x=86,y=31,z=-121,dx=-2,dz=-1,dy=1] run function game:movement/wsrreset

execute if score dummy wsrInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:movement/wsrreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy wsrInPrac matches 1 run scoreboard players set @a dropStoneAxe 1

execute as @a[scores={dropStoneAxe=1..}] at @s run tp @s 85 7 -19 0 0
execute as @a[scores={dropStoneAxe=1..}] at @s run clear @s
execute as @a[scores={dropStoneAxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropStoneAxe=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropStoneAxe=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropStoneAxe=1..}] at @s run scoreboard players set dummy wsrInPrac 0
execute as @a[scores={dropStoneAxe=1..}] at @s run scoreboard players set dummy wsrStarted 0
execute as @a[scores={dropStoneAxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:stone_axe"}}]

execute as @a[scores={dropStoneAxe=1..}] at @s run scoreboard players set @s dropStoneAxe 0
