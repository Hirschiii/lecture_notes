# Gnuplot Skript zur Darstellung von LED-Messwerten
# Speichern Sie dieses Skript z. B. unter "plot_leds.gp" und führen Sie es mit `gnuplot plot_leds.gp` aus.

# set terminal png
set terminal pngcairo enhanced font "DejaVu Sans,18" size 1200,700
set output 'led_characteristics.png'

set datafile separator ","

# set title "LED Characteristics" 
set xlabel "U_A/ I" 
set ylabel "I_B / A" 

set grid
set key outside

# Achsen- und Diagrammoptionen
set xrange [1:2.5]
set yrange [0:0.0015]

# Daten aus den CSV-Dateien plotten
plot \
 	'messwerte-led-blau.csv' using 1:2 with lines title "Blaue LED" lw 2 lc rgb "blue", \
 	'messwerte-led-gruen.csv' using 1:2 with lines title "Grüne LED" lw 2 lc rgb "green", \
 	'messwerte-led-rot.csv' using 1:2 with lines title "Rote LED" lw 2 lc rgb "red", \
 	'messwerte-led-uv.csv' using 1:2 with lines title "UV LED" lw 2 lc rgb "purple"

# Speichert das Diagramm und beendet Gnuplot
set output
