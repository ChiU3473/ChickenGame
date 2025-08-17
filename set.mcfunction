#遊戲設置
kill @e[type=chicken]
kill @e[type=item]
scoreboard players reset * CGplay
scoreboard players reset * CGtime
scoreboard objectives remove CGplay
scoreboard objectives remove CGtime
team add R
team modify R color red
team add Y
team modify Y color yellow
team add G
team modify G color green
team add B
team modify B color aqua
scoreboard objectives add CGhealth dummy "周圍隊雞血量"
scoreboard objectives add CGdeath deathCount "死亡板"
scoreboard objectives add CGlife dummy "剩餘生命"
scoreboard players set @a CGlife 3
scoreboard objectives setdisplay sidebar CGlife
gamemode creative @a
#粒子特效
kill @e[tag=CGpa]
summon armor_stand 0 -63 0 {Tags:["CGpa"],CustomName:"系統"}
execute as @a at @s anchored eyes run particle minecraft:sonic_boom ^ ^ ^1.5 0 0 0 10 10 force @s
#系統提示
execute as @e[tag=CGpa] run say 已設置隊伍
execute as @e[tag=CGpa] run say 輸入" /team join R/Y/G/B "加入紅/黃/綠/藍隊伍
