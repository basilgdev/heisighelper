require 'sqlite3'
require 'csv'

db = SQLite3::Database.new('storage/development.sqlite3')

csv_file_path = 'heisig.csv'

CSV.foreach(csv_file_path, headers: false) do |row|
  kanji = row[0]
  frame_number = row[1]
  entry = row[2]
  radicals = row[3]
  rank = row[4]
  created_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
  updated_at = created_at

  db.execute("INSERT INTO kanjis (kanji, frame_number, entry, radicals, rank, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)",
             [kanji, frame_number, entry, radicals, rank, created_at, updated_at])
end

db.close