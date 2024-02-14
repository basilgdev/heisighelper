class CreateKanjis < ActiveRecord::Migration[7.1]
  def change
    create_table :kanjis do |t|
      t.string :kanji, limit: 1, null: false
      t.integer :frame_number, null: true
      t.string :radicals, null: true
      t.integer :rank, null: true
	    t.string	:entry, null: true
      t.timestamps
    end
  end
end
