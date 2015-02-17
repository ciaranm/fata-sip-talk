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

set arrow from 2e7,5.8e2 to 8e7,5.8e2 lw 1 front  filled
set label 1 'EHP' at 2e7,5.8e2 right offset character 0.1,character 0

set arrow from 5e4,4e5 to 2.55e5,1.8e5 lw 1 front filled
set arrow from 5e4,5e5 to 8.5e5,4.7e5 lw 1 front filled
set arrow from 5e4,6e5 to 1.2e6,9.8e5 lw 1 front filled
set label 2 'Better balance needed' at 5.2e4,5.5e5 right offset character 0.1,character 0

set arrow from 3e5,5.1e6 to 1.8e6,5.1e6 lw 1 front  filled
set label 3 'Cache effect? Bad HT scheduling?' font '\tiny' at 3e5,5.1e6 right offset character 0.3,character 0.1
set label 4 '(Semireproducible, Intel HW only)' font '\tiny' at 3e5,5.1e6 right offset character 0.9,character -0.7

plot \
    "graph-speedup.data" u (($2 == 0 && $3 == 7) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 13 lc "#84bd00" notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 7) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 12 lc "#84bd00" notitle, \
    "graph-speedup.data" u (($2 == 0 && $3 == 2) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 7 lc "#951272" notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 2) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 6 lc "#951272" notitle, \
    "graph-speedup.data" u (($2 == 0 && $3 == 3) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 7 lc "#009dec" notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 3) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 4 lc "#009dec" notitle, \
    "graph-speedup.data" u (($2 == 0 && $3 == 4) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 7 lc "#5b4d94" notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 4) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 4 lc "#5b4d94" notitle, \
    "graph-speedup.data" u (($2 == 0 && $3 == 5) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 9 lc "#ffdc36" notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 5) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 8 lc "#ffdc36" notitle, \
    "graph-speedup.data" u (($2 == 0 && $3 == 6) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 9 lc "#ffb948" notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 6) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 8 lc "#ffb948" notitle, \
    "graph-speedup.data" u (($2 == 0 && $3 == 1) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 11 lc "#b30c00" notitle, \
    "graph-speedup.data" u (($2 == 1 && $3 == 1) ? ($5<1?1:$5) : NaN):($6<1?1:$6):(1) ps variable pt 10 lc "#b30c00" notitle, \
    "graph-speedup.data" u (($2 == -1 && ($5 < 1e8 || $6 < 1e8)) ? ($5<1?1:$5) : NaN):($6<1?1:$6) pt 2 lc 0 ps 10 notitle, \
    x w l lt 1 lc 0 title '$1\times$', \
    x / 16 w l lt 1 lc 0 dt '-' title '$16\times$', \
    NaN w p ps 0 ti "~", \
    NaN w p ps 1.5 pt 6 lc "#951272" ti "LV (sat)", \
    NaN w p ps 1.5 pt 7 lc "#951272" ti "LV (unsat)", \
    NaN w p ps 1.5 pt 4 lc "#009dec" ti "BVG", \
    NaN w p ps 1.5 pt 4 lc "#5b4d94" ti "BVGm", \
    NaN w p ps 1.5 pt 8 lc "#ffdc36" ti "M4D", \
    NaN w p ps 1.5 pt 8 lc "#ffb948" ti "M4Dr", \
    NaN w p ps 1.5 pt 10 lc "#b30c00" ti "SF (sat)", \
    NaN w p ps 1.5 pt 11 lc "#b30c00" ti "SF (unsat)", \
    NaN w p ps 1.5 pt 12 lc "#84bd00" ti "r"

