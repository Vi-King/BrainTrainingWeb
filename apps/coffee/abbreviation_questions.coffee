class AbbreviationQuestions

  @shuffle = (ary) ->
    copy = []
    n = ary.length
    i = undefined
    while n
      i = Math.floor(Math.random() * ary.length)
      if i of ary
        copy.push ary[i]
        delete ary[i]
        n--
    copy

  @data = ->
    list = AbbreviationQuestions.questions.split("\n").map (line) =>
      dat = line.split(',')
      q = {name: dat[0], c: dat[1]}
      ans = AbbreviationQuestions.shuffle(dat.slice(1, 5))
      for a, idx in ans
        q["a#{idx + 1}"] = a
        q["a#{idx + 1}res"] = a == q.c
      q
    list = AbbreviationQuestions.generate_randomx(list.length, 20).map (idx) ->
      list[idx]
    AbbreviationQuestions.shuffle list

  @generate_randomx = (max, num) ->
    generated = new Array
    generatedCount = generated.length
    i = 0
    while i < num
      candidate = Math.floor(Math.random() * max)
      j = 0
      while j < generatedCount
        if candidate == generated[j]
          candidate = Math.floor(Math.random() * max)
          j = -1
        j++
      generated[i] = candidate
      generatedCount++
      i++
    generated

  @questions = """
構内ネットワーク,LAN,LON,LAL,KAN
未確認飛行物体,UFO,UFJ,UMA,CFO
後天的免疫不完全症候群,AIDS,AEDS,AISD,EIDS
知能指数,IQ,EQ,IC,AQ
放送衛星,BS,CS,ES,IS
コンパクトデイスク,CD,CG,CB,CA
システムエンジニア,SE,SI,SA,SW
未確認生物,UMA,UFO,USI,AMA
ケーブルテレビ,CATV,CETV,KBTV,CBTV
紫外線,UV,UC,IR,UB
ビデオテープレコーダー,VTR,BTR,BTL,VSR
日本放送協会,NHK,NHP,NNK,HNK
ハードディスク,HD,HG,HP,CD
オペレーティングシステム,OS,OC,AS,OP
東京ディズニーランド,TDL,TDS,TSJ,TLD
デオキシリボ核酸,DNA,DNP,DSI,DOG
音声応答システム,ARS,ABS,ERS,ARC
石油輸出国機構,OPEC,APEC,ASEA,OTEC
グリニッジ標準時,GMT,CMT,GNP,GDP
マサチューセッツ工科大学,MIT,MAT,SAT,MTL
ユニバーサルスタジオジャパン,USJ,UFJ,UNJ,UCJ
人工知能,AI,CI,AN,AO
電子掲示板システム,BBS,BBC,BBA,QBK
アンチロックブレーキングシステム,ABS,ASR,ASC,ABC
現金自動預入支払機,ATM,AMT,ATU,ATN
フロッピーディスク,FD,CD,MD,HD
最高経営責任者,CEO,CFO,COO,CTO
国際サッカー連盟,FIFA,FAFA,FAFI,MAMA
集中治療室,ICU,ICC,IUC,UCI
全地球測位システム,GPS,GPD,GDP,GSP
株式公開買い付け,TOB,MOB,MBO,TBO
大規模集積,LSI,LSD,LAS,SSD
日本工業規格,JIS,JIJ,JIF,JIL
欧州連合,EU,AU,OU,GU
キリスト教青年会,YMCA,YMAC,YCMA,YAMC
集積回路,IC,EC,IB,ED
世界ボクシング協会,WBA,WBC,WMA,WMV
自動変速装置,AT,CT,BT,DT
赤十字国際委員会,ICRC,ICAC,ISRC,IMAC
北大西洋条約機構,NATO,HATO,KATO,SATO
日本貿易振興会,JETRO,DUTRO,JATRO,OOTRO
国内総生産,GDP,GPI,GDI,GPD
発光ダイオード,LED,RED,LAD,LSE
消費者物価指数,CPI,CPU,GPI,GDP
国際オリンピック協会,IOC,ICO,CIO,OCI
東南アジア諸国連合,ASEAN,ASIAN,ACEAN,ASAYN
非営利組織,NPO,NGO,NHO,NTO
非政府組織,NGO,NPO,NHO,NTO
大陸間弾道ミサイル,ICBM,IABM,ICPO,IABA
世界貿易機構,WTO,WHO,WBA,WWW
リボ核酸,RNA,DNA,ENA,LNA
国際原子力機関,IAEA,IKEA,AREA,EEIA
東証株価指数,TOPIX,TAPIX,TOPEX,TAPAX
液晶標準装置,LCD,LGO,LDS,LCL
中央処理装置,CPU,CUP,PCU,PUC
イギリス放送協会,BBC,BBS,BBB,BBA
米国連合通信社,AP,AC,AB,AN
国連安全保障理事会,UNSC,UNSF,UNWC,UNKO
米中央情報局,CIA,FBI,ICP,SAT
日本農林規格,JAS,JIS,JIF,JAF
日本公共広告機構,AC,AD,ED,CC
"""

module.exports = AbbreviationQuestions
