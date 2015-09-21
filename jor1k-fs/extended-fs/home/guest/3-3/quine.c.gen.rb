src = <<END
char_s[]=@;
int_main(){
  char *p;
  for (p=s; *p; p++){
    if (*p != 64){
      putchar(*p);
    }
    else {
      putchar(34);
      printf(s);
      putchar(34);
    }
  }
}
END

# 空白を取り除く (ただし int main とかの間は空白のまま)
src = src.gsub(/\s/m, "").gsub("_", " ")

# 繰り返し部分を埋める
src = src.sub("@") { src.dump }

# 出来上がったプログラムを出力する
print src
