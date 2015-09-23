eval s=%q(%(eval s=%q(#{ s })).each_byte {|c| puts '+'*c+'.>' })
