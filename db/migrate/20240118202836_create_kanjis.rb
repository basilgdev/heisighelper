class CreateKanjis < ActiveRecord::Migration[7.1]
  def change
    create_table :kanjis do |t|
      t.string :kanji, limit: 1, null: false
      t.integer :frame_number, null: false
      t.string :radicals, null: false
      t.integer :rank, null: false

      t.timestamps
    end
  end
end
