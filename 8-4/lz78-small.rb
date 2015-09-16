n=961193305173596169800385738175379
t=[*0..255]
r=b=c=[72]
14.times{|s|
  s+=257
  t<<c+b=[*t[n%s]||b][0,1]
  r+=c=[*t[n%s]]
  n/=s
}
p r.pack("C*") #=> "Hello, hello, hello!"
