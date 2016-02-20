#set title 'Belastungskennlinie'
set encoding utf8
set ylabel 'Spannung U_L in V'
set yrange [0:10]
set ytics

set y2label 'Strom I_L in mA'
set y2range [0:100]
set y2tics

set xlabel 'Lastwiderstand R_L in Ω'
set key on left top
set grid 
set logscale x

set style line 1 lc rgb '#0060ad' lt 1 lw 2 pi 1 ps .5
set style line 2 lc rgb '#dd181f' lt 9 lw 2 pi 2 ps .5
set style line 3 lc rgb '#29c524' lt 6 lw 2 pi 5 ps .5

set term eps
set output 'diagramme.eps'
set termoption enhanced

set label 1 at 11000,8 '200'
set label 2 at 11000,6 '150'
set label 3 at 11000,4 '100'
set label 4 at 11000,2 '50'
set label 5 at 30000,2.6 'Leistung P_{el} in mW' rotate left
set arrow from 10000,0 to 10000,10 nohead
set arrow from 9300,2 to 10000,2 nohead
set arrow from 9300,4 to 10000,4 nohead
set arrow from 9300,6 to 10000,6 nohead
set arrow from 9300,8 to 10000,8 nohead

set datafile separator ","

plot [1:50000] 'data.csv' using 1:2 ls 1 title 'U_{L}' axes x1y1, \
'data.csv' using 1:2 ls 1 smooth csplines notitle axes x1y1, \
'data.csv' using 1:3 ls 2 title 'I_L' axes x1y2, \
'data.csv' using 1:3 ls 2 smooth csplines notitle axes x1y2, \
'data.csv' using 1:($4/25) ls 3 title 'P_{el}' axes x1y1, \
'data.csv' using 1:($4/25) ls 3 smooth csplines notitle axes x1y1 
