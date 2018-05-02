# キーボード入力した文字列を文字列結合し表示するプログラム
#
# gets.chompメソッドはキーボード入力と改行コードの削除の機能
# 今回はputsメソッドでname変数と文字列結合しているので改行はしない

print "Are You Name?:"
name = gets.chomp
puts name + "さんですね"

