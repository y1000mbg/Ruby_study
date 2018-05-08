# Webアプリ作成の勉強メモ

## 概要

udemyでRuby on Railsについての教材を買ってみた。
学習のメモを記載する。
内容としては下記の通りでフロント側の技術も学んだ。

- Ruby
- Ruby on Rails
- HTML5
- JavaScript
- jQuery
- Bootstarp


## 環境について

- Ubuntu 18.04
- Ruby on Rails --version 4.2.8

※動画ではMac & HomeBrewの環境で環境構築をしていた

**Ubuntuは適宜aptコマンドに差し替えて実施**

## 1日目_2018/04/30_2時間

環境構築は２時間程度で完了。

### 環境構築

#### Rubyのインストール

デフォルトで入っていない場合は下記でインストール

```
apt install Ruby ruby-dev
```

※gemでRailesインストールの際に**ruby-devがないとエラーになる**ので注意

バージョン確認

```
y_shirai@x230:~/Downloads$ ruby -v
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]
y_shirai@x230:~/Downloads$
```

#### rbenvのインストール

複数のRubyのバージョンを切り替えたり出来る

```
sudo apt install rbenv
```

rbenvの初期設定を.bashrcの末尾に追加

```
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# bashrcの再読込
. ~/bashrc
```

#### 複数のrubyをインストール

rbenvを使ってrubyをインストール

```
# インストールできる一覧を確認
rbenv install -l

# 特定バージョンをインストール
## ダウンロードとインストールなので少し時間がかかる
rbenv install 2.4.0

# インストールされているバージョンの確認
$ rbenv versions
* system (set by /home/y_shirai/.rbenv/version)
  2.4.0

# バージョンの切り替え
rbenv local 2.4.0

```

※バージョン2.3.0のインストールは何故か失敗するので2.4.0と2.5.0で学習をすすめる

#### Railsのインストール

Rubyが入っていればgem（パッケージ管理ツール？ pipみたいなもの）が使える

```
# Railsインストール
sudo gem install rails --version "4.2.8"

# バージョン確認
$ rails -v
Rails 4.2.8

```

### はじめてのRailsプロジェクト作成と動作確認

作業ディレクトリを作成後プロジェクト生成

```
mkdir ~/railsstudy && cd ~/railsstudy

$ ${projectname}は任意のプロジェクト名

rails new ${projectname}

cd ${projectname}

## Gemfileの書き換え
## JavaScript Runtimeが入ってないとrailsサーバーがスタートできない
sed -i -e s/"# gem 'therubyracer'"/"gem 'therubyracer'"/ Gemfile

## JavaScript Runtimeを導入
bundle install

## Serverのスタート
rails s

## ブラウザで確認
http://localhost:3000 にアクセス。

Welcome aboard　なるページが開けばOK

```

※エラーの参考： https://qiita.com/noraworld/items/d92cca9bb449b48a97aa

## 2日目_2018/05/01_2時間

### Ruby言語

- スクリプト言語
  - v1.9からは実行時にバイトコードという仮想マシンで動くバイナリへ変換後、コンピュータが解釈できる機械語への変換が行われる。
  - ユーザーはプログラムの実行時にバイトコード変換を意識することはない
- すべての命令やデータをオブジェクトとして扱う（Javaみたいなイメージ？）
- 日本人のまつもとひろゆき氏が開発者 = 日本語ドキュメントが充実？
- **v2.0以降は文字コードはUTF-8で保存する必要がある**

### Rubyの実行形式

- エディタで拡張子.rbファイルを作成
- irbコマンドで対話形式で実行
- サーバー上で実行
  - rbファイルをサーバーに配置して実行
  - erbファイルをHTMLファイルに埋め込む
- JRubyというものを使えばデスクトップアプリも作れるらしい

### Rubyリファレンス

[Rubyリファレンスドキュメント](https://www.ruby-lang.org/ja/documentation/)

仕様を確認できる

### Ruby言語の記法詳細

#### すべてがオブジェクト

- 変数もオブジェクト
- オブジェクトのテンプレートをクラスと呼ぶ（Javaのクラスとは違う？）
- クラスの実態をインスタンスとも呼ぶ。インスタンスも当然オブジェクトである
- 文字列などのデータもオブジェクト

#### クラスの継承について

- Rubyは1回のみ継承可能で多重継承は不可能。つまり親子関係のみになる。

#### メソッド（処理）について

- メソッドは処理のことを指す（Javaと同じ感覚）

下記のようにかける

```Ruby
#メソッド 引数
ptus "HelloWorld"
```

実行の仕方

ターミナルからrubyコマンドの引数にファイル名を指定する

```
$ ruby ${filename}.rb
```

#### 変数について

変数

- 変数はオブジェクトとして扱われる
- 型はRubyが勝手に判断してくれる（型推論というらしい）
- メソッドを代入することも出来る
- 変数を使うときは**変数名を書けば良い（$などはつけない）**
- 代入演算子は=で表現

変数の種類

|記載方法|種類|補足|
|:---|:---|:---|
|hoge|ローカル変数|同じクラスからのみ参照|
|$hoge|グローバル変数|別クラスから参照可能|
|@hoge|インスタンス変数|後で書く|
|@@hoge|クラス変数|後で書く|
|HOGE|定数（コンスタント）|再代入できない|

#### 文字列や値について

- '（シングルクォート）は式や変数を展開**しない**
- "（ダブルクォート）は式や変数を展開**する**
- "で式や変数を使う場合は#{}を使う

#### エスケープシーケンス

|記載方法|意味|
|:---|:---|
|\t|タブ文字|
|\n|改行|
|\${char}|${char}の文字をエスケープ（特殊文字である"など）|
|\s|半角スペース|

※Javaと同じみたい。Ruby独特の表記がないか後で探してみる。

#### 演算子

|記載方法|意味|
|:---|:---|
|+|加算|
|-|減算|
|*|乗算|
|/|除算|
|%|余り|

##### 型変換

|記載方法|意味|
|:---|:---|
|${val}.to_i|数値型へ変換|
|${val}.to_s|文字列型へ変換|

## 2018/05/02_3日目_1時間

##### 配列

- 配列は複数の要素を持てる変数（Javaと名瀬)
- Arrayクラスオブジェクト
- 添字は0から始まる
- 一度生成した配列でも要素を追加出来る（固定長配列ではない）

配列の操作方法

```
# 精製方法1
array = ["AAA","BBB","CCC"]

# 精製方法2
array = %w(AAA BBB CCC)

# 配列の要素の取得
puts ${array}[0]

# 要素の追加
${array} << "DDD"

# 配列の要素数の取得
puts ${array}.length

# 配列が空かの判定
puts ${array}.empty?
```
#### 制御式

条件分岐と繰り返し処理

- Rubyでは制御文のことを**制御式**と呼ぶ

#### 条件分岐

|構文の種類|動作|
|:---|:---|
|if|条件式が成立した場合に実行|
|elsif|ifの条件式が未成立かつelseifの条件式が成立した場合に実行|
|else|ifとelseifの条件式が未成立の場合に実行|
|unless|後で記載|

#### 比較演算子

あとでまとめる

### 2018/05/05_4日目_1時間

#### 繰り返し

```
# ブロックを繰り返しに渡せる
## |i|がブロックパラメータ
## イマイチわかっていないので実際に書いて動きを見る
[式] do |i|
    処理内容
end

# until
## １行ずつ読み込む
## ${file}.eofはend of file(ファイルの終端かどうか)を調べる
until ${file}.eof
    print ${file}.gets
end

# for
## cshellのforeachやJavaの拡張for文と同じ動き
for i in [1,2,3,4,5]
    puts i*2
end
```

#### case

- case \- endの間に条件値による分岐を記載していく
 - whenの後に条件値を設定する
 - ダブルクォートで囲めば文字列になる

```
num = gets.to_i

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
```

### 2018/05/06_5日目_1時間

#### 例外処理

- 例外処理はbeginブロックで行う
  - begin => Javaでいうtry文
  - rescue => Javaでいうcache文

書き方

```
begin
	File.open("test.txt",encoding: "utf-8") do |f|
    # test.txtファイルが存在すれば1行読み込む
		print f.gets
end
# e変数にはエラーメッセージが格納される
rescue => e
	warn "#{e.class} / #{e.message}"
end
```

#### 時刻や日付の扱いについて

- Time.nowメソッドで現在日時を取得
- time.yearなどで表示する要素を指定（今回は年のみ）
- .*strftimeメソッドで表示形式の指定* を出来る
  - time.strftim("%Y/%m/%d") => YYYY/MM/SS形式で表示

記載例

```
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
```

実行結果

```
2018
2018/05/06 Sunday 13:23

2018/05/06 Sun 13:23
2018/05/06 Sun 01:23 PM
```

#### ハッシュ（連想配列）

- ハッシュはKey Valueの組み合わせ
- 複数の値を扱うことが出来る

```
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
```

#### 演習をやってみる

ここまででRubyの単元が一旦終わるので演習として何個かプログラムを作成してみる。

- FizzBuzz問題
  - 1〜100までを順番に表示
  - 3で割り切れるときはFizzと表示
  - 5で割り切れるときはBuzzと表示
  - 3と5で割り切れるときはFizzBuzzと表示

作成したプログラムは13_rensyu_fizzbuzz.rbを確認

- うるう年判定問題
  - 2000年〜3000年までを順番に表示
  - うるう年だった場合は「YYYY年 うるう年」と表示
  - うるう年ではない場合は「YYYY年 平年」と表示


- うるう年の定義
- [※どの年がうるう年になるの？ | 国立天文台(NAOJ)](https://www.nao.ac.jp/faq/a0306.html)
  1. 西暦年号が4で割り切れる年をうるう年とする
  2. ただし1.の例外として、西暦年号が100で割り切れて400で割り切れない年は平年とする
