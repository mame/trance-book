# 文字列の 1 文字を記号プログラム化する
def encode_char(c)
  s = "1"
  c.to_s(2)[1..-1].each_char do |v|
    if v == ?0
      s = s + "*_"
    else
      s = "(#{ s }*_+__)"
    end
  end
  s = s.gsub("1*", "")
  s = s[1..-2] if s.end_with?(")")
  s
end

# 文字列を記号プログラム化する
def encode_string(s)
  ['""', *s.bytes.map {|c| encode_char(c) }].join("<<")
end

# 変換前プログラム全体を変換する
def encode_program(p)
  code = %q(__="_"=~/$/;_=__+__;->(&___){___["",EVAL,CODE]}[&:"#{SEND}"])
  code.gsub!("EVAL") { encode_string("eval") }
  code.gsub!("CODE") { encode_string(p) }
  code.gsub!("SEND") { encode_string("send") }
  code
end

puts encode_program(%(3.times { puts "Hello" }))
