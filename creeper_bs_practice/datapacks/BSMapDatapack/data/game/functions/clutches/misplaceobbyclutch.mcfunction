scoreboard objectives add mpoTimeSec dummy
scoreboard objectives add mpoTimeMs dummy
scoreboard objectives add mpoPBTimeSec dummy
scoreboard objectives add mpoPBTimeMs dummy
scoreboard objectives add mpoInPrac dummy
scoreboard objectives add mpoStarted dummy
scoreboard objectives add mpoXTarget dummy
scoreboard objectives add mpoZTarget dummy
scoreboard objectives add mpoSetX dummy
scoreboard objectives add mpoSetZ dummy
#scoreboard objectives add dropStoneShovel minecraft.dropped:minecraft.stone_shovel

execute if score dummy mpoPBTimeMs matches 0 run data merge block 77 19 106 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"mpoPBTimeSec"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"mpoPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy mpoPBTimeMs matches 1..99 run data merge block 77 19 106 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"mpoPBTimeSec"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"mpoPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy mpoPBTimeMs matches 100.. run data merge block 77 19 106 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"mpoPBTimeSec"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"mpoPBTimeMs"},"bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=mpoPBTime,limit=1] CustomName set from block 77 19 106 Text1

# blaze ai
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoStarted matches 0 run execute as @e[type=blaze] at @s run execute as @e[type=!player] run data modify entity @s NoAi set value 1b
execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy mpoStarted matches 0 run data modify entity @s NoAi set value 0b
execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy mpoStarted matches 0 run data modify entity @s NoAi set value 0b

execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy mpoStarted matches 0 run effect clear @e[type=minecraft:blaze] minecraft:slowness
execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy mpoStarted matches 0 run effect clear @e[type=minecraft:blaze] minecraft:slowness

# movement to start map
execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy mpoStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy mpoStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy mpoStarted matches 0 run execute as @a at @s run tellraw @a {"text":"Mine the misplaced obby!","color":"green"}
execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy mpoStarted matches 0 run execute as @a at @s run tellraw @a {"text":"Mine the misplaced obby!","color":"green"}

execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy mpoStarted matches 0 run effect clear @a regeneration
execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy mpoStarted matches 0 run effect clear @a resistance
execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy mpoStarted matches 0 run effect clear @a fire_resistance

execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy mpoStarted matches 0 run effect clear @a regeneration
execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy mpoStarted matches 0 run effect clear @a resistance
execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy mpoStarted matches 0 run effect clear @a fire_resistance

execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy mpoStarted 1
execute if score dummy mpoInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy mpoStarted 1

# start practice
execute if block 77 14 109 minecraft:stone_button[powered=true] run function game:clutches/mporeset
execute if block 77 14 109 minecraft:stone_button[powered=true] run setblock 77 14 109 minecraft:stone_button[powered=false,facing=north]


# timer
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoStarted matches 1 run scoreboard players add dummy mpoTimeMs 50
execute if score dummy mpoTimeMs matches 1000.. run scoreboard players add dummy mpoTimeSec 1
execute if score dummy mpoTimeMs matches 1000.. run scoreboard players set dummy mpoTimeMs 0

execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"mpoTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"mpoTimeMs"},"color":"green"}]
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoTimeMs matches 1..99 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"mpoTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"mpoTimeMs"},"color":"green"}]
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoTimeMs matches 100.. run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"mpoTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"mpoTimeMs"},"color":"green"}]

# ending (correct coords)
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoStarted matches 1 run execute if block 99 18 105 air run execute if score dummy mpoTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"mpoTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"mpoTimeMs"},"color":"green"}]
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoStarted matches 1 run execute if block 99 18 105 air run execute if score dummy mpoTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"mpoTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"mpoTimeMs"},"color":"green"}]
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoStarted matches 1 run execute if block 99 18 105 air run execute if score dummy mpoTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"mpoTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"mpoTimeMs"},"color":"green"}]
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoStarted matches 1 run execute if block 99 18 105 air run execute if score dummy mpoTimeSec < dummy mpoPBTimeSec run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoStarted matches 1 run execute if block 99 18 105 air run execute if score dummy mpoTimeSec < dummy mpoPBTimeSec run scoreboard players operation dummy mpoPBTimeMs = dummy mpoTimeMs
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoStarted matches 1 run execute if block 99 18 105 air run execute if score dummy mpoTimeSec < dummy mpoPBTimeSec run scoreboard players operation dummy mpoPBTimeSec = dummy mpoTimeSec
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoStarted matches 1 run execute if block 99 18 105 air run execute if score dummy mpoTimeSec = dummy mpoPBTimeSec run execute if score dummy mpoTimeMs < dummy mpoPBTimeMs run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoStarted matches 1 run execute if block 99 18 105 air run execute if score dummy mpoTimeSec = dummy mpoPBTimeSec run execute if score dummy mpoTimeMs <= dummy mpoPBTimeMs run scoreboard players operation dummy mpoPBTimeMs = dummy mpoTimeMs
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoStarted matches 1 run execute if block 99 18 105 air run execute if score dummy mpoTimeSec = dummy mpoPBTimeSec run execute if score dummy mpoTimeMs <= dummy mpoPBTimeMs run scoreboard players operation dummy mpoPBTimeSec = dummy mpoTimeSec
execute if score dummy mpoInPrac matches 1 run execute if score dummy mpoStarted matches 1 run execute if block 99 18 105 air run function game:clutches/mporeset



execute if score dummy mpoInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:clutches/mporeset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy mpoInPrac matches 1 run scoreboard players set @a dropIronPickaxe 1

execute as @a[scores={dropIronPickaxe=1..}] at @s run tp @s 77 13 105 0 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run clear @s
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy mpoInPrac 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy mpoStarted 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect clear @s hunger
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s saturation 1 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run execute as @a at @s run attribute @s minecraft:generic.max_health base set 20
execute as @a[scores={dropIronPickaxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]

execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set @s dropIronPickaxe 0
