require 'csv'

csv_text = File.read(Rails.root.join('db', 'heisig.csv'))
csv = CSV.parse(csv_text, :headers => false, :encoding => 'UTF-8')

# For some reason, when the csv file has headers, it cannot access the 'kanji' column, while the rest are fine?
# Possibly encoding related...
# 'TypeError: no implicit conversion of nil into String (TypeError)'

csv.each do |row|

  Kanji.create(
    kanji: row[0]&.strip,
    frame_number: row[1]&.strip,
    entry: row[2]&.strip,
    radicals: row[3]&.strip,
    rank: row[4]&.strip
  )
end
