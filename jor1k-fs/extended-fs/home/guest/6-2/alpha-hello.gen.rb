# 変換前プログラム
p = "puts 'Hello, world!'"

# 変換前プログラム全体を小文字アルファベット化する
puts "public"
puts "def each"
puts "  clear"
p.bytes.reverse_each do |c|
  # 変換前プログラムの 1 文字を小文字アルファベット化する
  puts "  concat begin"
  puts "    dup ensure concat begin"
  puts "      clear"
  c.to_s(2).scan(/(10*)($)?/).map do |v, last|
    # 1 のビットごとに concat concat ... size の行を出す
    puts "      #{ "concat " * (last ? v.size : v.size + 1) }size"
  end
  puts "      size"
  puts "    ensure"
  puts "      clear"
  puts "    end"
  puts "  end"
end
puts "  eval self"
puts "end"
puts "for each in inspect do end"
