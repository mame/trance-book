SamplingRate = 8000 # OSS デフォルトのサンプリングレート
Freq = 440.0 # ラの周波数
data = []
(0..1).step(1.0 / SamplingRate) do |t|
  value = Math.sin(2 * Math::PI * Freq * t)
  data << 128 + (value * 60).round
end
File.binwrite("/dev/dsp", data.pack("C*"))
