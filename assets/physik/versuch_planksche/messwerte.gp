# Gnuplot Skript zur Darstellung von LED-Messwerten
# Speichern Sie dieses Skript z. B. unter "plot_leds.gp" und führen Sie es mit `gnuplot plot_leds.gp` aus.

set terminal png
set output 'led_characteristics.png'

set title "LED Characteristics" font "Arial,14"
set xlabel "U (V)" font "Arial,12"
set ylabel "I (A)" font "Arial,12"

set grid
set key outside

# Achsen- und Diagrammoptionen
set xrange [0:*]
set yrange [0:*]

# Daten aus den CSV-Dateien plotten
plot \
 	'messwerte-led-blau.csv' using 1:2 with linespoints title "Blue LED" lw 2 lc rgb "blue", \
 	'messwerte-led-gruen.csv' using 1:2 with linespoints title "Green LED" lw 2 lc rgb "green", \
 	'messwerte-led-rot.csv' using 1:2 with linespoints title "Red LED" lw 2 lc rgb "red", \
 	'messwerte-led-uv.csv' using 1:2 with linespoints title "UV LED" lw 2 lc rgb "purple"

# Speichert das Diagramm und beendet Gnuplot
set output
