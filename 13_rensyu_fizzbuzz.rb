# 演習問題1
# - FizzBuzz問題
#   - 1〜100までを順番に表示
#   - 3で割り切れるときはFizzと表示
#   - 5で割り切れるときはBuzzと表示
#   - 3と5で割り切れるときはFizzBuzzと表示

# for文で1〜100を繰り返す
# 1..100 の..は2つにすること。3つだと99までしか出力されなかった。

# elsifなので注意 elseifやelifではない！

for i in 1..100 do
    if i%3 == 0 && i%5 == 0 then
        print "#{i} FizzBuzz\n"
    elsif i%5 == 0 then
        print "#{i} Buzz\n"
    elsif i%3 == 0 then
        print "#{i} Fizz\n"
    else
        print "#{i}\n"
    end
end
