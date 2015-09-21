def cheat_zlib_deflate(data)
  a, b = 1, 0
  data.each {|d| b += a += d }
  [
    0x78, 0x9c,                                # Zlib ヘッダ (RFC 1950)
    1, data.size, ~data.size, data.pack("C*"), # 無圧縮 Deflate (RFC 1951)
    b%65221, a%65221                           # Adler-32 (RFC 1950)
  ].pack("C3vvA*nn")
end
