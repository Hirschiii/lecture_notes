---
title: "Binärsystem"
subtitle: "Eine Erläuterung und Vergleich"
author: Niklas von Hirschfeld
date: 2024-08-12
toc: true
publish: false
bib: true
---

# Aufbau

**Bi**när kommt von "zwei zuständen" [@Binary_advantages] . Diese können
beliebig ausgewählt werden, üblicherweise werden sie aber mit "0" und "1"
dargestellt. Auf einer CPU sind sie durch physische Gatter abgebildet, welche
entweder auf oder zu sind und so Strom durch lassen, oder nicht. Diese werden
mit logik Gattern, wie AND und OR, erweitert um komplexere Rechnungen
durchzuführen.

## Definition und Darstellung

Bei der Darstellung werden die Ziffern, ähnlich wie auch bei dem Dezimalsystem,
ohne Trennzeichen aufgeschrieben. Anders als bei dem Dezimalsystem, bei dem der
Stellenwert der passenden Zehnerpotenz entspricht, entspricht er bein Binärsystem der passenden Zweierpotzen[@BibEntry2024Aug].

Der Werte^[Im Dezimalsystem angegeben] der Binärzahl ergibt sich durch die Addition der einzelnen Ziffern. Definiert wird das wie folgt:

$$
W = \sum_{i=-n}^{m}z_i\cdot 2^i
$$

Im vergleich dazu die Berechnung des Wertes für das Dezimalsystem:

$$
W = \sum_{i=-n}^{m}z_i\cdot 10^i
$$

::: example
**Beispiel:**

Die folgenden Ziffern $0110$ würden im Dezimalsystem den Wert $\[110\]_{10}$ angeben. Im Binärsystem allerdings $\[6\]_2$.

$$
\[0110\]_2 = 0 \cdot 2^3 + 1 \cdot 2^2 + 1 \cdot 2^1 + 0 \cdot 2^0 = \[6\]_{10}
$$
:::



# Unterschied zum Dualsystem

Das **Binärsystem** ist ein allgemeiner Begriff für jedes System, das nur zwei
Zustände oder Symbole verwendet, diese müssen nicht $0$ und $1$
sein[@Brzesowsky2024Aug]. Es wird nicht nur in der Mathematik angewenden,
sondern auch in der Informatik und Elektronik[@BibEntry2012Mar]. Die zwei
Zustände können zum Beispiel durch Stromfluss, Schalter, Gatter, Lampen oder
beliebiege zwei verschiedene Symbole dargestellt werden.

Das **Dualsystem** ist ein Begriff, der speziell in der Mathematik und auch in
der Informatik, das Zahlensystem zur Basis $2$ bezeichnet.

# Rechengesetze

Wie in den meisten Zahlensystemen gibt es Rechengesetze. Es wird jeweils stellenweise gerechnet.

Die Addition kann, ähnlich wie bei dem Dezimalsystem, schriftlich und **stellenweise** durchgeführt. Dafür gibt es vier Fälle, je nachdem, welche zwei Ziffern addiert werden[@Khe+hsc+jpe2024May].

| Addition             | Subtraktion                                                               | Multiplikation | Division                       |
| ---                  | ---                                                                       | ---            | ---                            |
| $0+0=0$              | $0-0=0$                                                                   | $0 \times 0=0$ | $0 \div 0 =$ *Nicht Definiert* |
| $0+1=1$              | $0-1=1$ Übertrag^[Die Zahl wird an die nächste Stelle weitergegeben] $-1$ | $0 \times 1=0$ | $0 \div 1 =0$                  |
| $1+0=1$              | $1-0=1$                                                                   | $1 \times 0=0$ | $1 \div 0 =$ *Nicht Definiert* |
| $1+1=0$ Übertrag $1$ | $1-1=0$                                                                   | $1 \times 1=1$ | $1 \div 1 =1$                  |

## Beispiel: Addition


$$
\startalign[n=3]
\NC \NC 1001 \NR
\NC + \NC 100 \NR
\NC = \NC 1101 \NR
\stopalign
$$


::: leftbar
Die Addition kann Stellenweise erfolgen, da wir die Zahlen in **Summanden zerlegen können:**

$$
\startalign[n=11]
\NC   \NC 1001 \NC \rightarrow \NC 1000 \NC + \NC 000 \NC + \NC 00 \NC + \NC 1 \NR
\NC + \NC 100  \NC \rightarrow \NC      \NC   \NC 100 \NC + \NC 00 \NC + \NC 0 \NR
% here should be a horizontal line
\NC   \NC      \NC \rightarrow \NC 1000 \NC + \NC 100 \NC + \NC 00 \NC + \NC 1 \NR
\NC   \NC      \NC \rightarrow \NC 1101 \NC   \NC     \NC   \NC    \NC   \NC   \NR
\NC = \NC 1101 \NC             \NC      \NC   \NC     \NC   \NC    \NC   \NC   \NR
\stopalign
$$
:::


## Beispiel: Division

Die Division durch $0$ ist, wie auch beim Dezimalsystem, **nicht** Definiert.

```{=context}
\startformula[interlinespace=-5pt]
\startalign
\NC \NC \underline{1000010 \div  11 = \color[gray]{0}\color[green]{1}\color[orange]{0}\color[blue]{1}\color[red]{1}\color[green]{0}} \NR
\NC - \NC \underline{\phantom{0}\color[gray]{0}} \hfill \NR
\NC \NC 100 \hfill \NR
\NC - \NC \underline{\phantom{0}\color[green]{11}} \hfill \NR
\NC \NC \phantom{0}10 \hfill \NR
\NC - \NC \underline{\phantom{00}\color[orange]{0}} \hfill \NR
\NC \NC \phantom{00}100 \hfill \NR
\NC - \NC \underline{\phantom{000}\color[blue]{11}} \hfill \NR
\NC \NC \phantom{0000}11 \hfill \NR
\NC - \NC \underline{\phantom{0000}\color[red]{11}} \hfill \NR
\NC \NC \phantom{00000}00 \hfill \NR
\NC - \NC \underline{\phantom{000000}\color[green]{0}} \hfill \NR
\NC \NC \phantom{000000}0 \hfill \NR
\stopalign
\stopformula
```

Im ersten Schritt können wir die $11$ nicht durch $1$ oder $10$
teilen und somit ein $0$ schreiben und mit $00$ subtrahieren.
Damit erhalten wir die zusätzliche Stelle und können nun $11$
durch $100$ rechnen. Die $11$ passt genau $1$ mal in die $100$.
Wir ziehen also $11$, schreiben den Rest ($1$) herunter und
fahren wie gewohnt fort.

# Darstellung im Coputer



---

Vorstellung nächste Stunde

https://de.wikipedia.org/wiki/IEEE_754

https://www.cuemath.com/numbers/binary-division/

https://www.matheretter.de/wiki/binarzahlen-division
