# 例外処理を確認するプログラム


## File.openメソッドはファイルを開く
## doブロック内にf.getsが入っているのでtest.txtファイルから
## 一行毎に読み込む処理になる
## begin - end間で例外が発生したらrescue文の中身が実行される

begin
	File.open("test.txt",encoding: "utf-8") do |f|
		print f.gets
end
rescue
	warn "エラーが発生しました"
end
