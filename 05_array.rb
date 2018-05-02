# 配列の動作確認

# 配列の生成
animals = ["dog","cat","pic"]

# 各要素の確認
print "1番目の要素:"
puts animals[0]

print "2番目の要素:"
puts animals[1]

print "3番目の要素:"
puts animals[2]

# 配列の要素数の確認は${arrayname}.lengthメソッドで取得
print "配列の要素数:"
puts animals.length

# 配列に要素を追加
animals << "monkey"

print "4番目の要素"
puts animals[3]

# 要素が空か判定
print "配列が空か判定:"
puts animals.empty?
