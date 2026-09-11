scoreboard objectives add wlsInPrac dummy
scoreboard objectives add wlsStarted dummy

# movement to start map
execute if score dummy wlsInPrac matches 1 run execute if score dummy wlsStarted matches 0 run title @a actionbar {"text":"Waiting for movement...","color":"dark_red"}

execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wlsStarted matches 0 run title @a actionbar {"text":"","color":"dark_red"}
execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wlsStarted matches 0 run title @a actionbar {"text":"","color":"dark_red"}

execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wlsStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wlsStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wlsStarted matches 0 run effect clear @a regeneration
execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wlsStarted matches 0 run effect clear @a resistance
execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wlsStarted matches 0 run effect clear @a fire_resistance

execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wlsStarted matches 0 run effect clear @a regeneration
execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wlsStarted matches 0 run effect clear @a resistance
execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wlsStarted matches 0 run effect clear @a fire_resistance

execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy wlsStarted matches 0 run fill 99 15 132 99 15 133 air
execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy wlsStarted matches 0 run fill 99 15 132 99 15 133 air

execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run scoreboard players set dummy wlsStarted 1
execute if score dummy wlsInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run scoreboard players set dummy wlsStarted 1


# start practice
execute if block 76 16 138 minecraft:stone_button[powered=true] run function game:clutches/wlsreset
execute if block 76 16 138 minecraft:stone_button[powered=true] run setblock 76 16 138 minecraft:stone_button[powered=false,facing=north]

execute if score dummy wlsInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:clutches/wlsreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy wlsInPrac matches 1 run scoreboard players set @a dropIronPickaxe 1

execute if score dummy wlsInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run tp @s 76 15 132 0 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run clear @s
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy wlsInPrac 0
# execute as @a[scores={dropStoneShovel=1..}] at @s run scoreboard players set dummy wlsStarted 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s saturation 1 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]

