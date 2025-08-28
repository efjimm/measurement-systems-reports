#!/usr/bin/gnuplot
set terminal pdfcairo size 8,6
set datafile  separator ','
set key noautotitle
set grid

# Graph 1

set output 'graph-noise.pdf'
set xlabel 'Time (seconds)'
set ylabel 'Voltage'
set title 'Noise signal'

set yrange [-5:5]

plot 'base.csv' using 7:8 with lines

set output 'graph-clean.pdf'
set title 'Clean signal'
plot 'base.csv' using 13:14 with lines

set output 'graph-sum.pdf'
set title 'Clean + noise'
plot 'base.csv' using 1:2 with lines

set output 'graph-2nd.pdf'
set title '2nd Order Filter'
plot '2nd.csv' using 1:2 with lines

set output 'graph-4th.pdf'
set title '4th Order Filter'
plot '4th.csv' using 1:2 with lines

set output 'graph-2nd-zoomed.pdf'
set title '2nd Order Filter (zoomed)'
set xrange [0.002444:0.00246]
set yrange [2.96:3.06]
plot '2nd.csv' using 1:2 with lines

set output 'graph-4th-zoomed.pdf'
set title '4th Order Filter (zoomed)'
set xrange [0.0023445:0.002362]
set yrange [2.675:2.775]
plot '4th.csv' using 1:2 with lines

set output 'graph-clean-noisy.pdf'
set title 'Clean and noisy signal'
set xrange [*:*]
set yrange [*:*]
plot 'clean-noisy.csv' using 7:8 with lines title 'noisy signal' lt rgb 'orange', 'clean-noisy.csv' using 10:11 with lines title 'clean signal' lt rgb 'blue'

set output 'graph-sum-2nd.pdf'
set title 'Noisy signal and 2nd order filtered signal'
plot 'sum-2nd.csv' using 7:8 with lines title 'noisy signal' lt rgb 'orange', 'sum-2nd.csv' using 4:5 with lines title '2nd order filtered' lt rgb 'blue'

set output 'graph-sum-4th.pdf'
set title 'Noisy signal and 4th order filtered signal'
plot 'sum-4th.csv' using 7:8 with lines title 'noisy signal' lt rgb 'orange', 'sum-4th.csv' using 1:2 with lines title '4th order filtered' lt rgb 'blue'

set output 'graph-2nd-4th.pdf'
set title '2nd order filtered and 4th order filtered signal'
plot 'sum-2nd.csv' using 4:5 with lines title '2nd order filtered' lt rgb 'orange', 'sum-4th.csv' using 1:2 with lines title '4th order filtered' lt rgb 'blue'
