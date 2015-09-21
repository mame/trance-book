require "_"
puts __script__("a=b=1;($*[0]||10).to_i.times{p a;a,b=a+b,a}")
