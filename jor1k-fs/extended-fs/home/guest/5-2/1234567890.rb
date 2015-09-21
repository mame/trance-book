# 1234567890.rb
SIGNATURE_1234567890 = "I don't believe in natural science."
ObjectSpace.each_object(Bignum).to_a.each do |n|
  s = ["%x" % n].pack("H*")
  if s.start_with?(SIGNATURE_1234567890)
    eval s
    exit
  end
end
