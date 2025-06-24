---
title: Applications vs Libraries
short_title: Apps vs Libraries
subtitle: Users have different expectations of applications and libraries.
---

::::{tip} Objective
:label: tip:objective-app-lib
We're going to understand the difference between applications and libraries, and how to build the right kind of packages.
::::

## Background on dependency hell

"Recently", a tool called Poetry became popular with Python users. It made developing Python packages much easier, and made some strong decisions about user intent. One of these decisions was about package _constraints_ — Poetry introduced _upper bounds_ by default, e.g.

```{code} toml
:filename: pyproject.toml
[project]
dependencies = [
   "numpy>=2.0,<3.0"
]
```

If the user is installing _only_ your package, this isn't a problem. But what about when users are installing _lots_ of packages. As the number of packages {math}`N\rightarrow \infty`, there will be many constraints. What happens when constraints overlap?

:::{note} Overlapping constraints
:label: note:overlap-constraints

If we have `numpy>=1` and `numpy<2` constraints, they form a new constraint `numpy>=1,<2`. What about incompatible constraints, e.g. `numpy>=2` and `numpy<1`? This is _unsolvable_.
:::

Certain tools like `poetry` and `pdm` may encounter incompatible constraints. When this happens, they will often try to use {term}`back solving` in order to find a version of the packages that doesn't impose this constraint.

### Back solving

:::{glossary}
:label: glossary:back-solve
Back solving
: The process of looking at increasingly older package versions to find looser constraints.
:::

When people write packages, they often start with "permissive" uncapped dependencies, e.g.

```{code} toml
:filename: pyproject.toml
:linenos:
:emphasize-lines: 4
[project]
name = "arrow-to-knee"
version = "1.0.0"
dependencies = [
  "numpy >= 1"
]
```

Then, they discover that a new version of their dependency is incompatible with their package. So, they release a new version that introduces an upper cap:

```{code} toml
:filename: pyproject.toml
:linenos:
:emphasize-lines: 4
[project]
name = "arrow-to-knee"
version = "1.0.1"
dependencies = [
  "numpy >= 1,<2"
]
```

If a user requires both `arrow-to-knee` and `numpy>=2`, what will happen? This problem is made worse by _defensive_ caps that _presume_ a new version of the dependency will be incompatible (i.e. before it's _known)_ to be the case).

::::{warning} Back solving is usually not intentional
:label: warning:back-solving-not-intentional
Although _mathematically_, back solving is correct, it is usually the _wrong_ behaviour. See [this blog by Henry Schreiner](https://iscinumpy.dev/post/bound-version-constraints/#backsolving-is-usually-wrong) for more.
::::

::::{note} Styles of versioning
:label: note:style-version
There are many different kinds of versioning styles. Some people use {term}`SemVer`. I encourage you to break from convention and think about what makes the most sense.
:::{glossary}
:label: glossary:apps-libs

SemVer
: Semantic Versioning — meaningful changes with `major`.`minor`.`patch`. Each component communicates a certain kind of change.

CalVer
: Calendar Versioning — versions get better with time. Often of the form `YYYY.MM.<other>`, with lots of variations.

EffVer
: Effort Versioning — vibes-based versioning with `macro`.`meso`.`micro`. Each component communicates a certain level of effort to upgrade.

ZeroVer
: Zero Versioning — like {term}`SemVer` but the `major` component is always 0!

Single Digit
: There's only one number, and it always increases!

:::

::::

## Applications vs Libraries

This brings us back to the question of {term}`applications<application>` vs {term}`libraries<library>`.

:::{glossary}
:label: glossary:apps-libs

Application
: A package that lives in its own environment with no other user packages.

Library
: A package that may coexist with many other user packages.
:::

The distinction between {term}`applications<application>` and {term}`libraries<library>` lies in how they're installed. An {term}`application` should be installed by a tool manager like `pipx` or `uvx`, while an {term}`library` can be added as a dependency to other people's `pyproject.toml` files.

:::{tip} I'm writing an library
:label: tip:writing-library

If you're writing a library, _don't_ add upper bounds to your dependencies unless you _have_ to. Trust your users to be able to fix things instead!
:::

::::{important} Conclusion
:label: important:conclusion-app-lib
We've learned that:

- Applications and libraries have different dependency needs.
- Over-constraining doesn't always do what you expect.
- Upper caps are often harmful, and hard to predict.
  ::::
