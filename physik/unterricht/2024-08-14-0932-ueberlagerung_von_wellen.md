---
title: "Überlagerung von Wellen"
subtitle: "Rückblick"
author: Niklas von Hirschfeld
date: 2024-08-14
toc: true
publish: false
---

```{=context}
\placefigure[here][fig:waves_no_offset]{Überlagerung zwei exakt gleicher Wellen}{
\startMPcode
    draw function (1, "x", ".5 * sin(2x)", 1, 10, .01) scaled 1.5cm
    withpen pencircle scaled 1mm withcolor transparent(1,.5,red);

    draw function (2, "x", ".5 * sin(2x)", 1, 10, .01) scaled 1.5cm
    withpen pencircle scaled 1mm withcolor transparent(1,.5,blue);

    draw function (3, "x", ".5 * (sin(2x)+sin(2x))", 1, 10, .01) scaled 1.5cm
    withpen pencircle scaled 1mm withcolor transparent(1,.5,black);
\stopMPcode
}

\placefigure[here][fig:waves_offset]{Überlagerung zwei unterschiedlicher Wellen}{
\startMPcode
    draw function (1, "x", "sin(2x + pi)", 1, 10, .01) scaled 1.5cm
    withpen pencircle scaled 1mm withcolor transparent(1,.5,red);

    draw function (2, "x", "sin(2x)", 1, 10, .01) scaled 1.5cm
    withpen pencircle scaled 1mm withcolor transparent(1,.5,blue);

    draw function (3, "x", "sin(2x)+sin(2x + pi)", 1, 10, .01) scaled 1.5cm
    withpen pencircle scaled 1mm withcolor transparent(1,.5,black);
\stopMPcode
}
```

Im ersten Beispiel[@fig:waves_no_offset] wird die Amplitude _verdoppelt_, im zweiten Beispiel[@fig:waves_offset] gleichen sich die beiden Wellen zu _keiner_ Welle aus.

Hier betrachten wir immer 2 gleichartige Wellen und interesieren uns für die

Wällenlänge: $\lambda$

$$
\lambda = \frac{g \cdot \sin(\text{arcan}\frac{a_n}{l})}{n}=\frac{g\cdot \sin(\tan^{-1}(\frac{a_n}{l}))}{n}
$$

```{=context}
\placefigure[here][fig:waves_interference]{Überlagerung von Wellen durch ein Gitter}{
\startMPcode
    % Define the size of the pattern
    numeric width, height;
    width := 16cm;
    height := 2cm;

    % Define colors for the interference pattern
    color bright, dark;
    bright := yellow;
    dark := black;

    % Define the number of lines (grid density)
    numeric lines;
    lines := 200; % Increase the number of lines for finer detail

    % Center of the pattern
    numeric center;
    center := lines / 2;

    % Sharper fall-off function combined with a high-frequency sine wave
    vardef gaussian(expr x) =
        exp(-(x^2) * 16)
    enddef;

    vardef mysin(expr x) =
        0.5 * sin(40 * (2^(-(x^2) * 2 + 1)) * x + (pi/2)) + 0.5
    enddef;

    % Beugungsfunktion
    vardef beg_diffraktion(expr b, lambda, theta) =
        (sin(pi*b*sin(theta)/lambda)/(pi*b*sin(theta)/lambda))**2
    enddef;

    % Interferenzfunktion
    vardef interfunktion(expr d, lambda, theta) =
        cos(pi*d*sin(theta)/lambda)**2
    enddef;

    % Gesamte Intensität
    vardef intensitaet(expr d, b, lambda, theta) =
        beg_diffraktion(b, lambda, theta) * interfunktion(d, lambda, theta)
    enddef;


    % Draw the interference pattern
    for i=0 step 1 until (lines - 1):
        numeric x, x_width, brightness;
        x := (i/lines);
        % Calculate the position relative to the center
        numeric relative_x;
        relative_x := x - 0.5;

        % Combine the sharp fall-off function with a sine wave
        % brightness := sigmoid_prime(x) * sin(2 * relative_x + (pi/2));
        % brightness := sigmoid_prime(x - 0.5);
        % brightness := gaussian(x - 0.5) * mysin(x - 0.5);
        % brightness := intensitaet(0.6, 0.6, 0.6, x - 0.5);
        % brightness := interfunktion(0.6, 0.6, x - 0.5);
        if relative_x == 0:
            brightness := 1;
        else:
            brightness := intensitaet(4, 1.5, 0.8, relative_x);
        fi;
        % Draw the rectangle with modulated brightness
        fill (x * width, 0) -- (x * width + (width / lines), 0) --
             (x * width + (width / lines), height) -- (x * width, height) -- cycle
        % withcolor (dark + brightness * (bright - dark));
        withcolor (dark + brightness * (bright - dark));
    endfor;

    % Draw the black bars on the top and bottom
    fill unitsquare xyscaled (width, height/10) shifted (0, height) withcolor black;
    fill unitsquare xyscaled (width, height/10) shifted (0, -height/10) withcolor black;

    draw function (1, "x", "intensitaet(4, 1.5, 0.8, x - 0.5)", 0, 1, 0.00001) xyscaled (16cm,4cm) shifted (0, height * 1.2)
    withpen pencircle scaled 1mm withcolor transparent(1,.5,black);
\stopMPcode
}
```

Abstand zwischen 2 Maxima gleicher Ordnung messen und durch zwei Dividieren.
