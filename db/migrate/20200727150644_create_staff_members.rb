class CreateStaffMembers < ActiveRecord::Migration[6.0]
  def change
    # 主キーを"member_id"に変えたい場合は、↓のコマンドを入力する。
    # create_table :staff_members, primary_key: "member_id" do |t|
    create_table :staff_members do |t|  # t = TableDefinitionオブジェクト
    
      # オプション null に false を指定すると "NOT NULL制約"が設定され、NULL値の設定ができないようになる
      t.string :email, null: false        # メールアドレス
      t.string :family_name, null: false  # 姓
      t.string :given_name, null: false   # 名
      t.string :family_name_kana, null: false # 姓 (カナ)
      t.string :given_name_kana, null: false   # 名（カナ）
      t.string :hashed_password           # パスワード
      t.date :start_date, null: false     # 開始日
      t.date :end_datem                   # 終了日
      t.boolean :suspended, null: false, default: false # 無効フラグ

      t.timestamps
    end

    add_index :staff_members, "LOWER(email)", unique: true
    add_index :staff_members, [ :family_name_kana, :given_name_kana] # ふりがなでインデックスをつけて、ソートの高速化を図る
  end
end
