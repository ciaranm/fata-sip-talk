# vim: set et ft=gnuplot sw=4 :

set terminal tikz color size 3.5in,2.6in font '\scriptsize'

set output "gen-graph-parallel.tex"

set multiplot

set border 3

set nokey
set xlabel "Runtime (ms)"
set ylabel "Cumulative Number of Instances Solved" offset 3
set logscale x
set xtics nomirror
set ytics nomirror add ('\raisebox{1mm}{2063}' 2063)
set grid xtics ytics mytics
set xrange [1:1e8]
set yrange [0:2063]
set mytics 5
set format x '$10^{%T}$'

plot \
    "graph-cumulative.data" u ($7):($7 >= 1e8 ? 1e-10 : 1) smooth cumulative ti '\raisebox{3.5mm}{Parallel}' at end lc 7, \
    "graph-cumulative.data" u ($4):($4 >= 1e8 ? 1e-10 : 1) smooth cumulative ti '\raisebox{1mm}{Sequential}' at end lc 4, \
    "graph-cumulative.data" u ($9):($9 >= 1e8 ? 1e-10 : 1) smooth cumulative ti '\raisebox{-1mm}{SND}' at end lc 3, \
    "graph-cumulative.data" u ($2):($2 >= 1e8 ? 1e-10 : 1) smooth cumulative ti '\raisebox{-3mm}{LAD}' at end lc 1, \
    "graph-cumulative.data" u ($8):($8 >= 1e8 ? 1e-10 : 1) smooth cumulative ti 'VF2' at end lc 2

