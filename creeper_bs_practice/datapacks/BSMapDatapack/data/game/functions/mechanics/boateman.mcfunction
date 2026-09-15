
# vars
scoreboard objectives add bemTimeSec dummy
scoreboard objectives add bemTimeMs dummy
scoreboard objectives add bemPBTimeSec dummy
scoreboard objectives add bemPBTimeMs dummy
scoreboard objectives add bemInPrac dummy
scoreboard objectives add bemStarted dummy
scoreboard objectives add bemKillEman minecraft.killed:minecraft.enderman

execute if score dummy bemPBTimeMs matches 0 run data merge block -92 23 68 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"bemPBTimeSec"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"bemPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy bemPBTimeMs matches 1..99 run data merge block -92 23 68 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"bemPBTimeSec"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"bemPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy bemPBTimeMs matches 100.. run data merge block -92 23 68 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"bemPBTimeSec"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"bemPBTimeMs"},"bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=bemPBTime,limit=1] CustomName set from block -92 23 68 Text1

# hoglin ai
execute if score dummy bemInPrac matches 1 run execute if score dummy bemStarted matches 0 run execute as @e[type=enderman] at @s run execute as @e[type=!player] run data modify entity @s NoAi set value 1b
execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy bemStarted matches 0 run data modify entity @s NoAi set value 0b
execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy bemStarted matches 0 run data modify entity @s NoAi set value 0b

# movement to start map

execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy bemStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy bemStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy bemStarted matches 0 run effect clear @a regeneration
execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy bemStarted matches 0 run effect clear @a resistance
execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy bemStarted matches 0 run effect clear @a fire_resistance

execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy bemStarted matches 0 run effect clear @a regeneration
execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy bemStarted matches 0 run effect clear @a resistance
execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy bemStarted matches 0 run effect clear @a fire_resistance

execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run effect clear @e[type=enderman] slowness
execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run effect clear @e[type=enderman] slowness

execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy bemStarted 1
execute if score dummy bemInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy bemStarted 1

# start practice
execute if block -92 16 71 minecraft:stone_button[powered=true] run function game:mechanics/bemreset
execute if block -92 16 71 minecraft:stone_button[powered=true] run setblock -92 16 71 minecraft:stone_button[powered=false,facing=north]

# timer
execute if score dummy bemInPrac matches 1 run execute if score dummy bemStarted matches 1 run scoreboard players add dummy bemTimeMs 50
execute if score dummy bemTimeMs matches 1000.. run scoreboard players add dummy bemTimeSec 1
execute if score dummy bemTimeMs matches 1000.. run scoreboard players set dummy bemTimeMs 0

execute if score dummy bemInPrac matches 1 run execute if score dummy bemTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"bemTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"bemTimeMs"},"color":"green"}]
execute if score dummy bemInPrac matches 1 run execute if score dummy bemTimeMs matches 1..99 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"bemTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"bemTimeMs"},"color":"green"}]
execute if score dummy bemInPrac matches 1 run execute if score dummy bemTimeMs matches 100.. run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"bemTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"bemTimeMs"},"color":"green"}]


# reach ending-55 21 132
execute if score dummy bemInPrac matches 1 run execute as @a at @s run execute if entity @s[scores={bemKillEman=1..}] run execute if score dummy bemTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"bemTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"bemTimeMs"},"color":"green"}]
execute if score dummy bemInPrac matches 1 run execute as @a at @s run execute if entity @s[scores={bemKillEman=1..}] run execute if score dummy bemTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"bemTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"bemTimeMs"},"color":"green"}]
execute if score dummy bemInPrac matches 1 run execute as @a at @s run execute if entity @s[scores={bemKillEman=1..}] run execute if score dummy bemTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"bemTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"bemTimeMs"},"color":"green"}]
execute if score dummy bemInPrac matches 1 run execute as @a at @s run execute if entity @s[scores={bemKillEman=1..}] run execute if score dummy bemTimeSec < dummy bemPBTimeSec run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy bemInPrac matches 1 run execute as @a at @s run execute if entity @s[scores={bemKillEman=1..}] run execute if score dummy bemTimeSec < dummy bemPBTimeSec run scoreboard players operation dummy bemPBTimeMs = dummy bemTimeMs
execute if score dummy bemInPrac matches 1 run execute as @a at @s run execute if entity @s[scores={bemKillEman=1..}] run execute if score dummy bemTimeSec < dummy bemPBTimeSec run scoreboard players operation dummy bemPBTimeSec = dummy bemTimeSec
execute if score dummy bemInPrac matches 1 run execute as @a at @s run execute if entity @s[scores={bemKillEman=1..}] run execute if score dummy bemTimeSec = dummy bemPBTimeSec run execute if score dummy bemTimeMs < dummy bemPBTimeMs run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy bemInPrac matches 1 run execute as @a at @s run execute if entity @s[scores={bemKillEman=1..}] run execute if score dummy bemTimeSec = dummy bemPBTimeSec run execute if score dummy bemTimeMs < dummy bemPBTimeMs run scoreboard players operation dummy bemPBTimeMs = dummy bemTimeMs
execute if score dummy bemInPrac matches 1 run execute as @a at @s run execute if entity @s[scores={bemKillEman=1..}] run execute if score dummy bemTimeSec = dummy bemPBTimeSec run execute if score dummy bemTimeMs <= dummy bemPBTimeMs run scoreboard players operation dummy bemPBTimeSec = dummy bemTimeSec
execute if score dummy bemInPrac matches 1 run execute as @a at @s run execute if entity @s[scores={bemKillEman=1..}] run function game:mechanics/bemreset

execute if score dummy bemInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:mechanics/bemreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy bemInPrac matches 1 run scoreboard players set @a dropIronPickaxe 1

execute if score dummy bemInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run tp @s -92 15 67 0 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run clear @s
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy bemInPrac 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy bemStarted 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]

