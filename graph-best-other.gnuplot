# vim: set et ft=gnuplot sw=4 :

set terminal tikz color size 4.5in,2.6in font '\scriptsize'

set size square

set output "gen-graph-best-other.tex"

set key outside right center height 1 spacing 1.2 width 3

set border 3

set xlabel "Virtual best other solver runtime (ms)"
set ylabel "Our runtime (ms)"
set logscale xy
set xtics nomirror
set ytics nomirror
set grid
set xrange [1:1e8]
set yrange [1:1e8]
set format x '$10^{%T}$'
set format y '$10^{%T}$'

set arrow from 19788,3e7 to 8245,8e7 lw 1 back filled
set label 1 'EHP' at 10993,6e7 left offset character 0.2,character -1

plot \
    "graph-best-other.data" u (($3 == 1 && $2 == 0 && $9 < $5 && $9 < $8 && $9 < 1e8)?$9:NaN):($7):(1) w p ps variable lc "#009dec" pt 11 notitle, \
    "graph-best-other.data" u (($3 == 1 && $2 == 0 && $5 <= $8 && $5 <= $9 && $5 < 1e8)?$5:NaN):($7):(1) w p ps variable lc "#951272" pt 11 notitle, \
    "graph-best-other.data" u (($3 == 1 && $2 == 0 && $8 < $5 && $8 <= $9 && $8 < 1e8)?$8:NaN):($7):(1) w p ps variable lc "#84bd00" pt 11 notitle, \
    "graph-best-other.data" u (($3 == 1 && $2 == 1 && $9 < $5 && $9 < $8 && $9 < 1e8)?$9:NaN):($7):(1) w p ps variable lc "#009dec" pt 10 notitle, \
    "graph-best-other.data" u (($3 == 1 && $2 == 1 && $5 <= $8 && $5 <= $9 && $5 < 1e8)?$5:NaN):($7):(1) w p ps variable lc "#951272" pt 10 notitle, \
    "graph-best-other.data" u (($3 == 1 && $2 == 1 && $8 < $5 && $8 <= $9 && $8 < 1e8)?$8:NaN):($7):(1) w p ps variable lc "#84bd00" pt 10 notitle, \
    "graph-best-other.data" u (($3 == 2 && $2 == 0 && $9 < $5 && $9 < $8 && $9 < 1e8)?$9:NaN):($7):(1) w p ps variable lc "#009dec" pt 7 notitle, \
    "graph-best-other.data" u (($3 == 2 && $2 == 0 && $5 <= $8 && $5 <= $9 && $5 < 1e8)?$5:NaN):($7):(1) w p ps variable lc "#951272" pt 7 notitle, \
    "graph-best-other.data" u (($3 == 2 && $2 == 0 && $8 < $5 && $8 <= $9 && $8 < 1e8)?$8:NaN):($7):(1) w p ps variable lc "#84bd00" pt 7 notitle, \
    "graph-best-other.data" u (($3 == 2 && $2 == 1 && $9 < $5 && $9 < $8 && $9 < 1e8)?$9:NaN):($7):(1) w p ps variable lc "#009dec" pt 6 notitle, \
    "graph-best-other.data" u (($3 == 2 && $2 == 1 && $5 <= $8 && $5 <= $9 && $5 < 1e8)?$5:NaN):($7):(1) w p ps variable lc "#951272" pt 6 notitle, \
    "graph-best-other.data" u (($3 == 2 && $2 == 1 && $8 < $5 && $8 <= $9 && $8 < 1e8)?$8:NaN):($7):(1) w p ps variable lc "#84bd00" pt 6 notitle, \
    "graph-best-other.data" u (($3 == 3 && $2 == 1 && $9 < $5 && $9 < $8 && $9 < 1e8)?$9:NaN):($7):(1) w p ps variable lc "#009dec" pt 4 notitle, \
    "graph-best-other.data" u (($3 == 3 && $2 == 1 && $5 <= $8 && $5 <= $9 && $5 < 1e8)?$5:NaN):($7):(1) w p ps variable lc "#951272" pt 4 notitle, \
    "graph-best-other.data" u (($3 == 3 && $2 == 1 && $8 < $5 && $8 <= $9 && $8 < 1e8)?$8:NaN):($7):(1) w p ps variable lc "#84bd00" pt 4 notitle, \
    "graph-best-other.data" u (($3 == 4 && $2 == 1 && $9 < $5 && $9 < $8 && $9 < 1e8)?$9:NaN):($7):(1) w p ps variable lc "#009dec" pt 4 notitle, \
    "graph-best-other.data" u (($3 == 4 && $2 == 1 && $5 <= $8 && $5 <= $9 && $5 < 1e8)?$5:NaN):($7):(1) w p ps variable lc "#951272" pt 4 notitle, \
    "graph-best-other.data" u (($3 == 4 && $2 == 1 && $8 < $5 && $8 <= $9 && $8 < 1e8)?$8:NaN):($7):(1) w p ps variable lc "#84bd00" pt 4 notitle, \
    "graph-best-other.data" u (($3 == 5 && $2 == 1 && $9 < $5 && $9 < $8 && $9 < 1e8)?$9:NaN):($7):(1) w p ps variable lc "#009dec" pt 8 notitle, \
    "graph-best-other.data" u (($3 == 5 && $2 == 1 && $5 <= $8 && $5 <= $9 && $5 < 1e8)?$5:NaN):($7):(1) w p ps variable lc "#951272" pt 8 notitle, \
    "graph-best-other.data" u (($3 == 5 && $2 == 1 && $8 < $5 && $8 <= $9 && $8 < 1e8)?$8:NaN):($7):(1) w p ps variable lc "#84bd00" pt 8 notitle, \
    "graph-best-other.data" u (($3 == 6 && $2 == 1 && $9 < $5 && $9 < $8 && $9 < 1e8)?$9:NaN):($7):(1) w p ps variable lc "#009dec" pt 8 notitle, \
    "graph-best-other.data" u (($3 == 6 && $2 == 1 && $5 <= $8 && $5 <= $9 && $5 < 1e8)?$5:NaN):($7):(1) w p ps variable lc "#951272" pt 8 notitle, \
    "graph-best-other.data" u (($3 == 6 && $2 == 1 && $8 < $5 && $8 <= $9 && $8 < 1e8)?$8:NaN):($7):(1) w p ps variable lc "#84bd00" pt 8 notitle, \
    "graph-best-other.data" u (($3 == 7 && $2 == 1 && $9 < $5 && $9 < $8 && $9 < 1e8)?$9:NaN):($7):(1) w p ps variable lc "#009dec" pt 12 notitle, \
    "graph-best-other.data" u (($3 == 7 && $2 == 1 && $5 <= $8 && $5 <= $9 && $5 < 1e8)?$5:NaN):($7):(1) w p ps variable lc "#951272" pt 12 notitle, \
    "graph-best-other.data" u (($3 == 7 && $2 == 1 && $8 < $5 && $8 <= $9 && $8 < 1e8)?$8:NaN):($7):(1) w p ps variable lc "#84bd00" pt 12 notitle, \
    "graph-best-other.data" u (($3 == 2 && $2 == 0 && $8 >= 1e8 && $8 >= 1e8 && $9 >= 1e8)?1e8:NaN):($7):(1) w p ps variable lc 0 pt 7 notitle, \
    "graph-best-other.data" u (($3 == 2 && $2 == 1 && $8 >= 1e8 && $8 >= 1e8 && $9 >= 1e8)?1e8:NaN):($7):(1) w p ps variable lc 0 pt 6 notitle, \
    "graph-best-other.data" u (($3 == 7 && $2 == 1 && $8 >= 1e8 && $8 >= 1e8 && $9 >= 1e8)?1e8:NaN):($7):(1) w p ps variable lc 0 pt 12 notitle, \
    "graph-best-other.data" u (($2 == -1 && $5<1e8)?$5:NaN):($7):(1) w p ps 10 lc 0 pt 1 notitle, \
    "graph-best-other.data" u (($2 == -1 && $8<1e8)?$8:NaN):($7):(1) w p ps 10 lc 0 pt 1 notitle, \
    "graph-best-other.data" u (($2 == -1 && $9<1e8)?$9:NaN):($7):(1) w p ps 10 lc 0 pt 1 notitle, \
    x w l lt 0 notitle, \
    NaN w p ps 1.5 pt 7 lc "#009dec" ti "SND", \
    NaN w p ps 1.5 pt 7 lc "#951272" ti "LAD", \
    NaN w p ps 1.5 pt 7 lc "#84bd00" ti "VF2", \
    NaN w p ps 0 ti "~", \
    NaN w p ps 1.5 pt 6 lc 8 ti "LV (sat)", \
    NaN w p ps 1.5 pt 7 lc 8 ti "LV (unsat)", \
    NaN w p ps 1.5 pt 4 lc 8 ti "BVG / BVGm", \
    NaN w p ps 1.5 pt 8 lc 8 ti "M4D / M4Dr", \
    NaN w p ps 1.5 pt 10 lc 8 ti "SF (sat)", \
    NaN w p ps 1.5 pt 11 lc 8 ti "SF (unsat)", \
    NaN w p ps 1.5 pt 12 lc 8 ti "r"

