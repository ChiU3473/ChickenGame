#雞=====================================================================================================================
#基礎設定
execute as @a[team=R] at @e[type=chicken,team=R] run spawnpoint @s ~ ~ ~
execute as @a[team=Y] at @e[type=chicken,team=Y] run spawnpoint @s ~ ~ ~
execute as @a[team=G] at @e[type=chicken,team=G] run spawnpoint @s ~ ~ ~
execute as @a[team=B] at @e[type=chicken,team=B] run spawnpoint @s ~ ~ ~
#血量偵測
scoreboard players reset * CGhealth
scoreboard objectives setdisplay sidebar.team.light_purple
scoreboard objectives setdisplay sidebar.team.yellow
scoreboard objectives setdisplay sidebar.team.green
scoreboard objectives setdisplay sidebar.team.aqua
execute as @a[team=R] at @s if entity @e[type=chicken,distance=..2.5,team=R] run scoreboard objectives setdisplay sidebar.team.red CGhealth
execute as @a[team=Y] at @s if entity @e[type=chicken,distance=..2.5,team=Y] run scoreboard objectives setdisplay sidebar.team.yellow CGhealth
execute as @a[team=G] at @s if entity @e[type=chicken,distance=..2.5,team=G] run scoreboard objectives setdisplay sidebar.team.green CGhealth
execute as @a[team=B] at @s if entity @e[type=chicken,distance=..2.5,team=B] run scoreboard objectives setdisplay sidebar.team.aqua CGhealth
execute at @e[tag=CGtc] as @p[distance=..2.5] at @s if entity @n[tag=CGtc] store result score @s CGhealth as @s run data get entity @n[tag=CGtc] Health
#距離偵測
tag @a remove dck
tag @a add ck
execute as @a[team=R] at @s if entity @n[type=chicken,distance=..16,team=R] at @s run tag @s add dck
execute as @a[team=Y] at @s if entity @n[type=chicken,distance=..16,team=Y] at @s run tag @s add dck
execute as @a[team=G] at @s if entity @n[type=chicken,distance=..16,team=G] at @s run tag @s add dck
execute as @a[team=B] at @s if entity @n[type=chicken,distance=..16,team=B] at @s run tag @s add dck
tag @a[tag=dck] remove ck
#圈內提升
execute as @a[team=R] at @s if entity @n[type=chicken,distance=..15,team=R] at @s run effect give @s speed 1 0 true
execute as @a[team=Y] at @s if entity @n[type=chicken,distance=..15,team=Y] at @s run effect give @s speed 1 0 true
execute as @a[team=G] at @s if entity @n[type=chicken,distance=..15,team=G] at @s run effect give @s speed 1 0 true
execute as @a[team=B] at @s if entity @n[type=chicken,distance=..15,team=B] at @s run effect give @s speed 1 0 true
execute as @a[team=R] at @s if entity @n[type=chicken,distance=..15,team=R] at @s run effect give @s haste 1 4 true
execute as @a[team=Y] at @s if entity @n[type=chicken,distance=..15,team=Y] at @s run effect give @s haste 1 4 true
execute as @a[team=G] at @s if entity @n[type=chicken,distance=..15,team=G] at @s run effect give @s haste 1 4 true
execute as @a[team=B] at @s if entity @n[type=chicken,distance=..15,team=B] at @s run effect give @s haste 1 4 true
#超距計時
execute as @a[tag=ck] at @s run scoreboard players add @s CGtime 1
execute as @a[tag=ck] at @s if score @s CGtime matches 20 run scoreboard players add @s CGplay 1
execute as @a at @s if score @s CGtime matches 20 run scoreboard players reset @s CGtime
execute as @a[tag=dck] at @s run scoreboard players reset @s CGtime
execute as @a[tag=dck] at @s run scoreboard players remove @s CGplay 1
execute as @a[tag=dck] at @s if score @s CGplay matches -1 run scoreboard players reset @s CGplay
scoreboard objectives setdisplay sidebar CGlife
execute as @a if score @s CGplay >= pp CGplay run scoreboard objectives setdisplay sidebar CGplay
#超距懲罰
execute as @a[tag=ck] at @s if score @s CGplay matches 1 run effect give @s minecraft:darkness 2 1 true
execute as @a at @s if score @s CGplay >= IIIIIIII CGplay run effect give @s minecraft:hunger 2 100 true
execute as @a at @s if score @s CGplay >= IIIIIIII CGplay run effect give @s minecraft:poison 2 100 true
#雞奴剩餘生命
execute as @a at @s if score @s CGdeath matches 1 run scoreboard players remove @s CGlife 1
execute as @a at @s if score @s CGdeath matches 1 run scoreboard players set @s CGdeath 0
execute as @a at @s if score @s CGlife matches 0 run gamemode spectator @s
scoreboard players reset @a[gamemode=spectator] CGtime
#野雞的加入
execute as @e[tag=CGtc] at @s run effect give @e[type=chicken,tag=,distance=..16] minecraft:glowing 7200 1 true
execute as @e[tag=CGtc] at @s run effect give @e[type=chicken,tag=,distance=..16] regeneration 7200 100 true
execute as @e[tag=CGtc] at @s run effect give @e[type=chicken,tag=,distance=..16] speed 7200 0 true
execute as @e[tag=CGtc,team=R] at @s run team join R @e[type=chicken,tag=,distance=..16]
execute as @e[tag=CGtc,team=Y] at @s run team join Y @e[type=chicken,tag=,distance=..16]
execute as @e[tag=CGtc,team=G] at @s run team join G @e[type=chicken,tag=,distance=..16]
execute as @e[tag=CGtc,team=B] at @s run team join B @e[type=chicken,tag=,distance=..16]
execute as @e[tag=CGtc] at @s run tag @e[type=chicken,tag=,distance=..16] add CGtc
#粒子特效
execute as @e[tag=CGpa] at @s run tp @s ~ ~ ~ ~2 0
execute as @e[tag=CGtc] at @s rotated as @e[tag=CGpa] run particle minecraft:cloud ^ ^0.2 ^15.5 0 0 0 0 1 force
execute as @e[tag=CGtc] at @s rotated as @e[tag=CGpa] run particle minecraft:cloud ^ ^0.2 ^-15.5 0 0 0 0 1 force
execute as @e[tag=CGtc] at @s rotated as @e[tag=CGpa] run particle minecraft:cloud ^15.5 ^0.2 ^ 0 0 0 0 1 force
execute as @e[tag=CGtc] at @s rotated as @e[tag=CGpa] run particle minecraft:cloud ^-15.5 ^0.2 ^ 0 0 0 0 1 force
execute as @a[tag=ck,team=R] at @s facing entity @n[type=chicken,team=R] eyes run particle cloud ^ ^ ^1 0 0 0 0 1 force
execute as @a[tag=ck,team=Y] at @s facing entity @n[type=chicken,team=Y] eyes run particle cloud ^ ^ ^1 0 0 0 0 1 force
execute as @a[tag=ck,team=G] at @s facing entity @n[type=chicken,team=G] eyes run particle cloud ^ ^ ^1 0 0 0 0 1 force
execute as @a[tag=ck,team=B] at @s facing entity @n[type=chicken,team=B] eyes run particle cloud ^ ^ ^1 0 0 0 0 1 force
#雞_最終決賽
execute if score CGfinalgo CGtime > pp CGplay run scoreboard players add CGfinalgo CGtime 1
execute if score CGfinalgo CGtime matches 72000 run function chickengame:final
execute if score CGfinalgo CGtime matches 72000 run scoreboard players set CGfinalgo CGtime 0
execute if score CGfinal CGtime > pp CGplay run scoreboard players add CGfinal CGtime 1
execute if score CGfinal CGtime matches 20 run title @a title "9"
execute if score CGfinal CGtime matches 40 run title @a title "8"
execute if score CGfinal CGtime matches 60 run title @a title "7"
execute if score CGfinal CGtime matches 80 run title @a title "6"
execute if score CGfinal CGtime matches 100 run title @a title "5"
execute if score CGfinal CGtime matches 120 run title @a title "4"
execute if score CGfinal CGtime matches 140 run title @a title "3"
execute if score CGfinal CGtime matches 160 run title @a title "2"
execute if score CGfinal CGtime matches 180 run title @a title "1"
execute if score CGfinal CGtime matches 200 run title @a title "開戰!!!"
execute if score CGfinal CGtime matches 200 run title @a subtitle ""
execute if score CGfinal CGtime matches 200 run effect clear @a
execute if score CGfinal CGtime matches 200 run effect clear @e[tag=CGtc] speed
execute if score CGfinal CGtime matches 200 run worldborder center 0.0 0.0
execute if score CGfinal CGtime matches 200 run worldborder set 100
execute if score CGfinal CGtime matches 200 run spreadplayers 0 0 32 40 true @a[tag=CGc]
execute if score CGfinal CGtime matches 200 run tp @e[team=R] @r[team=R,tag=CGc]
execute if score CGfinal CGtime matches 200 run tp @e[team=Y] @r[team=Y,tag=CGc]
execute if score CGfinal CGtime matches 200 run tp @e[team=G] @r[team=G,tag=CGc]
execute if score CGfinal CGtime matches 200 run tp @e[team=B] @r[team=B,tag=CGc]
execute if score CGfinal CGtime matches 200 run scoreboard players set CGfinal CGtime 0
#物品合成===============================================================================================================
#雞生怪蛋
execute as @e[type=minecraft:item,nbt={Item:{count:1,id:"minecraft:egg"}}] at @s if entity @e[type=minecraft:item,nbt={Item:{count:1,id:"minecraft:redstone"}},distance=..1] if entity @e[type=minecraft:item,nbt={Item:{count:1,id:"minecraft:gray_dye"}},distance=..1] if entity @e[type=minecraft:item,nbt={Item:{count:1,id:"minecraft:gold_block"}},distance=..1] run function chickengame:summon

