#設定隊長
tag @a remove CGc
tag @p[team=R] add CGc
tag @p[team=Y] add CGc
tag @p[team=G] add CGc
tag @p[team=B] add CGc
spreadplayers 0 0 128 256 true @a[tag=CGc]
#傳送玩家至隊長
tp @a[team=R] @r[team=R,tag=CGc]
tp @a[team=Y] @r[team=Y,tag=CGc]
tp @a[team=G] @r[team=G,tag=CGc]
tp @a[team=B] @r[team=B,tag=CGc]
#恢復預設
gamemode adventure @a
effect give @a resistance 15 4 false
#邊界設置
worldborder center 0.0 0.0
worldborder set 1000
#系統提示
execute as @e[tag=CGpa] run say "邊界邊長已設為1000。"
execute as @e[tag=CGpa] run say "所有玩家已被傳送至直徑500的範圍中。"
execute as @e[tag=CGpa] run say "隊伍之間相隔128格。"
