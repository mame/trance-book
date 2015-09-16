def decode(s)
  n = 0
  s.bytes do |m|
    n = n*91 + (m%92-1)
  end
  n
end

p decode("`v5TOB?zip6}JKco?|UNS/2d?&$VvU<o%")
  #=> 1604523709406423275118219621190437654457627609041732643246301143
