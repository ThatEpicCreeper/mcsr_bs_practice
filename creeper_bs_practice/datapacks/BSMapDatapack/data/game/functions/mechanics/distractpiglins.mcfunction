
# vars
scoreboard objectives add dspTimeSec dummy
scoreboard objectives add dspTimeMs dummy
scoreboard objectives add dspPBTimeSec dummy
scoreboard objectives add dspPBTimeMs dummy
scoreboard objectives add dspInPrac dummy
scoreboard objectives add dspStarted dummy

execute if score dummy dspPBTimeMs matches 0 run data merge block -50 19 70 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"dspPBTimeSec"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"dspPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy dspPBTimeMs matches 1..99 run data merge block -50 19 70 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"dspPBTimeSec"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"dspPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy dspPBTimeMs matches 100.. run data merge block -50 19 70 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"dspPBTimeSec"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"dspPBTimeMs"},"bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=dspPBTime,limit=1] CustomName set from block -50 19 70 Text1

# hoglin ai
execute if score dummy dspInPrac matches 1 run execute if score dummy dspStarted matches 0 run execute as @e[type=piglin] at @s run execute as @e[type=!player] run data modify entity @s NoAi set value 1b
execute if score dummy dspInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy dspStarted matches 0 run data modify entity @s NoAi set value 0b
execute if score dummy dspInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy dspStarted matches 0 run data modify entity @s NoAi set value 0b

# movement to start map

execute if score dummy dspInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy dspStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy dspInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy dspStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy dspInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy dspStarted matches 0 run effect clear @a regeneration
execute if score dummy dspInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy dspStarted matches 0 run effect clear @a resistance
execute if score dummy dspInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy dspStarted matches 0 run effect clear @a fire_resistance

execute if score dummy dspInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy dspStarted matches 0 run effect clear @a regeneration
execute if score dummy dspInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy dspStarted matches 0 run effect clear @a resistance
execute if score dummy dspInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy dspStarted matches 0 run effect clear @a fire_resistance

execute if score dummy dspInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy dspStarted 1
execute if score dummy dspInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy dspStarted 1

# start practice
execute if block -50 12 73 minecraft:stone_button[powered=true] run function game:mechanics/dspreset
execute if block -50 12 73 minecraft:stone_button[powered=true] run setblock -50 12 73 minecraft:stone_button[powered=false,facing=north]

# timer
execute if score dummy dspInPrac matches 1 run execute if score dummy dspStarted matches 1 run scoreboard players add dummy dspTimeMs 50
execute if score dummy dspTimeMs matches 1000.. run scoreboard players add dummy dspTimeSec 1
execute if score dummy dspTimeMs matches 1000.. run scoreboard players set dummy dspTimeMs 0

execute if score dummy dspInPrac matches 1 run execute if score dummy dspTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"dspTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"dspTimeMs"},"color":"green"}]
execute if score dummy dspInPrac matches 1 run execute if score dummy dspTimeMs matches 1..99 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"dspTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"dspTimeMs"},"color":"green"}]
execute if score dummy dspInPrac matches 1 run execute if score dummy dspTimeMs matches 100.. run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"dspTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"dspTimeMs"},"color":"green"}]


# reach ending-55 21 132
execute if score dummy dspInPrac matches 1 run execute as @a at @s run execute if entity @s[x=-55,y=21,z=132,dx=2,dz=1,dy=1] run execute if score dummy dspTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"dspTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"dspTimeMs"},"color":"green"}]
execute if score dummy dspInPrac matches 1 run execute as @a at @s run execute if entity @s[x=-55,y=21,z=132,dx=2,dz=1,dy=1] run execute if score dummy dspTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"dspTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"dspTimeMs"},"color":"green"}]
execute if score dummy dspInPrac matches 1 run execute as @a at @s run execute if entity @s[x=-55,y=21,z=132,dx=2,dz=1,dy=1] run execute if score dummy dspTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"dspTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"dspTimeMs"},"color":"green"}]
execute if score dummy dspInPrac matches 1 run execute as @a at @s run execute if entity @s[x=-55,y=21,z=132,dx=2,dz=1,dy=1] run execute if score dummy dspTimeSec < dummy dspPBTimeSec run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy dspInPrac matches 1 run execute as @a at @s run execute if entity @s[x=-55,y=21,z=132,dx=2,dz=1,dy=1] run execute if score dummy dspTimeSec < dummy dspPBTimeSec run scoreboard players operation dummy dspPBTimeMs = dummy dspTimeMs
execute if score dummy dspInPrac matches 1 run execute as @a at @s run execute if entity @s[x=-55,y=21,z=132,dx=2,dz=1,dy=1] run execute if score dummy dspTimeSec < dummy dspPBTimeSec run scoreboard players operation dummy dspPBTimeSec = dummy dspTimeSec
execute if score dummy dspInPrac matches 1 run execute as @a at @s run execute if entity @s[x=-55,y=21,z=132,dx=2,dz=1,dy=1] run execute if score dummy dspTimeSec = dummy dspPBTimeSec run execute if score dummy dspTimeMs < dummy dspPBTimeMs run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy dspInPrac matches 1 run execute as @a at @s run execute if entity @s[x=-55,y=21,z=132,dx=2,dz=1,dy=1] run execute if score dummy dspTimeSec = dummy dspPBTimeSec run execute if score dummy dspTimeMs < dummy dspPBTimeMs run scoreboard players operation dummy dspPBTimeMs = dummy dspTimeMs
execute if score dummy dspInPrac matches 1 run execute as @a at @s run execute if entity @s[x=-55,y=21,z=132,dx=2,dz=1,dy=1] run execute if score dummy dspTimeSec = dummy dspPBTimeSec run execute if score dummy dspTimeMs <= dummy dspPBTimeMs run scoreboard players operation dummy dspPBTimeSec = dummy dspTimeSec
execute if score dummy dspInPrac matches 1 run execute as @a at @s run execute if entity @s[x=-55,y=21,z=132,dx=2,dz=1,dy=1] run function game:mechanics/dspreset

execute if score dummy dspInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:mechanics/dspreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy dspInPrac matches 1 run scoreboard players set @a dropIronPickaxe 1

execute if score dummy dspInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run tp @s -50 11 68 0 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run clear @s
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy dspInPrac 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy dspStarted 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]

