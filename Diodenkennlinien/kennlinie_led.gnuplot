#set title 'Belastungskennlinie'
set xlabel 'Spannung in V'
set yrange [0:10]
set ylabel 'Strom in mA'
set grid
set key top left
set term eps
set termoption enhanced
set output 'kennlinie_led.eps'
set datafile separator ","
#set arrow from 7.2,0 to 7.2,f(7.2) nohead
#set arrow from 0,f(7.2) to 7.2,f(7.2) nohead
set style line 1 lc rgb "black" pi 1 ps .5
set style line 3 lc rgb "red" lt 2 lw 2

set arrow from 1.85,0 to 2.07,9 nohead
set label "U_{TO}" at 1.8,-0.2

plot [0:2.5] 'data_led_transposed.csv' using 1:2 ls 1 title "Messwerte", \
'data_led_transposed.csv' using 1:2 ls 3 smooth csplines notitle
