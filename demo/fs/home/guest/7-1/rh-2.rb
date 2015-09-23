eval =eval="(puts 'Hello, world!'; exit)#"##"
/#{ eval eval if eval.size >= 29 }}/.i rescue##/
eval "
c = ((2380 - eval.sum) % 256).chr
eval.scan(//) {
  b = $` + c + $'
  eval b if b.unpack('H*')[0].hex % 65521 == 50656
}
eval eval
"##"
