#set title 'Belastungskennlinie'
set ylabel 'Spannung in V'
set yrange [0:5]
set xlabel 'Strom in mA'
set grid
set term eps
set output 'belastungskennlinie.eps'
set datafile separator ","
#f(x) = (-5.0/20.0)*x+5
f(x) = m*x+b
fit [0:15] f(x) 'data.csv' via m,b
set arrow from 7.2,0 to 7.2,f(7.2) nohead
set arrow from 0,f(7.2) to 7.2,f(7.2) nohead
plot [0:20] 'data.csv' title "Messwerte", f(x) title "Kennlinie"
