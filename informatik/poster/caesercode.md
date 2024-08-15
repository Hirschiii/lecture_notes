---
title: 'Caeser-code'
institute: 'Gymnasium Lüneburger Heide'
author: Niklas von Hirschfeld
date: 2024-08-15
toc: true
publish: false
---

# Einleitung

Der **Caesercode** (auch Caeser-Verschlüsselung oder -Verschiebung) ist ein
*symmetrisches*^[es wird sowohl für die Ver- wie auch Entschlüsselung der selbe
Schlüssel verwendet.] Verschlüsselungsverfahren, welches nach Julius Caesar
benannt ist. Dieser habe es für die Kommunikation mit seinen militärischen
Verbündeten genutzt. Nachrichten mussten über lange Distanzen transportiert
werden. Dabei passierte es nicht selten, dass solche Nachrichten abgefangen
wurden. Damit dabei keine vertraulichen Informationen an den *Gegner* gerieten,
wurde die Caeser-Verschlüsselung genutzt.

# Vorteile

Damals war dieses Verschlüsselungsmethode gut und effektiv.
Die größte Vorteil war zu der darmaliegen Zeit die **Unbekanntheit**. Wenn ein
solches Verfahren noch nicht bekannt oder Verbreitet ist, gibt es weniger
ansetze und intresse es zu knacken. Ein weiter Vorteil ist die **schnelle Ver-
und Entschlüsselung**, wodurch die Infomation schnell Menschenlesbar gemacht
und genutzt werden können.

# Sicherheit

Mittlerweile gilt dieses Verfahren als **nicht Sicher**. Durch ihre begrenzte
Anzahl an Schlüsseln, ist ein lösen des Codes mithilfe der
*Bruteforcemethode*^[Ausprobieren von allen möglichen Schlüsseln] durchaus
realistisch. 

Da dieses Verfahren schon alt und auch relative einfach ist, gibt es
mittlerweile viele gute und schnelle Wege, den Code zu lösen. Die gängigsten
sind eine **Bruteforce-Attacke** oder eine **Häufigkeitsanalyse**.

---


Beim **Brutforce** werden einfach **alle** möglichen Schlüssel ausprobiert. Bei
aktuellen und herkömmlichen Verschlüsselungsmethoden dauert diese Attacke in der
Theorie oft mehrere Jahrzehnte, auch mit den aktuellsten Computern. Beim
Caeser-Verfahren sollte es allerdings nicht länger als Minuten oder sogar
Sekunden dauern, da die Anzahl an möglichen Schlüsseln bei 26 liegt. Zwar ist
auch ein Schlüssel wie 27 *möglich* allerdings funktioniert dieser exakt wie
der Schlüssel 1.

Bei der **Häufigkeitsanalyse** geht es darum, die Anzahl der auftauchenden
Buchstaben zu analysieren. Diese Vergleicht man dann mit der Häufigkeit des
jeweiliegen Buchstaben in der ziel Sprache generell. Im deutschen ist der am
häufigsten auftauchnde Buchstabe das $e$. Wenn jetzt ein Buchstabe am
häufigsten auftaucht, ist es mit hoher wahrscheinlichkeit das verschlüsselte
*e*.

# Tools

Den Prozess des Codieren können verschiedene Werkzeuge oder auch Scripte
vereinfach und verschnellern. Hier abgebildet ist Papierkonstrukt, bestehend
aus einer großen und einer kleineren Scheibe. 

```{=context}
\framed[align=middle, width=\hsize, frame=off, height=fit]{
\startMPcode{doublefun}
u := .8cm; % Unit size
outer_radius := 3.5u;
inner_radius := 2.5u;

% Draw the outer circle
draw fullcircle scaled (2*outer_radius);

% Draw the inner circle
draw fullcircle scaled (2*inner_radius);

% Define the alphabets
string alphabet, small_alphabet;
alphabet := "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
small_alphabet := "abcdefghijklmnopqrstuvwxyz";

% Draw the letters on the outer circle
for i=0 upto length(alphabet)-1:
    draw textext(substring(i, i+1) of alphabet) rotatedaround(origin, -i*13.846 - 90) shifted ((outer_radius - 0.3u)*dir(-i*13.846));
endfor;

%% Draw the letters on the inner circle
for i=0 upto length(small_alphabet)-1:
    draw textext(substring(i, i+1) of small_alphabet) rotatedaround(origin, -i*13.846 - 90) shifted ((inner_radius - 0.3u)*dir(-i*13.846));
endfor;
%
%% Draw the center point (pivot)
fill fullcircle scaled 0.1u shifted origin withcolor black;
%
%% Draw the arrow for rotation
path arrowhead;
arrowhead := (0, 0.5u) -- (0.4u, 0.7u) -- (0.4u, 0.3u) -- cycle;
\stopMPcode
}
```

Die Buchstaben sind nach dem Alphabet angeordnet und somit kann die inner
Scheibe weitergedreht werden, um eine neuen Schlüssel darzustellen.

