src = File.read(ARGV[0])
src.size.times do |i|
  File.write("rh.broken.rb", src[0, i] + src[i + 1 .. -1])
  if `ruby rh.broken.rb` != "Hello, world!\n"
    raise
  end
end
p :ok!
