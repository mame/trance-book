#!ruby
# Q(uine)R(uby)code (C) Y.Endoh 2009
eval s=%q(X=(0..7).map{|i|1<<i};W=116;m=(1..w=117).map{[]};B=999.times{|i|X<<(
X[-4]^X[-5]^X[-6]^X[-8]);n=0x7f415d5d5d417f;i<64&&m[j=i/8][k=i%8]=m[W-j][k]=m[
j][W-k]=n[i]};P=6.step 110,26;P.map{|j|P.map{|k|m[j][k]||25.times{|i|m[j-2+i/5
][k-2+i%5]=-469441[i]}}};g=[1];m[109.times{|i|m[i][6]=m[6][i]||=1-i;i<15&&m[i.
+i<6?0:i<8?1:102][8]=m[8][(i>8?14:i>7?15:W)-i]=26998[i];i<18&&m[i/3][x=i%3+106
]=m[x][i/3]=102881[i];i<26&&g=(g+[0]).zip([0]+g.map{|x|X[i+X.index(x)]}).map{|
x,y|x^y}}][8]=1;_,*G=g;n=c=12704;b=("404e4#{"%02x"*1252}0#{"ec11"*B}"%%(#!ruby
# Q(uine)R(uby)code (C) Y.Endoh 2009\neval s=%q(#{s})).unpack("C*")).scan /../
D=[];E=([106]*8+[107]*4).map{|d|D<<y=b.shift(d).map(&:hex);z=y+G.map{0};y.map{
r=X.index z.shift;r&&z=z.zip(G).map{|y,x|x ?y^X[r+X.index(x)]:y}};z};require"\
zlib";(D*B+E*B).map{|l|x=l.shift;x&&n=x+n*256};x=13688;d=[1,W];x.times{m[i=x/w
][j=x%w]||=n[c-=1]^i+j+i*j%3+1;x-=y=d.shift;d<<y;0<=x&&x<w*w||x-=3+d[1]=-2-y ;
x==6&&x=5};z,e="\0","\xff";t=(z+e*125)*16;s="IDAT"+Zlib.deflate(t+m.map{|l|[z,
e*4,l.map{|x|(e+z)[x&1,1]},e*4]*4}*""+t); $>.binmode<< "\x89PNG\r\n\x1a\n".b+[
13,"IHDR",500,500,2,0,2752354551,s.size-4,s,Zlib.crc32(s),0,"IEND\xAEB`\x82"].
pack("NA*NNCN3A*NNA*"))
