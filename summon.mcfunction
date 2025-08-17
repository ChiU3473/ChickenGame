execute if entity @e[type=minecraft:item,nbt={Item:{count:1,id:"minecraft:redstone"}},distance=..1] run summon chicken ~ ~ ~ {CustomName:"隊雞",Tags:["CGtc","CGspawnc"]}
execute as @n[tag=CGspawnc] at @s run tag @p add CGcjoin
execute as @p[team=R,tag=CGcjoin] at @s run team join R @e[tag=CGspawnc]
execute as @p[team=Y,tag=CGcjoin] at @s run team join Y @e[tag=CGspawnc]
execute as @p[team=G,tag=CGcjoin] at @s run team join G @e[tag=CGspawnc]
execute as @p[team=B,tag=CGcjoin] at @s run team join B @e[tag=CGspawnc]
execute as @n[tag=CGspawnc] at @s run particle cloud ~ ~0.5 ~ 0.5 0.5 0.5 0 30 force
tag @a remove CGcjoin
effect give @e[tag=CGspawnc] minecraft:health_boost 7200 10 true
effect give @e[tag=CGspawnc] instant_health 1 100 true
effect give @e[tag=CGspawnc] regeneration 7200 0 true
effect give @e[tag=CGspawnc] speed 7200 0 true
effect give @e[tag=CGspawnc] minecraft:glowing 7200 1 false
tag @e remove CGspawnc
kill @e[type=item,distance=..1]
