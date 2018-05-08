# 時刻や日付の確認をするプログラム

# 現在時刻の取得
time = Time.now

# 年だけ表示
puts time.year

# YYYY/MM/DD 英語曜日 HH:MM
puts time.strftime("%Y/%m/%d %A %H:%M")
puts "\n"
# YYYY/MM/DD 英語曜日(省略) HH:MM
puts time.strftime("%Y/%m/%d %a %H:%M")

puts time.strftime("%Y/%m/%d %a %I:%M %p")
