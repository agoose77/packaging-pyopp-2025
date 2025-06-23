# What is a Package?

Ugh, another heavily overloaded word! Like _einsetzen_[^einsetzen], _packaging_ has a _lot_ of different interpretations. We are going to stick with the definitions given by _the_ authority on packaging in Python — The [{abbr}`PyPA`](xref:ppug). To the PyPA, the term package means two things:

:::{glossary}
:name: glossary:packages
Import package
: A Python module _that you can import_ using an `import` statement.

Distribution package
: An archive (e.g. ZIP, or tar) containing a collection of {term}`import package`s and additional metadata (such as which other distribution packages are required by _this_ distribution).
:::

:::{tip} Objective
:label: tip:objective-package
We're to understand _what_ this distinction means, and why it is useful!
:::

[^einsetzen]: Better German speakers than I have reliably informed me that _ensetzen_ is a [very overloaded term](https://dict.zero-g.net/#q=einsetzen) in German!
