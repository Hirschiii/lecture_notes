# Der Komplette mögliche Markdown syntax

## This is an H2

### This is an H3

#### This is an H4

##### This is an H5

This is a text paragraph containing an ellipsis ... and followed by a thematic break.

***

This is inline `code`. This is a [link](http://google.cz "Google").  _This is an *emphasized* span of text_. __This is a **strongly emphasized** span of text__.

  ![example image](example-image.png "An example image from Martin Scharrer's mwe package")

  /scientists.csv (The great minds of the 19th century rendered via a content block)

This is a fenced code block:


This is a table:

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|    12 | 12   | 12      |   12   |
|   123 | 123  | 123     |   123  |
|     1 | 1    | 1       |    1   |

  : Demonstration of pipe table syntax.

This is a bullet list:

* The first item of a bullet list,

* the second item of a bullet list,

* the third item of a bullet list.

This is a definition list:


This is a ^superscript^ and a ~subscript~.

This is a block quote:

> This is the first level of quoting.
>
> > This is nested blockquote.
>
> Back to the first level.

Here is a note reference[^1] and another.[^longnote]
Here is an inline note.^[Inlines notes are easier to
write, since you don't have to pick an identifier and
move down to type the note.]

[^1]: Here is the note.

[^longnote]: Here's one with multiple blocks.

    Subsequent paragraphs are indented to show that they
belong to the previous note.

        Some code

    The whole paragraph can be indented, or just the first
    line.  In this way, multi-paragraph notes work like
    multi-paragraph list items.

This is raw `\TeX`{=tex} code:


| this is a line block that
| spans multiple
| even
  discontinuous
| lines

This is inline and display TeX math created using dollars signs:

$E=mc^2$

$$E=mc^2$$
