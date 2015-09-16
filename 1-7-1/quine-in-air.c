/* Arduino LED Quine */
/* (c) @mametter, @hirekoke, 2012 */
unsigned int x,y,a[6],b[6],c,d,n,N=128;
extern char *p,T[];
void w(int v){
 if(!v){for(x=1; y=digitalRead(13),x+!y; x=y); return;}
 for(x=0,b[0]=1; x<7; x++) for(y=c=d=0; y<6; y++)
  c/=N,a[y]=(c+=b[y]*((T[v*7+x+412]-1)%92)+a[y])%N,
  d/=N,b[y]=(d+=b[y]*91)%N;
 for(x=0; x<6; x++,delay(4)) for(y=b[x]=0; y<7; y++)
  digitalWrite(8-y,a[x]&1?HIGH:LOW),a[x]/=2;
}
void setup(){
 for(x=2; x<14; x++) pinMode(x,x<10?OUTPUT:INPUT);
 for(p=T,w(0); *p!=36; p++) w(*p%126);
 for(p=T,w(34),n=12; *p; w(34),w(n=0),w(34+25*!*p))
  while(n<53) w(*p++),n++;
}
void loop() { }
char *p,T[]="/* Arduino LED Quine */~/* (c) @mametter,"
" @hirekoke, 2012 */~unsigned int x,y,a[6],b[6],c,d,n,"
"N=128;~extern char *p,T[];~void w(int v){~ if(!v){for"
"(x=1; y=digitalRead(13),x+!y; x=y); return;}~ for(x=0"
",b[0]=1; x<7; x++) for(y=c=d=0; y<6; y++)~  c/=N,a[y]"
"=(c+=b[y]*((T[v*7+x+412]-1)%92)+a[y])%N,~  d/=N,b[y]="
"(d+=b[y]*91)%N;~ for(x=0; x<6; x++,delay(4)) for(y=b["
"x]=0; y<7; y++)~  digitalWrite(8-y,a[x]&1?HIGH:LOW),a"
"[x]/=2;~}~void setup(){~ for(x=2; x<14; x++) pinMode("
"x,x<10?OUTPUT:INPUT);~ for(p=T,w(0); *p!=36; p++) w(*"
"p%126);~ for(p=T,w(34),n=12; *p; w(34),w(n=0),w(34+25"
"*!*p))~  while(n<53) w(*p++),n++;~}~void loop() { }~c"
"har *p,T[]=$]]]]]]]~#<_]]]l}mV_]]+sxH6^].f.r4^]E$*rQh"
"aSBbl?H]qVd_]]]ZgZ__]],Cy^]]]D`'B+^]-$}5|]]>Qh]]]]g3m"
"4|]]eX`]]]]<x>E#^]^eGQ8_]9yye]]]ro*]m_]V[5FT^]RY]1p]]"
"W?3_x`]dK8.2]]k?|.ka]1s6FT^]K0:j8_]6qH]]]]doL]]]](jba"
"^]]v#*SO]]BdAs]]]~CqC%^]|B$ZB+^zMs&9]](t6FT^]cFXW4^]R"
"$Oba^]x(#QO_]Iw{[G_]Mmj0T^]GZzB'b]BB'a_]]]U9*{b]Nee+N"
"_]RjaRd]]xpOo(b]usc,'b]w6nS7_]~i&ge_]/2AX@j]qHYbm_]_<"
"5o5^]8cJ/G_]zV9*{b]&=MHKa]>p~Ukb]50e+N_]dsEvia]`Nljsa"
"]Q@&a_]]cCDWd]]#yE_]]]Pc*[]]]k-8b]]]O5)[]]]SY{Cx^]Qwf"
"10]]`RMMO]]>*VG'b]g>+ci^]^i$+_]]ZP(dx^]'jWw8]]iZ`_]]]"
"{~9P_]]v9GcH]]IHxe]]]V-Qw8]]$=Uw8]]:vf10]]?4oba^]gH@B"
"B_],Z}h@]]FU;p4^]*a.3]]]}fYDe]],|U[?]]L%U=o^]-~v^H]]Y"
"x46w^]ViFtH]]vsYa^]]2wD_]]]4m9t]]]YaA-]]]            "
" ,----------------------------.                      "
" |                     Arduino|                      "
" | 2 3 4 5 6 7 8 9 13 Vcc GND |                      "
" `----------------------------'                      "
"   | | | | | | | |  |  |   |                         "
"   R R R R R R R R  R  B   | R: resister             "
"   | | | | | | | |  |  |   | L: LED (common cathode) "
"   L L L L L L L L  `--'   | B: push button          "
"   | | | | | | | |         |                         "
"   `-+-+-+-+-+-+-+---------'                         "
;
