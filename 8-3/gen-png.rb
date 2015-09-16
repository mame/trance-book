require "zlib"

W, H = 255, 50

# 画像のベタデータ生成
data = []
H.times do
  data << 0
  W.times do |x|
    data << 255-x << 0 << x # RGB = (255-x, 0, x)
  end
end

# チャンクのバイト列生成関数
def chunk(type, data)
  [data.bytesize, type, data, Zlib.crc32(type + data)].pack("NA4A*N")
end

# ファイルシグニチャ
$stdout.binmode
print "\x89PNG\r\n\x1a\n"

# ヘッダ
print chunk("IHDR", [W, H, 8, 2, 0, 0, 0].pack("NNCCCCC"))

# 画像データ
print chunk("IDAT", Zlib.deflate(data.pack("C*")))

# 終端
print chunk("IEND", "")
