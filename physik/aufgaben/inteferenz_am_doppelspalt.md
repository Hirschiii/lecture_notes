---
title: 'Interferenz am Doppelspalt'
subtitle: 'Versuchsbericht'
author: "Finn Garbers, Magnus Rappuhn, Bella Raudies, Niklas von Hirschfeld"
date: 2024-08-21
toc: true
bib: true
environments: [physik_versuchsbericht]
---

# Versuchsziel

Das Ziel dieses Versuchs ist es, die Welleninterferenz bei
Ultraschallwellen zu untersuchen. Insbesondere soll gezeigt werden, dass
Ultraschallwellen, die durch einen Doppelspalt gehen, minima und maxima
erzeugen um damit die Wellenlänge zu berechnen.

# Versuchsgrundlage

Die Grundlage des Versuchs bietet die Überlagerung von Wellen. Mithilfer der dadurch entstehenden Maxima der verschiedenen Ordnungen, lässt sich mit folgender Formel die Wellenlänge bestimmen[@Doppelspalt_gleichung_leifi]:

$$
\lambda = \frac{d \cdot a_k}{k \cdot \sqrt{e^2+a_k^2}}; \quad k \in \{1;2;3;...\}
$$

Dabei ist:

- $\lambda$: die Wellenlänge des einfallenden Lichts.
- $d$: der Abstand der Mittelpunkte der beiden Spalte.
- $e$: Abstand zwischen Doppelspalt und Schirm.
- $k$: Ordnung des betrachteten **Maximums**.
- $a_k$: Abstand des $k.$ **Maximums** zum $0.$ Maimum.

# Aufbau

Für ausführliche Liste des Komponente siehe Arbeitsblatt (Trage ich
eventuell noch nach). Ebenso für den Versuchsaufbau. Hier ist eine
vereinfachte Version mit den Dimensionen und den Messungen der Maxima, mit deren Abstand zur $0.$ Ordnung:

```{=context}
\placefigure[here][fig:darstellung_aufbau]{Versuchsaufbau}{
\startMPcode

% Zeichne das Rechteck für den Sender
draw (0,-0.5cm)--(2cm,-0.5cm)--(2cm,0.5cm)--(0,0.5cm)--cycle withcolor black;

% Beschrifte das Rechteck
label.top("Sender", (1cm,-0.25cm));

% Zeichne den Doppelspalt (drei Rechtecke)
draw (5cm,-2cm)--(5.5cm,-2cm)--(5.5cm,-1cm)--(5cm,-1cm)--cycle withcolor black;
draw (5cm,-0.5cm)--(5.5cm,-0.5cm)--(5.5cm,0.5cm)--(5cm,0.5cm)--cycle withcolor black;
draw (5cm,2cm)--(5.5cm,2cm)--(5.5cm,1cm)--(5cm,1cm)--cycle withcolor black;

% Beschrifte den Doppelspalt
label.lft("Doppelspalt", (6.4cm,2.5cm));

% Zeichne die Strahlen von der Mitte des Doppelspalts zu den Maxima
% for i = -2 upto 2:
%   drawarrow (5.2cm, 0cm)--(10cm, i*1.5cm) withcolor red;
% endfor

% Zeichne die Maxima hinter dem Doppelspalt als Punkte
% for i = -2 upto 2:
%   draw fullcircle scaled 0.2cm shifted (10cm, i*1.5cm) withcolor black;
% endfor

% Maxima
draw (10cm, -2cm)--(10cm, 2cm) withpen pencircle scaled 0.6pt;
draw (12cm, -2cm)--(12cm, 2cm) withpen pencircle scaled 0.6pt;

label.rt("1. Maxima Messung", (8.25cm,2.5cm));
label.rt("2. Maxima Messung", (10.25cm,3cm));

vardef draw_dimension_line_horizontal(expr pos, length, labeltext) =
  draw pos--(xpart pos + length, ypart pos) withcolor black;
  draw (xpart pos, ypart pos + 0.2cm)--(xpart pos, ypart pos - 0.2cm) withpen pencircle scaled 0.6pt;
  draw (xpart pos + length, ypart pos + 0.2cm)--(xpart pos + length, ypart pos - 0.2cm) withpen pencircle scaled 0.6pt;
  label.top(labeltext, (xpart pos + length / 2, ypart pos - 0.5cm));
enddef;

vardef draw_dimension_line_vertikal(expr pos, length, labeltext) =
  draw pos--(xpart pos, ypart pos + length) withcolor black;
  draw (xpart pos + 0.2cm, ypart pos)--(xpart pos - 0.2cm, ypart pos) withpen pencircle scaled 0.6pt;
  draw (xpart pos + 0.2cm, ypart pos + length)--(xpart pos - 0.2cm, ypart pos + length) withpen pencircle scaled 0.6pt;
  label.top(labeltext, (xpart pos + 0.8cm, ypart pos + length / 2 - 0.25cm));
enddef;

vardef draw_measurement(expr pos, labeltext) =
  draw (xpart pos + 0.1cm, ypart pos + 0.1cm)--(xpart pos - 0.1cm, ypart pos - 0.1cm) withpen pencircle scaled 0.6pt;
  draw (xpart pos + 0.1cm, ypart pos - 0.1cm)--(xpart pos - 0.1cm, ypart pos + 0.1cm) withpen pencircle scaled 0.6pt;
  label.top(labeltext, (xpart pos + 0.8cm, ypart pos - 0.2cm));
enddef;


draw_dimension_line_horizontal((2cm,-2.5cm), 3cm, "5.2 cm");
draw_dimension_line_horizontal((5.5cm,-2.5cm), 4.5cm, "5 cm");
draw_dimension_line_horizontal((5.5cm,-3cm), 6.5cm, "10 cm");

draw_dimension_line_vertikal((5.9cm,0.5cm), 0.5cm, "0.5 cm");
draw_dimension_line_vertikal((5.9cm,-0.5cm), 1cm, "2 cm");

draw_measurement((10cm, -1.8cm), "6.5cm");
draw_measurement((10cm, -1.1cm), "2.7cm");
draw_measurement((10cm, -0.5cm), "1.5cm");
draw_measurement((10cm, 0cm), "0.0cm");
draw_measurement((10cm, 0.5cm), "1.7cm");
draw_measurement((10cm, 1.1cm), "2.8cm");
draw_measurement((10cm, 1.8cm), "5.3cm");

draw_measurement((12cm, -0.6cm), "1.8cm");
draw_measurement((12cm, 0cm), "0.0cm");
draw_measurement((12cm, 0.6cm), "1.7cm");



draw_measurement((11cm, -2.5cm), "");
label.top("Messungen", (12.3cm, -2.8cm));

\stopMPcode
}
```

\page

# Auswertung

## Messergebnisse:

| Ordnung | 1. Messung ($5cm$) | 2. Messung ($10cm$) |
| ---     | ---                | ---                 |
| $2a_1$: | $3.2cm$            | $3.5cm$             |
| $2a_2$: | $5.5cm$            | -                   |
| $2a_3$: | $11.8cm$           | -                   |

## Rechnung:

### Erster Ordnung:

$$
\lambda = \frac{0.025m \cdot 0.016m}{1 \cdot \sqrt{0.05m^2+0.016m^2}}\approx 0.0076m = 7.61 \cdot 10^{-3} = 0.76cm 
$$

### Zweite Ordnung:

$$
\lambda = \frac{0.025m \cdot 0.0275m}{1 \cdot \sqrt{0.05m^2+0.0275m^2}}
$$


### Dritte Ordnung:

$$
\lambda = \frac{0.025m \cdot 0.59m}{1 \cdot \sqrt{0.05m^2+0.59m^2}}
$$
