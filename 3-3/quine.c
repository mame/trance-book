char s[] =
  "char s[]=@;int main(){char*p;for(p=s;*p;p++){if(*p!=64){putchar(*p);}else{putchar(34);printf(s);putchar(34);}}}";
int main()
{
  char *p;
  for (p = s; *p; p++) {
    if (*p != 64) {
      putchar(*p);
    }
    else {
      putchar(34);
      printf(s);
      putchar(34);
    }
  }
}
