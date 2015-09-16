# アスキーアートのテンプレート
asciiart = <<END
   ##########
 ##          ##
##   #    #   ##
##            ##
##  ##    ##  ##
##    ####    ##
 ##          ##
   ##########
END

# プログラム本体
code = <<'END'
  3.times {
    puts "Hello%c:-%c" % [32, 41]
  }
  #######
END

# プログラムから空白文字や改行文字を取り除く
code = code.split.join

# アスキーアート化のための工夫を入れる
code = 'eval(%w(' + code + ')*"")'

# テンプレートの # にコードを一文字ずつ入れていく
code = asciiart.gsub("#") { code.slice!(0, 1) }

# 生成物を出力する
puts code
