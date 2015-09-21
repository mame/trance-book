SAFE_LETTERS = "!$&+,-/:;=>?[]{|}~gijmnoqrstuxyz".bytes
SAVE_OFFSETS = {}
(SAFE_LETTERS - [?^.ord]).permutation(2) do |b1, b2|
  (SAVE_OFFSETS[b1 - b2] ||= []) << [b1, b2]
end

def search(*ss)
  ss.map do |s|
    rs = []
    bs = s.bytes
    (SAFE_LETTERS.min - bs.min).upto(SAFE_LETTERS.max - bs.max) do |offset|
      if SAVE_OFFSETS[offset] && bs.all? {|b| SAFE_LETTERS.include?(b + offset) }
        SAVE_OFFSETS[offset].each do |r1s, r2s|
          next if bs.min < r2s
          r1e = 126
          r2e = SAFE_LETTERS.find {|b| bs.max <= b }
          r1 = "%c-%c" % [r1s, r1e]
          r2 = "%c-%c" % [r2s, r2e]
          r1e = s.tr(r2, r1).bytes.max
          r1e = SAFE_LETTERS.find {|b| r1e <= b }
          r1 = "%c-%c" % [r1s, r1e]
          t = s.tr(r2, r1)
          r1 = %("#{ r1 }")
          r2 = %("#{ r2 }")
          rs << %(proc_tr[#{ %("#{ t }") },#{ r1 },#{ r2 }])
        end
      end
    end
    rs.find {|r| r.include?("common_tr") } || rs.first
  end * "+"
end

STR_EVAL = search("eva", "l")
STR_SEND = search("send")
STR_TR = search("%\"().0-", "9hklpvw<*", "a-f")

main = <<'END'
if local_variables.include?(:format)
  if format
    deleted_letters = [10.chr, *32.chr..126.chr] - (format + ?%).chars
  else
    deleted_letters = '().0123456789hklpvw<*abcdef%'.chars - n.chars
  end
elsif local_variables.include?(:ormat)
  deleted_letters = [?f]
elsif local_variables.include?(:frmat)
  deleted_letters = [?o]
elsif local_variables.include?(:fomat)
  deleted_letters = [?r]
elsif local_variables.include?(:forat)
  deleted_letters = [?m]
elsif local_variables.include?(:formt)
  deleted_letters = [?a]
elsif local_variables.include?(:forma)
  deleted_letters = [?t]
else
  deleted_letters = [?=]
end
p(deleted_letters.first) unless deleted_letters.empty?
exit#/g
END

# for lipo-hello2.rb
#main = "puts 72.chr+'ello, world!';exit"


code = <<'END'
format= %%->{#({#){#.{#0{#1{#2{#3{#4{#5{#6{#7{#8{#9{#h{#k{#l{#p{#v{#w{#<{#*{#a{#b{#c{#d{#e{#f{#

  proc_tr = -> s,x,y { -> &_ { _[s,x,y]}[&:tr] }

  -> &_ {
    n = "STR_CANARY"
    _["",
      STR_EVAL,
      proc_tr[
        "STR_MAIN1",
        "STR_RANGE",
        STR_TR
      ]
    ]
  }[&
    -> &_ { _[STR_SEND] }[&:to_sym]
  ]

}[]%;

eval"(eval((%w()<<%w( STR_MAIN2 )*%()).pack(%(h*))))"
END

ngletters='().0123456789hklpvw<*abcdef';
STR_MAIN1 = main.tr('%"' + ngletters, range=96.chr<<94<<64<<45<<90)
code.sub!("STR_EVAL") { STR_EVAL }
code.sub!("STR_SEND") { STR_SEND }
code.sub!("STR_MAIN1") { STR_MAIN1 }
code.sub!("STR_MAIN2") { main.unpack("h*")[0] }
code.sub!("STR_CANARY") { ngletters+92.chr*2 }
code.sub!("STR_TR") { STR_TR }
code.sub!("STR_RANGE") { 96.chr<<94<<64<<45<<90 }

puts code
