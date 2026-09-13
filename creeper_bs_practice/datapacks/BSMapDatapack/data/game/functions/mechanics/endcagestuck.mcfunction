
# vars
scoreboard objectives add ecgTimeSec dummy
scoreboard objectives add ecgTimeMs dummy
scoreboard objectives add ecgPBTimeSec dummy
scoreboard objectives add ecgPBTimeMs dummy
scoreboard objectives add ecgInPrac dummy
scoreboard objectives add ecgStarted dummy

execute if score dummy ecgPBTimeMs matches 0 run data merge block 26 49 -15 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"ecgPBTimeSec"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"ecgPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy ecgPBTimeMs matches 1..99 run data merge block 26 49 -15 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"ecgPBTimeSec"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"ecgPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy ecgPBTimeMs matches 100.. run data merge block 26 49 -15 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"ecgPBTimeSec"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"ecgPBTimeMs"},"bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=ecgPBTime,limit=1] CustomName set from block 26 49 -15 Text1

# movement to start map

execute if score dummy ecgInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy ecgStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy ecgInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy ecgStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy ecgInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy ecgStarted matches 0 run effect clear @a regeneration
execute if score dummy ecgInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy ecgStarted matches 0 run effect clear @a resistance
execute if score dummy ecgInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy ecgStarted matches 0 run effect clear @a fire_resistance

execute if score dummy ecgInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy ecgStarted matches 0 run effect clear @a regeneration
execute if score dummy ecgInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy ecgStarted matches 0 run effect clear @a resistance
execute if score dummy ecgInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy ecgStarted matches 0 run effect clear @a fire_resistance

execute if score dummy ecgInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy ecgStarted 1
execute if score dummy ecgInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy ecgStarted 1

# start practice
execute if block 26 42 -12 minecraft:stone_button[powered=true] run function game:mechanics/ecgreset
execute if block 26 42 -12 minecraft:stone_button[powered=true] run setblock 26 42 -12 minecraft:stone_button[powered=false,facing=north]

# timer
execute if score dummy ecgInPrac matches 1 run execute if score dummy ecgStarted matches 1 run scoreboard players add dummy ecgTimeMs 50
execute if score dummy ecgTimeMs matches 1000.. run scoreboard players add dummy ecgTimeSec 1
execute if score dummy ecgTimeMs matches 1000.. run scoreboard players set dummy ecgTimeMs 0

execute if score dummy ecgInPrac matches 1 run execute if score dummy ecgTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"ecgTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"ecgTimeMs"},"color":"green"}]
execute if score dummy ecgInPrac matches 1 run execute if score dummy ecgTimeMs matches 1..99 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"ecgTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"ecgTimeMs"},"color":"green"}]
execute if score dummy ecgInPrac matches 1 run execute if score dummy ecgTimeMs matches 100.. run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"ecgTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"ecgTimeMs"},"color":"green"}]


# reach ending-55 21 132
execute if score dummy ecgInPrac matches 1 run execute as @a at @s run execute if entity @s[x=28,y=96.9,z=-27,dx=0.3,dz=0.3,dy=1] run execute if score dummy ecgTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"ecgTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"ecgTimeMs"},"color":"green"}]
execute if score dummy ecgInPrac matches 1 run execute as @a at @s run execute if entity @s[x=28,y=96.9,z=-27,dx=0.3,dz=0.3,dy=1] run execute if score dummy ecgTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"ecgTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"ecgTimeMs"},"color":"green"}]
execute if score dummy ecgInPrac matches 1 run execute as @a at @s run execute if entity @s[x=28,y=96.9,z=-27,dx=0.3,dz=0.3,dy=1] run execute if score dummy ecgTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"ecgTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"ecgTimeMs"},"color":"green"}]
execute if score dummy ecgInPrac matches 1 run execute as @a at @s run execute if entity @s[x=28,y=96.9,z=-27,dx=0.3,dz=0.3,dy=1] run execute if score dummy ecgTimeSec < dummy ecgPBTimeSec run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy ecgInPrac matches 1 run execute as @a at @s run execute if entity @s[x=28,y=96.9,z=-27,dx=0.3,dz=0.3,dy=1] run execute if score dummy ecgTimeSec < dummy ecgPBTimeSec run scoreboard players operation dummy ecgPBTimeMs = dummy ecgTimeMs
execute if score dummy ecgInPrac matches 1 run execute as @a at @s run execute if entity @s[x=28,y=96.9,z=-27,dx=0.3,dz=0.3,dy=1] run execute if score dummy ecgTimeSec < dummy ecgPBTimeSec run scoreboard players operation dummy ecgPBTimeSec = dummy ecgTimeSec
execute if score dummy ecgInPrac matches 1 run execute as @a at @s run execute if entity @s[x=28,y=96.9,z=-27,dx=0.3,dz=0.3,dy=1] run execute if score dummy ecgTimeSec = dummy ecgPBTimeSec run execute if score dummy ecgTimeMs < dummy ecgPBTimeMs run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy ecgInPrac matches 1 run execute as @a at @s run execute if entity @s[x=28,y=96.9,z=-27,dx=0.3,dz=0.3,dy=1] run execute if score dummy ecgTimeSec = dummy ecgPBTimeSec run execute if score dummy ecgTimeMs <= dummy ecgPBTimeMs run scoreboard players operation dummy ecgPBTimeMs = dummy ecgTimeMs
execute if score dummy ecgInPrac matches 1 run execute as @a at @s run execute if entity @s[x=28,y=96.9,z=-27,dx=0.3,dz=0.3,dy=1] run execute if score dummy ecgTimeSec = dummy ecgPBTimeSec run execute if score dummy ecgTimeMs <= dummy ecgPBTimeMs run scoreboard players operation dummy ecgPBTimeSec = dummy ecgTimeSec
execute if score dummy ecgInPrac matches 1 run execute as @a at @s run execute if entity @s[x=28,y=96.9,z=-27,dx=0.3,dz=0.3,dy=1] run function game:mechanics/ecgreset

execute if score dummy ecgInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:mechanics/ecgreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy ecgInPrac matches 1 run scoreboard players set @a dropIronPickaxe 1

execute if score dummy ecgInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run tp @s 26 41 -17 0 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run clear @s
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy ecgInPrac 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy ecgStarted 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]

