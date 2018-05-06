# ハッシュ（連想配列）の動きを確認するプログラム

# ハッシュの宣言



# Key => Value,
# 名前 => 値
# 区切りはカンマを使うので注意
books = {
    "Ruby入門" => 1000,
    "hashについて" => 500,
    "hoge本" => 300
}

# Ruby入門Keyに紐付けられている1000Valueが表示される
puts books["Ruby入門"]

# ハッシュに要素の追加
books["プログラムの本"] = 1300

puts books["プログラムの本"]

# eachメソッドはkeyとvalueのセットをdoブロックで
# 順番に取り出せるのでdoブロックで繰り返し処理する
books.each do |key,val|
    puts "#{key},#{val}円"
end
