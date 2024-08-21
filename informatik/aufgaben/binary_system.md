---
title: "Binärsystem"
subtitle: "Eine Erläuterung und Vergleich"
author: Niklas von Hirschfeld
date: 2024-08-12
toc: true
publish: false
---

# Aufbau

**Bi**när kommt von "zwei zuständen" [@Binary_advantages] . Diese können beliebig
dargestellt werden, üblicherweise werden sie aber mit "0" und "1" dargestellt.
Auf einer CPU werden sie durch physische Gatter dargestellt, welche entweder
auf oder zu sind. Diese werden mit logik Gattern, wie AND und OR, erweitert um
komplexere Rechnungen durchzuführen.

## Definition und Darstellung

Bei der Darstellung werden die Ziffern, ähnlich wie auch bei dem Dezimalsystem,
ohne Trennzeichen aufgeschrieben. Anders als bei dem Dezimalsystem, bei dem der
Stellenwert der passenden Zehnerpotenz entspricht, entspricht er bein Binärsystem der passenden Zweierpotzen[@BibEntry2024Aug].

Der Werte der Binärzahl ergibt sich durch die Addition der einzelnen Ziffern. Definiert wird das wie folgt:

$$
W = \sum_{i=-n}^{m}z_i\cdot 2^i
$$

Im vergleich dazu die Berechnung des Wertes für das Dezimalsystem:

$$
W = \sum_{i=-n}^{m}z_i\cdot 10^i
$$

**Beispiel:**

Die folgenden Ziffern $0110$ würden im Dezimalsystem den Wert $110$ (Dargestellt im Dezimalsystem) angeben. Im Binärsystem allerdings $6$ (Dargestellt im Dezimalsystem).
 
$$
\[0110\]_2 = 0 \cdot 2^3 + 1 \cdot 2^2 + 1 \cdot 2^1 + 0 \cdot 2^0 = \[6\]_{10}
$$

# Unterschied zum Dualsystem

Das *Dual*system besteht aus zwei **verschiedenen** Ziffern. Diese können dabei beliebig gewählt werden. Bei dem Binärsystem werden Standardmäßig die Ziffern $1$ und $0$ gewählt.

# Rechengesetze

Wie in den meisten Zahlensystemen gibt es Rechengesetze. Es wird jeweils stellenweise gerechnet.

Die Addition kann, ähnlich wie bei dem Dezimalsystem, schriftlich und **stellenweise** durchgeführt. Dafür gibt es vier Fälle, je nachdem, welche zwei Ziffern addiert werden[@Khe+hsc+jpe2024May].

| Fall | Addition             | Subtraktion                                                               | Multiplikation | Division                     |
| ---  | ---                  | ---                                                                       | ---            | ---                          |
| 1.   | $0+0=0$              | $0-0=0$                                                                   | $0*0=0$        | $0 : 0 =$ *Nicht Definiert* |
| 2.   | $0+1=1$              | $0-1=1$ Übertrag^[Die Zahl wird an die nächste Stelle weitergegeben] $-1$ | $0*1=0$        | $0 : 1 =0$                  |
| 3.   | $1+0=1$              | $1-0=1$                                                                   | $1*0=0$        | $1 : 0 =$ *Nicht Definiert* |
| 4.   | $1+1=0$ Übertrag $1$ | $1-1=0$                                                                   | $1*1=1$        | $1 : 1 =1$                  |

## Beispiel schriftliche Addition

---

Vorstellung nächste Stunde

https://de.wikipedia.org/wiki/IEEE_754
