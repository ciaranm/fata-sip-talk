# vim: set et ft=gnuplot sw=4 :

set terminal tikz color size 3.5in,2.6in font '\scriptsize'

set output "gen-graph-features.tex"

set multiplot

set border 3

set nokey
set xlabel "Runtime (ms)"
set ylabel "Cumulative Number of Instances Solved" offset 3
set logscale x
set xtics nomirror
set ytics nomirror add ('\raisebox{1mm}{2063}' 2063)
set grid
set xrange [1:1e8]
set yrange [0:2063]
set format x '$10^{%T}$'

set arrow from 2277e3, 1910 to screen 0.8, screen 0.8 lw 1 back filled

set arrow from 60e3,1910 to 86400e3,1910 front nohead
set arrow from 60e3,2030 to 86400e3,2030 front nohead
set arrow from 60e3,1910 to 60e3,2030 front nohead
set arrow from 86400e3,1910 to 86400e3,2030 front nohead

plot \
    "graph-cumulative.data" u ($4):($4 >= 1e8 ? 1e-10 : 1) smooth cumulative notitle lc 4, \
    "graph-cumulative.data" u ($3):($3 >= 1e8 ? 1e-10 : 1) smooth cumulative notitle lc 2, \
    "graph-cumulative.data" u ($5):($5 >= 1e8 ? 1e-10 : 1) smooth cumulative notitle lc 1, \
    "graph-cumulative.data" u ($6):($6 >= 1e8 ? 1e-10 : 1) smooth cumulative notitle lc 3

set size 0.4, 0.5
set origin 0.6, 0.3
set bmargin 0; set tmargin 0; set lmargin 0; set rmargin 0
unset arrow
set border 15
clear

set nokey
set xrange [60e3:86400e3]
set xtics 0e3 add ("1m" 60e3) add ("1h" 3600e3) add ("1d" 86400e3) mirror
set ytics mirror
set yrange [1910:2030]
set xlabel ""
set ylabel ""
set grid xtics ytics mytics

plot \
    "graph-cumulative.data" u ($4 >= 86400e3 ? 86400e3 : $4):($4 >= 86400e3 ? 1e-10 : 1) smooth cumulative ti '\raisebox{1.4mm}{Sequential}' at end lc 4, \
    "graph-cumulative.data" u ($3 >= 86400e3 ? 86400e3 : $3):($3 >= 86400e3 ? 1e-10 : 1) smooth cumulative ti '\raisebox{-0.65mm}{No Backjumping}' at end lc 2, \
    "graph-cumulative.data" u ($5 >= 86400e3 ? 86400e3 : $5):($5 >= 86400e3 ? 1e-10 : 1) smooth cumulative ti '\raisebox{0mm}{No Supplementals}' at end lc 1, \
    "graph-cumulative.data" u ($6 >= 86400e3 ? 86400e3 : $6):($6 >= 86400e3 ? 1e-10 : 1) smooth cumulative ti '\raisebox{1.1mm}{No Counting}' at end lc 3

unset multiplot
