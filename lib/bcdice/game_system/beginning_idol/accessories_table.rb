# frozen_string_literal: true

module BCDice
  module GameSystem
    class BeginningIdol < Base
      private

      def roll_accessories_table(command)
        roll_tables(command, ACCESSORIE_TABLES)
      end

      ACCESSORIE_HEAD = DiceTable::D66Table.new(
        "頭アクセサリー表",
        D66SortType::ASC,
        {
          11 => "アイマスク",
          12 => "うさみみ",
          13 => "ねこみみ",
          14 => "サングラス",
          15 => "ピアス",
          16 => "シュシュ",
          22 => "仮面",
          23 => "ティアラ",
          24 => "エクステ",
          25 => "バンダナ",
          26 => "ヘアバンド",
          33 => "インカム",
          34 => "イヤリング",
          35 => "ホワイトプリム",
          36 => "ゴーグル",
          44 => "つけひげ",
          45 => "ヘッドホン",
          46 => "耳あて",
          55 => "トナカイの角",
          56 => "花飾り",
          66 => "かんざし",
        }
      )

      ACCESSORIE_HAT = DiceTable::D66Table.new(
        "帽子アクセサリー表",
        D66SortType::ASC,
        {
          11 => "ヘルメット",
          12 => "麦わら帽子",
          13 => "サンタ帽子",
          14 => "花冠",
          15 => "学帽",
          16 => "ハンチング帽",
          22 => "シルクハット",
          23 => "テンガロンハット",
          24 => "ナイトキャップ",
          25 => "ロシア帽",
          26 => "ベレー帽",
          33 => "コック帽",
          34 => "パーティコーン",
          35 => "とんがり帽子",
          36 => "キャップ",
          44 => "ナースキャップ",
          45 => "カンカン帽",
          46 => "ハット帽",
          55 => "ターバン",
          56 => "セーラーキャップ",
          66 => "中共帽子",
        }
      )

      ACCESSORIE_BODY = DiceTable::D66Table.new(
        "胴アクセサリー表",
        D66SortType::ASC,
        {
          11 => "首かけ指輪",
          12 => "カウベル",
          13 => "ネックレス",
          14 => "蝶ネクタイ",
          15 => "メガホン",
          16 => "ペンダント",
          22 => "ブローチ",
          23 => "金の首輪",
          24 => "チョーカー",
          25 => "南京錠",
          26 => "タスキ",
          33 => "エプロン",
          34 => "名札",
          35 => "階級章",
          36 => "胸当て",
          44 => "ベルト",
          45 => "ポシェット",
          46 => "マフラー",
          55 => "首かけカメラ",
          56 => "リボン",
          66 => "肩パット",
        }
      )

      ACCESSORIE_ARM = DiceTable::D66Table.new(
        "腕アクセサリー表",
        D66SortType::ASC,
        {
          11 => "動物の手",
          12 => "宝石の腕輪",
          13 => "動物のマペット",
          14 => "グローブ",
          15 => "指ぬきグローブ",
          16 => "リストバンド",
          22 => "鍋掴み",
          23 => "手袋",
          24 => "長手袋",
          25 => "腕章",
          26 => "腕時計",
          33 => "ドリル",
          34 => "楽器",
          35 => "マフ",
          36 => "カフス",
          44 => "ボクシンググローブ",
          45 => "シルバーアクセサリー",
          46 => "ゴールドアクセサリー",
          55 => "ぬいぐるみ",
          56 => "ミサンガ",
          66 => "手甲",
        }
      )

      ACCESSORIE_FOOT = DiceTable::D66Table.new(
        "足アクセサリー表",
        D66SortType::ASC,
        {
          11 => "革靴",
          12 => "ブーツ",
          13 => "スポーツシューズ",
          14 => "スキー靴",
          15 => "アンクル",
          16 => "バスケットシューズ",
          22 => "スリッパ",
          23 => "ミサンガ",
          24 => "動物の足",
          25 => "作業靴",
          26 => "ルーズウォーマー",
          33 => "ニーパッド",
          34 => "ガーターリング",
          35 => "ポーチ",
          36 => "ローラースケート",
          44 => "へんなタイツ",
          45 => "白タイツ",
          46 => "網タイツ",
          55 => "ガラスの靴",
          56 => "グリープ",
          66 => "ベル",
        }
      )

      ACCESSORIE_OTHER = DiceTable::D66Table.new(
        "その他アクセサリー表",
        D66SortType::ASC,
        {
          11 => "ボンボン",
          12 => "マント",
          13 => "蝶の羽",
          14 => "天使の羽",
          15 => "悪魔の羽",
          16 => "猫のしっぽ",
          22 => "トレンチコート",
          23 => "ばんそうこう",
          24 => "パラソル",
          25 => "ステッキ",
          26 => "タトゥーシール",
          33 => "バーコード",
          34 => "バレーボール",
          35 => "大きなリボン",
          36 => "鎖",
          44 => "キャラクターグッズ",
          45 => "イメージカラーのネイル",
          46 => "メガネ",
          55 => "旗",
          56 => "ジャケット",
          66 => "サスペンダー",
        }
      )

      ACCESSORIE = ChainTable.new(
        "アクセサリー種別決定表",
        "1D6",
        [
          ["頭アクセサリー表を使用する。", ACCESSORIE_HEAD],
          ["帽子アクセサリー表を使用する。", ACCESSORIE_HAT],
          ["胴アクセサリー表を使用する。", ACCESSORIE_BODY],
          ["腕アクセサリー表を使用する。", ACCESSORIE_ARM],
          ["足アクセサリー表を使用する。", ACCESSORIE_FOOT],
          ["その他アクセサリー表を使用する。", ACCESSORIE_OTHER],
        ]
      ).freeze

      ACCESSORIE_TABLES = {
        "ACT" => ACCESSORIE,
      }.freeze

      register_prefix(ACCESSORIE_TABLES.keys)
    end
  end
end
