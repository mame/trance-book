src = File.read("rquine.rb")

src.size.times do |i|
  broken_src = src.dup
  broken_src[i, 1] = ""

  File.write("rquine.broken.rb", broken_src)

  fail if `ruby --enable-frozen-string-literal rquine.broken.rb` != src
end
p :ok!
