
# scoreboard objectives add vicTimeSec dummy
# scoreboard objectives add vicTimeMs dummy
# scoreboard objectives add vicPBTimeSec dummy
# scoreboard objectives add vicPBTimeMs dummy
scoreboard objectives add vicInPrac dummy
# scoreboard objectives add vicStarted dummy
scoreboard objectives add vicXTarget dummy
scoreboard objectives add vicZTarget dummy
# scoreboard objectives add vicSetX dummy
# scoreboard objectives add vicSetZ dummy
scoreboard objectives add dropWarpedSign minecraft.dropped:minecraft.warped_sign

#target block
scoreboard players add dummy vicXTarget 1
scoreboard players add dummy vicZTarget 1
execute if score dummy vicXTarget matches 107.. run scoreboard players set dummy vicXTarget 97
execute if score dummy vicZTarget matches 34.. run scoreboard players set dummy vicZTarget 25

# start practice
execute if block 81 11 27 minecraft:warped_button[powered=true] run function game:clutches/vicreset
execute if block 81 11 27 minecraft:warped_button[powered=true] run setblock 81 11 27 minecraft:warped_button[powered=false,facing=north]

# fall to ground
execute as @a[x=97,y=9,z=25,dx=9,dz=8] at @s run function game:clutches/vicreset

execute if score dummy vicInPrac matches 1 run execute as @a[scores={throwSnowball=1..}] at @s run function game:clutches/vicreset

execute as @a[scores={onDeath=1..}] at @s run execute if score dummy vicInPrac matches 1 run scoreboard players set @a dropStoneShovel 1

execute as @a[scores={dropWarpedSign=1..}] at @s run tp @s 81 10 23 0 0
execute as @a[scores={dropWarpedSign=1..}] at @s run clear @s
execute as @a[scores={dropWarpedSign=1..}] at @s run effect give @s fire_resistance 20 5 true
execute as @a[scores={dropWarpedSign=1..}] at @s run effect give @s regeneration 20 5 true
execute as @a[scores={dropWarpedSign=1..}] at @s run effect give @s resistance 20 5 true
execute as @a[scores={dropWarpedSign=1..}] at @s run scoreboard players set dummy vicInPrac 0
# execute as @a[scores={dropStoneShovel=1..}] at @s run scoreboard players set dummy vicStarted 0
execute as @a[scores={dropWarpedSign=1..}] at @s run effect give @s saturation 1 5 true
execute as @a[scores={dropWarpedSign=1..}] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:warped_sign"}}]

execute as @a[scores={dropWarpedSign=1..}] at @s run scoreboard players set @s dropWarpedSign 0