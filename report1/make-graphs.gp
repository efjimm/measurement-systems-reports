#!/usr/bin/gnuplot
set terminal pdfcairo size 8,6
set datafile  separator ","
set key noautotitle
set grid

# Graph 1

file = 'data1.csv'
stats file u (lx=strcol(1), ly=strcol(2)) every ::0::0 nooutput

set output 'gout1.pdf'
set xlabel lx
set ylabel ly
set title 'Rg vs Vo'

set xrange [0:55000]
set yrange [0:5]

plot file using 1:2 with points

# Graph 2

file = 'data2.csv'
stats file u (lx=strcol(1), ly=strcol(2)) every ::0::0 nooutput

set output 'gout2.pdf'
set xlabel lx
set ylabel ly
set title 'Voltage transfer characteristic'

set xrange [*:0.26]
set yrange [*:12]
plot file using 1:2 with points

# Graph 3

file = 'data3.csv'
stats file u (lx=strcol(1), ly=strcol(2)) every ::0::0 nooutput

set output 'gout3.pdf'
set xlabel lx
set ylabel ly
set title 'Voltage transfer characteristic'

set xrange [*:*]
set yrange [*:*]
plot file using 1:2 with points

# Graph 4, 100dB

file = 'data4.csv'
stats file u (lx=strcol(1), ly=strcol(3)) every ::0::0 nooutput

set output 'gout4.pdf'
set xlabel lx
set ylabel ly
set title 'Frequency vs gain (100dB)'

set xrange [*:105000]
set yrange [*:*]
plot file using 1:3 with points

# Graph 5, 10dB

file = 'data5.csv'
stats file u (lx=strcol(1), ly=strcol(3)) every ::0::0 nooutput

set output 'gout5.pdf'
set xlabel lx
set ylabel ly
set title 'Frequency vs gain (10dB)'

set xrange [*:105000]
set yrange [*:*]
plot file using 1:3 with points

# Graph 6, Multisim 100dB

file = 'sim-100dB.csv'
stats file u (lx=strcol(1), ly=strcol(3)) every ::0::0 nooutput

set output 'gout6.pdf'
set xlabel lx
set ylabel ly
set title 'Frequency vs gain (Multsim 100dB)'

set xrange [*:105000]
set yrange [*:*]
plot file using 1:2 with points

# Graph 7, Multisim 10dB

file = 'sim-10dB.csv'
stats file u (lx=strcol(1), ly=strcol(3)) every ::0::0 nooutput

set output 'gout7.pdf'
set xlabel lx
set ylabel ly
set title 'Frequency vs gain (Multisim 10dB)'

set xrange [*:105000]
set yrange [*:*]
plot file using 1:2 with points
