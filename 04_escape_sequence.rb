print "Are You Name?:"
name = gets.chomp
# puts name + "さんですね" => コメントアウト

puts "#{name}さんですね\n"
puts "現在時刻：#{Time.now}"

# gets.chompメソッドはキーボード入力と改行コードの削除の機能
# 今回はputsメソッドでname変数と文字列結合しているので改行はしない
# => は注釈の意
# Time.nowメソッドは現在時刻を取得する ※Timeは大文字なので注意
