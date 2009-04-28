;;; support-jitsuu.el --- suport file for "字通"
;; Copyright (C) 2009 KAWABATA Taichi <kawabata.taichi@gmail.com>

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software Foundation,
;; Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

;;; Memo:

;; AJ1-6のIVSでは対応できなかった旧字については、コメントに「旧字」と附した。
;; これらには、四画草冠・はみ出さない「身」・「育・㐬」の上部が三画・「立」の
;; 初画が横画・三画の「止」、等が含まれる。

;; 末尾にコメントアウトしているのは、親字として立てられながら、AJ1-6では対応
;; できていない異体字で、現状では画像として扱うべきと考えられるものである。

;;; Code:

(require 'lookup)

(let 
  ((encoded-jitsuu-gaiji-table
    '(
      ("H1-41" "ə")
      ("H1-42" "ā")
      ("H1-43" "ī")
      ("H1-44" "ṃ")
      ("H1-45" "ṇ")
      ("H1-46" "ô")
      ("H1-47" "ś")
      ("H1-48" "ṣ")
      ("H1-49" "ū")
      ("11-4E0B" "延󠄂")
      ("11-4E10" "擢󠄁")
      ("11-4E15" "擲󠄀")
      ("11-4E1E" "吳")
      ("11-4E21" "釣󠄁")
      ("11-4E59" "㕣󠄀")
      ("11-4E80" "碻")
      ("11-4E88" "譚󠄁")
      ("11-4E92" "菊") ;; 旧字
      ("11-4EAD" "住󠄁")
      ("11-4EAE" "彫󠄁")
      ("11-4EC2" "㓠")
      ("11-4EC6" "玷")
      ("11-4ECD" "坫")
      ("11-4ED5" "寓") ;; 旧字
      ("11-4ED8" "揃󠄁")
      ("11-4EDE" "淟")
      ("11-4EDF" "奠󠄀")
      ("11-4EE5" "韋") ;; 旧字
      ("11-4EEE" "炎") ;; 旧字
      ("11-4EF0" "秆")
      ("11-4F01" "慨󠄄")
      ("11-4F09" "塡")
      ("11-4F0A" "扆")
      ("11-4F1D" "緒") ;; 旧字
      ("11-4F5C" "勤󠄁")
      ("11-4F5E" "頻󠄀")
      ("11-4F6F" "顚")
      ("11-4F7B" "遭󠄁")
      ("11-4F7C" "虐󠄁")
      ("11-4F7F" "遇󠄁")
      ("11-4F8D" "涇")
      ("11-4F9B" "攼")
      ("11-4F9D" "偉󠄁")
      ("11-4FAE" "遷󠄁")
      ("11-4FAF" "逆󠄁")
      ("11-4FC2" "宄")
      ("11-4FD0" "堵󠄁")
      ("11-4FD8" "途󠄁")
      ("11-4FDA" "都󠄀")
      ("11-4FE5" "稌")
      ("11-5005" "斁")
      ("11-5012" "宵󠄁")
      ("11-5016" "及󠄁")
      ("11-5019" "丩")
      ("11-5021" "冬󠄀")
      ("11-5024" "餌󠄃")
      ("11-5025" "賭󠄁")
      ("11-5026" "萁")
      ("11-5036" "翰󠄁")
      ("11-5043" "洮")
      ("11-5047" "逃󠄂")
      ("11-5075" "厹")
      ("11-50AD" "談") ;; 旧字
      ("11-50B7" "謙󠄁")
      ("11-50D1" "旰")
      ("11-50D6" "塘")
      ("11-50ED" "董") ;; 旧字
      ("11-50F9" "憃")
      ("11-5102" "滕󠄁")
      ("11-5109" "憧") ;; 旧字
      ("11-5118" "兔󠄀")
      ("11-511F" "繭󠄀")
      ("11-5141" "𠃉")
      ("11-5146" "酌󠄁")
      ("11-514C" "縢󠄀")
      ("11-5150" "荊")
      ("11-5165" "職") ;; 旧字
      ("11-5176" "芝") ;; 旧字
      ("11-5185" "狀")
      ("11-5189" "鬭")
      ("11-51A4" "禱󠄀")
      ("11-51A5" "退󠄁")
      ("11-51A8" "搧")
      ("11-51B4" "囷")
      ("11-51B7" "追󠄁")
      ("11-51EA" "城󠄁")
      ("11-51ED" "童") ;; 旧字
      ("11-51F0" "道󠄁")
      ("11-51FA" "倦󠄁")
      ("11-51FE" "導󠄁")
      ("11-5200" "消󠄁")
      ("11-5208" "芥")
      ("11-5224" "眚")
      ("11-522E" "猱")
      ("11-5243" "尗")
      ("11-5244" "匿󠄁")
      ("11-524A" "僅󠄁")
      ("11-524C" "德")
      ("11-5254" "瀆")
      ("11-526F" "蟬")
      ("11-5270" "娛")
      ("11-5287" "起󠄁")
      ("11-5289" "儲󠄁")
      ("11-528D" "𠫓") ;; 旧字
      ("11-5292" "突󠄁")
      ("11-5294" "㕯")
      ("11-529B" "潮󠄀")
      ("11-529F" "舊") ;; 旧字
      ("11-52AD" "遁󠄁")
      ("11-52BC" "吞")
      ("11-52C1" "那󠄁")
      ("11-52C3" "藏") ;; 旧字
      ("11-52C5" "酋󠄁")
      ("11-52C7" "淡") ;; 旧字
      ("11-52C9" "麤")
      ("11-52DD" "繭󠄁") ;; 旧字
      ("11-52DE" "內")
      ("11-52E0" "難󠄀")
      ("11-52E7" "海")
      ("11-52F3" "肉󠄁")
      ("11-52F5" "乳󠄁")
      ("11-52F8" "溺󠄁")
      ("11-52F9" "忍󠄁")
      ("11-52FA" "藝") ;; 旧字
      ("11-530F" "寧󠄀")
      ("11-5315" "甯")
      ("11-5316" "沿󠄂")
      ("11-531D" "朔") ;; 旧字
      ("11-5339" "契󠄂")
      ("11-5340" "納󠄁")
      ("11-5346" "匘")
      ("11-5348" "麴")
      ("11-534A" "逝󠄁")
      ("11-5353" "資󠄁")
      ("11-535A" "諶")
      ("11-5360" "杌")
      ("11-5369" "派󠄂")
      ("11-5370" "鳦󠄁")
      ("11-5375" "輈")
      ("11-5378" "夗")
      ("11-5384" "濯󠄁")
      ("11-5398" "調󠄁")
      ("11-53C9" "境") ;; 旧字
      ("11-53CD" "淸")
      ("11-53DB" "盛󠄁")
      ("11-53E3" "吸󠄁")
      ("11-53EF" "冤󠄁")
      ("11-53F3" "咽") ;; 旧字
      ("11-5404" "華") ;; 旧字
      ("11-540F" "縶")
      ("11-541D" "梅󠄀")
      ("11-5426" "帨󠄀")
      ("11-542B" "劾") ;; 旧字
      ("11-542C" "稗")
      ("11-543C" "誖")
      ("11-5442" "隄")
      ("11-544A" "禦") ;; 旧字
      ("11-5476" "剝")
      ("11-547B" "迫󠄁")
      ("11-5486" "薄󠄁") ;; 旧字
      ("11-5490" "博󠄁")
      ("11-54A4" "漠") ;; 旧字
      ("11-54B3" "化󠄁")
      ("11-54C1" "涎󠄀")
      ("11-54D8" "縛󠄁")
      ("11-54E2" "犮")
      ("11-54ED" "八󠄁")
      ("11-54FD" "邈󠄀")
      ("11-5506" "竟") ;; 旧字
      ("11-5510" "祥󠄀")
      ("11-552F" "耑")
      ("11-5553" "危󠄁")
      ("11-557B" "汎") ;; 旧字
      ("11-557E" "伴󠄁")
      ("11-558A" "半󠄁")
      ("11-5598" "判󠄁")
      ("11-559C" "槪󠄁")
      ("11-559F" "帆󠄁")
      ("11-55A8" "叛󠄁")
      ("11-55AA" "削󠄁")
      ("11-55B0" "𥳑")
      ("11-55DC" "畔󠄁")
      ("11-55DF" "范") ;; 旧字
      ("11-5614" "飯󠄀")
      ("11-5616" "頒󠄁")
      ("11-562F" "挽󠄁")
      ("11-5634" "扳")
      ("11-5668" "漑") ;; 傍は「旣」
      ("11-566C" "晚")
      ("11-567A" "政") ;; 旧字
      ("11-5680" "蕃󠄁")
      ("11-5687" "荷") ;; 旧字
      ("11-56B6" "畀")
      ("11-56C1" "柲")
      ("11-56C2" "卑󠄀")
      ("11-56C3" "毖")
      ("11-56D7" "笓")
      ("11-56DB" "詘")
      ("11-56E0" "逸")
      ("11-56F3" "稉")
      ("11-56FD" "𠬞")
      ("11-5712" "惲")
      ("11-5726" "閟")
      ("11-5737" "碑󠄀")
      ("11-5738" "緋󠄁")
      ("11-5747" "寛󠄁") ;; 旧字
      ("11-5764" "陿")
      ("11-5766" "次󠄁")
      ("11-57A2" "汲󠄁")
      ("11-57C0" "避󠄁")
      ("11-57CB" "邨󠄁")
      ("11-57D2" "微󠄁")
      ("11-57F7" "儆") ;; 旧字
      ("11-57F9" "㐱")
      ("11-5805" "詭")
      ("11-580A" "鼻󠄁")
      ("11-5815" "姿󠄁")
      ("11-5824" "祝󠄀")
      ("11-5830" "運󠄁")
      ("11-5831" "棗") ;; 旧字
      ("11-5834" "誤󠄁")
      ("11-583D" "畢") ;; 旧字
      ("11-5858" "稱󠄁")
      ("11-5875" "控󠄁")
      ("11-5879" "逼󠄁")
      ("11-587E" "硏")
      ("11-5893" "牂")
      ("11-58BE" "强")
      ("11-58C1" "疏") ;; 旧字
      ("11-58CA" "往󠄁")
      ("11-58D1" "謬󠄁")
      ("11-58D8" "豹󠄁")
      ("11-58EF" "僄")
      ("11-58F0" "翺")
      ("11-58F2" "軔󠄁")
      ("11-5910" "瓢") ;; 旧字
      ("11-591B" "猋")
      ("11-5925" "苗") ;; 旧字
      ("11-5927" "訾")
      ("11-5929" "遵󠄁")
      ("11-592A" "胑")
      ("11-592C" "病")
      ("11-5944" "氳")
      ("11-5947" "蓋") ;; 旧字
      ("11-5960" "貧󠄁")
      ("11-596C" "賓󠄀")
      ("11-5983" "脆󠄁")
      ("11-59B9" "尊󠄁")
      ("11-59D4" "意󠄁")
      ("11-59EB" "褻󠄀")
      ("11-59FB" "矞")
      ("11-5A36" "父󠄁")
      ("11-5A5A" "敎")
      ("11-5A6C" "敏󠄀")
      ("11-5A92" "刃󠄁")
      ("11-5ABD" "負󠄂")
      ("11-5AC1" "匽")
      ("11-5ACC" "跪") ;; 旧字
      ("11-5AE1" "𦊩")
      ("11-5AE6" "浮󠄁")
      ("11-5AFA" "婦󠄁")
      ("11-5B22" "護") ;; 旧字
      ("11-5B2C" "繡")
      ("11-5B55" "𢻬")
      ("11-5B5A" "侮󠄁")
      ("11-5B5D" "急󠄁")
      ("11-5B71" "韍")
      ("11-5B73" "幠")
      ("11-5B78" "舞") ;; 旧字
      ("11-5B8C" "晦󠄁")
      ("11-5B97" "傑󠄁")
      ("11-5B99" "煮󠄀")
      ("11-5B9C" "獲") ;; 旧字
      ("11-5B9D" "葬") ;; 旧字
      ("11-5BB3" "卡")
      ("11-5BC5" "瀟")
      ("11-5BD2" "悔")
      ("11-5BDD" "苟") ;; 旧字
      ("11-5BE4" "宓")
      ("11-5BE6" "服󠄁")
      ("11-5BE9" "荒󠄁")
      ("11-5BF5" "爵󠄂")
      ("11-5C02" "丨")
      ("11-5C07" "福󠄁")
      ("11-5C0D" "覆󠄁")
      ("11-5C0F" "沅")
      ("11-5C1A" "彦")
      ("11-5C45" "轄󠄁")
      ("11-5C4B" "悅")
      ("11-5C4E" "紱")
      ("11-5C53" "紼")
      ("11-5C5E" "支") ;; 旧字
      ("11-5C6F" "鐘") ;; 旧字
      ("11-5CB6" "粉󠄁")
      ("11-5CBB" "粉󠄁")
      ("11-5CD9" "憤󠄁")
      ("11-5CF0" "僧")
      ("11-5CFB" "拳󠄁")
      ("11-5D07" "嘐")
      ("11-5D14" "忟")
      ("11-5D16" "瓜󠄁")
      ("11-5D1F" "文󠄁")
      ("11-5D4B" "甹")
      ("11-5D4E" "平󠄁")
      ("11-5D52" "丙󠄁")
      ("11-5D5C" "分󠄁")
      ("11-5D6F" "誩")
      ("11-5D82" "幷")
      ("11-5DBA" "墜󠄀")
      ("11-5DBC" "苹󠄀")
      ("11-5DBD" "柄󠄁")
      ("11-5DD3" "屛")
      ("11-5DE1" "嫌󠄁")
      ("11-5DE3" "茁") ;; 旧字
      ("11-5DE7" "級󠄁")
      ("11-5E03" "煎󠄁")
      ("11-5E0C" "骸") ;; 旧字
      ("11-5E25" "閎")
      ("11-5E30" "殻󠄁")
      ("11-5E4C" "卽")
      ("11-5E4E" "蔽󠄁") ;; 旧字
      ("11-5E72" "𤪿")
      ("11-5E74" "神󠄀")
      ("11-5E78" "笈󠄁")
      ("11-5E83" "赳󠄁")
      ("11-5E84" "彥")
      ("11-5E8F" "縑")
      ("11-5E97" "所󠄁")
      ("11-5EA7" "頰")
      ("11-5EAD" "倐")
      ("11-5EB7" "躳")
      ("11-5ECA" "禘")
      ("11-5ED6" "撆")
      ("11-5EF1" "蔑󠄀") ;; 旧字
      ("11-5EF6" "縕")
      ("11-5EF7" "粛󠄀")
      ("11-5EF8" "返󠄁")
      ("11-5EFC" "秦")
      ("11-5EFF" "飾󠄁")
      ("11-5F09" "扁󠄁")
      ("11-5F0B" "偏󠄁")
      ("11-5F0C" "敵") ;; 旧字
      ("11-5F15" "溢󠄁")
      ("11-5F26" "𣪘")
      ("11-5F2D" "遍󠄁")
      ("11-5F38" "徧")
      ("11-5F3C" "節󠄂")
      ("11-5F4C" "篇󠄁")
      ("11-5F4E" "編󠄁")
      ("11-5F5C" "窆")
      ("11-5F5D" "砭")
      ("11-5F61" "騙󠄁")
      ("11-5F6B" "若") ;; 旧字
      ("11-5F6C" "㳄")
      ("11-5F7C" "稅")
      ("11-5F85" "茨󠄁") ;; 旧字
      ("11-5F87" "便󠄁")
      ("11-5F8B" "著󠄁")
      ("11-5F91" "拚")
      ("11-5FAE" "籍󠄁")
      ("11-5FB4" "弱󠄁")
      ("11-5FD7" "薰") ;; 旧字
      ("11-5FE4" "步")
      ("11-5FEB" "盎")
      ("11-600F" "莫") ;; 旧字
      ("11-6012" "哨󠄁")
      ("11-6015" "墓") ;; 旧字
      ("11-601C" "墜󠄁")
      ("11-6021" "蒲") ;; 旧字
      ("11-6026" "暮") ;; 旧字
      ("11-6028" "醞")
      ("11-602A" "翁󠄂")
      ("11-602B" "慕") ;; 旧字
      ("11-6041" "簿󠄁")
      ("11-6043" "邦󠄂")
      ("11-6046" "捊")
      ("11-6060" "酺")
      ("11-6063" "芳") ;; 旧字
      ("11-6065" "識") ;; 旧字
      ("11-6068" "眶")
      ("11-606B" "抱󠄁")
      ("11-606F" "𣦻")
      ("11-6077" "包󠄁")
      ("11-6084" "炰")
      ("11-608D" "朋󠄁")
      ("11-6094" "滃")
      ("11-60B4" "崩󠄁")
      ("11-60B5" "萌󠄁")
      ("11-60BC" "商󠄁")
      ("11-60C5" "丂")
      ("11-60D1" "的󠄁")
      ("11-60D3" "覂")
      ("11-60D8" "逢󠄁")
      ("11-60DA" "怳")
      ("11-60E3" "迮")
      ("11-60E7" "灋")
      ("11-60F0" "枲")
      ("11-60F1" "飽󠄁")
      ("11-6108" "達󠄁")
      ("11-6109" "敓")
      ("11-610F" "葦") ;; 旧字
      ("11-611B" "疴")
      ("11-6121" "蠭")
      ("11-613C" "蓬󠄁")
      ("11-6147" "蚌") ;; 旧字
      ("11-6148" "啓󠄁")
      ("11-615F" "亡󠄁")
      ("11-6163" "祴") ;; 旧字
      ("11-6174" "鵬󠄁")
      ("11-6187" "杗")
      ("11-618A" "房󠄁")
      ("11-618E" "攢")
      ("11-6190" "庭󠄁")
      ("11-6196" "忘󠄁")
      ("11-61A9" "汔")
      ("11-61BA" "望󠄂")
      ("11-61C6" "茫") ;; 旧字
      ("11-61C8" "茆") ;; 旧字
      ("11-61CC" "冒󠄁")
      ("11-61D0" "蓊") ;; 旧字
      ("11-61F2" "惹") ;; 旧字
      ("11-620A" "巢")
      ("11-6210" "篝󠄁")
      ("11-6212" "橫")
      ("11-621F" "飢󠄁")
      ("11-624D" "鏡") ;; 旧字
      ("11-6271" "暗󠄁")
      ("11-6282" "墨󠄀")
      ("11-6291" "蓄") ;; 旧字
      ("11-6294" "脖")
      ("11-6297" "觩")
      ("11-629E" "禔󠄀")
      ("11-62AC" "戹")
      ("11-62B9" "侂")
      ("11-62C2" "磨󠄁")
      ("11-62C6" "翻󠄁")
      ("11-62C9" "每")
      ("11-62CA" "摩󠄁")
      ("11-62CF" "奔") ;; 旧字
      ("11-62DC" "麻󠄁")
      ("11-6308" "邁󠄀")
      ("11-6349" "𣦼")
      ("11-634C" "苦") ;; 旧字
      ("11-634D" "萬") ;; 旧字
      ("11-6355" "莊") ;; 旧字
      ("11-635C" "笮")
      ("11-6367" "搔")
      ("11-6368" "薊") ;; 旧字
      ("11-6369" "夢") ;; 旧字
      ("11-6376" "蔓") ;; 旧字
      ("11-6388" "挈")
      ("11-639F" "脈󠄂")
      ("11-63A0" "箸󠄁")
      ("11-63AA" "採󠄁")
      ("11-63C6" "明󠄁")
      ("11-63C9" "迷󠄁")
      ("11-63D0" "儵")
      ("11-63DB" "凷")
      ("11-63F4" "蘊") ;; 旧字
      ("11-63F6" "盟󠄁")
      ("11-640D" "使󠄁")
      ("11-6413" "免󠄁")
      ("11-6417" "茂") ;; 旧字
      ("11-642C" "晴󠄀")
      ("11-6467" "妄󠄁")
      ("11-6469" "賊󠄁")
      ("11-6476" "盲󠄁")
      ("11-6493" "網󠄁")
      ("11-6495" "莽󠄁")
      ("11-649A" "浸󠄁")
      ("11-64A4" "巡󠄁")
      ("11-64A5" "蒙") ;; 旧字
      ("11-64AB" "選󠄁")
      ("11-64B9" "貨󠄁")
      ("11-64D4" "凡󠄁")
      ("11-64E2" "舜󠄁")
      ("11-64EF" "搹")
      ("11-64F2" "約󠄁")
      ("11-64FE" "公󠄁")
      ("11-6518" "藥") ;; 旧字
      ("11-6524" "躍󠄁")
      ("11-6535" "㼌")
      ("11-6537" "庾")
      ("11-656C" "呬")
      ("11-6572" "輸󠄁")
      ("11-6588" "舞") ;; 旧字
      ("11-659B" "有󠄁")
      ("11-65A1" "菴") ;; 旧字
      ("11-65A5" "慠")
      ("11-65AB" "肜")
      ("11-65AC" "俱󠄀")
      ("11-65C4" "呦")
      ("11-65CC" "狖")
      ("11-65CF" "史󠄁")
      ("11-65DB" "勇󠄁")
      ("11-65E0" "斿")
      ("11-65E1" "祐󠄀")
      ("11-65FB" "莠") ;; 旧字
      ("11-6606" "郷󠄁")
      ("11-660E" "逮󠄁")
      ("11-6613" "違󠄂")
      ("11-661C" "猶󠄁")
      ("11-6625" "赶")
      ("11-662D" "諺󠄁")
      ("11-6641" "猷")
      ("11-6641" "猷󠄂")
      ("11-6644" "遊󠄁")
      ("11-6652" "訏")
      ("11-665F" "熠")
      ("11-6666" "襖")
      ("11-6670" "輶")
      ("11-6674" "穅")
      ("11-6697" "醫") ;; 旧字
      ("11-66A2" "主󠄁")
      ("11-66A6" "杕")
      ("11-66AB" "虞󠄁")
      ("11-66DD" "箠")
      ("11-66F8" "權") ;; 旧字
      ("11-66FD" "斎󠄁")
      ("11-6703" "唐󠄁")
      ("11-670F" "窅")
      ("11-6715" "終󠄁")
      ("11-6736" "遙󠄀")
      ("11-673F" "葉") ;; 旧字
      ("11-6749" "構󠄁")
      ("11-6751" "姉󠄁")
      ("11-6753" "迎󠄁")
      ("11-675E" "要󠄁")
      ("11-6761" "交󠄁")
      ("11-6762" "奶")
      ("11-6763" "樣")
      ("11-676D" "窮") ;; 旧字
      ("11-6773" "訧")
      ("11-6777" "溱")
      ("11-678C" "曄")
      ("11-6795" "噂󠄁")
      ("11-679C" "援󠄁")
      ("11-67A9" "養󠄁")
      ("11-67AF" "饑󠄀")
      ("11-67B6" "焰")
      ("11-67B8" "雝")
      ("11-67CE" "饔")
      ("11-67F1" "謝") ;; 旧字
      ("11-67F4" "殸")
      ("11-67FB" "嶠")
      ("11-67FE" "樽󠄁")
      ("11-6822" "攺")
      ("11-6848" "毉")
      ("11-684E" "翌󠄀")
      ("11-6850" "閒")
      ("11-685C" "謹󠄀")
      ("11-6867" "薛") ;; 旧字
      ("11-6874" "𧝹")
      ("11-6876" "謁󠄀")
      ("11-6885" "迅󠄁")
      ("11-6894" "翼󠄂")
      ("11-6897" "糗")
      ("11-68AD" "翼󠄀")
      ("11-68B3" "翌󠄁")
      ("11-68B5" "臝")
      ("11-68C6" "攔")
      ("11-68CD" "賴") ;; 旧字
      ("11-68D7" "落") ;; 旧字
      ("11-68E0" "𤔔")
      ("11-68EE" "校󠄁")
      ("11-6919" "搆󠄁")
      ("11-691A" "藍") ;; 旧字
      ("11-693F" "蝤")
      ("11-6953" "薦") ;; 旧字
      ("11-6954" "吏󠄁")
      ("11-695D" "涖")
      ("11-6979" "欄󠄀")
      ("11-698E" "芸") ;; 旧字
      ("11-699B" "𣐊")
      ("11-69CD" "殺󠄀")
      ("11-69DE" "琉") ;; 旧字
      ("11-69EB" "飂")
      ("11-69FF" "旒") ;; 旧字
      ("11-6A02" "龍󠄂")
      ("11-6A0C" "淩") ;; 旧字
      ("11-6A12" "旅󠄁")
      ("11-6A1B" "隆󠄁")
      ("11-6A2E" "僇󠄀")
      ("11-6A38" "憀")
      ("11-6A72" "翏󠄀")
      ("11-6A80" "𡭗")
      ("11-6A8E" "迄󠄁")
      ("11-6A97" "蓼") ;; 旧字
      ("11-6AAA" "綠")
      ("11-6AAE" "倮")
      ("11-6ABB" "遼󠄁")
      ("11-6AC1" "虜󠄀")
      ("11-6AC3" "瘳")
      ("11-6AD3" "楨")
      ("11-6ADF" "菉")
      ("11-6AEA" "騄")
      ("11-6B1D" "堙󠄁")
      ("11-6B20" "幾󠄁")
      ("11-6B39" "隣󠄁")
      ("11-6B49" "鱗󠄁")
      ("11-6B50" "麟󠄁")
      ("11-6B64" "恐󠄁")
      ("11-6B69" "草") ;; 旧字
      ("11-6B73" "饗󠄃")
      ("11-6B78" "厽")
      ("11-6B79" "淚")
      ("11-6B7F" "絫")
      ("11-6B83" "類󠄀")
      ("11-6B86" "贈󠄁")
      ("11-6B8B" "空󠄁")
      ("11-6B8D" "羸") ;; 旧字
      ("11-6B95" "纍")
      ("11-6BAB" "戾")
      ("11-6BB2" "泠")
      ("11-6BBB" "過󠄁")
      ("11-6BDB" "魋")
      ("11-6BDF" "翎")
      ("11-6BF3" "厲") ;; 旧字
      ("11-6C08" "霝")
      ("11-6C3E" "萋")
      ("11-6C4E" "聖󠄁") ;; 聖の下は「𡈼」
      ("11-6C55" "礪") ;; 旧字
      ("11-6C5D" "釀")
      ("11-6C62" "醴󠄁")
      ("11-6C68" "秝")
      ("11-6C73" "厤")
      ("11-6C7D" "确")
      ("11-6C88" "習󠄀")
      ("11-6C90" "歷")
      ("11-6C92" "曆")
      ("11-6CAE" "廉󠄀")
      ("11-6CBA" "蓮󠄀")
      ("11-6CBB" "嵆")
      ("11-6CBE" "煉󠄀")
      ("11-6CBF" "薀")
      ("11-6CD5" "蒼") ;; 旧字
      ("11-6CDD" "連󠄀")
      ("11-6CEA" "練󠄀")
      ("11-6CF3" "韻") ;; 旧字
      ("11-6D0B" "絺")
      ("11-6D1B" "注󠄁")
      ("11-6D1F" "憐󠄀")
      ("11-6D29" "亏")
      ("11-6D41" "攄")
      ("11-6D77" "鷗")
      ("11-6D78" "浩󠄁")
      ("11-6D9B" "訟󠄁")
      ("11-6DB2" "竽")
      ("11-6DB8" "浪") ;; 旧字
      ("11-6DBC" "朝󠄁")
      ("11-6DC7" "朗") ;; 旧字
      ("11-6DD1" "建󠄁")
      ("11-6DD8" "章") ;; 旧字
      ("11-6DDE" "廊󠄁")
      ("11-6DFB" "苴") ;; 旧字
      ("11-6E05" "薨") ;; 旧字
      ("11-6E08" "驚") ;; 旧字
      ("11-6E09" "戶")
      ("11-6E0A" "郞")
      ("11-6E29" "妟")
      ("11-6E2E" "壟") ;; 旧字
      ("11-6E38" "籙")
      ("11-6E3A" "彔")
      ("11-6E4A" "涶")
      ("11-6E4D" "聾󠄁")
      ("11-6E6B" "礱")
      ("11-6E6E" "醪")
      ("11-6E76" "籠") ;; 旧字
      ("11-6E96" "䅌")
      ("11-6E98" "窊")
      ("11-6ECB" "卿󠄀")
      ("11-6ED3" "龢")
      ("11-6EFF" "錄")
      ("11-6F0F" "鄭󠄁")
      ("11-6F14" "英") ;; 旧字
      ("11-6F20" "翠󠄁")
      ("11-6F54" "揆󠄁")
      ("11-6F5F" "牙󠄁")
      ("11-6F84" "遘󠄁")
      ("11-7058" "情󠄁")
      ("11-706F" "勝󠄁")
      ("11-7070" "億") ;; 旧字
      ("11-70C8" "帝󠄁")
      ("11-7126" "狐") ;; 旧字
      ("11-7149" "脡")
      ("11-7167" "孤") ;; 旧字
      ("11-71DF" "藩")
      ("11-722A" "襲") ;; 旧字
      ("11-723A" "磔󠄁")
      ("11-724C" "簪") ;; 旧字
      ("11-725F" "汏")
      ("11-7261" "閱")
      ("11-7267" "造󠄁")
      ("11-7272" "覯󠄁")
      ("11-72AF" "誠󠄁")
      ("11-72ED" "𢽎")
      ("11-732B" "侵󠄁")
      ("11-7337" "歎󠄁")
      ("11-7372" "嫁") ;; 旧字
      ("11-7396" "還󠄁")
      ("11-73CD" "習󠄁")
      ("11-73ED" "靖󠄁")
      ("11-7403" "割󠄀")
      ("11-7409" "躇󠄀") ;; 旧字
      ("11-7435" "㪿")
      ("11-751A" "黃")
      ("11-751F" "講󠄁")
      ("11-752B" "送󠄁")
      ("11-754B" "愈󠄁")
      ("11-754C" "憶") ;; 旧字
      ("11-7554" "精󠄀")
      ("11-7562" "說")
      ("11-75C5" "穿󠄁")
      ("11-75D5" "貺")
      ("11-75F4" "𠮟")
      ("11-7652" "脫")
      ("11-7686" "臆") ;; 旧字
      ("11-76C6" "屬")
      ("11-76EE" "嬭")
      ("11-76F8" "芟") ;; 旧字
      ("11-770B" "褢")
      ("11-7740" "罝")
      ("11-7761" "媾󠄁")
      ("11-7766" "像󠄁")
      ("11-77AC" "健󠄁")
      ("11-77E9" "館󠄁")
      ("11-7832" "層󠄁")
      ("11-7881" "喫󠄂")
      ("11-7897" "翟󠄀")
      ("11-78A9" "穀󠄀")
      ("11-78C1" "敬") ;; 旧字
      ("11-7956" "歲")
      ("11-795E" "耕󠄁")
      ("11-7965" "扈󠄁")
      ("11-7977" "翔")
      ("11-7985" "災")
      ("11-79BD" "琯")
      ("11-79BF" "蕭") ;; 旧字
      ("11-79C0" "潏")
      ("11-79C1" "卟")
      ("11-79D2" "苫") ;; 旧字
      ("11-79D8" "腊")
      ("11-79E6" "耗󠄁")
      ("11-79F0" "瓠󠄁")
      ("11-79FB" "遺󠄁")
      ("11-7A17" "偰")
      ("11-7A2E" "綌")
      ("11-7A3C" "煙") ;; 旧字
      ("11-7A46" "增")
      ("11-7A4E" "羽󠄀")
      ("11-7A4F" "肙")
      ("11-7A6B" "禍󠄀")
      ("11-7A7A" "觀") ;; 旧字
      ("11-7A83" "圣")
      ("11-7A92" "射") ;; 旧字
      ("11-7AAA" "贛")
      ("11-7AAE" "葛󠄁")
      ("11-7AD2" "廟󠄁")
      ("11-7B49" "象") ;; 旧字
      ("11-7B4B" "暵")
      ("11-7B87" "蝯")
      ("11-7B94" "衰") ;; 旧字
      ("11-7BC9" "櫛󠄂")
      ("11-7C3E" "逞󠄁")
      ("11-7C3F" "埽")
      ("11-7C89" "冉󠄁")
      ("11-7C95" "醉")
      ("11-7C9F" "匜")
      ("11-7CA5" "屆")
      ("11-7CBE" "骾")
      ("11-7CCE" "采󠄁")
      ("11-7CDE" "全󠄁")
      ("11-7D00" "較󠄁")
      ("11-7D10" "絕")
      ("11-7D18" "巨󠄁")
      ("11-7D19" "乩")
      ("11-7D20" "蔡") ;; 旧字
      ("11-7D22" "禽") ;; 旧字
      ("11-7D50" "晷")
      ("11-7D61" "柱󠄁")
      ("11-7D76" "曶")
      ("11-7D79" "器󠄁")
      ("11-7DB1" "凥")
      ("11-7DB4" "聚󠄁")
      ("11-7DCA" "歡") ;; 旧字
      ("11-7DCF" "產")
      ("11-7DF4" "啼") ;; 旧字
      ("11-7E1B" "誶")
      ("11-7E26" "肩󠄁")
      ("11-7E41" "請󠄁")
      ("11-7E4B" "姬󠄁")
      ("11-7E55" "烖")
      ("11-7E82" "軀") ;; 旧字
      ("11-7E8F" "渚󠄀")
      ("11-7F77" "舄")
      ("11-7FC1" "益󠄁")
      ("11-7FCC" "茶") ;; 旧字
      ("11-7FEB" "害󠄂")
      ("11-7FFB" "速󠄁")
      ("11-8005" "繫")
      ("11-8015" "拒󠄁")
      ("11-805E" "前󠄁")
      ("11-807E" "䞓")
      ("11-8105" "寒󠄁")
      ("11-8107" "禰󠄁")
      ("11-810A" "吿")
      ("11-8133" "進󠄁")
      ("11-814E" "堠")
      ("11-8155" "適󠄁")
      ("11-816B" "隙󠄁")
      ("11-817F" "視󠄁")
      ("11-818F" "祛󠄀")
      ("11-819D" "雪󠄁")
      ("11-81B3" "灾")
      ("11-81BF" "寑")
      ("11-81FC" "淫󠄁")
      ("11-8212" "迭󠄁")
      ("11-8218" "亥") ;; 旧字
      ("11-821B" "杈")
      ("11-822C" "靚")
      ("11-8235" "柶")
      ("11-8236" "棰")
      ("11-8239" "𧴪")
      ("11-8247" "述󠄁")
      ("11-82AD" "稹󠄀")
      ("11-82B1" "猨󠄀")
      ("11-82B8" "既󠄁")
      ("11-82D3" "通󠄁")
      ("11-82E7" "杓󠄁")
      ("11-8302" "黛󠄁")
      ("11-8336" "捨󠄁")
      ("11-8352" "袪")
      ("11-83D3" "遠󠄁")
      ("11-83DF" "肖󠄁") ;; 旧字
      ("11-83F1" "禼")
      ("11-8404" "樟") ;; 旧字
      ("11-8457" "勺󠄀")
      ("11-8463" "翛")
      ("11-849C" "扇󠄁")
      ("11-84C4" "社󠄁")
      ("11-84CB" "花󠄁")
      ("11-84EC" "總") ;; 旧字
      ("11-8500" "駉")
      ("11-852D" "乚")
      ("11-8584" "萃") ;; 旧字
      ("11-85AE" "挩")
      ("11-85E9" "醒")
      ("11-85F7" "憲󠄂")
      ("11-865E" "韓󠄁")
      ("11-86A4" "脤")
      ("11-86CB" "茲") ;; 旧字
      ("11-86EE" "汭")
      ("11-8766" "鉛󠄁")
      ("11-878D" "簞")
      ("11-87F9" "音󠄁")
      ("11-8840" "期󠄁")
      ("11-8846" "月󠄁")
      ("11-8853" "兼󠄁")
      ("11-8877" "邪󠄂")
      ("11-8888" "龕")
      ("11-88CF" "絀")
      ("11-8907" "羴")
      ("11-8956" "埸")
      ("11-8987" "搢")
      ("11-898F" "隔󠄁")
      ("11-8996" "巠")
      ("11-8997" "祳")
      ("11-89B3" "醢")
      ("11-89E3" "坳")
      ("11-8A23" "棄") ;; 旧字
      ("11-8A2A" "遭󠄁")
      ("11-8A31" "厈")
      ("11-8A3B" "衺")
      ("11-8A60" "杅")
      ("11-8A95" "滋󠄁")
      ("11-8A98" "誕󠄁")
      ("11-8AA0" "鯁")
      ("11-8AAC" "抇")
      ("11-8ACC" "禬")
      ("11-8ADC" "亼")
      ("11-8AE6" "術󠄁")
      ("11-8AEE" "坰")
      ("11-8B01" "蔚") ;; 旧字
      ("11-8B1B" "渠") ;; 旧字
      ("11-8B1D" "警") ;; 旧字
      ("11-8B58" "継") ;; 旧字
      ("11-8B72" "更󠄁")
      ("11-8B83" "𦡱")
      ("11-8C4A" "噲")
      ("11-8C6B" "屮")
      ("11-8C8C" "藪") ;; 旧字
      ("11-8C9D" "溫")
      ("11-8C9E" "叔") ;; 旧字
      ("11-8CA1" "近󠄁")
      ("11-8CAC" "刻") ;; 旧字
      ("11-8CAF" "灼󠄁")
      ("11-8CB7" "訊󠄁")
      ("11-8CBB" "藉")
      ("11-8CBF" "藻") ;; 旧字
      ("11-8CC7" "冋")
      ("11-8CD3" "訕")
      ("11-8CE6" "撰󠄁")
      ("11-8CED" "尚")
      ("11-8DB3" "竄") ;; 旧字
      ("11-8DE1" "黑")
      ("11-8DF3" "周󠄀")
      ("11-8E0F" "摺󠄁")
      ("11-8E74" "抈")
      ("11-8ECD" "頑󠄁")
      ("11-8F1D" "毃")
      ("11-8F44" "雅󠄁")
      ("11-8F5F" "御") ;; 旧字
      ("11-8F9B" "降󠄁")
      ("11-8FB0" "諮󠄁")
      ("11-8FB2" "祲")
      ("11-8FC2" "姻") ;; 旧字
      ("11-8FC4" "吒")
      ("11-8FCE" "旣")
      ("11-8FE9" "食󠄁")
      ("11-8FEB" "遂󠄂")
      ("11-8FED" "荀") ;; 旧字
      ("11-9001" "餐󠄁")
      ("11-9010" "者󠄁")
      ("11-9023" "稊")
      ("11-9038" "育") ;; 旧字
      ("11-904D" "蘇") ;; 旧字
      ("11-90E1" "翫")
      ("11-90ED" "嘏")
      ("11-90FD" "松󠄁")
      ("11-9154" "秔")
      ("11-9162" "硬󠄁")
      ("11-9178" "具󠄁")
      ("11-9187" "楗")
      ("11-91B8" "㪅")
      ("11-91CC" "宁")
      ("11-91E6" "憎󠄀")
      ("11-920D" "丈󠄁")
      ("11-920E" "家") ;; 旧字
      ("11-929A" "咠")
      ("11-92ED" "禹") ;; 旧字
      ("11-92F2" "剗")
      ("11-9320" "沆")
      ("11-9326" "漢󠄁")
      ("11-932C" "程󠄁")
      ("11-9354" "蒐") ;; 旧字
      ("11-9375" "機󠄁")
      ("11-939A" "戢")
      ("11-9418" "盬")
      ("11-9451" "闓")
      ("11-9453" "窋")
      ("11-95A5" "靑")
      ("11-95B2" "沄")
      ("11-9640" "牭")
      ("11-9644" "箭󠄁")
      ("11-9650" "譏")
      ("11-9663" "殽")
      ("11-966A" "尋󠄁")
      ("11-9670" "冘")
      ("11-969C" "顧󠄁")
      ("11-96B7" "辻󠄁")
      ("11-96CC" "莖")
      ("11-96E2" "苧")
      ("11-96EA" "汩")
      ("11-96FB" "諸󠄀")
      ("11-970A" "氐")
      ("11-9756" "諾") ;; 旧字
      ("11-97FB" "印") ;; 旧字
      ("11-9801" "祖󠄁")
      ("11-9805" "虛")
      ("11-9808" "硜")
      ("11-9811" "塏")
      ("11-9818" "嘲󠄁")
      ("11-983B" "船󠄁")
      ("11-9854" "愷")
      ("11-9858" "慨󠄀")
      ("11-985B" "署󠄀")
      ("11-985E" "朕󠄂")
      ("11-98DF" "巷󠄁")
      ("11-98F2" "遹")
      ("11-98F4" "闇") ;; 旧字
      ("11-9905" "乇")
      ("11-990A" "逐󠄁")
      ("11-9913" "汙")
      ("11-9996" "擊")
      ("11-99A8" "苛") ;; 旧字
      ("11-9A13" "諱") ;; 旧字
      ("11-9AA8" "俠")
      ("11-9AEA" "成󠄁")
      ("11-9B54" "率󠄁")
      ("11-9BAB" "矩󠄁")
      ("11-9BAE" "鎖󠄁")
      ("11-9BD6" "盱")
      ("11-9C3B" "湮󠄁")
      ("11-9CE5" "臭󠄁")
      ("11-9CF3" "瘦󠄀") ;; 旧字
      ("11-9CF4" "隊") ;; 旧字
      ("11-9D5C" "茵") ;; 旧字
      ("11-9E97" "呈󠄁")
      ("11-9E9F" "寵") ;; 旧字
      ("11-9EBA" "頹")
      ("11-9EC4" "睪")
      ("11-9F13" "螘")
      ("11-9F3B" "屑󠄁")
      ("11-9F62" "廷󠄁")
      ("12-4E11" "兩") ;; 旧字
      ("12-4E8A" "謵")
      ("12-4EDF" "𥔳")
      ("12-4EED" "礊")
      ("12-4F83" "垚")
      ("12-4F9B" "㞐")
      ("12-4F9D" "丣")
      ("12-50B7" "瑒")
      ("12-5143" "戁")
      ("12-5147" "屢")
      ("12-5150" "涊")
      ("12-520A" "垒")
      ("12-5275" "絟")
      ("12-52BE" "吕")
      ("12-53AD" "僦")
      ("12-53CC" "綈")
      ("12-5468" "檾")
      ("12-54F2" "襺")
      ("12-56E0" "伀")
      ("12-572D" "𠬶")
      ("12-5751" "敂")
      ("12-5973" "琨")
      ("12-5A5A" "极")
      ("12-5E1D" "衊")
      ("12-5EA6" "詄")
      ("12-5EF6" "儞")
      ("12-5F81" "𥝸")
      ("12-610F" "乀")
      ("12-6211" "卂")
      ("12-623F" "𩪦")
      ("12-6589" "窔")
      ("12-673A" "娀")
      ("12-6897" "𣃘")
      ("12-6905" "㇉")
      ("12-6BB4" "凊")
      ("12-6BBB" "啑")
      ("12-6C8C" "趕")
      ("12-6C99" "栳")
      ("12-6D3B" "噹")
      ("12-6EDE" "胦")
      ("12-7070" "㐬") ;; 旧字
      ("12-70AD" "䑦")
      ("12-756A" "醲")
      ("12-77ED" "𦪇")
      ("12-7802" "梮")
      ("12-79E6" "𥈾")
      ("12-7A3D" "㣥")
      ("12-7AE0" "畾")
      ("12-7D44" "紩")
      ("12-7DAD" "𣶒")
      ("12-7E26" "狌")
      ("12-7E41" "酙")
      ("12-80C3" "𠂹")
      ("12-80CE" "朐")
      ("12-82EB" "贜")
      ("12-8358" "繯")
      ("12-83AB" "𨒅")
      ("12-8A66" "沝")
      ("12-8A70" "孒")
      ("12-8A8C" "泚")
      ("12-8AF8" "琰")
      ("12-8CB8" "胻")
      ("12-8CDC" "洧")
      ("12-8DE1" "䆞")
      ("12-9700" "燾")
      ("12-9A30" "𧰙")
      ("12-9BAA" "鱮")
      ("13-63E1" "⌺")
      ("13-82A6" "〻")
      ;; ("11-57FC" "菌") ;; 旧字
      ;; ("11-5DE5" "糾") ;; 旧字
      ;; ("11-6083" "泡") ;; 旧字
      ;; ("11-6092" "胞") ;; 旧字
      ;; ("11-6583" "又") ;; 旧字
      ;; ("11-69B4" "流") ;; 旧字
      ;; ("11-6B0A" "硫") ;; 旧字
      ;; ("11-75D8" "硝") ;; 旧字
      ;; ("11-5E9A" "赳")
      ;; ("11-9834" "芋") ;; 旧字
      ;; ("12-6557" "⿰車乙") ;; 軋
      ;; ("12-6787" "⿰金命") ;; 令に倣い鈴に同じ
      ;; ("12-6885" "⿱辰止") ;; 金文「祳」
      )))
  (setq ndjitsuu-gaiji-table
    (lookup-new-gaiji-table
     encoded-jitsuu-gaiji-table)))

;;; support-jitsuu.el ends here
