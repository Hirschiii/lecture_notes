---
title: 'Automaten'
author: Niklas von Hirschfeld
date: 2024-06-03
tags: 
- projekt
enableToc: true
chapter: true
publish: false
language: de
---

# Projekt: Snackautomat

## Snackautomat 

  * Getränke / Snakt automat
  * mindestens 5 Produkte
  * 3 Preisklassen
  * Java

## Welcher Automat 

  * DEA
    * Pro
      * Deterministisch
      * Eindeutig
    * Kontra
      * Keine Rückverfolgung der Schritte


## Ablauf 


  - Eingabe des Geldes, bis maximal

## Produkte 

| Nummer | Produkt | Preisklasse |
| --- | --- | --- |
| 1. | Fanta | a |
| 2. | Voelkel Kombucha | a |
| 3. | Kekse | b |
| 4. | Energieriegel | b |
| 5. | Uran | c |

----

  * a = 0.5
  * b = 1.0
  * c = 1.5

## Automat 

  * $Q = \{q_0, q_1, q_2, q_3, q_4\}$ 
  * $s = q_0$ Startzustand
  * $\sum = \{T1, T2, T3, T4, T5, G05, G1\}$
    * $T1$: Taste 1
    * $T2$: Taste 2
    * $T3$: Taste 3
    * $T4$: Taste 4
    * $T5$: Taste 5
    * $G0.5$: Geld 0.50 Euro
    * $G1$: Geld 1 Euro
  * $\Omega = \{V, F, E; U, K, V0.5, V1, V1.5, F0.5, F1, E0.5, E1, U0.5, K0.5\}$
    * $V$: Kombucha
    * $F$: Fanta
    * $E$: Energieriegel
    * $U$: Uran
    * $K$: Keks
    * $V0.5$: Kombucha + 0.5 Geld ausgabe
    * $V1$: Kombucha + 1.0 Geld ausgabe
    * $V1.5$: Kombucha + 1.5 Geld ausgabe
    * $F0.5$: Fanta + 0.5 Geld ausgabe
    * $F1$: Fanta + 1 Geld ausgabe
    * $E0.5$: Energieriegel + 0.5 Geld ausgabe
    * $E1$: Energieriegel + 1 Geld ausgabe
    * $U0.5$: Uran + 0.5 Geld ausgabe
    * $K0.5$: Keks + 0.5 Geld ausgabe
  * $\delta =$

|        |  $T1$  | $T2$   | $T3$   | $T4$   | $T5$   | $G0.5$  | $G1$   |
| --- | --- | --- |--- |--- | --- | --- | --- |
| $q_0$  | $q_0$  | $q_0$  | $q_0$  | $q_0$  | $q_0$  | $q_1$   | $q_2$  |
| $q_1$  | $q_0$  | $q_0$  | $q_1$  | $q_1$  | $q_1$  | $q_2$   | $q_4$  |
| $q_2$  | $q_0$  | $q_0$  | $q_0$  | $q_0$  | $q_2$  | $q_3$   |        |
| $q_3$  | $q_0$  | $q_0$  | $q_0$  | $q_0$  | $q_0$  | $q_4$   |        |
| $q_4$  | $q_0$  | $q_0$  | $q_0$  | $q_0$  | $q_0$  |         |        |


  * $\gamma =$

|        |  $T1$              | $T2$               | $T3$               | $T4$               | $T5$               | $G0.5$  | $G1$   |
| --- | --- | --- |--- |--- | --- | --- | --- |
| $q_0$  | "Nicht verfügbar"  | "Nicht verfügbar"  | "Nicht verfügbar"  | "Nicht verfügbar"  | "Nicht verfügbar"  | $"Guthaben: 0.5"$   | $"Guthaben: 1$$  |
| $q_1$  | $F$                | $V$                | "Nicht verfügbar"  | "Nicht verfügbar"  | "Nicht verfügbar"  | $"Guthaben: 1"$   | $"Guthaben: 2"$  |
| $q_2$  | $F0.5$             | $V0.5$             | $K$                | $E$                | "Nicht verfügbar"  | $"Guthaben: 1.5"$   |        |
| $q_3$  | $F1$               | $V1$               | $K0.5$             | $E0.5$             | $U$                | $"Guthaben: 2"$        |        |
| $q_4$  | $F1.5$             | $V1.5$             | $K1$               | $E1$               | $U0.5$             |         |        |

