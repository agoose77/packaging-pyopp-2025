---
title: What is a Package?
subtitle: Another word with too many meanings!
kernelspec:
  name: python3
  display_name: Python
---

# What is a Package?

```{code-cell} python3
:tags: [remove-cell]

import os, tempfile
os.chdir(tempfile.mkdtemp())
```

:::{tip} Objective
:label: tip:objective-what-is
We're going to learn two definitions of the word "package", and why the distinction is useful!
:::

## The word "package"

Ugh, another heavily overloaded word! Like einsetzen[^einsetzen], _packaging_ has a _lot_ of different interpretations. Some of us might already have an idea:

:::{blockquote}
:label: quote:import-package

A Python package is something you can _import_ e.g. `import numpy`

--- An imaginary friend
:::

Any other ideas? Enter my _other_ imaginary friend

:::{blockquote}
:label: quote:install-package

A Python package is something you can _install_, e.g. `pip install numpy`

--- My other imaginary friend
:::

I really can't afford for these friends to fall out[^im]. How do we rectify these different definitions? We are going to start by taking the formal definitions of the word "package" given by _the_ authority on packaging in Python — The [{abbr}`PyPA`](xref:ppug). To the PyPA, the term package means one of:

:::{glossary}
:name: glossary:packages
Import package
: A Python module _that you can import_ using an `import` statement.

Distribution package
: An archive (e.g. ZIP, or tar) containing a collection of {term}`import package`s and additional metadata (such as which other distribution packages are required by _this_ distribution).
:::

## Exploring import packages

One of the earliest things you will have learned on your Python journey is how to import _other_ people's code.
:::{exercise}
:label: ex:worse-other-code
What's worse than code that someone else wrote?
:::
:::{solution} ex:worse-other-code
:label: sol:worse-other-code
:class: dropdown

Code that you wrote, late at night, without documentation because

> the \_code is the documentation

Is this you?
:::

With this self-deprecating line of thinking, we should clearly prefer using other people's code. Let's try importing NumPy[^req]!

```{code-cell} python3
:label: cell:import
import numpy
```

💥 Nice. When we run `import`, where is the code _coming from_? Python gives us some handy attributes that we can look at

```{code-cell} python3
:name: cell:numpy-path
numpy.__path__
```

That looks like a directory to me! Let's take a closer look

```{code-cell} python3
:label: cell:numpy-dir
path = numpy.__path__[0]
!ls {path}
```

OK, so it's _not_ magic. 🧙 Phew. Crisis _averted_, we can all go home.
:::{pull-quote}
But how does the code _get there_?
:::
The next question is obvious! How does the code get there?? From our previous discussion we can infer that someone may have _installed_ NumPy, such as with pip.

```{code-cell} python3
:label: cell:show-numpy
:class: space-cat

%pip show numpy
```

That confirms it — NumPy is importable _and_ `pip` knows about it. But, _how_ does `pip` install the package? Where does it get it from? How do you put your own "package" there? What is the meaning of life?

These are all great questions.

## Our first look at a distribution package

By now, we've covered the fact that if you can import a Python module, it's an {term}`import package`. We also had an alternative definition of a package:

![](#quote:install-package)

We learned that the PyPA call this a {term}`distribution package`. You can _easily_ find out what a distribution package looks like! Let's take NumPy for example! The `pip` program has a `download` option:

:::{figure} ../media/you-wouldnt-download-a-package.png
:label: fig:you-wouldnt
A very important disclaimer from the 2000s, about packaging.
:::

```{code-cell}
:label: cell:numpy-download
%pip download numpy
```

We can see that some file was downloaded to the working directory:

```{code-cell} python3
:label: cell:numpy-zip-ls
!ls numpy*
```

What is this? What's a `.whl` extension used for? What are all those tags like `-cp311`? All will be revealed. Let's first ask what kind of file this is.

```{code-cell} python3
:label: cell:numpy-file
!file numpy*.whl
```

It's a <wiki:ZIP_file>! That means we can extract it, and look inside.

```{code-cell} python3
:label: cell:numpy-dirs
!unzip -q numpy*.whl
!ls -d numpy*/
```

There are three folders! Let's peek at the `numpy/` directory:

```{code-cell} python3
:label: cell:numpy-code-dir
!ls numpy/
```

No surprises there, that looks like the same files we saw in @cell:numpy-dir. What about the directory with the `.dist-info` suffix?

```{code-cell} python3
:label: cell:numpy-dist-dir
!ls numpy*.dist-info/
```

This is _not_ a Python {term}`import package`. We've encountered something _new_ — these files are Python _distribution data_. More on that later!

::::{important} Conclusion
:label: important:conclusion-what-is
We've learned that:

- an {term}`import package` is not the same thing as a {term}`distribution package`.
- `pip` downloads and installs {term}`distribution packages<distribution package>`.
- {term}`distribution packages<distribution package>` contain {term}`import packages<import package>`.

:::{note} Note on terminology

In Python, when people use the word "package" in the context of "packaging", they're nearly _always_ talking about {term}`distribution packages<distribution package>`.

:::
::::

[^einsetzen]: Better German speakers than I have reliably informed me that _einsetzen_ is a [very overloaded term](https://dict.zero-g.net/#q=einsetzen) in German!

[^req]: This tutorial takes place at a particular moment in space-and-time (one where I've installed NumPy already...)

[^im]: What, did you think imaginary friends grown on trees?
