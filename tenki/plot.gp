set terminal png size 1200,600
set output 'plot.png'

set nokey
set xtics font 'YukarryAA, 14'
set ytics font 'YukarryAA, 15'
set xtics rotate by -60
set xdata time
set timefmt "%m/%d %H:%M"
set style fill solid border lc rgb "#00ffff"
set style line 1 lc rgb "#bbffff"
set style data filledcurves x1

set yrange [0:100]
set grid
set tmargin 1
set multiplot

set size 0.5,1
set format x "%m/%d %H:%M"
set format y "%2.0f%%"
plot 'data' every ::0::150 using 1:3 smooth csplines linestyle 1 lw 3 with filledcurves

set origin 0.5,0
set format x "%m/%d      "
set format y ""
plot 'data' using 1:3 smooth csplines linestyle 1 lw 3 with filledcurves
