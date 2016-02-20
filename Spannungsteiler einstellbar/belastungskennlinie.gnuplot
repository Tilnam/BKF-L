#set title 'Belastungskennlinie'
set encoding utf8
set ylabel 'Spannung in V'
set yrange [0:10]
set xlabel 'R1/R2'
set xtics 1
set key on left top box
set grid

set style line 1 lc rgb '#0060ad' lt 1 lw 2 pi 1 ps .5
set style line 2 lc rgb '#dd181f' lt 9 lw 2 pi 2 ps .5
set style line 3 lc rgb '#29c524' lt 6 lw 2 pi 5 ps .5
set style line 4 lc rgb '#7D72F9' lt 7 lw 2 pi 7 ps .5

set term eps
set output 'belastungskennlinie.eps'
set termoption enhanced
set datafile separator ","
plot [0:10] 'data.csv' using 1:2 ls 1 title 'U_{L,∞}', 'data.csv' using 1:2 ls 1smooth csplines notitle, 'data.csv' using 1:3 ls 2 title 'U_{L,47Ω}', 'data.csv' using 1:3 ls 2 smooth csplines notitle, 'data.csv' using 1:4 ls 3 title 'U_{L, 470Ω}', 'data.csv' using 1:4 ls 3 smooth csplines notitle, 'data.csv' using 1:5 ls 4 title 'U_{L, 10kΩ}', 'data.csv' using 1:5 ls 4 smooth csplines notitle 
