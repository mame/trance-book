                   eval$s=%w'k=0000;f=                   
               proc{|x,y,s|x*x+y*y*4<36864               
             &&(u,v=x.round,y.round;x.abs>21             
           +s||y.abs>4+s||(x*x+(y*2+6)**2<4?f[           
         x*96,y*96+288,s*192]:u*u<441&&v*v<25&&"         
        36effv0qbzox5c3npa191hhgzrio5b3640nv9g9jz        
       vnm8a67su".to_i(36)[u-v*41+143]>0))};k=(k+(       
      $*[0]||1).to_i)%99;t=("eval$s=%%w%ck=%04o;"%[      
     39,k])<<($s[7,530]<<35<<35)*9;s=8/96**(1-k.to_f     
     /98);o=(-11..11).map{|j|(-28..28).map{|i|f[i*s,     
     j*s-36*(8-s)/95,s/4]       ??a:32.chr}*""}*10.c     
     hr;o.sub!(/aaaa((#{" Quine ";(s=92.chr)+?s}+a{1     
     ,3})*#{s+?s}*)#{s+?z       }/){39.chr+%(*"")+$1     
     .tr(?a,?;)};o.gsub!(/a/){t.slice!(0,1)};puts(*o     
     )##f=proc{|x,y,s|x*x+y*y*4<36864&&(u,v=x.round,     
      y.round;x.abs>21+s||y.abs>4+s||(x*x+(y*2+6)**      
       2<4?f[x*96,y*96+288,s*192]:u*u<441&&v*v<25&       
        &"36effv0qbzox5c3npa191hhgzrio5b3640nv9g9        
         jzvnm8a67su".to_i(36)[u-v*41+143]>0))};         
           k=(k+($*[0]||1).to_i)%99;t=("eval$s           
             =%%w%ck=%04o;"%[39,k])<<($s[7,5             
               30]<<35<<35)*9;s=8/96**(1-k               
                   .to_f/98);o=(-1'*""                   
