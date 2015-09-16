W, H = 79, 25

# 電荷 (x と y: 位置、e: 電荷量、de: 電荷量の変化)
Charge = Struct.new(:x, :y, :e, :de)
charges = (0..9).map { Charge[0, 0, 0, 0] }

print "\e[2J" # 画面クリア
loop do
  # 電荷量を更新する
  charges.each do |p|
    p.e += p.de
    p.de -= 0.002
    if p.e <= 0
      # 電荷量が0になったので新しい電荷を作る
      p.x = rand * W
      p.y = rand * H
      p.e = 0
      p.de = rand * 0.05 + 0.05
    end
  end

  # 電場を計算する
  f = (0..H).map do |y|
    (0..W).map do |x|
      v = 0.0
      charges.each do |p|
        # 電場の各点の値は電荷の2乗に反比例する
        v += p.e / Math.hypot(p.x - x, (p.y - y) ** 2)
      end
      v
    end
  end

  # マーチングスクエア法で電場の等高線を生成する
  s = (0...H).map do |y|
    (0...W).map do |x|
      v  = f[y  ][x  ] > 0.5 ? 1 : 0
      v += f[y  ][x+1] > 0.5 ? 2 : 0
      v += f[y+1][x  ] > 0.5 ? 4 : 0
      v += f[y+1][x+1] > 0.5 ? 8 : 0
      #0123456789ABCDEF
      " '`-.|+,,+|.-`' "[v]
    end.join
  end

  # 描画
  print "\e[1;1H" + s.join("\n")
  sleep 0.01
end
