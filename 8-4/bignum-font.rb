FONT = <<END
000 |  1  | 222 | 333 | 4 4 | 555 | 666 | 777 | 888 | 999 | FFF | BB  |     |    |   |
0 0 | 11  |   2 |   3 | 4 4 | 5   | 6   | 7 7 | 8 8 | 9 9 | F   | B B | u u | zz | i |
0 0 |  1  | 222 | 333 | 444 | 555 | 666 |   7 | 888 | 999 | FFF | BB  | u u |  z |   |
0 0 |  1  | 2   |   3 |   4 |   5 | 6 6 |  7  | 8 8 |   9 | F   | B B | u u | z  | i |
000 | 111 | 222 | 333 |   4 | 555 | 666 |  7  | 888 | 999 | F   | BB  |  uu | zz | i |
END

# フォントを巨大整数に変換する
n = FONT.tr(" ", "#").gsub(/#\|[#\n]/, "").gsub(/[^#]/, "1").gsub("#", "0").reverse.to_i(2)

puts "[エンコード]"
puts n                             # 10 進数表記
puts "0x%x" % n                    # 16 進数表記
puts %("#{ n.to_s(36) }".to_i(36)) # 36 進数表記

puts

# 巨大整数からフォントデータを復元する
puts "[デコード]"
5.times do |y|
  line = (0..41).map do |x|
    "8z99pvysjsmstaojnhxu9bfve7e25stmteedmpr6f".to_i(36)[x+y*42]
  end.join.tr("01", " #").scan(/.{2}(?=.$)|.{1,3}/).join(" | ")
  puts line
end
