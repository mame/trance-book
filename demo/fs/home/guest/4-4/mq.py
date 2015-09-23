t = r"""
import sys
if len(sys.argv)>1:
  print "eval s=%q(\n  s = \"eval s=%q(\" + s + \")\"\n  if $*[0]\n    puts %(t = r\"\"\"\nimport sys\nif len(sys.argv)>1:\n  print ) + s.dump + %(\nelse:\n  print 't = r\"\"'+'\"'+t+'\"\"'+'\";exec(t)'\n\"\"\";exec(t))\n  else\n    puts s\n  end\n)"
else:
  print 't = r""'+'"'+t+'""'+'";exec(t)'
""";exec(t)
