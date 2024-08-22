---
title: 'Interferenz am Doppelspalt'
subtitle: 'subtitle'
author: Niklas von Hirschfeld
date: 2024-08-21
toc: true
publish: false
---


# Aufbau
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
label.lft("Doppelspalt", (6.25cm,-3cm));

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

label.rt("1. Maxima Messung", (8.25cm,-3cm));
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

draw_dimension_line_horizontal((2.1cm,0), 2.8cm, "6 cm");
draw_dimension_line_horizontal((5.6cm,0.3cm), 4.3cm, "5 cm");
draw_dimension_line_horizontal((5.6cm,-0.3cm), 6.3cm, "8 cm");

draw_dimension_line_vertikal((5.9cm,0.5cm), 0.5cm, "0.5 cm");
\stopMPcode
}
```

