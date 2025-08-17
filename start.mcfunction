#隊伍雞設定
kill @e[type=chicken]
execute as @a[tag=CGc] at @s run summon chicken ~ ~ ~ {CustomName:"隊雞",Tags:["CGtc"]}
execute as @a[tag=CGc,team=R] at @s run team join R @n[tag=CGtc]
execute as @a[tag=CGc,team=Y] at @s run team join Y @n[tag=CGtc]
execute as @a[tag=CGc,team=G] at @s run team join G @n[tag=CGtc]
execute as @a[tag=CGc,team=B] at @s run team join B @n[tag=CGtc]
effect give @e[tag=CGtc] minecraft:health_boost 7200 10 true
effect give @e[tag=CGtc] instant_health 1 100 true
effect give @e[tag=CGtc] regeneration 7200 0 true
effect give @e[tag=CGtc] speed 7200 0 true
effect give @e[tag=CGtc] minecraft:glowing 7200 1 false
#玩家設定
gamemode survival @a
clear @a
effect clear @a
scoreboard players set @a CGplay 0
scoreboard players set @a CGlife 3
effect give @a resistance 15 4 false
effect give @a instant_health 1 100 false
#系統設定與提示
kill @e[type=item]
scoreboard objectives add CGplay dummy "雞計時"
scoreboard players set pp CGplay 0
scoreboard players set IIIIIIII CGplay 30
scoreboard objectives add CGtime dummy "計時"
scoreboard players set CGfinal CGtime 0
scoreboard players set CGfinalgo CGtime 1
title @a title "遊戲開始"
title @a subtitle "你家的雞要被狐狸咬了"
execute as @e[tag=CGpa] run say "隊雞的血量為48滴(24顆心)。"
execute as @e[tag=CGpa] run say "距離隊伍雞16格以上30秒未回，會遭受嚴峻的懲罰！"
execute as @e[tag=CGpa] run say "在所屬隊伍領域內，玩家將獲得[加速]效果。"
execute as @e[tag=CGpa] run say "[召喚隊雞]：將 雞蛋、金磚、紅石、灰色染料 丟置於地上即可召喚隊雞。"
execute as @e[tag=CGpa] run say "[拉攏野雞]：使野雞進入隊雞16格內。加入後血量不變，但有超高生命回復效果。"
#粒子特效
particle minecraft:lava ~ ~ ~ 0 0 0 10 10 force @a
