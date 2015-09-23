eval s=%q(
  s = "eval s=%q(" + s + ")"
  if $*[0]
    puts %(t = r"""
import sys
if len(sys.argv)>1:
  print ) + s.dump + %(
else:
  print 't = r""'+'"'+t+'""'+'";exec(t)'
""";exec(t))
  else
    puts s
  end
)
