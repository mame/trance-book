eval s=%q(n=1; puts %(eval s=%q(#{ s.sub(/\d+/) { (n+1).to_s } })))
