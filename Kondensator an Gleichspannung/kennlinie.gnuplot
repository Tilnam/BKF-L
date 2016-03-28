#set title 'Kennlinie'
set encoding utf8
set ylabel 'Spannung U_c in V'
set yrange [0:16]
set xlabel 'Zeit t in s'
set xtics 20
set key nobox
set grid

set style line 1 lc rgb "black" pi 1 ps .5
set style line 2 lc rgb "black"  pi 2 ps .5
set style line 3 lc rgb "orange" lt 2 lw 2 
set style line 4 lc rgb "green" lt 2 lw 2 
set style line 5 lc rgb "orange" lt 1 lw 2 
set style line 6 lc rgb "green" lt 1 lw 2 
e=2.7182818284
f(x) = 8*(1-e**(-x/13.68))
g(x) = 16*(1-e**(-x/13.68))
h(x) = 8*(e**(-(x-90)/13.68))
i(x) = 16*(e**(-(x-90)/13.68))

set term eps
set output 'kennlinie.eps'
set termoption enhanced
set termoption dashed
set datafile separator ","
plot [0:180] 'data.csv' using 1:2 ls 1 title 'U_{G}=8V', \
'data.csv' using 1:2 ls 3 smooth csplines notitle, \
'data.csv' using 1:3 ls 2 title 'U_{G}=16V', \
'data.csv' using 1:3 ls 3 smooth csplines title 'laden', \
'data.csv' using 1:4 ls 1 notitle, \
'data.csv' using 1:4 ls 4 smooth csplines notitle, \
'data.csv' using 1:5 ls 2 notitle, \
'data.csv' using 1:5 ls 4 smooth csplines title 'entladen',\
(x<=90) ? f(x) : 1/0 with lines ls 5 title 'laden, berechnet',\
(x<=90) ? g(x) : 1/0 with lines ls 5 notitle,\
(x>=90) ? h(x) : 1/0 with lines ls 6 title 'entladen, berechnet',\
(x>=90) ? i(x) : 1/0 with lines ls 6 notitle
