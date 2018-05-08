# 式展開するプログラム

# gets.chompメソッドはキーボード入力と改行コードの削除の機能
# 今回はputsメソッドでname変数と文字列結合しているので改行はしない
# => は注釈の意


print "Are You Name?:"
name = gets.chomp
# puts name + "さんですね" => コメントアウト

puts "#{name}さんですね"

