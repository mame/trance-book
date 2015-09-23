#!/usr/bin/env ruby
eval src = %q!
$stdout.binmode
print [
  "RIFF",17282028,"AVI ","LIST",196,"hdrl","avih",56,
  66732,7455232,512,2064,75,0,1,230408,320,240,0,0,0,
  0,"LIST",120,"strl","strh",56,"vids","DIB ",0,0,0,
  6000,30000,0,75,230408,0,0,0,0,"strf",44,40,320,
  240,1,24,0,230400,0,0,0,0,0,"LIST",17280604,"movi"
].pack("A4VA4A4VA4A4V15A4VA4A4VA4A4V12A4V4v2V7A4VA4")
font = 0
data = "^#>%t2R0I~}_|a[2<i*clzP`Jp{=3<-]OEn>OyjOA;yW\
:(TN5mbsf.?Kv.qt[MMf>oxebbr)FVlr,<P,1C`[R#p('8Mw<5bP\
zKOJ7G.Ic[iQK.UGA34X$<,?*?/6E%aQm#Cv6V9HUg;y)A/5LIZ1\
(a`rLBFxN,*kQz.Vh+~~6R>Krm?>psftq{;FN7rM9FpFu+Mm}VU*\
uG)B28(KjG7<%3'q&Jjc|=U82N>7l>g)|?mElL[,^Ilyl3h5oKm7\
x[|X#'PyxDT,'omX^W6c|h_)Zfx]Mg%Fj@fGOj4fh%7n8Gh(DW^G\
j`L:fHuDZM)9Gbv5pA-BoQ>u$I'd]2DMGi18,V]ErXlKZmOc0euT\
h*SyDa%_':@G]6Jrx}J6f)2pIGJ1Ni6rW]=`e8@'|`2)L3|<lTv[\
M:|4`0fOBbwi9l,%OD8cHs]CL/|wCc2+QC7A?2D0dAq'c.UlUIit\
RqK[hnb:*ER*(WsmMfbw;mwQQ1[X8[0YQj&:HEf=:9miks^@xb.h\
vj3+06p7$1.*4c5;l_>tQawZO]X|<HNfK+O/J|yNr7cSuI#G%h+z\
8(tx8v0uZuI}ki3nw:QGJ1Qz(-mgiHNMiA*^~)#;g3%`}a2&Va%_\
|0#xckLrJ.v+hw1?Mu-ye,^>}99+i}w#ZL0<hIN$2yliZ(C3zD]s\
B%2o7EYZdYx^@fwvPr7jLS0N9?ovtzG42e~E1#k.wp_$Gb-OfHmj\
bm-g':lE7oV{y1nDs:Hz]-|X9W+X_#r>rzzK:;KQ[EPp`7<>RHRZ\
}7Sh8fKa{b5e]dI;&&ebT0m9P%.hui^%c27i|xXlrFUdrH#h1A'X\
FV~#azOsM_1P@m~X[FI0row=YBIs9'vx}^n{G#7YB3{,;v`Ay"
data.unpack("C*").each {|c| font = font*91+(c-1)%92 }
src = "#%c/usr/bin/env ruby
eval src = %%q%c%s%c
Copyright(C). Yusuke Endoh, 2010" % [33,33,src,33]
src = src.lines.map {|line| line.unpack("C*") }
black, white = "\0\0\0", "\xff\xff\xff"
75.times do |n|
  print ["00db",230400].pack("A4V")
  240.times do |y|
    idx = n-y/10
    line = idx>=0 && src[idx] ? src[idx] : []
    320.times do |x|
      idx = (line[x/6]||0)*60-1920+(y%10)*6+(x%6)
      print(font[idx]==0 ? black : white)
    end
  end
end
print ["idx1",1200].pack("A4V")
75.times do |i|
  print ["00db",0,228+230408*i,230400].pack("A4V3")
end
exit!
Copyright(C). Yusuke Endoh, 2010
