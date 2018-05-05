
print "1-4までの番号を入力してください\n"
print "入力："

# num変数にはキー入力の内容を整数型に変換した値が格納される
# .to_iメソッドで整数型に型変換
num = gets.to_i

# whenの条件は整数でも文字列でもOK
# 下記条件は4はダブルクォートで囲っているので文字列扱い
# numはget.to_iで整数に変換されているので4と入力しても合致しない

case num
when  1
	print "1番です\n"
when  2
	print "2番です\n"
when  3
	print "3番です\n"
when "4"
	print "四番です\n"
else
	print "どの条件とも合致しませんでした\n"
end

