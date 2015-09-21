N = 8

eval s=%q(puts "require_relative '_-2'"
line = ""
%(eval s=%q(#{s})).each_byte do |n|
  n.to_s(N).rjust(Math.log(126, N).ceil, "0").each_char do |d|
    d = d.to_i + 1
    if line.size + d > 50
      puts line.strip
      line = ""
    end
    line << "_" * d + " "
  end
end
puts line.strip)
