SamplingRate = 8000 # OSS デフォルトのサンプリングレート
Freq = 440.0 # ラの周波数
data = []
[3, 5, 7].each do |scale|
  (0..1).step(1.0 / SamplingRate) do |t|
    value = Math.sin(2 * Math::PI * Freq * 2**(scale / 12.0) * t)
    data << 128 + (value * 60).round
  end
end
File.binwrite("/dev/dsp", data.pack("C*"))
