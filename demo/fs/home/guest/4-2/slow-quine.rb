eval s=%q(%(eval s=%q(#{ s })).each_char {|c|
  sleep 0.1
  print c
  STDOUT.flush
})
