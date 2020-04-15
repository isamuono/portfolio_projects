# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Category.create([
  { name: '運動・スポーツ・アウトドア' },
  { name: '文化' },
  { name: '営利団体' },
  { name: '非営利団体・公共団体' },
  { name: 'その他' }
])

subcategories = Subcategory.create([
  { category_id: '1', name: '野球・ソフトボール' },
  { category_id: '1', name: 'サッカー・フットサル' },
  { category_id: '1', name: 'バスケットボール・3x3' },
  { category_id: '1', name: 'バレーボール' },
  { category_id: '1', name: 'ハンドボール' },
  { category_id: '1', name: 'テニス・ソフトテニス' },
  { category_id: '1', name: '卓球' },
  { category_id: '1', name: 'バドミントン' },
  { category_id: '1', name: 'ゴルフ' },
  { category_id: '1', name: 'ダンス' },
  { category_id: '1', name: 'ヨガ' },
  { category_id: '1', name: '登山・キャンプ' },
  { category_id: '1', name: '釣り・フィッシング' },
  { category_id: '1', name: '水泳' },
  { category_id: '1', name: 'マリンスポーツ' },
  { category_id: '1', name: 'ウィンタースポーツ' },
  { category_id: '1', name: 'スポーツクライミング（ボルダリング・リードなど）' },
  { category_id: '1', name: '陸上競技・マラソン・ジョギング' },
  { category_id: '1', name: '自転車競技・サイクリング' },
  { category_id: '1', name: '体操' },
  { category_id: '1', name: '武道（空手・柔道・剣道など）' },
  { category_id: '1', name: '格闘技' },
  { category_id: '1', name: 'ラグビー' },
  { category_id: '1', name: 'その他スポーツ' },
  { category_id: '2', name: '伝統・文芸・工芸' },
  { category_id: '2', name: '衣食住'},
  { category_id: '2', name: '健康' },
  { category_id: '2', name: '旅行' },
  { category_id: '2', name: '音楽' },
  { category_id: '2', name: '美術・芸術' },
  { category_id: '2', name: '読書' },
  { category_id: '2', name: '教育' },
  { category_id: '2', name: 'コミュニケーション・言語・外国語' },
  { category_id: '2', name: 'テクノロジー・文明' },
  { category_id: '2', name: 'その他' },
  { category_id: '3', name: '株式会社' },
  { category_id: '3', name: 'その他営利団体' },
  { category_id: '4', name: '一般財団・公益社団・公益財団' },
  { category_id: '4', name: 'NPO' },
  { category_id: '4', name: '宗教法人・学校法人' },
  { category_id: '4', name: 'ボランティア' },
  { category_id: '4', name: 'その他非営利団体' }
])

prefectures = Prefecture.create([
  { name: '北海道' },
  { name: '青森県' },
  { name: '岩手県' },
  { name: '宮城県' },
  { name: '秋田県' },
  { name: '山形県' },
  { name: '福島県' },
  { name: '茨城県' },
  { name: '栃木県' },
  { name: '群馬県' },
  { name: '埼玉県' },
  { name: '千葉県' },
  { name: '東京都' },
  { name: '神奈川県' },
  { name: '新潟県' },
  { name: '富山県' },
  { name: '石川県' },
  { name: '福井県' },
  { name: '山梨県' },
  { name: '長野県' },
  { name: '岐阜県' },
  { name: '静岡県' },
  { name: '愛知県' },
  { name: '三重県' },
  { name: '滋賀県' },
  { name: '京都府' },
  { name: '大阪府' },
  { name: '兵庫県' },
  { name: '奈良県' },
  { name: '和歌山県' },
  { name: '鳥取県' },
  { name: '島根県' },
  { name: '岡山県' },
  { name: '広島県' },
  { name: '山口県' },
  { name: '徳島県' },
  { name: '香川県' },
  { name: '愛媛県' },
  { name: '高知県' },
  { name: '福岡県' },
  { name: '佐賀県' },
  { name: '長崎県' },
  { name: '熊本県' },
  { name: '大分県' },
  { name: '宮崎県' },
  { name: '鹿児島県' },
  { name: '沖縄県' }
])