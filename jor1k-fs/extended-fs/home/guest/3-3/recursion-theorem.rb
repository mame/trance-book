E = ->(p, s) { eval(p).call(s) }
f = "->(x){ puts(x); exit }"
h = "->(x){ \"->(y){ E[E[\#{ x.dump }, \#{ x.dump }], y] }\" }"
e = "->(x){ E[f, E[h, x]] }"
p = E[h, e]

puts p   # ->(y){ E[E["->(x){ E[f, E[h, x]] }", "->(x){ E[f, E[h, x]] }"], y] } が出力される

E[p, ""] # ->(y){ E[E["->(x){ E[f, E[h, x]] }", "->(x){ E[f, E[h, x]] }"], y] } が出力される
