S = 25 # 描画領域の大きさ
A = S / 2.1 # 長径
B = S / 8.0 # 短径

n = 0

print "\e[2J" # 画面クリア
loop do
  # バッファ
  s = (0...S).map { " " * S * 2 }

  100.times do |i|
    # 楕円の媒介変数表示
    t = Math::PI * 2 * (i + n) / 100
    e = Complex(A * Math.cos(t), B * Math.sin(t))

    # 楕円を 3 つ描く
    -1.upto(1) do |j|
      # 楕円を傾ける
      e2 = e * Complex.polar(1.0, Math::PI * 2 / 3 * j + n / 500.0)

      # ドットを置く
      x = (e2.real * 2 + S).floor
      y = (e2.imag * 2 + S).floor
      if i == 99
        s[y / 2][x - 1, 2] = "()"
      elsif y % 2 == 0
        s[y / 2][x] = s[y / 2][x] == " " || s[y / 2][x] == "'" ? "'" : ";"
      else
        s[y / 2][x] = s[y / 2][x] == " " || s[y / 2][x] == "," ? "," : ";"
      end
    end
  end

  # 描画
  print "\e[1;1H" + s.join("\n")
  sleep 0.03

  # 粒子を進める
  n += 1
end
