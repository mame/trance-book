eval$e=%q(puts'open http://localhost:18463';require'socket'
s=TCPServer.new 18463;c=(/GET +\/(\d*)/i=~c.gets;c<<%(HTTP\
/1.0 200 OK\nContent-Type:text/html\n\n)+(eval(%(#$1% 60>0?
%(leval$e=%q(\#$e)#)[#$1,1].sub('&','&amp;').sub('>','&gt;'
).sub('<','&lt;'):'<br>'# ;nil))||%(<title>quine web server
</title>The source code of this web server is:<pre id='p'>\
</pre><script type='text/javascript'>a=i=0;f=function(){a!=
0&&a.readyState<4||(a!=0&&(document.getElementById('p').in\
nerHTML+=a.responseText),i++<719&&(a=new XMLHttpRequest() ,
a.open('GET','/'+i,true),a.onreadystatechange=f,a.send()))}
;f() </script>));puts$_;c.shutdown:WR;c.read;c.close)while\
c=s.accept ## quine-web-server.rb (c) Yusuke Endoh 2009 #)#
