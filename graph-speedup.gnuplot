# vim: set et ft=gnuplot sw=4 :

set terminal tikz color size 4.5in,2.6in font '\scriptsize'

set size square

set output "gen-graph-speedup.tex"

set key outside right center height 1 spacing 1.2 samplen 3

set border 3

set xlabel "Sequential runtime (ms)"
set ylabel "Parallel runtime (ms)"
set logscale xy
set xtics nomirror
set ytics nomirror
set grid
set xrange [1:1e8]
set yrange [1:1e8]
set grid
set format x '$10^{%T}$'
set format y '$10^{%T}$'

plot \
    "graph-speedup.data" u (($2 == 0 && $3 == 2) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 7 lc 1 notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 2) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 6 lc 1 notitle, \
    "graph-speedup.data" u (($2 == 0 && $3 == 3) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 7 lc 3 notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 3) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 4 lc 3 notitle, \
    "graph-speedup.data" u (($2 == 0 && $3 == 4) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 7 lc 6 notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 4) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 4 lc 6 notitle, \
    "graph-speedup.data" u (($2 == 0 && $3 == 5) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 9 lc 5 notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 5) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 8 lc 5 notitle, \
    "graph-speedup.data" u (($2 == 0 && $3 == 6) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 9 lc 4 notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 6) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 8 lc 4 notitle, \
    "graph-speedup.data" u (($2 == 0 && $3 == 1) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 11 lc 7 notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 1) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 10 lc 7 notitle, \
    "graph-speedup.data" u (($2 == 0 && $3 == 7) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 13 lc 2 notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 7) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 12 lc 2 notitle, \
    "graph-speedup.data" u (($2 == -1) ? ($5<1?1:$5) : NaN):($6<1?1:$6) pt 2 lc 0 ps 10 notitle, \
    x w l lt 1 lc 0 title '$1\times$', \
    x / 16 w l lt 1 lc 0 dt '-' title '$16\times$', \
    NaN w p ps 0 ti "~", \
    NaN w p ps 1.5 pt 6 lc 1 ti "LV (sat)", \
    NaN w p ps 1.5 pt 7 lc 1 ti "LV (unsat)", \
    NaN w p ps 1.5 pt 4 lc 3 ti "BVG", \
    NaN w p ps 1.5 pt 4 lc 6 ti "BVGm", \
    NaN w p ps 1.5 pt 8 lc 5 ti "M4D", \
    NaN w p ps 1.5 pt 8 lc 4 ti "M4Dr", \
    NaN w p ps 1.5 pt 10 lc 7 ti "SF (sat)", \
    NaN w p ps 1.5 pt 11 lc 7 ti "SF (unsat)", \
    NaN w p ps 1.5 pt 12 lc 2 ti "r"
