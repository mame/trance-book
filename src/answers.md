---
layout: default
title: "演習の解答例"
---

## 目次

* [演習 2-1 の解答](#answer-2-1)
* [演習 3-1 の解答](#answer-3-1)
* [演習 3-2 の解答](#answer-3-2)
* [演習 3-3 の解答](#answer-3-3)
* [演習 4-1 の解答](#answer-4-1)
* [演習 4-2 の解答](#answer-4-2)
* [演習 4-3 の解答](#answer-4-3)
* [演習 5-1 の解答](#answer-5-1)
* [演習 5-2 の解答](#answer-5-2)
* [演習 6-1 の解答](#answer-6-1)
* [演習 6-2 の解答](#answer-6-2)
* [演習 7-1 の解答](#answer-7-1)
* [演習 7-2 の解答](#answer-7-2)
* [演習 7-3 の解答](#answer-7-3)

## 演習 2-1 の解答 {#answer-2-1}

素直にやってみた例。

    eval((                    %w(1.
    up      to  (100)  do|n|  s=  n;  if (n  %15==  0);s=
    "FizzB        uz     z"   elsif   (n %5    ==     0)
    ;s      ="   Bu     zz    "e  ls  if (n   %3     ==  
    0)      ;s  ="Fiz  z"end  ;puts    (s)e  nd##)  *""))

粗いので読みにくいですが、“FizzBuzz”の形をしています。生成プログラムは [aa-fizzbuzz.gen.rb](https://github.com/mame/trance-book/blob/master/2-1/aa-fizzbuzz.gen.rb) を参照してください。

この解答例は、元の FizzBuzz プログラムに本当に単純に括弧とセミコロンを足しただけなので、
改善の余地は数多くあります。
`do` … `end` を `{`…`}` にしたり、
`if` … `elsif` … `end` を条件演算子 … `?` … `:` … にしたりすることで、
かなり短くできるでしょう。
そうして空いた文字数の分で機能拡張してみると面白いでしょう。
たとえば、今は 1 から 100 まで FizzBuzz を表示しますが、
範囲をユーザが指定できるようにしてみてください。

## 演習 3-1 の解答 {#answer-3-1}
実直にやる場合。

    s = "s = \"...\"; print(s.sub(\"...\", s.gsub('\\\\','\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\').gsub('\"', '\\\"')))"; print(s.sub("...", s.gsub('\\','\\\\\\\\\\\\\\\\').gsub('"', '\"')))

次は別解。`gsub("A","B")`の代わりに`gsub("A"){"B"}`とすると`B`の中の`\`をエスケープしなくてすみます。

    s = "s = \"...\"; print(s.sub(\"...\"){s.gsub('\\\\'){'\\\\\\\\'}.gsub('\"', '\\\"')})"; print(s.sub("..."){s.gsub('\\'){'\\\\'}.gsub('"', '\"')})

もうひとつ別解。そもそも `\` という文字を極力使わないでプログラムを書けば、`\` のエスケープ自体が不要になり、だいぶすっきりします。

    s = "s = \"...\"; print s.sub(\"...\", s.gsub('\"', 92.chr+'\"'))"; print s.sub("...", s.gsub('"', 92.chr+'"'))

## 演習 3-2 の解答 {#answer-3-2}

生成プログラムを示します。

    src = <<END
    #include_<stdio.h>__
    char_s[]=@;
    int_main(){
      char *p;
      for (p=s; *p; p++){
	if (*p != 64){
	  if (*p != 78){
	    if (*p != 81) {
	      putchar(*p);
	    }
	    else {
	      putchar(34);
	    }
	  }
	  else {
	    putchar(10);
	  }
	}
	else {
	  putchar(34);
	  printf("%s", s);
	  putchar(34);
	}
      }
      return_0;
    }__
    END

    # 空白を取り除く (ただし int main とかの間は空白のまま)
    src = src.gsub(/\s/m, "").gsub("__", "\n").gsub("_", " ")

    # 繰り返し部分を埋める
    src = src.sub("@") { src.gsub("\n", "N").gsub('"', "Q").dump }

    # 出来上がったプログラムを出力する
    puts src

種となる文字列の中では、`N` は改行文字を、`Q` はダブルクォートを表しています。

## 演習 3-3 の解答 {#answer-3-3}

配列を使った Quine の生成プログラム。

    CODE = <<END
    d = DATA
    d.each do |c|
      if c != 0
	putc c
      else
	p d
      end
    end
    END
    puts CODE.sub("DATA") { CODE.sub("DATA\n", "\0").bytes.inspect }

制御構造を使った Quine の生成プログラム。

    CODE_PROLOGUE = <<END
    def get(i)
      case i
    END

    CODE_EPILOGUE = <<END
      end
    end
    AAA.times do |i|
      c = get(i)
      if c != 0
	putc c
      else
	AAA.times do |j|
	  puts "  when \#{ j } then \#{ get(j) }"
	end
      end
    end
    END

    CODE_ALL = CODE_PROLOGUE + "\0" + CODE_EPILOGUE
    CODE_ALL.gsub!("AAA") { CODE_ALL.size }

    DATA_PART = CODE_ALL.bytes.map.with_index do |b, i|
      "  when #{ i } then #{ b }\n"
    end

    puts CODE_ALL.sub("\0") { DATA_PART.join }

---

関数を使わない、分岐とループだけのQuineは次のとおり。

    340.times do |i|
      case (i < 66 ? i : i < 236 ? i - 66 : i - 170)
      when 0 then c = 51
      when 1 then c = 52
      when 2 then c = 48
      when 3 then c = 46
      when 4 then c = 116
      when 5 then c = 105
      when 6 then c = 109
      when 7 then c = 101
      when 8 then c = 115
      # (略)
      when 169 then c = 10
      end
      if i < 66 || 236 <= i
        putc c
      else
        puts "  when #{ i - 66 } then c = #{ c }"
      end
    end

ちょっとわかりにくいですが、次のように動きます。

* `i` が 0 から 65 までの間、ループ 1 回の実行ごとに、1 文字ずつ出力します。
  これにより、最初の 1 行を出力します。
* `i` が 66 から 235 までの間、ループ 1 回の実行ごとに、`when` の行を1行ずつ出力します。
* `i` が 236 から 339 までの間、また 1 文字ずつ出力します。
  これにより、最後の 7 行を出力します。

## 演習 4-1 の解答 {#answer-4-1}

    n=1; eval s="puts \"n=\#{ n+1 }; eval s=\" + s.dump"

`#{` の前にエスケープを入れていることに注意してください。
このように、種となる文字列自体では式展開を抑制し、
`eval`して初めて式展開が行われるようにタイミングを制御するのがポイントです。
本文の例では、外側が`%q(`…`)`なので式展開が行われず、
内側の`%(`…`)`で初めて式展開が行われるので、
たまたまうまいタイミングで展開されていました。
しかし、たまにこのタイミングを意識しないといけないことがあります。

## 演習 4-2 の解答 {#answer-4-2}

    eval s=%q(n=1; puts %(eval s=%q(#{ s.sub(/\d+/) { (n+1).to_s } })))

`n=1` が文字列 `s` の中に含まれているので、その数字部分を探し出して書き換えるのがポイントです。

## 演習 4-3 の解答 {#answer-4-3}
(1)

    eval s=%q(puts %(print q(print("eval s=%q(#{ s.gsub(34.chr, 92.chr<<34) })"));))

(2)

    eval s=%q(%(eval s=%q(#{ s })).each_byte {|c| puts '+'*c+'.>' })

## 演習 5-1 の解答 {#answer-5-1}

生成プログラムだけ示します。

    N = 8

    eval s=%q(puts "require_relative '_-2'"
    line = ""
    %(eval s=%q(#{s})).each_byte do |n|
      n.to_s(N).rjust(Math.log(126, N).ceil, "0").each_char do |d|
	d = d.to_i + 1
	if line.size + d > 50
	  puts line.strip
	  line = ""
	end
	line << "_" * d + " "
      end
    end
    puts line.strip)

アンダースコアだけの Hello, world! の生成プログラム（図 5-9）と比較してみてください。

## 演習 5-2 の解答 {#answer-5-2}

まず、変換前プログラムの最後にコメント記号を入れておきます。

    puts 'Hello, world!'#

このプログラムを巨大数化した数字を $$k$$ とします。
ここで、$$N = k \times 256^n + b$$ という数字を考えます。
$$n$$ は非負の整数、$$b$$ は $$0 \le b < 256^n$$ の整数です。

$$k$$ はプログラムの各文字を 256 進数の各桁として表しているので、
$$256^n$$ をかけると $$n$$ 桁増え、末尾に空きができます。
そこに $$b$$ の値がゴミ文字として入ってきます。
よって $$N$$ をデコードすると、次のような文字列になります。

    puts 'Hello, world!'#n個のゴミ文字

したがって、この $$N$$ も Hello, world! プログラムを表す整数と言えます。

厳密に言えば、ゴミ文字の中に改行文字が含まれると有効なプログラムにならなくなる可能性があります。
不安であれば、コメントの代わりにスクリプトの終わりを示す `__END__` という行を最後に置くことで、
確実にゴミ文字をスキップできます。ただし、プログラムは長くなります。

あとは、$$N$$ が素数になるような $$n$$ と $$b$$ を探せば終わりです。

このような巨大数の素数判定は、Ruby標準添付ライブラリの prime.rb には荷が重いでしょう。
擬素数（非常に高確率で素数だけど、ひょっとしたら素数じゃないかもしれない数）の判定でよければ、
OpenSSLを使えばかんたんです。

    require "openssl"

    SIGNATURE_1234567890 = "I don't believe in natural science."
    k = (SIGNATURE_1234567890 + "puts 'Hello, world!'#").unpack("H*")[0].hex

    n = 256
    loop do
      n.times do |b|
	if OpenSSL::BN.new((k * n + b).to_s(16), 16).prime?
	  puts %(require "1234567890"\n\n#{ k * n + b })
	  exit
	end
      end
      n *= 256
    end

確実な素数でないことが気になるようであれば、
ECPP 法や APRCL 法などの高度な素数判定プログラムを使ってください。
探せばフリーの実装もいくつか見つかるようです。
もちろん、これらの判定法を自分で実装してみても面白いでしょう。
ただし、ランダムな入力に対して OpenSSL の素数判定が誤る確率
（素数じゃないのに素数と判定してしまう確率）は
$$1/2^{80}$$ 以下だそうなので、取り越し苦労かもしれません。

> Both `BN_is_prime_ex()` and `BN_is_prime_fasttest_ex()` perform
> a Miller-Rabin probabilistic primality test with nchecks iterations.
> If `nchecks == BN_prime_checks`, a number of iterations is used
> that yields a false positive rate of at most 2^-80 for random input.
>
> “[BN_generate_prime - OpenSSL](https://www.openssl.org/docs/crypto/BN_generate_prime.html)”


この演習の元ネタ：『[違法素数 - Wikipedia](https://ja.wikipedia.org/wiki/%E9%81%95%E6%B3%95%E7%B4%A0%E6%95%B0)』


## 演習 6-1 の解答 {#answer-6-1}

筆者は7種類の文字で書く方法を見つけました（`$`、`>`、`<`、`,`、`'`、`/`、`+`）。
生成プログラムだけ載せます。

    print "$>.<<''"
    "Hello, world!\n".bytes.map do |c|
      print "<<" + ["$$/$$"] * c * "+"
    end

PID が 0 にならないことを仮定しています。
さらに少ない文字種で書く方法を見つけたら、ぜひ教えてください。

## 演習 6-2 の解答 {#answer-6-2}

[alpha-punct-uroboros-quine.gen.rb](https://github.com/mame/trance-book/blob/master/6-2/alpha-punct-uroboros-quine.gen.rb)が生成プログラムです。


全く最適化していないので非常に巨大なプログラムになります。
「小文字だけ」は 14371 行。でも、動くことは動きます。興味があれば小さくしてみてください。

    $ ruby alpha-punct-uroboros-quine.gen.rb > alpha-uroboros-quine.rb

    $ wc -l alpha-uroboros-quine.rb
    14371 alpha-uroboros-quine.rb

    $ head alpha-uroboros-quine.rb
    public
    def each
      clear
      concat begin
	dup ensure concat begin
	  clear
	  concat concat concat size
	  concat concat concat concat size
	  concat size
	  size

    $ ruby alpha-uroboros-quine.rb > punct-uroboros-quine.rb

    $ head -c 300 punct-uroboros-quine.rb
    __="_"=~/$/;_=__+__;->(&___){___["",""<<((_+__)*_*_*_+__)*_*_+__<<((((_+__)*_+__
    )*_*_+__)*_+__)*_<<(_+__)*_*_*_*_*_+__<<(((_+__)*_*_+__)*_+__)*_*_,""<<(_+__)*_*
    _*_*_*_+__<<(((_+__)*_*_+__)*_+__)*_*_<<((_+__)*_+__)*_*_*_*_<<((_+__)*_*_+__)*_
    *_*_<<(_+__)*_*_*_*_*_+__<<(((_+__)*_+__)*_+__)*_*_+__<<(_+_

    $ ruby punct-uroboros-quine.rb > alpha-uroboros-quine-2.rb

    $ diff -s alpha-uroboros-quine.rb alpha-uroboros-quine-2.rb
    ファイル alpha-uroboros-quine.rb と alpha-uroboros-quine-2.rb は同一です

    $ <-cursor

## 演習 7-1 の解答 {#answer-7-1}

あまり面白くないですが、C 言語でのリテラルのみ宇宙線耐性。

    #include <stdio.h>
    #include <string.h>

    int main(void) {
        int n = 11;
        char s1[] = "Hello, world!";
        char s2[] = "Hello, world!";

        puts(strlen(s1) > strlen(s2) ? s1 : s2);

        return n - n;
    }

2 つの `"Hello, world!"` のどちらかが壊されても、
このプログラムは `Hello, world!` を出力します。
なお、数値リテラル（このプログラム中では `11` のみ）が別の値に書き換えられた場合でも、
ちゃんと正常終了します。

浜地慎一郎さんによる、[Perl での宇宙線耐性 Quine](http://shinh.hatenablog.com/entries/2014/02/20) もあります。

## 演習 7-2 の解答 {#answer-7-2}

まず、変換前プログラムで使わない文字を決めます。
たとえば、大文字アルファベットなんかはなくても困らないでしょう。
変換前プログラムは `Hello, world!` の `H` を使っていますが、`72.chr' に置き換えます。

    puts 72.chr+'ello, world!';exit
    ~    ~~~~~   ~~~   ~  ~~  ~ ~

下線が引かれている文字は、文字集合Aに含まれていないため、
そのままでは表現できない文字です。
これらの文字を、使わないことにした文字で置換します。
たとえば、`p` は `P` に、`7` は `J` に、などと割り当てます。

    puts 72.chr+'ello, world!';exit
      ↓
    Puts JEBWMr+'YOOo, RorOX!';Yxit

この文字列なら文字集合 A で表現できます。
これを `String#tr` で元に戻せば、変換前のプログラムが得られます。

    "Puts JEBWMr+'YOOo, RorOX!';Yxit".tr("`^@-Z", "%\"().0-9hklpvw<*a-f")

なお、`"%\"().0-9hklpvw<*a-f"` という文字列は文字集合 A で表現できないので、
これ自体も `String#tr` を使って作り出す必要があります。

    proc_tr["qntuz|y","m-|","!-:"] +
      proc_tr[";jmnrxy>,","&-{","$-{"] +
      proc_tr["n:s",":-{","--{"]  #=> "%\"().0-9hklpvw<*a-f"

全体としては [lipo-hello2.rb](https://github.com/mame/trance-book/blob/master/7-2/lipo-hello2.rb) を参照してください。

これで、変換前プログラムを表す部分（`Puts JEBWMr`…）が 1 つの文字列になりました。
これによってアスキーアート化もかんたんになります。
まず生成時に、変換前プログラムを空白なしで書いておき、この範囲はアスキーアート化可とします。
そして実行時、`eval` する直前に空白を取り除きます。
これによって、変換前プログラムを表す部分は自由に成形できることになります。
なお、文字集合 A に `w` が含まれていないので、`%w(`…`)*""` というイディオムは使用できませんが、
代わりに `"`…`".tr(" \n", "")` とすることで空白を取り除けます。

7-2 項のリポグラム Quine では、大文字アルファベット、`@`、`^`、`‘`を
変換前プログラムで使わないようにしています。
そして、`.tr("%\"().0-9hklpvw<*a-f", "‘^@A-Z")`という対応を使っています。

## 演習 7-3 の解答 {#answer-7-3}

構成自体は解答 7-2 と同じですが、次の 2 点を変えます。

* 前半部分を `format` というローカル変数への代入にする
* 文字集合 B の文字を列挙した文字列を、`n` というローカル変数に代入する

これによって、次のようなプログラムになります。

    format= %%->{#({#){#.{#0{#1{#2{#3{#4{#5{#6{#7{#8{#9{#h{#k{#l{#p{#v{#w{#<{#*{#a{#b{#c{#d{#e{#f{#

      proc_tr = -> s,x,y { -> &_ { _[s,x,y]}[&:tr] }

      -> &_ {
        n = "().0123456789hklpvw<*abcdef\\";

        (A) 文字集合 A の文字だけを使う部分

    }[]%;

    eval"(eval((%w()<<%w( (B) 文字集合 B の文字だけを使う部分 )*%()).pack(%(h*))))"

どういう風に動くかを、消される文字ごとに場合分けして考えます。

* I）文字集合 A の文字が消された場合（ただし `o`、`r`、`m`、`t` 以外）

前半部分はローカル変数 `format` に文字列として代入されます。
その後、（B）の部分のプログラムが実行されます。

前半部分が丸ごとローカル変数 `format` に入っているので、
それと文字集合 A との差分を取れば何が消されたかわかります。

* II）文字集合 B の文字が消された場合（ただし `f`、`a` 以外）

ローカル変数 `format` は宣言されますが、代入が行われる前に（A）の部分が実行されます。
（`format` には `nil` が入っています）

ローカル変数 `n` の文字列のどれかが消えているはずなので、
文字集合 B と `n` の差分を取れば、何が消されたかわかります。

* III）`f`、`o`、`r`、`m`、`a`、`t` のいずれかが消された場合

（A）または（B）のいずれかが実行されます。
定義されているローカル変数一覧を返す `Kernel#local_variables` を使って、
たとえば `ormat` という変数が定義されているとわかれば、消されたのは `f` だと判断できます。

* IV）`%` が消された場合

文字列の式展開ではなく、ラムダ式として（A）の部分が実行されます（IIの場合と同じ）。
このとき、`n` の中の文字が 1 つも消えていなければ、`%` が消されたのだとわかります。

* V）`=` が消された場合

`=` が消えると、`format` への代入は `Kernel#format` の呼び出しに変わります。
`Kernel#format` は文字列を入力して文字列を返すメソッドですが、
結果を使っていないので実質的に意味はありません。
`format` も `ormat` も定義されないまま、（B）の部分が実行されます。
よって、`format` や `ormat` などが一切定義されていないときは、`=` が消されたのだとわかります。

以上をまとめると、変換前プログラムは次のようになります。

    if local_variables.include?(:format)
      if format
        # I)
        deleted_letters = [10.chr, *32.chr..126.chr] - (format + ?%).chars
      else
        # II) and IV)
        deleted_letters = '().0123456789hklpvw<*abcdef%'.chars - n.chars
      end

      # III)
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

      # IIV)
      deleted_letters = [?=]
    end

    p(deleted_letters.first) unless deleted_letters.empty?

    exit#/g

最終的なプログラムは [lipo-detect.rb](https://github.com/mame/trance-book/blob/master/7-2/lipo-detect.rb) のようになります。

1-9-2 項のリポグラム Quine では、まずこのテクニックを使って消された文字を検出し、
自分自身を出力する前に消された文字を削除しています。
これにより、文字を消される前のプログラムに戻るのではなく、
消された後のプログラム自体を出力するようになっています。
