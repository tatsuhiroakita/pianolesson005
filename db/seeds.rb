# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#LessonStyle.create(name: 'フリー', created_at: '2014-07-01 14:00:00', updated_at: '2014-07-01 14:00:00')
#LessonStyle.create(name: '月２回', created_at: '2011-11-14', updated_at:  '2011-11-14') 
#LessonStyle.create(name: '年契約', created_at: '2011-11-14', updated_at:  '2011-11-14')

#FeeHowto.create(name: 'カード一回', created_at: '2011-11-14', updated_at:  '2011-11-14')
#FeeHowto.create(name: 'カード毎月', created_at: '2011-11-14', updated_at:  '2011-11-14')
#FeeHowto.create(name: '現金手渡し', created_at: '2011-11-14', updated_at:  '2011-11-14')
#PinanoOwned.create(name: '電子ピアノ', created_at: '2011-11-14', updated_at:  '2011-11-14')
#PinanoOwned.create(name: 'アップライト', created_at: '2011-11-14', updated_at:  '2011-11-14')
#PinanoOwned.create(name: 'グランドピアノ', created_at: '2011-11-14', updated_at:  '2011-11-14')
#PinanoOwned.create(name: 'なし（おもちゃやキーボード含む）', created_at: '2011-11-14', updated_at:  '2011-11-14')

#PinanoHistory.create(name: '初めて（１年いない）', created_at: '2011-11-14', updated_at:  '2011-11-14')
#PinanoHistory.create(name: '１〜２年', created_at: '2011-11-14', updated_at:  '2011-11-14')
#PinanoHistory.create(name: '３〜５年', created_at: '2011-11-14', updated_at:  '2011-11-14')
#PinanoHistory.create(name: '５年以上', created_at: '2011-11-14', updated_at:  '2011-11-14')

##LevelKakutei.create(name: '初級', created_at: '2011-11-14', updated_at:  '2011-11-14')
#LevelKakutei.create(name: '中級', created_at: '2011-11-14', updated_at:  '2011-11-14')
#LevelKakutei.create(name: '上級', created_at: '2011-11-14', updated_at:  '2011-11-14')



#Kingaku.create(kingaku: '500',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Kingaku.create(kingaku: '1000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Kingaku.create(kingaku: '2000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Kingaku.create(kingaku: '3000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Kingaku.create(kingaku: '4000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Kingaku.create(kingaku: '5000',created_at: '2011-11-14', updated_at:  '2011-11-14')

#YoyakuStatus.create(name: '予約中', status:'0' ,created_at: '2011-11-14', updated_at:  '2011-11-14')
#YoyakuStatus.create(name: 'レッスン完了', status:'1' ,created_at: '2011-11-14', updated_at:  '2011-11-14')
#YoyakuStatus.create(name: '生徒都合キャンセル', status:'99' ,created_at: '2011-11-14', updated_at:  '2011-11-14')
#YoyakuStatus.create(name: '講師都合キャンセル', status:'999' ,created_at: '2011-11-14', updated_at:  '2011-11-14')


#Fee.create(level:'1',style:'1' ,hosoku:'バイエル',kingaku:'3000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Fee.create(level:'2',style:'1' ,hosoku:'バイエル',kingaku:'3000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Fee.create(level:'3',style:'1' ,hosoku:'バイエル',kingaku:'3000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Fee.create(level:'4',style:'1' ,hosoku:'バイエル',kingaku:'3000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Fee.create(level:'1',style:'2' ,hosoku:'バイエル',kingaku:'3000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Fee.create(level:'2',style:'2' ,hosoku:'バイエル',kingaku:'3000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Fee.create(level:'3',style:'2' ,hosoku:'バイエル',kingaku:'3000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Fee.create(level:'4',style:'2' ,hosoku:'バイエル',kingaku:'3000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Fee.create(level:'1',style:'3' ,hosoku:'バイエル',kingaku:'3000',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Fee.create(level:'2',style:'3' ,hosoku:'バイエル',kingaku:'7200',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Fee.create(level:'3',style:'3' ,hosoku:'バイエル',kingaku:'8400',created_at: '2011-11-14', updated_at:  '2011-11-14')
#Fee.create(level:'4',style:'3' ,hosoku:'バイエル',kingaku:'9900',created_at: '2011-11-14', updated_at:  '2011-11-14')

NyukinShubetsu.create(shubetu:'入金',created_at: '2011-11-14', updated_at:  '2011-11-14')
NyukinShubetsu.create(shubetu:'返金',created_at: '2011-11-14', updated_at:  '2011-11-14')
NyukinShubetsu.create(shubetu:'予約金',created_at: '2011-11-14', updated_at:  '2011-11-14')