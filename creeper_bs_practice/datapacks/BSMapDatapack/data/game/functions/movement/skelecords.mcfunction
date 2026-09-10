
scoreboard objectives add skcTimeSec dummy
scoreboard objectives add skcTimeMs dummy
scoreboard objectives add skcPBTimeSec dummy
scoreboard objectives add skcPBTimeMs dummy
scoreboard objectives add skcInPrac dummy
scoreboard objectives add skcStarted dummy
scoreboard objectives add skcXTarget dummy
scoreboard objectives add skcZTarget dummy
scoreboard objectives add skcSetX dummy
scoreboard objectives add skcSetZ dummy
scoreboard objectives add dropStoneShovel minecraft.dropped:minecraft.stone_shovel

execute if score dummy skcPBTimeMs matches 0 run data merge block 123 13 -18 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"skcPBTimeSec"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"skcPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy skcPBTimeMs matches 1..99 run data merge block 123 13 -18 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"skcPBTimeSec"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"skcPBTimeMs"},"bold":true,"color":"yellow"}]'}
execute if score dummy skcPBTimeMs matches 100.. run data merge block 123 13 -18 {Text1:'["",{"text":"PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"skcPBTimeSec"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"skcPBTimeMs"},"bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=skcPBTime,limit=1] CustomName set from block 123 13 -18 Text1

# skeleton ai
execute if score dummy skcInPrac matches 1 run execute if score dummy skcStarted matches 0 run execute as @e[type=skeleton] at @s run execute as @e[type=!player] run data modify entity @s NoAi set value 1b
execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy skcStarted matches 0 run data modify entity @s NoAi set value 0b
execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy skcStarted matches 0 run data modify entity @s NoAi set value 0b

execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy skcStarted matches 0 run effect clear @e[type=minecraft:skeleton] minecraft:slowness
execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy skcStarted matches 0 run effect clear @e[type=minecraft:skeleton] minecraft:slowness

# target block
scoreboard players add dummy skcXTarget 1
scoreboard players add dummy skcZTarget 1
execute if score dummy skcXTarget matches 135.. run scoreboard players set dummy skcXTarget 119
execute if score dummy skcZTarget matches -49.. run scoreboard players set dummy skcZTarget -64

# movement to start map
execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy skcStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy skcStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy skcStarted matches 0 run execute as @a at @s run tellraw @a {"text":"Dig and stand at the target coordinates!","color":"green"}
execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy skcStarted matches 0 run execute as @a at @s run tellraw @a {"text":"Dig and stand at the target coordinates!","color":"green"}

execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy skcStarted matches 0 run execute as @a at @s run tellraw @a ["",{"text":"Target Coordinates: ","bold":true,"color":"gold"},{"text":"(","bold":true,"color":"red"},{"score":{"name":"dummy","objective":"skcSetX"},"bold":true,"color":"red"},{"text":", ","bold":true,"color":"red"},{"score":{"name":"dummy","objective":"skcSetZ"},"bold":true,"color":"red"},{"text":")","bold":true,"color":"red"}]
execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy skcStarted matches 0 run execute as @a at @s run tellraw @a ["",{"text":"Target Coordinates: ","bold":true,"color":"gold"},{"text":"(","bold":true,"color":"red"},{"score":{"name":"dummy","objective":"skcSetX"},"bold":true,"color":"red"},{"text":", ","bold":true,"color":"red"},{"score":{"name":"dummy","objective":"skcSetZ"},"bold":true,"color":"red"},{"text":")","bold":true,"color":"red"}]

execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy skcStarted matches 0 run effect clear @a regeneration
execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy skcStarted matches 0 run effect clear @a resistance
execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy skcStarted matches 0 run effect clear @a fire_resistance

execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy skcStarted matches 0 run effect clear @a regeneration
execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy skcStarted matches 0 run effect clear @a resistance
execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy skcStarted matches 0 run effect clear @a fire_resistance

execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy skcStarted 1
execute if score dummy skcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy skcStarted 1



# start practice
execute if block 123 7 -16 minecraft:stone_button[powered=true] run function game:movement/skcreset
execute if block 123 7 -16 minecraft:stone_button[powered=true] run setblock 123 7 -16 minecraft:stone_button[powered=false,facing=north]

# timer
execute if score dummy skcInPrac matches 1 run execute if score dummy skcStarted matches 1 run scoreboard players add dummy skcTimeMs 50
execute if score dummy skcTimeMs matches 1000.. run scoreboard players add dummy skcTimeSec 1
execute if score dummy skcTimeMs matches 1000.. run scoreboard players set dummy skcTimeMs 0

execute if score dummy skcInPrac matches 1 run execute if score dummy skcStarted matches 0 run execute if score dummy skcTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"skcTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"skcTimeMs"},"color":"green"}]
execute if score dummy skcInPrac matches 1 run execute if score dummy skcStarted matches 1 run execute if score dummy skcTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"skcTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"skcTimeMs"},"color":"green"},{"text":"  (","bold":true,"color":"red"},{"score":{"name":"dummy","objective":"skcSetX"},"bold":true,"color":"red"},{"text":", ","bold":true,"color":"red"},{"score":{"name":"dummy","objective":"skcSetZ"},"bold":true,"color":"red"},{"text":")","bold":true,"color":"red"}]
execute if score dummy skcInPrac matches 1 run execute if score dummy skcTimeMs matches 1..99 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"skcTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"skcTimeMs"},"color":"green"},{"text":"  (","bold":true,"color":"red"},{"score":{"name":"dummy","objective":"skcSetX"},"bold":true,"color":"red"},{"text":", ","bold":true,"color":"red"},{"score":{"name":"dummy","objective":"skcSetZ"},"bold":true,"color":"red"},{"text":")","bold":true,"color":"red"}]
execute if score dummy skcInPrac matches 1 run execute if score dummy skcTimeMs matches 100.. run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"skcTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"skcTimeMs"},"color":"green"},{"text":"  (","bold":true,"color":"red"},{"score":{"name":"dummy","objective":"skcSetX"},"bold":true,"color":"red"},{"text":", ","bold":true,"color":"red"},{"score":{"name":"dummy","objective":"skcSetZ"},"bold":true,"color":"red"},{"text":")","bold":true,"color":"red"}]

# ending (correct coords)
execute if score dummy skcInPrac matches 1 run execute as @a at @s run execute if score @s xPos = dummy skcSetX run execute if score @s zPos = dummy skcSetZ run execute if score @s yPos matches 16..17 run execute if score dummy skcTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"skcTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"skcTimeMs"},"color":"green"}]
execute if score dummy skcInPrac matches 1 run execute as @a at @s run execute if score @s xPos = dummy skcSetX run execute if score @s zPos = dummy skcSetZ run execute if score @s yPos matches 16..17 run execute if score dummy skcTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"skcTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"skcTimeMs"},"color":"green"}]
execute if score dummy skcInPrac matches 1 run execute as @a at @s run execute if score @s xPos = dummy skcSetX run execute if score @s zPos = dummy skcSetZ run execute if score @s yPos matches 16..17 run execute if score dummy skcTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"skcTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"skcTimeMs"},"color":"green"}]
execute if score dummy skcInPrac matches 1 run execute as @a at @s run execute if score @s xPos = dummy skcSetX run execute if score @s zPos = dummy skcSetZ run execute if score @s yPos matches 16..17 run execute if score dummy skcTimeSec < dummy skcPBTimeSec run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy skcInPrac matches 1 run execute as @a at @s run execute if score @s xPos = dummy skcSetX run execute if score @s zPos = dummy skcSetZ run execute if score @s yPos matches 16..17 run execute if score dummy skcTimeSec < dummy skcPBTimeSec run scoreboard players operation dummy skcPBTimeMs = dummy skcTimeMs
execute if score dummy skcInPrac matches 1 run execute as @a at @s run execute if score @s xPos = dummy skcSetX run execute if score @s zPos = dummy skcSetZ run execute if score @s yPos matches 16..17 run execute if score dummy skcTimeSec < dummy skcPBTimeSec run scoreboard players operation dummy skcPBTimeSec = dummy skcTimeSec
execute if score dummy skcInPrac matches 1 run execute as @a at @s run execute if score @s xPos = dummy skcSetX run execute if score @s zPos = dummy skcSetZ run execute if score @s yPos matches 16..17 run execute if score dummy skcTimeSec = dummy skcPBTimeSec run execute if score dummy skcTimeMs < dummy skcPBTimeMs run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy skcInPrac matches 1 run execute as @a at @s run execute if score @s xPos = dummy skcSetX run execute if score @s zPos = dummy skcSetZ run execute if score @s yPos matches 16..17 run execute if score dummy skcTimeSec = dummy skcPBTimeSec run execute if score dummy skcTimeMs <= dummy skcPBTimeMs run scoreboard players operation dummy skcPBTimeMs = dummy skcTimeMs
execute if score dummy skcInPrac matches 1 run execute as @a at @s run execute if score @s xPos = dummy skcSetX run execute if score @s zPos = dummy skcSetZ run execute if score @s yPos matches 16..17 run execute if score dummy skcTimeSec = dummy skcPBTimeSec run execute if score dummy skcTimeMs <= dummy skcPBTimeMs run scoreboard players operation dummy skcPBTimeSec = dummy skcTimeSec
execute if score dummy skcInPrac matches 1 run execute as @a at @s run execute if score @s xPos = dummy skcSetX run execute if score @s zPos = dummy skcSetZ run execute if score @s yPos matches 16..17 run function game:movement/skcreset



execute if score dummy skcInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:movement/skcreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy skcInPrac matches 1 run scoreboard players set @a dropStoneShovel 1

execute as @a[scores={dropStoneShovel=1..}] at @s run tp @s 123 6 -20 0 0
execute as @a[scores={dropStoneShovel=1..}] at @s run clear @s
execute as @a[scores={dropStoneShovel=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropStoneShovel=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropStoneShovel=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropStoneShovel=1..}] at @s run scoreboard players set dummy skcInPrac 0
execute as @a[scores={dropStoneShovel=1..}] at @s run scoreboard players set dummy skcStarted 0
execute as @a[scores={dropStoneShovel=1..}] at @s run effect clear @s hunger
execute as @a[scores={dropStoneShovel=1..}] at @s run effect give @s saturation 1 5 true
execute as @a[scores={dropStoneShovel=1..}] at @s run execute as @a at @s run attribute @s minecraft:generic.max_health base set 20
execute as @a[scores={dropStoneShovel=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:stone_shovel"}}]

execute as @a[scores={dropStoneShovel=1..}] at @s run scoreboard players set @s dropStoneShovel 0