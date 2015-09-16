eval$s=%w(
  s = %(eval$s=%w(#{$s})*"");

  f = -> n { s.slice!(0, n) };

  puts(f[32]);
  14.times {|i|
    puts(f[2] + 32.chr * 28 + f[2])
  };
  puts(s)

  ;;
)*""
