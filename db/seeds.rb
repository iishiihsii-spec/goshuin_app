# スタンプ機能で使用する初期データ

# rarity_id: 1 = Normal, 2 = Rare, 3 = Super Rare, 4 = Ultra Rare

Stamp.create!(
name: "桜の神様",
description: "春の参拝を見守る、小さくてやさしい神様。桜の花びらをまとい、初めて御朱印を集める人をそっと応援してくれる。",
rarity_id: 1,
icon: "normal_sakura_god.png"
)

Stamp.create!(
name: "おみくじ小僧",
description: "小さなおみくじ箱を持った、元気な案内役。参拝者に今日の小さな幸運を届けてくれる、親しみやすいキャラクター。",
rarity_id: 1,
icon: "normal_omikuji_boy.png"
)

Stamp.create!(
name: "手水のしずく",
description: "手水舎の水から生まれた、小さな水の精。参拝前の心を清め、穏やかな気持ちにしてくれる。",
rarity_id: 1,
icon: "normal_water_spirit.png"
)

Stamp.create!(
name: "参道のたぬき",
description: "参道の近くで旅人を見守る、のんびりしたたぬき。少しおっちょこちょいだが、御朱印集めの旅を楽しくしてくれる。",
rarity_id: 1,
icon: "normal_tanuki.png"
)

Stamp.create!(
name: "狐の使い",
description: "神社へ向かう参拝者を導いてくれる、少し神秘的な白狐。赤い飾り紐と小さな鈴を身につけている。",
rarity_id: 2,
icon: "rare_fox.png"
)

Stamp.create!(
name: "鈴の巫女",
description: "清らかな鈴の音で幸運を呼ぶ小さな巫女。参拝者の願いが届くように、やさしく祈ってくれる。",
rarity_id: 2,
icon: "rare_miko.png"
)

Stamp.create!(
name: "御朱印帳の精",
description: "御朱印帳に宿る小さな精霊。集めた御朱印の思い出を大切に守り、旅の記録を見守ってくれる。",
rarity_id: 2,
icon: "rare_goshuin_book_spirit.png"
)

Stamp.create!(
name: "金の狛犬",
description: "金色に輝く特別な狛犬。参拝者を災いから守り、御朱印集めの旅に力強い加護を与えてくれる。",
rarity_id: 3,
icon: "super_rare_gold_komainu.png"
)

Stamp.create!(
name: "月夜の龍神",
description: "月明かりの中に現れる水の龍神。澄んだ青い光と雲をまとい、静かで神秘的な力を持っている。",
rarity_id: 3,
icon: "super_rare_moon_dragon.png"
)

Stamp.create!(
name: "天照の光",
description: "まばゆい光で旅路を照らす、最高位の神様。金色の後光と桜吹雪をまとい、御朱印集めの旅に特別な祝福を与えてくれる。",
rarity_id: 4,
icon: "ultra_rare_amaterasu.png"
)