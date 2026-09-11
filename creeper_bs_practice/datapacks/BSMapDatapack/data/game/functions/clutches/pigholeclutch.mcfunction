scoreboard objectives add phcTimeSec dummy
scoreboard objectives add phcTimeMs dummy
scoreboard objectives add phcPBTimeSec dummy
scoreboard objectives add phcPBTimeMs dummy
scoreboard objectives add phcInPrac dummy
scoreboard objectives add phcStarted dummy
# scoreboard objectives add phcXTarget dummy
# scoreboard objectives add phcZTarget dummy
# scoreboard objectives add phcSetX dummy
# scoreboard objectives add phcSetZ dummy
scoreboard objectives add dropIronPickaxe minecraft.dropped:minecraft.iron_pickaxe

execute if score dummy phcPBTimeMs matches 0 run data merge block 79 17 56 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"phcPBTimeSec"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"phcPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy phcPBTimeMs matches 1..99 run data merge block 79 17 56 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"phcPBTimeSec"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"phcPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy phcPBTimeMs matches 100.. run data merge block 79 17 56 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"phcPBTimeSec"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"phcPBTimeMs"},"bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=phcPBTime,limit=1] CustomName set from block 79 17 56 Text1

# piglin ai
execute if score dummy phcInPrac matches 1 run execute if score dummy phcStarted matches 0 run execute as @e[type=piglin] at @s run execute as @e[type=!player] run data modify entity @s NoAi set value 1b
execute if score dummy phcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy phcStarted matches 0 run data modify entity @s NoAi set value 0b
execute if score dummy phcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy phcStarted matches 0 run data modify entity @s NoAi set value 0b

# movement to start map
execute if score dummy phcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy phcStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy phcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy phcStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy phcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy phcStarted matches 0 run effect clear @a regeneration
execute if score dummy phcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy phcStarted matches 0 run effect clear @a resistance
execute if score dummy phcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy phcStarted matches 0 run effect clear @a fire_resistance

execute if score dummy phcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy phcStarted matches 0 run effect clear @a regeneration
execute if score dummy phcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy phcStarted matches 0 run effect clear @a resistance
execute if score dummy phcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy phcStarted matches 0 run effect clear @a fire_resistance

execute if score dummy phcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy phcStarted 1
execute if score dummy phcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy phcStarted 1

# start practice
execute if block 80 12 59 minecraft:stone_button[powered=true] run function game:clutches/phcreset
execute if block 80 12 59 minecraft:stone_button[powered=true] run setblock 80 12 59 minecraft:stone_button[powered=false,facing=north]

# force enter hole
execute if score dummy phcTimeSec matches 0 run execute if score dummy phcTimeMs matches 100 run tp @a 101 13 56 90 90

# timer
execute if score dummy phcInPrac matches 1 run execute if score dummy phcStarted matches 1 run scoreboard players add dummy phcTimeMs 50
execute if score dummy phcTimeMs matches 1000.. run scoreboard players add dummy phcTimeSec 1
execute if score dummy phcTimeMs matches 1000.. run scoreboard players set dummy phcTimeMs 0


execute if score dummy phcInPrac matches 1 run execute if score dummy phcTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"phcTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"phcTimeMs"},"color":"green"}]
execute if score dummy phcInPrac matches 1 run execute if score dummy phcTimeMs matches 1..99 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"phcTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"phcTimeMs"},"color":"green"}]
execute if score dummy phcInPrac matches 1 run execute if score dummy phcTimeMs matches 100.. run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"phcTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"phcTimeMs"},"color":"green"}]

# ending (escaped)
execute if score dummy phcInPrac matches 1 run execute as @a[x=96,y=13,z=55,dx=1,dz=1,dy=1] at @s run execute if score dummy phcTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"phcTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"phcTimeMs"},"color":"green"}]
execute if score dummy phcInPrac matches 1 run execute as @a[x=96,y=13,z=55,dx=1,dz=1,dy=1] at @s run execute if score dummy phcTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"phcTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"phcTimeMs"},"color":"green"}]
execute if score dummy phcInPrac matches 1 run execute as @a[x=96,y=13,z=55,dx=1,dz=1,dy=1] at @s run execute if score dummy phcTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"phcTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"phcTimeMs"},"color":"green"}]
execute if score dummy phcInPrac matches 1 run execute as @a[x=96,y=13,z=55,dx=1,dz=1,dy=1] at @s run execute if score dummy phcTimeSec < dummy phcPBTimeSec run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy phcInPrac matches 1 run execute as @a[x=96,y=13,z=55,dx=1,dz=1,dy=1] at @s run execute if score dummy phcTimeSec < dummy phcPBTimeSec run scoreboard players operation dummy phcPBTimeMs = dummy phcTimeMs
execute if score dummy phcInPrac matches 1 run execute as @a[x=96,y=13,z=55,dx=1,dz=1,dy=1] at @s run execute if score dummy phcTimeSec < dummy phcPBTimeSec run scoreboard players operation dummy phcPBTimeSec = dummy phcTimeSec
execute if score dummy phcInPrac matches 1 run execute as @a[x=96,y=13,z=55,dx=1,dz=1,dy=1] at @s run execute if score dummy phcTimeSec = dummy phcPBTimeSec run execute if score dummy phcTimeMs < dummy phcPBTimeMs run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy phcInPrac matches 1 run execute as @a[x=96,y=13,z=55,dx=1,dz=1,dy=1] at @s run execute if score dummy phcTimeSec = dummy phcPBTimeSec run execute if score dummy phcTimeMs <= dummy phcPBTimeMs run scoreboard players operation dummy phcPBTimeMs = dummy phcTimeMs
execute if score dummy phcInPrac matches 1 run execute as @a[x=96,y=13,z=55,dx=1,dz=1,dy=1] at @s run execute if score dummy phcTimeSec = dummy phcPBTimeSec run execute if score dummy phcTimeMs <= dummy phcPBTimeMs run scoreboard players operation dummy phcPBTimeSec = dummy phcTimeSec
execute if score dummy phcInPrac matches 1 run execute as @a[x=96,y=13,z=55,dx=1,dz=1,dy=1] at @s run function game:clutches/phcreset

execute if score dummy phcInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:clutches/phcreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy phcInPrac matches 1 run scoreboard players set @a dropIronPickaxe 1

execute if score dummy phcInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run tp @s 80 11 55 0 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run clear @s
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy phcInPrac 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy phcStarted 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s saturation 1 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]

# execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set @s dropIronPickaxe 0
