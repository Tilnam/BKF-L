#set title 'Kennlinie'
set encoding utf8
set ylabel 'Kollektorstrom I_C in mA'
set yrange [0:850]
set xlabel 'Baisstrom I_B in mA'
set xtics 5
set key left nobox
set grid

set style line 1 lc rgb "black" pi 1 ps .5
set style line 2 lc rgb "black"  pi 2 ps .5
set style line 3 lc rgb "orange" lt 2 lw 2 
set style line 4 lc rgb "green" lt 2 lw 2 
set style line 5 lc rgb "orange" lt 1 lw 2 
set style line 6 lc rgb "green" lt 1 lw 2 

#set arrow from (13.68*5),0 to (13.68*5),16 nohead lc rgb "red"
#set label "5·{/Symbol t}" at (13.68*5.2),12

#set label "5·{/Symbol t}" at 90+(13.68*5.2),6
#set arrow from 90+(13.68*5),0 to 90+(13.68*5),8 nohead lc rgb "red"

set term eps
set output 'kennlinie.eps'
set termoption enhanced
set termoption dashed
set datafile separator ","

plot [0:20] 'data.csv' using 1:2 ls 1 title 'I_C=f(I_B)', \
'data.csv' using 1:2 ls 3 smooth csplines notitle 
