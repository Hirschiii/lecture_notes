---
title: "Dreidimensionale Bildbearbeitung"
author: "Niklas von Hirschfeld"
institute: "GLH"
topic: "3D Bildbearbeitung"
theme: "Boadilla"
colortheme: "dolphin"
fonttheme: "professionalfonts"
mainfont: "Hack Nerd Font"
fontsize: 10pt
urlcolor: red
linkstyle: bold
aspectratio: 169
date: 2024-06-03
lang: de-DE
section-titles: true
toc: true
header-includes:
- \usepackage{tikz}
- \usepackage{tikz-3dplot}
- \usepackage{tkz-euclide}
- \usepackage{graphicx}
---

# Mutliplikation mit einer Matrix

$$
\begin{aligned}
A\cdot \vec{p}=
\begin{pmatrix}
a_{11} & a_{12} & a_{13}\\
a_{21} & a_{22} & a_{23}\\
a_{31} & a_{32} & a_{33}
\end{pmatrix} \cdot
\begin{pmatrix}
p_1\\
p_2\\
p_3\\
\end{pmatrix} =
\begin{pmatrix}
a_{11} \cdot p_{1} &+& a_{12} \cdot p_{2} &+& a_{13} \cdot p_{3}\\
a_{21} \cdot p_{1} &+& a_{22} \cdot p_{2} &+& a_{23} \cdot p_{3}\\
a_{31} \cdot p_{1} &+& a_{32} \cdot p_{2} &+& a_{33} \cdot p_{3}
\end{pmatrix} =
\begin{pmatrix}
\dot{p_1}\\
\dot{p_2}\\
\dot{p_3}\\
\end{pmatrix} 
\end{aligned}
$$


# Beispiele und Möglichkeiten

## Identische Abbildung

$$
\begin{aligned}
A=\begin{pmatrix}
1 & 0 & 0\\
0 & 1 & 0\\
0 & 0 & 1
\end{pmatrix}
\end{aligned}
$$


## Projetkion auf eine Koordinatenebene

$$
\begin{aligned}
A=\begin{pmatrix}
0 & 0 & 0\\
a & 1 & 0\\
b & 0 & 1\\
\end{pmatrix}
\end{aligned}
$$

## Zentrische Strckung am Ursprung

:::::::::::::: {.columns}
::: {.column}
$$
\begin{aligned}
\vec{P'}=\begin{pmatrix}
z & 0 & 0\\
0 & z & 0\\
0 & 0 & z
\end{pmatrix} \cdot \vec{P}
\end{aligned}
$$
:::
::: {.column}
![Zentrische Streckung](./assets/streckung.png)
:::
::::::::::::::


## Orthogonale Spigelung an der $x_1$-$x_3$-Ebene

> Die $x_1$- und $x_3$-Koordinaten bleiben gleich und die $x_2$-Koordinate ändert ihr vorzeichen.

:::::::::::::: {.columns}
::: {.column}
$$
\begin{aligned}
\vec{p'}=\begin{pmatrix}
1 & 0 & 0\\
0 & -1 & 0\\
0 & 0 & 1
\end{pmatrix} \cdot \vec{p}=
\begin{pmatrix}
p_1\\
-p_2\\
p_3
\end{pmatrix}
\end{aligned}
$$
:::
::: {.column}
![Spiegeln](./assets/spiegeln.png)
:::
::::::::::::::



## Drehung um die $x_2$-Achse

:::::::::::::: {.columns}
::: {.column}
$$
\begin{aligned}
\vec{\dot{p}}&=
\begin{pmatrix}
\cos{\phi} & 0 & -\sin{\phi}\\
0 & 1 & 0\\
\sin{\phi} & 0 & \cos{\phi}
\end{pmatrix} \cdot \vec{p}\\ &= 
\begin{pmatrix}
p_1\cos{\phi} -p_3\sin{\phi}\\
p_2  \\
p_1\sin{\phi} + p_3 \cos{\phi}
\end{pmatrix}
\end{aligned}
$$
:::
::: {.column}
![Drehung 3D-Ansicht](./assets/drehen_um_x2.png)
:::
::::::::::::::

## Seitenansicht:

![Drehung Seitensicht](./assets/drehen_seitenansich.png){ width=50% }


# Übungsaufgabe

- Geben Sie eine Matrix an, die eine Punktspiegelung am Ursprung durchführt.
