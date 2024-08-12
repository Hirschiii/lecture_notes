---
title: 'Abstand eines Punktes von einer Ebene'
subtitle: "Einfuehrung"
author: Niklas von Hirschfeld
date: 2024-08-12
toc: true
---

# Aufgaben

## S. 214 

### Nr. 1

> Bestimmen Sie die Koordinaten des Lotfusspunktes F des Lots durch
> $A(3|-1|7)$, $B(6|8|19)$ und $C(-3|-3|-4)$ auf der Ebene $E: \vec{x} = r \cdot \startpmatrix \NC 1 \NR \NC 0 \NR \NC 0 \NR \stoppmatrix + s \cdot \startpmatrix \NC 0 \NR \NC 4 \NR \NC -3 \NR \stoppmatrix$

$$
\vec{n} = \startpmatrix
1 \NR
0 \NR
0 \NR
\stoppmatrix \times
\startpmatrix
0 \NR
4 \NR
-3 \NR
\stoppmatrix =
\startpmatrix
0 \NR
3 \NR
4 \NR
\stoppmatrix
$$

Den Normalenverktor können wir jetzt in die Gleichung mit einsetzten. Hier
setzen wir die Ebenen mit unserer Gerade (Punkt + t * Normalenverktor) gleich,
um den Schnittpunkt zu berechnen.

$$
r \cdot \startpmatrix
1 \NR
0 \NR
0 \NR
\stoppmatrix + s \cdot
\startpmatrix
0 \NR
4 \NR
-3 \NR
\stoppmatrix = \vec{p} + t \cdot \vec{n}
$$

Nun müssen nurnoch die Ortsvektoren der Punkte in die gleichung eingegeben. Mit
dem Wert für $t$ können wir den Ortsvektor des Punktes auf der Ebene berechnen,
welcher unserem Ausgangspunkt am nächsten liegt.

$$
f=\vec{p} + t \cdot \vec{n} \NR
$$

| Punkt | Distanz |
| ---   | ---     |
| A     | 5       |
| B     | 25     |
| C     | 5       |

### A2

$$
E: \vec{x} = 
\startpmatrix
1 \NR
3 \NR
-1 \NR
\stoppmatrix + r \cdot
\startpmatrix
1 \NR
0 \NR
-1 \NR
\stoppmatrix + s \cdot
\startpmatrix
5 \NR
2 \NR
0 \NR
\stoppmatrix 
$$

$$
E: \vec{y} = 
\startpmatrix
0 \NR
1 \NR
-1 \NR
\stoppmatrix + r \cdot
\startpmatrix
0 \NR
1 \NR
1 \NR
\stoppmatrix + s \cdot
\startpmatrix
1 \NR
0 \NR
2 \NR
\stoppmatrix
$$

| Punkt  | Distanz zu $E: \vec{x}$ | Distanz zu $E: \vec{y}$ |
| ---    | ---                     | ---                     |
| $A(0\  | 2\                      | 1)$                     | 2 | $\approx 0.41$   |
| $B(1\  | 3\                      | 5)$                     | $\approx 5.13$ | $\approx 0.8085$ |
| $C(-3\ | 1\                      | -1)$                    |  $\approx 4.64079$ | $\approx 2.45$   |

### A4

$$
E: \vec{x} = 
\startpmatrix
3 \NR
0 \NR
0 \NR
\stoppmatrix + r \cdot
\startpmatrix
0 \NR
3 \NR
0 \NR
\stoppmatrix + s \cdot
\startpmatrix
0 \NR
0 \NR
4 \NR
\stoppmatrix
$$

$$
P(3|5|7)
$$

Distanz $= 4.2$

### A6

| Koordinatenebene | Entfernung des Punktes $P(1\|-2\|-3)$|
| ---              | ---        |
| x1x2             | 3          |
| x1x3             | 2          |
| x2x3             | 1          |

Die drei Werte des Punktes $x_1$, $x_2$ und $x_3$ geben so gesehen die
Entfernung zu der jeweiliegen Koordinatenebene ein. Der Punkt $P(x|y|10)$ ist
immer $10$ entfernt von der $x_1x_2$-Koordinatenebenen.

### A13

Idee: Von beliebigen Punkt aus in die Richtung des Normalenverktors und dort
Ebene Spannen. Punkt haben wir und auch die Spannung mit der
Koordinatengleichung der gegebenen.

$$
E: 4x_1-7x_2+4x_3=6
$$

Dies trifft zu für ${x_1=2.5, x_2=1, x_3=1}$. Damit können wir anfangen, die Normalenform der Gleichung bestimmen:

$$
E: 
\startpmatrix
4 \NR
-7 \NR
4 \NR
\stoppmatrix \cdot (
\startpmatrix
x_1 \NR
x_2 \NR
x_3 \NR
\stoppmatrix - 
\startpmatrix
2.5 \NR
1 \NR
1 \NR
\stoppmatrix 
)
$$

Damit können wir eine Ebene Aufspannen, welche den selben Normalenverktor hat und so also parrallel verläuft. Um einen Abstand von $d$ zu erhalten müssen wir nun nur noch eine Gleichung aufstellen.

> Mit dem C.A.S.:

$$
solve(
nrom(
\startpmatrix
2.5 \NR
1 \NR
1 \NR
\stoppmatrix -
(
\startpmatrix
2.5 \NR
1 \NR
1 \NR
\stoppmatrix + t \cdot
\startpmatrix
4 \NR
-7 \NR
4 \NR
\stoppmatrix
)) = d, t)
$$

Damit ergibt sich $t\approx \pm 0.44$. Und dies können wir in die Parametergleichung mit eingeben.
