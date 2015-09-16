def encode(n)
  # データを表す整数 n を 91 進数に分解
  ns = []
  while n > 0
    ns << n % 91
    n /= 91
  end

  # 表示可能文字へ変換
  ns = ns.map {|n| (n+58)%92+35 }

  ns.pack("C*").reverse
end

p encode(
  1604523709406423275118219621190437654457627609041732643246301143
) #=> "`v5TOB?zip6}JKco?|UNS/2d?&$VvU<o%"
