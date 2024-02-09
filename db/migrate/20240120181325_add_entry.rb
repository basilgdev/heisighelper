class AddEntry < ActiveRecord::Migration[7.1]
  def change
    add_column :kanjis, :entry, :string
  end
end
