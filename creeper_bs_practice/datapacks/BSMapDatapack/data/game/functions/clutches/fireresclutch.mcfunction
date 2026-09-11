# scoreboard objectives add frcTimeSec dummy
# scoreboard objectives add frcTimeMs dummy
# scoreboard objectives add frcPBTimeSec dummy
# scoreboard objectives add frcPBTimeMs dummy
scoreboard objectives add frcInPrac dummy
scoreboard objectives add frcStarted dummy
# scoreboard objectives add frcXTarget dummy
# scoreboard objectives add frcZTarget dummy
# scoreboard objectives add frcSetX dummy
# scoreboard objectives add frcSetZ dummy
scoreboard objectives add dropIronPickaxe minecraft.dropped:minecraft.iron_pickaxe

execute if score dummy frcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy frcStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2
execute if score dummy frcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy frcStarted matches 0 run execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

execute if score dummy frcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy frcStarted matches 0 run effect clear @a regeneration
execute if score dummy frcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy frcStarted matches 0 run effect clear @a resistance
execute if score dummy frcInPrac matches 1 run execute if entity @r[scores={startMovingA=1..}] run execute if score dummy frcStarted matches 0 run effect clear @a fire_resistance

execute if score dummy frcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy frcStarted matches 0 run effect clear @a regeneration
execute if score dummy frcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy frcStarted matches 0 run effect clear @a resistance
execute if score dummy frcInPrac matches 1 run execute if entity @r[scores={startMovingB=1..}] run execute if score dummy frcStarted matches 0 run effect clear @a fire_resistance

# start practice
execute if block 77 15 79 minecraft:warped_button[powered=true] run function game:clutches/frcreset
execute if block 77 15 79 minecraft:warped_button[powered=true] run setblock 77 15 79 minecraft:warped_button[powered=false,facing=north]

# get fire res
execute if score dummy frcInPrac matches 1 run execute if score dummy frcStarted matches 1 run execute as @a[x=94,y=4,z=71,dx=9,dz=9,dy=15] at @s run execute if entity @a[nbt={ActiveEffects:[{Id:12b}]}] run tellraw @a {"text":"Fire Res Successful!","bold":true,"color":"gold"}
execute if score dummy frcInPrac matches 1 run execute if score dummy frcStarted matches 1 run execute as @a[x=94,y=4,z=71,dx=9,dz=9,dy=15] at @s run execute if entity @a[nbt={ActiveEffects:[{Id:12b}]}] run execute as @a at @s run playsound minecraft:entity.blaze.death master @s ~ ~31 ~ 1 2
execute if score dummy frcInPrac matches 1 run execute if score dummy frcStarted matches 1 run execute as @a[x=94,y=4,z=71,dx=9,dz=9,dy=15] at @s run execute if entity @a[nbt={ActiveEffects:[{Id:12b}]}] run function game:clutches/frcreset

# fall to ground
execute as @a[x=94,y=4,z=71,dx=9,dz=9,scores={hp=..4}] at @s run function game:clutches/frcreset


execute if score dummy frcInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:clutches/frcreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy frcInPrac matches 1 run scoreboard players set @a dropIronPickaxe 1

execute if score dummy frcInPrac matches 1 run execute as @a[scores={dropIronPickaxe=1..}] at @s run tp @s 77 14 74 0 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run clear @s
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy frcInPrac 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set dummy frcStarted 0
execute as @a[scores={dropIronPickaxe=1..}] at @s run effect give @s saturation 1 5 true
execute as @a[scores={dropIronPickaxe=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:iron_pickaxe"}}]

