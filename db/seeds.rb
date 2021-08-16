# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

League.create!([
                 { name: 'ルーキー' },
                 { name: 'ブロンズ' },
                 { name: 'スーパーブロンズ' },
                 { name: 'ウルトラブロンズ' },
                 { name: 'シルバー' },
                 { name: 'スーパーシルバー' },
                 { name: 'ウルトラシルバー' },
                 { name: 'ゴールド' },
                 { name: 'スーパーゴールド' },
                 { name: 'ウルトラゴールド' },
                 { name: 'プラチナ' },
                 { name: 'スーパープラチナ' },
                 { name: 'ウルトラプラチナ' },
                 { name: 'ダイヤモンド' },
                 { name: 'スーパーダイヤモンド' },
                 { name: 'ウルトラダイヤモンド' },
                 { name: 'マスター' },
                 { name: 'グランドマスター' },
                 { name: 'アルティメットグランドマスター' },
                 { name: 'ウォーロード' }
               ])

Character.create!([
                    { name: 'リュウ' },
                    { name: '春麗' },
                    { name: 'ナッシュ' },
                    { name: 'ベガ' },
                    { name: 'キャミィ' },
                    { name: 'バーディ' },
                    { name: 'ケン' },
                    { name: 'ネカリ' },
                    { name: 'バルログ' },
                    { name: 'レインボー・ミカ' },
                    { name: 'ラシード' },
                    { name: 'かりん' },
                    { name: 'ザンギエフ' },
                    { name: 'ララ' },
                    { name: 'ダルシム' },
                    { name: 'ファン' },
                    { name: 'アレックス' },
                    { name: 'ガイル' },
                    { name: 'いぶき' },
                    { name: 'バイソン' },
                    { name: 'ジュリ' },
                    { name: 'ユリアン' },
                    { name: '豪鬼' },
                    { name: 'コーリン' },
                    { name: 'エド' },
                    { name: 'アビゲイル' },
                    { name: 'メナト' },
                    { name: '是空' },
                    { name: 'さくら' },
                    { name: 'ブランカ' },
                    { name: 'ファルケ' },
                    { name: 'コーディー' },
                    { name: 'サガット' },
                    { name: 'G' },
                    { name: '影ナル者' },
                    { name: 'ポイズン' },
                    { name: 'ルシア' },
                    { name: 'エドモンド本田' },
                    { name: 'ギル' },
                    { name: 'セス' },
                    { name: 'ダン' },
                    { name: 'ローズ' },
                    { name: 'オロ' },
                    { name: 'アキラ' }
                  ])

Category.create!([
                   { name: '屈伸' },
                   { name: '舐めプ' },
                   { name: '切断' },
                   { name: 'ファンメ' }
                 ])
