---
title: 'Wellenoptik: RADAR und LIDAR'
subtitle: 'Bearbeitung des Arbeitsblatt: PhQ_WO_01_RadarLidar'
author: Niklas von Hirschfeld
date: 2024-08-24
toc: true
bib: true
---

# Aufgabe 1

::: leftbar
Recherchieren Sie RADAR und LIDAR (Quellen angeben!).

Beschreiben Sie (kurz), wie diese Technologien funktionieren und für welche Zwecke sie
eingesetzt werden.
:::

Lidar, Radar, oder auch Sonar, funktionieren alle sehr ähnlich, indem Energiewellen ausgesendet werden und auf eine Reflexion
gewartet wird. 


## Radar

"**Ra**dio **d**etection **a**nd **r**anging", kurz Radar, ist die Bezeichnung
für verschiedene Erkennungs- oder auch Ortungsverfahren, welche mit
**elektromagnetischen Wellen** im Radiofrequenzbereich (kleiner als
$300\text{MHz}$[@Radiowellen_LEIFI]) 

#### Funktionsweise

Für die Funktionsweise von Radar-Sensoren sind drei grundlegende physikalische Gesetze von bedeutung[@Wolff2024Aug]:

1. Die **Reflexion** elektromagnetischer Wellen.
2. Die **konstante Ausbreitungsgeschwindigkeit** der elektromagnetischen Wellen, welche sich mit knapp Lichtgeschwindigkeit ausbreiten (ca $300 \frac{km}{s}$).
3. Die **geradlinige Ausbreitung** der elektromagnetischen Wellen.

Die elektromagnetischen Wellen werden also ausgesendet und deren Reflexion
gemessen. Mit der Zeitdifferenz des aussenden und des empfangen kann die
Distanz ermittelt werden, welche die Wellen zurückgelegt haben.

#### Anwendung

Die Anwendungsmöglichkeiten sind vielfältig. Die Technologie wird unter anderem
dafür genutzt, um Positionen zu bestimmen, oder auch füllstände in
Lagertanks[@IFM_Radar]

## Lidar

„**Li**ght **d**etection **a**nd **r**anging“, kurz Lidar, ist eine
Technologie, welche die präziese messung von Entfernungen mit sehr geringer
latenz erlaubt[@IBM_LIDAR].

#### Funktionsweise

Klassische Lidar-Sensoren bezitzen einen Transmitter und einen Empfänger. Über
den Transmitter wird ein **gepulster Laser** wird ausgesendet. Der Zeitpunkt dessen
Reflexion wird mit dem Empfänger gemessen und somit die "Flugdauer" ermittelt. Da die
Lichtgeschwindigkeit konstant ist (ca $300
\frac{km}{s}$[@lichtgeschwindigkeit_LEIFI]) ist diese Methode sehr schnell und
präziese.

#### Anwendung

Lidar Technologie findet in der heutigen Welt eine breite und vielschichtige
Anwendung. Von Forschung bis Technologie im Alltag, Lidar-Sensoren sind überall
zu finden und auch nicht mehr weg zu denken.

In der Archäologie wurde 2018 mithilfe von Lidar-Luftscans eine bisher
übersehene Maya-Ruinenstadt gefunden. Dank der Scans konnte eine
großflächige und detailreiche 3D-Karte kreiert werden, welche die Umrisse der Ruinen aufdeckte[@lidar_defunk].

Auch für das autonome Fahren spielt die Lidar-Technologie eine große Rolle. Die
Autos müssen ihre Umgebung in drei Dimensionen erfassen können. Die
Lidar-Sensoren werden mit vielen anderen Sensoren, wie auch Kameras, kombiniert
um die aktuelle Situation einzuschätzen. Lidar ist deshalb geeignet, da es sehr
präzise Messungen mit sehr geringer Latenz ermöglicht[@9127855]. Aber nicht nur
für das Autonome steuern von Autos wird diese Technologie genutzt, auch
Staubsaug-Roboter nutzen sie, um sich in einem Raum zurecht zu finden.


# Aufgabe 2

::: leftbar
Erklären Sie die Funktionsweise dieser beiden Technologien physikalisch. Geben Sie
dafür auch die Gleichungen an, mit denen die nötigen Berechnungen durchgeführt
werden können. Verzichten Sie auf Erklärungen zur Nutzung der Raman-Streuung mit
LIDAR-Systemen
:::

Die Messung der "Time of flight", also der Strecke, die die Energiewelle in welcher Zeit zurückgelegt hat, sieht wie folgt aus[@Gotzig2015Mar]:

$$
d=\frac{c_0\cdot t}{2}
$$

- $d =$ Abstand
- $c_0 =$ Geschwindigkeit der Energiewelle, bei Lidar: Lichtgeschwindigkeit (ca. $300 \frac{km}{s}$) und bei Radar: geschwindigkeit ausbreitung von elektromagnetischer Wellen (annähernd Lichtgeschwindigkeit)
- $t =$ Zeit in $s$.

# Aufgabe 3

::: leftbar
Ordnen Sie die in RADAR und LIDAR verwendeten Wellenlängen bzw. Frequenzen in das
elektromagnetische Spektrum ein.

https://www.leifiphysik.de/optik/elektromagnetisches-spektrum
:::

|             | Radar[@Radiowellen_LEIFI] | Lidar[@infrarot_LEIFI]              |
| ---         | ---                       | ---                                 |
| Wellenlänge | $1m$                      | zwischen $1mm$ und $780nm$          |
| Frequenzen  | $300\text{MHz}$           | $300\text{GHz}$ bis $385\text{THz}$ |
| Art         | Radiowellen               | Infrarot                            |
