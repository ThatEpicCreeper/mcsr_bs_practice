scoreboard objectives add kiaTimeSec dummy
scoreboard objectives add kiaTimeMs dummy
scoreboard objectives add kiaPBTimeSec0 dummy
scoreboard objectives add kiaPBTimeSec1 dummy
scoreboard objectives add kiaPBTimeSec2 dummy
scoreboard objectives add kiaPBTimeSec3 dummy
scoreboard objectives add kiaPBTimeMs0 dummy
scoreboard objectives add kiaPBTimeMs1 dummy
scoreboard objectives add kiaPBTimeMs2 dummy
scoreboard objectives add kiaPBTimeMs3 dummy
scoreboard objectives add kiaInPrac dummy
scoreboard objectives add kiaStarted dummy
scoreboard objectives add kiaAnimalType dummy
scoreboard objectives add steakCount dummy
scoreboard objectives add porkCount dummy
scoreboard objectives add chickenCount dummy
scoreboard objectives add muttonCount dummy
scoreboard objectives add dropGoldSword minecraft.dropped:minecraft.golden_sword

execute if score dummy kiaPBTimeMs0 matches 0 run data merge block 2 20 69 {Text1:'["",{"text":"Cow PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"kiaPBTimeSec0"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"kiaPBTimeMs0"},"bold":true,"color":"yellow"}]'}
execute if score dummy kiaPBTimeMs0 matches 1..99 run data merge block 2 20 69 {Text1:'["",{"text":"Cow PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"kiaPBTimeSec0"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"kiaPBTimeMs0"},"bold":true,"color":"yellow"}]'}
execute if score dummy kiaPBTimeMs0 matches 100.. run data merge block 2 20 69 {Text1:'["",{"text":"Cow PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"kiaPBTimeSec0"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"kiaPBTimeMs0"},"bold":true,"color":"yellow"}]'}

execute if score dummy kiaPBTimeMs1 matches 0 run data merge block 2 20 69 {Text2:'["",{"text":"Pig PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"kiaPBTimeSec1"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"kiaPBTimeMs1"},"bold":true,"color":"yellow"}]'}
execute if score dummy kiaPBTimeMs1 matches 1..99 run data merge block 2 20 69 {Text2:'["",{"text":"Pig PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"kiaPBTimeSec1"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"kiaPBTimeMs1"},"bold":true,"color":"yellow"}]'}
execute if score dummy kiaPBTimeMs1 matches 100.. run data merge block 2 20 69 {Text2:'["",{"text":"Pig PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"kiaPBTimeSec1"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"kiaPBTimeMs1"},"bold":true,"color":"yellow"}]'}

execute if score dummy kiaPBTimeMs2 matches 0 run data merge block 2 20 69 {Text3:'["",{"text":"Chicken PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"kiaPBTimeSec2"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"kiaPBTimeMs2"},"bold":true,"color":"yellow"}]'}
execute if score dummy kiaPBTimeMs2 matches 1..99 run data merge block 2 20 69 {Text3:'["",{"text":"Chicken PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"kiaPBTimeSec2"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"kiaPBTimeMs2"},"bold":true,"color":"yellow"}]'}
execute if score dummy kiaPBTimeMs2 matches 100.. run data merge block 2 20 69 {Text3:'["",{"text":"Chicken PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"kiaPBTimeSec2"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"kiaPBTimeMs2"},"bold":true,"color":"yellow"}]'}

execute if score dummy kiaPBTimeMs3 matches 0 run data merge block 2 20 69 {Text4:'["",{"text":"Sheep PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"kiaPBTimeSec3"},"bold":true,"color":"yellow"},{"text":".00","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"kiaPBTimeMs3"},"bold":true,"color":"yellow"}]'}
execute if score dummy kiaPBTimeMs3 matches 1..99 run data merge block 2 20 69 {Text4:'["",{"text":"Sheep PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"kiaPBTimeSec3"},"bold":true,"color":"yellow"},{"text":".0","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"kiaPBTimeMs3"},"bold":true,"color":"yellow"}]'}
execute if score dummy kiaPBTimeMs3 matches 100.. run data merge block 2 20 69 {Text4:'["",{"text":"Sheep PB: ","bold":true,"color":"aqua"},{"score":{"name":"dummy","objective":"kiaPBTimeSec3"},"bold":true,"color":"yellow"},{"text":".","bold":true,"color":"yellow"},{"score":{"name":"dummy","objective":"kiaPBTimeMs3"},"bold":true,"color":"yellow"}]'}

data modify entity @e[type=armor_stand,tag=kiaPBTime0,limit=1] CustomName set from block 2 20 69 Text1
data modify entity @e[type=armor_stand,tag=kiaPBTime1,limit=1] CustomName set from block 2 20 69 Text2
data modify entity @e[type=armor_stand,tag=kiaPBTime2,limit=1] CustomName set from block 2 20 69 Text3
data modify entity @e[type=armor_stand,tag=kiaPBTime3,limit=1] CustomName set from block 2 20 69 Text4

# animal types: 0 = cow, 1 = pig, 2 = chicken, 3 = sheep
execute if block 6 12 69 minecraft:stone_button[powered=true] run setblock 7 12 69 minecraft:lime_concrete
execute if block 6 12 69 minecraft:stone_button[powered=true] run setblock 7 13 69 minecraft:red_concrete
execute if block 6 12 69 minecraft:stone_button[powered=true] run setblock 7 13 70 minecraft:red_concrete
execute if block 6 12 69 minecraft:stone_button[powered=true] run setblock 7 12 70 minecraft:red_concrete
execute if block 6 12 69 minecraft:stone_button[powered=true] run scoreboard players set dummy kiaAnimalType 0
execute if block 6 12 69 minecraft:stone_button[powered=true] run setblock 6 12 69 minecraft:stone_button[powered=false,facing=west]

execute if block 6 13 69 minecraft:stone_button[powered=true] run setblock 7 12 69 minecraft:red_concrete
execute if block 6 13 69 minecraft:stone_button[powered=true] run setblock 7 13 69 minecraft:lime_concrete
execute if block 6 13 69 minecraft:stone_button[powered=true] run setblock 7 13 70 minecraft:red_concrete
execute if block 6 13 69 minecraft:stone_button[powered=true] run setblock 7 12 70 minecraft:red_concrete
execute if block 6 13 69 minecraft:stone_button[powered=true] run scoreboard players set dummy kiaAnimalType 1
execute if block 6 13 69 minecraft:stone_button[powered=true] run setblock 6 13 69 minecraft:stone_button[powered=false,facing=west]

execute if block 6 13 70 minecraft:stone_button[powered=true] run setblock 7 12 69 minecraft:red_concrete
execute if block 6 13 70 minecraft:stone_button[powered=true] run setblock 7 13 69 minecraft:red_concrete
execute if block 6 13 70 minecraft:stone_button[powered=true] run setblock 7 13 70 minecraft:lime_concrete
execute if block 6 13 70 minecraft:stone_button[powered=true] run setblock 7 12 70 minecraft:red_concrete
execute if block 6 13 70 minecraft:stone_button[powered=true] run scoreboard players set dummy kiaAnimalType 2
execute if block 6 13 70 minecraft:stone_button[powered=true] run setblock 6 13 70 minecraft:stone_button[powered=false,facing=west]

execute if block 6 12 70 minecraft:stone_button[powered=true] run setblock 7 12 69 minecraft:red_concrete
execute if block 6 12 70 minecraft:stone_button[powered=true] run setblock 7 13 69 minecraft:red_concrete
execute if block 6 12 70 minecraft:stone_button[powered=true] run setblock 7 13 70 minecraft:red_concrete
execute if block 6 12 70 minecraft:stone_button[powered=true] run setblock 7 12 70 minecraft:lime_concrete
execute if block 6 12 70 minecraft:stone_button[powered=true] run scoreboard players set dummy kiaAnimalType 3
execute if block 6 12 70 minecraft:stone_button[powered=true] run setblock 6 12 70 minecraft:stone_button[powered=false,facing=west]

# count food
execute as @a at @s run execute store result score @s steakCount run clear @s minecraft:cooked_beef 0
execute as @a at @s run execute store result score @s porkCount run clear @s minecraft:cooked_porkchop 0
execute as @a at @s run execute store result score @s chickenCount run clear @s minecraft:cooked_chicken 0
execute as @a at @s run execute store result score @s muttonCount run clear @s minecraft:cooked_mutton 0


# animal ai
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaStarted matches 0 run execute as @e[type=cow] at @s run execute as @e[type=!player] run data modify entity @s NoAi set value 1b
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaStarted matches 0 run execute as @e[type=pig] at @s run execute as @e[type=!player] run data modify entity @s NoAi set value 1b
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaStarted matches 0 run execute as @e[type=chicken] at @s run execute as @e[type=!player] run data modify entity @s NoAi set value 1b
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaStarted matches 0 run execute as @e[type=sheep] at @s run execute as @e[type=!player] run data modify entity @s NoAi set value 1b
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy kiaStarted matches 0 run data modify entity @s NoAi set value 0b
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy kiaStarted matches 0 run data modify entity @s NoAi set value 0b

# movement to start map
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy kiaStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy kiaStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy kiaStarted matches 0 run effect clear @a regeneration
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy kiaStarted matches 0 run effect clear @a resistance
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy kiaStarted matches 0 run effect clear @a fire_resistance

execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy kiaStarted matches 0 run effect clear @a regeneration
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy kiaStarted matches 0 run effect clear @a resistance
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy kiaStarted matches 0 run effect clear @a fire_resistance

execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy kiaStarted matches 0 run gamerule doMobLoot true
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy kiaStarted matches 0 run gamerule doMobLoot true

execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy kiaStarted matches 0 run execute if score dummy kiaAnimalType matches 0 run tellraw @a {"text":"Obtain 5+ Steak!","color":"green"}
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy kiaStarted matches 0 run execute if score dummy kiaAnimalType matches 0 run tellraw @a {"text":"Obtain 5+ Steak!","color":"green"}

execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy kiaStarted matches 0 run execute if score dummy kiaAnimalType matches 1 run tellraw @a {"text":"Obtain 5+ Cooked Porkchop!","color":"green"}
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy kiaStarted matches 0 run execute if score dummy kiaAnimalType matches 1 run tellraw @a {"text":"Obtain 5+ Cooked Porkchop!","color":"green"}

execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy kiaStarted matches 0 run execute if score dummy kiaAnimalType matches 2 run tellraw @a {"text":"Obtain 5+ Cooked Chicken!","color":"green"}
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy kiaStarted matches 0 run execute if score dummy kiaAnimalType matches 2 run tellraw @a {"text":"Obtain 5+ Cooked Chicken!","color":"green"}

execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy kiaStarted matches 0 run execute if score dummy kiaAnimalType matches 3 run tellraw @a {"text":"Obtain 5+ Cooked Mutton!","color":"green"}
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy kiaStarted matches 0 run execute if score dummy kiaAnimalType matches 3 run tellraw @a {"text":"Obtain 5+ Cooked Mutton!","color":"green"}

execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy kiaStarted 1
execute if score dummy kiaInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy kiaStarted 1

# start practice
execute if block 2 12 73 minecraft:stone_button[powered=true] run function game:mechanics/kiareset
execute if block 2 12 73 minecraft:stone_button[powered=true] run setblock 2 12 73 minecraft:stone_button[powered=false,facing=north]


# timer
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaStarted matches 1 run scoreboard players add dummy kiaTimeMs 50
execute if score dummy kiaTimeMs matches 1000.. run scoreboard players add dummy kiaTimeSec 1
execute if score dummy kiaTimeMs matches 1000.. run scoreboard players set dummy kiaTimeMs 0


execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaTimeMs matches 0 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaTimeMs matches 1..99 run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaTimeMs matches 100.. run title @a actionbar ["",{"text":"Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]

# ending (get food)
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 0 run execute as @a[scores={steakCount=5..}] at @s run execute if score dummy kiaTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 0 run execute as @a[scores={steakCount=5..}] at @s run execute if score dummy kiaTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 0 run execute as @a[scores={steakCount=5..}] at @s run execute if score dummy kiaTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 0 run execute as @a[scores={steakCount=5..}] at @s run execute if score dummy kiaTimeSec < dummy kiaPBTimeSec0 run tellraw @a {"text":"(New PB!)","color ":"gold"}
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 0 run execute as @a[scores={steakCount=5..}] at @s run execute if score dummy kiaTimeSec < dummy kiaPBTimeSec0 run scoreboard players operation dummy kiaPBTimeMs0 = dummy kiaTimeMs
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 0 run execute as @a[scores={steakCount=5..}] at @s run execute if score dummy kiaTimeSec < dummy kiaPBTimeSec0 run scoreboard players operation dummy kiaPBTimeSec0 = dummy kiaTimeSec
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 0 run execute as @a[scores={steakCount=5..}] at @s run execute if score dummy kiaTimeSec = dummy kiaPBTimeSec0 run execute if score dummy kiaTimeMs < dummy kiaPBTimeMs0 run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 0 run execute as @a[scores={steakCount=5..}] at @s run execute if score dummy kiaTimeSec = dummy kiaPBTimeSec0 run execute if score dummy kiaTimeMs <= dummy kiaPBTimeMs0 run scoreboard players operation dummy kiaPBTimeMs0 = dummy kiaTimeMs
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 0 run execute as @a[scores={steakCount=5..}] at @s run execute if score dummy kiaTimeSec = dummy kiaPBTimeSec0 run execute if score dummy kiaTimeMs <= dummy kiaPBTimeMs0 run scoreboard players operation dummy kiaPBTimeSec0 = dummy kiaTimeSec
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 0 run execute as @a[scores={steakCount=5..}] at @s run function game:mechanics/kiareset

execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 1 run execute as @a[scores={porkCount=5..}] at @s run execute if score dummy kiaTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 1 run execute as @a[scores={porkCount=5..}] at @s run execute if score dummy kiaTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 1 run execute as @a[scores={porkCount=5..}] at @s run execute if score dummy kiaTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 1 run execute as @a[scores={porkCount=5..}] at @s run execute if score dummy kiaTimeSec < dummy kiaPBTimeSec1 run tellraw @a {"text":"(New PB!)","color ":"gold"}
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 1 run execute as @a[scores={porkCount=5..}] at @s run execute if score dummy kiaTimeSec < dummy kiaPBTimeSec1 run scoreboard players operation dummy kiaPBTimeMs1 = dummy kiaTimeMs
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 1 run execute as @a[scores={porkCount=5..}] at @s run execute if score dummy kiaTimeSec < dummy kiaPBTimeSec1 run scoreboard players operation dummy kiaPBTimeSec1 = dummy kiaTimeSec
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 1 run execute as @a[scores={porkCount=5..}] at @s run execute if score dummy kiaTimeSec = dummy kiaPBTimeSec1 run execute if score dummy kiaTimeMs < dummy kiaPBTimeMs1 run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 1 run execute as @a[scores={porkCount=5..}] at @s run execute if score dummy kiaTimeSec = dummy kiaPBTimeSec1 run execute if score dummy kiaTimeMs <= dummy kiaPBTimeMs1 run scoreboard players operation dummy kiaPBTimeMs1 = dummy kiaTimeMs
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 1 run execute as @a[scores={porkCount=5..}] at @s run execute if score dummy kiaTimeSec = dummy kiaPBTimeSec1 run execute if score dummy kiaTimeMs <= dummy kiaPBTimeMs1 run scoreboard players operation dummy kiaPBTimeSec1 = dummy kiaTimeSec
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 1 run execute as @a[scores={porkCount=5..}] at @s run function game:mechanics/kiareset

execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 2 run execute as @a[scores={chickenCount=5..}] at @s run execute if score dummy kiaTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 2 run execute as @a[scores={chickenCount=5..}] at @s run execute if score dummy kiaTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 2 run execute as @a[scores={chickenCount=5..}] at @s run execute if score dummy kiaTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 2 run execute as @a[scores={chickenCount=5..}] at @s run execute if score dummy kiaTimeSec < dummy kiaPBTimeSec2 run tellraw @a {"text":"(New PB!)","color ":"gold"}
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 2 run execute as @a[scores={chickenCount=5..}] at @s run execute if score dummy kiaTimeSec < dummy kiaPBTimeSec2 run scoreboard players operation dummy kiaPBTimeMs2 = dummy kiaTimeMs
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 2 run execute as @a[scores={chickenCount=5..}] at @s run execute if score dummy kiaTimeSec < dummy kiaPBTimeSec2 run scoreboard players operation dummy kiaPBTimeSec2 = dummy kiaTimeSec
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 2 run execute as @a[scores={chickenCount=5..}] at @s run execute if score dummy kiaTimeSec = dummy kiaPBTimeSec2 run execute if score dummy kiaTimeMs < dummy kiaPBTimeMs2 run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 2 run execute as @a[scores={chickenCount=5..}] at @s run execute if score dummy kiaTimeSec = dummy kiaPBTimeSec2 run execute if score dummy kiaTimeMs <= dummy kiaPBTimeMs2 run scoreboard players operation dummy kiaPBTimeMs2 = dummy kiaTimeMs
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 2 run execute as @a[scores={chickenCount=5..}] at @s run execute if score dummy kiaTimeSec = dummy kiaPBTimeSec2 run execute if score dummy kiaTimeMs <= dummy kiaPBTimeMs2 run scoreboard players operation dummy kiaPBTimeSec2 = dummy kiaTimeSec
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 2 run execute as @a[scores={chickenCount=5..}] at @s run function game:mechanics/kiareset

execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 3 run execute as @a[scores={muttonCount=5..}] at @s run execute if score dummy kiaTimeMs matches 0 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".00","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 3 run execute as @a[scores={muttonCount=5..}] at @s run execute if score dummy kiaTimeMs matches 1..99 run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 3 run execute as @a[scores={muttonCount=5..}] at @s run execute if score dummy kiaTimeMs matches 100.. run tellraw @a ["",{"text":"Run Time: ","color":"dark_green"},{"score":{"name":"dummy","objective":"kiaTimeSec"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"dummy","objective":"kiaTimeMs"},"color":"green"}]
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 3 run execute as @a[scores={muttonCount=5..}] at @s run execute if score dummy kiaTimeSec < dummy kiaPBTimeSec3 run tellraw @a {"text":"(New PB!)","color ":"gold"}
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 3 run execute as @a[scores={muttonCount=5..}] at @s run execute if score dummy kiaTimeSec < dummy kiaPBTimeSec3 run scoreboard players operation dummy kiaPBTimeMs3 = dummy kiaTimeMs
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 3 run execute as @a[scores={muttonCount=5..}] at @s run execute if score dummy kiaTimeSec < dummy kiaPBTimeSec3 run scoreboard players operation dummy kiaPBTimeSec3 = dummy kiaTimeSec
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 3 run execute as @a[scores={muttonCount=5..}] at @s run execute if score dummy kiaTimeSec = dummy kiaPBTimeSec3 run execute if score dummy kiaTimeMs < dummy kiaPBTimeMs3 run tellraw @a {"text":"(New PB!)","color":"gold"}
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 3 run execute as @a[scores={muttonCount=5..}] at @s run execute if score dummy kiaTimeSec = dummy kiaPBTimeSec3 run execute if score dummy kiaTimeMs <= dummy kiaPBTimeMs3 run scoreboard players operation dummy kiaPBTimeMs3 = dummy kiaTimeMs
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 3 run execute as @a[scores={muttonCount=5..}] at @s run execute if score dummy kiaTimeSec = dummy kiaPBTimeSec3 run execute if score dummy kiaTimeMs <= dummy kiaPBTimeMs3 run scoreboard players operation dummy kiaPBTimeSec3 = dummy kiaTimeSec
execute if score dummy kiaInPrac matches 1 run execute if score dummy kiaAnimalType matches 3 run execute as @a[scores={muttonCount=5..}] at @s run function game:mechanics/kiareset


execute if score dummy kiaInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:mechanics/kiareset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy kiaInPrac matches 1 run scoreboard players set @a dropGoldSword 1

execute if score dummy kiaInPrac matches 1 run execute as @a[scores={dropGoldSword=1..}] at @s run tp @s 2 11 68 0 0
execute as @a[scores={dropGoldSword=1..}] at @s run clear @s
execute as @a[scores={dropGoldSword=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropGoldSword=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropGoldSword=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropGoldSword=1..}] at @s run scoreboard players set dummy kiaInPrac 0
execute as @a[scores={dropGoldSword=1..}] at @s run scoreboard players set dummy kiaStarted 0
execute as @a[scores={dropGoldSword=1..}] at @s run effect give @s saturation 1 5 true
execute as @a[scores={dropGoldSword=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:golden_sword"}}]

execute as @a[scores={dropGoldSword=1..}] at @s run scoreboard players set @s dropGoldSword 0

