---
title: "Abstand eines Punktes von einer Gerade"
author: Niklas von Hirschfeld
date: 2024-08-13
toc: true
publish: false
---

# Funktionsweise

Wenn ein Punkt und eine Gerade gegeben ist, und der Abstand beider gesucht,
muss zunächst, wie auch bei dem Abstand eines Punktes von einer Ebene, die
kürzeste Distanz ermittelt werden. Bei einer Ebene konnte man einfach einen
Normalenvektor berechnen und damit eine Gerade aufstellen, welche durch den
Punkt geht. Bei einer Gerade ist es nicht gegeben, dass es für jeden
Normalenvektor zu der Gerade eine Gerade gibt, die auch durch den Punkt geht.

Die kürzeste Distanz kann mithilfe einer Ebene gefunden werden. Wir stellen also eine ebene auf, die folgende Bedingungen erfüllen muss:

- Sie muss zur Gerade **orthogonal** sein.
- Sie muss den **Punkt** beinhaltet.

```{=context}
\startMPcode
  draw fullcircle scaled 3cm;
\stopMPcode
```
