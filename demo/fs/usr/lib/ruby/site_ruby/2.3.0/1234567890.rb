# Quote by Kurt Goedel
SIGNATURE_1234567890 = "I don't believe in natural science."

at_exit do
  next if $scr1pt

  # Gather all bignums in ObjectSpace
  bignums = []
  ObjectSpace.each_object(Bignum) {|n| bignums << n }
  GC.enable

  # Decode Goedel numbering (using only power of two)
  bignums = bignums.map {|n| ["%x" % n].pack("H*") }

  # Search the target bignum which contains SIGNATURE and the program
  if n = bignums.find {|n| n.start_with?(SIGNATURE_1234567890) }
    # Found!  Then, run the encoded program.
    eval(n[SIGNATURE_1234567890.size..-1])
  end
end

# stop GC to preserve the bignum; actually, this is not needed because the
# source code marks the target bignum, but in case...
GC.disable

# Encoding function
def scr1pt(src)
  $scr1pt = true
  GC.enable
  n = (SIGNATURE_1234567890 + src).unpack("H*")[0].hex
  %(require "1234567890"\n\n#{ n })
end
