alpha=1;
eval s=%q(

def punct_encode_char(c)
  s = "1"
  c.to_s(2)[1..-1].each_char do |v|
    if v == ?0
      s = s + "*_"
    else
      s = "(#{ s }*_+__)"
    end
  end
  s = s.gsub("1*", "")
  s = s[1..-2] if s.end_with?(41.chr)
  s
end

def punct_encode_string(s)
  ['(""+"")', *s.bytes.map {|c| punct_encode_char(c) }].join("<<")
end

def output_punct_encode_program(p)
  code = %q(__="_"=~/$/;_=__+__;->(&___){___["",EVAL,CODE]}[&:"#{SEND}"]).dup
  code.gsub!("EVAL") { punct_encode_string("eval") }
  code.gsub!("CODE") { punct_encode_string(p) }
  code.gsub!("SEND") { punct_encode_string("send") }
  puts code
end

def output_alpha_encode_program(p)
  puts "public"
  puts "def each"
  puts "  clear"
  p.bytes.reverse_each do |c|
    puts "  concat begin"
    puts "    dup ensure concat begin"
    puts "      clear"
    c.to_s(2).scan(/(10*)($)?/).map do |v, last|
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
end

s = %(alpha=#{ 1 - alpha };eval s=%q(#{ s }))

if alpha == 1
  output_alpha_encode_program(s)
else
  output_punct_encode_program(s)
end
)
