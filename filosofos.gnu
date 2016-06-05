# Variables de usuario
ListaTotal = 11

# Programación
ListaTotal = ListaTotal + 1
Fondo = -1.5

unset key
set grid back lc rgb '#666666'
set yrange [Fondo:ListaTotal]

timeformat = "%Y"
T(N) = timecolumn(N,timeformat)

OneMonth = strptime("%m","25")

set xdata time
set format x "%Y"

set xtics scale 0.75,0.25 nomirror
set mxtics 6
unset ytics #nomirror

set title "Desde la Ilustración: ontología / lógica"
set border 0

set style line 1 lw 1 lc rgb 'red' dt 3
set style line 2 lw 1 lc rgb 'orange' pt 5 ps 1.25
set style line 3 lw 1 lc rgb 'navy' pt 5 ps 1.25

set style arrow 1 heads size screen 0.0075, 90 lw 2.0 lc rgb 'navy' dt 1
set style arrow 2 backhead empty size screen 0.005,90,135 ls 1
set style arrow 3 backhead filled size screen 0.005,90,135 ls 2
set style arrow 4 heads size screen 0.0075, 90 lw 2.0 lc rgb 'orange' dt 1

set termoption enhanced
save_encoding = GPVAL_ENCODING
set encoding utf8

set terminal postscript eps size 10.0,5.0 enhanced color background rgb 'white'
set output "filosofos.eps"

# # #

plot \
	 './eventos.dat' using (T(1)) : 2 : (0) : (ListaTotal + 3) with vector as 2, \
     './eventos.dat' using (T(1)) : 3 : 4 with labels left offset -0.25 tc rgb 'black' font "courier,10", \
     './complementario.dat' using (T(3)) : 1 : (T(4)-T(3)) : (0.0) : yticlabel(1) with vector as 4, \
     './complementario.dat' using (T(5)) : 1 ls 2, \
     './complementario.dat' using (T(6)) : 1 ls 2, \
     './complementario.dat' using (T(3)) : 1 : 2 with labels left offset 0.75,-1.0, \
	 './filosofos.dat' using (T(3)) : 1 : (T(4)-T(3)) : (0.0) : yticlabel(1) with vector as 1, \
     './filosofos.dat' using (T(5)) : 1 ls 3, \
     './filosofos.dat' using (T(6)) : 1 ls 3, \
     './filosofos.dat' using (T(3)) : 1 : 2 with labels left offset 0.75,-1.0


# OTRAS TERMINALES
#set terminal svg size 3200,1200 dynamic enhanced fname 'arial'  fsize 11 mousing butt dashlength 1.0
#set output 'lines_arrows.1.svg'
#set terminal png size 3200,1200 enhanced font "Helvetica,10"
#set output "cifiseries.png"