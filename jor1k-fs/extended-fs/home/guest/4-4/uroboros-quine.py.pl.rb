eval s=%q(puts %(print q(print("eval s=%q(#{ s.gsub(34.chr, 92.chr<<34) })"));))
