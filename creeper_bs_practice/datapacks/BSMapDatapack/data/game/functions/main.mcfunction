effect give @a night_vision 10000 4 true

# global scbs
scoreboard objectives add throwSnowball minecraft.used:minecraft.snowball
scoreboard objectives add startMovingA minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add startMovingB minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add onDeath deathCount
scoreboard objectives add xPos dummy
scoreboard objectives add yPos dummy
scoreboard objectives add zPos dummy
scoreboard objectives add hp health

# run other fcns
function game:movement/hoglinfs
function game:movement/wskelerun
function game:movement/skelecords

function game:clutches/vineclutch
function game:clutches/pigholeclutch
function game:clutches/fireresclutch
function game:clutches/misplaceobbyclutch
function game:clutches/woodlightsave

function game:mechanics/killanimals
function game:mechanics/distractpiglins
function game:mechanics/endcagestuck
function game:mechanics/boateman
function game:mechanics/blindsplitpearl

#on death 
execute as @a[scores={onDeath=1..}] at @s run clear @s
execute as @a[scores={onDeath=1..}] at @s run execute as @a at @s run attribute @s minecraft:generic.max_health base set 20
execute as @a[scores={onDeath=1..}] at @s run gamemode adventure @a

#get player coords
execute as @a at @s run execute store result score @s xPos run data get entity @s Pos[0]
execute as @a at @s run execute store result score @s yPos run data get entity @s Pos[1]
execute as @a at @s run execute store result score @s zPos run data get entity @s Pos[2]

execute as @a[scores={throwSnowball=1..}] at @s run scoreboard players set @s throwSnowball 0
execute as @a[scores={startMovingA=1..}] at @s run scoreboard players set @s startMovingA 0
execute as @a[scores={startMovingB=1..}] at @s run scoreboard players set @s startMovingB 0
execute as @a[scores={onDeath=1..}] at @s run scoreboard players set @s onDeath 0

execute as @a[scores={dropIronPickaxe=1..}] at @s run scoreboard players set @s dropIronPickaxe 0