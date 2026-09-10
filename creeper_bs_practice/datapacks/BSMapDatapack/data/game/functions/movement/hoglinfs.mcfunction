
# vars
scoreboard objectives add hfsMap dummy
scoreboard objectives add hfsTimeSec dummy
scoreboard objectives add hfsTimeMs dummy
scoreboard objectives add hfsPBTimeSec dummy
scoreboard objectives add hfsPBTimeMs dummy
scoreboard objectives add hfsInPrac dummy
scoreboard objectives add hfsStarted dummy
scoreboard objectives add dropFNS minecraft.dropped:minecraft.flint_and_steel

execute if score dummy hfsPBTimeMs matches 0 run data merge block 50 50 -20 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"hfsPBTimeSec"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"hfsPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy hfsPBTimeMs matches 1..99 run data merge block 50 50 -20 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"hfsPBTimeSec"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"hfsPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy hfsPBTimeMs matches 100.. run data merge block 50 50 -20 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"hfsPBTimeSec"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"hfsPBTimeMs"},"bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=hfsPBTime,limit=1] CustomName set from block 50 50 -20 Text1

# hoglin ai
execute if score dummy hfsInPrac matches 1 run execute if score dummy hfsStarted matches 0 run execute as @e[type=hoglin] at @s run execute as @e[type=!player] run data modify entity @s NoAi set value 1b
execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy hfsStarted matches 0 run data modify entity @s NoAi set value 0b
execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy hfsStarted matches 0 run data modify entity @s AngerTime set value 32767
execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy hfsStarted matches 0 run data modify entity @s NoAi set value 0b
execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy hfsStarted matches 0 run data modify entity @s AngerTime set value 32767

# movement to start map

execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy hfsStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy hfsStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy hfsStarted matches 0 run effect clear @a regeneration
execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy hfsStarted matches 0 run effect clear @a resistance
execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy hfsStarted matches 0 run effect clear @a fire_resistance

execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy hfsStarted matches 0 run effect clear @a regeneration
execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy hfsStarted matches 0 run effect clear @a resistance
execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy hfsStarted matches 0 run effect clear @a fire_resistance

execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy hfsStarted 1
execute if score dummy hfsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy hfsStarted 1

# start practice
execute if block 48 8 -24 minecraft:crimson_button[powered=true] run function game:movement/hfsreset
execute if block 48 8 -24 minecraft:crimson_button[powered=true] run setblock 48 8 -24 minecraft:crimson_button[powered=false,facing=south]

# timer
execute if score dummy hfsInPrac matches 1 run execute if score dummy hfsStarted matches 1 run scoreboard players add dummy hfsTimeMs 50
execute if score dummy hfsTimeMs matches 1000.. run scoreboard players add dummy hfsTimeSec 1
execute if score dummy hfsTimeMs matches 1000.. run scoreboard players set dummy hfsTimeMs 0

execute if score dummy hfsInPrac matches 1 run execute if score dummy hfsTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"hfsTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"hfsTimeMs"},"color":"green"}]
execute if score dummy hfsInPrac matches 1 run execute if score dummy hfsTimeMs matches 1..99 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"hfsTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"hfsTimeMs"},"color":"green"}]
execute if score dummy hfsInPrac matches 1 run execute if score dummy hfsTimeMs matches 100.. run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"hfsTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"hfsTimeMs"},"color":"green"}]


# reach ending
execute if score dummy hfsInPrac matches 1 run execute as @a at @s run execute if entity @s[x=49,y=10,z=-74,dx=-2,dz=-1,dy=1] run execute if score dummy hfsTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"hfsTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"hfsTimeMs"},"color":"green"}]
execute if score dummy hfsInPrac matches 1 run execute as @a at @s run execute if entity @s[x=49,y=10,z=-74,dx=-2,dz=-1,dy=1] run execute if score dummy hfsTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"hfsTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"hfsTimeMs"},"color":"green"}]
execute if score dummy hfsInPrac matches 1 run execute as @a at @s run execute if entity @s[x=49,y=10,z=-74,dx=-2,dz=-1,dy=1] run execute if score dummy hfsTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"hfsTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"hfsTimeMs"},"color":"green"}]
execute if score dummy hfsInPrac matches 1 run execute as @a at @s run execute if entity @s[x=49,y=10,z=-74,dx=-2,dz=-1,dy=1] run execute if score dummy hfsTimeSec < dummy hfsPBTimeSec run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy hfsInPrac matches 1 run execute as @a at @s run execute if entity @s[x=49,y=10,z=-74,dx=-2,dz=-1,dy=1] run execute if score dummy hfsTimeSec < dummy hfsPBTimeSec run scoreboard players operation dummy hfsPBTimeMs = dummy hfsTimeMs
execute if score dummy hfsInPrac matches 1 run execute as @a at @s run execute if entity @s[x=49,y=10,z=-74,dx=-2,dz=-1,dy=1] run execute if score dummy hfsTimeSec < dummy hfsPBTimeSec run scoreboard players operation dummy hfsPBTimeSec = dummy hfsTimeSec
execute if score dummy hfsInPrac matches 1 run execute as @a at @s run execute if entity @s[x=49,y=10,z=-74,dx=-2,dz=-1,dy=1] run execute if score dummy hfsTimeSec = dummy hfsPBTimeSec run execute if score dummy hfsTimeMs < dummy hfsPBTimeMs run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy hfsInPrac matches 1 run execute as @a at @s run execute if entity @s[x=49,y=10,z=-74,dx=-2,dz=-1,dy=1] run execute if score dummy hfsTimeSec = dummy hfsPBTimeSec run execute if score dummy hfsTimeMs < dummy hfsPBTimeMs run scoreboard players operation dummy hfsPBTimeMs = dummy hfsTimeMs
execute if score dummy hfsInPrac matches 1 run execute as @a at @s run execute if entity @s[x=49,y=10,z=-74,dx=-2,dz=-1,dy=1] run execute if score dummy hfsTimeSec = dummy hfsPBTimeSec run execute if score dummy hfsTimeMs <= dummy hfsPBTimeMs run scoreboard players operation dummy hfsPBTimeSec = dummy hfsTimeSec
execute if score dummy hfsInPrac matches 1 run execute as @a at @s run execute if entity @s[x=49,y=10,z=-74,dx=-2,dz=-1,dy=1] run function game:movement/hfsreset

execute if score dummy hfsInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:movement/hfsreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy hfsInPrac matches 1 run scoreboard players set @a dropFNS 1

execute as @a[scores={dropFNS=1..}] at @s run tp @s 48 7 -18 180 0
execute as @a[scores={dropFNS=1..}] at @s run clear @s
execute as @a[scores={dropFNS=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropFNS=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropFNS=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropFNS=1..}] at @s run scoreboard players set dummy hfsInPrac 0
execute as @a[scores={dropFNS=1..}] at @s run scoreboard players set dummy hfsStarted 0
execute as @a[scores={dropFNS=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:flint_and_steel"}}]

execute as @a[scores={dropFNS=1..}] at @s run scoreboard players set @s dropFNS 0
