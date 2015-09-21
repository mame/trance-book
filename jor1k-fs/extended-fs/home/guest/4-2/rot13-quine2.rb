eval s=%(
  puts ("eval s=%(" + s + ")").tr("A-Za-z","N-ZA-Mn-za-m")
  puts "BEGIN { print $<.read.tr('A-Za-z','N-ZA-Mn-za-m'); exit }"
  exit
)
ORTVA { cevag $<.ernq.ge('N-Mn-m','A-MN-Za-mn-z'); rkvg }
