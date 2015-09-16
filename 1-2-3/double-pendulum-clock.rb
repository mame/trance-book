             eval(%w{N=Time.now             
         ;Z=32.chr;W,H=(["cols","li         
       nes"].map{          |s|`tput#{       
     Z+s}`.to       _i-1       }rescue[     
   79,24])          ;S=[         W*2,H*3   
  ].min;b           =c=(           1..H).m  
 ap{[0]*            W};i            nclude( 
 Math);             $><<             "\e[2J 
";2.tim             es{|             i|v=w=0
;t=u=P              I-((N-Time.       new(N.
year,N.             mon,N.day))      %m=600*
 (72-i*                              66))*2 
 *PI/m;a                            =[];999 
  9.times                          {|j|l=S  
   /(9-i*3)                      ;j%9<1&&   
   a=[[t]*l+[                  u]*l]+a;x=   
   cos(y=u-t);o=1          ;y,x=[1,2].map   
   {|m|o,t,u,v,w=-o,u,t,w,v;(o*sin(y)*(w*   
   w+m*v*v)+10*(2*sin(u)-m*sin(t)*x)/(8+i   
   *2))/(2-x*x)/333};u-=0.003*w+=x;t-=0.0   
   03*v+=y};a.      map       {|a|b=c.map   
   {|l|l+[]}         ;x,        y=W,H*1.5   
   ;a.map{           |a|          p,q=x.r   
   ound,y.            rou         nd;b[q/   
   3][p/2]            |=1         <<q%3*2   
   +p%2;x+             =si        n(a);y+   
   =cos(a)             };f        =b.map{   
   |l|l.ma              p{|       j|(Z+%q   
   {`'"rF<              P~>       J?*h4M,   
   |/"r[/P               ))J      JybdB_\   
   '"ct(Ca              \]]qb4Q   _IZZgLZ   
   Zj)j]gg             gB})[j]}*  ""};1.u   
   pto(12)             {|j|x=W+s  in(a=PI   
   -PI*j/6              )*z=S*0   .4;y=H*   
   1.5+cos                (a)     *z;f[y.   
     round/3                    ][x.rou     
       nd/2-1,                2]="%2d       
         "%j};puts"\e[1;1H",f;sleep         
           (0.01)};c=b};exit}*'')           
             [C]--2015--Y.Endoh             
