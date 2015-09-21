src = File.read("rquine.rb")

src.size.times do |i|
  puts "%d / %d" % [i, src.size]

  broken_src = src.dup
  broken_src[i, 1] = ""

  File.write("rquine.broken.rb", broken_src)

  fail if `ruby rquine.broken.rb` != src
end
p :ok!
