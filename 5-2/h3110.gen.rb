SIGNATURE_1234567890 = "I don't believe in natural science."
n = (SIGNATURE_1234567890 + "puts 'Hello, world!'").unpack("H*")[0].hex
puts %(require "1234567890"\n\n#{ n })
