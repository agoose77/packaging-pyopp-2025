---
title: Kinds of Distribution Packages
short_title: Kinds of Packages
---

:::{tip} Objective
:label: tip:objective-kinds-of
We're going to learn about two different kinds of {term}`distribution package`, and how they compare.
:::
This whole discussion so far has been back-to-front. We've started with some assumptions about `pip`, and NumPy, and used those to play around a little. Let's take a step back.

## The purpose of a distribution

What is the purpose of a distribution? Well, it exists to solve the following problems:

:::{div}
:label: div:distribution-problems

1. Bundle a Python {term}`import package` into a sharable container
2. Store metadata like the version of the package, and author contact details!
3. List _other_ {term}`distribution packages<distribution package>` that are used by _this_ package.
   :::

For example, you might write some analysis code that needs to be able to import NumPy in order to perform some array calculations. You might need an older version of NumPy that still supports a particular feature. How do you signal to your users that this is the case? This is the purpose of a distribution: to encode additional information alongside your code.

## Two kinds of distributions

There are two _kinds_ of distribution that Python packaging knows about:
:::{glossary}
:label: glossary:distributions
Binary distribution
: An archive containing exactly the files that need to be copied when installing the package.

Source distribution
: A raw archive of the source code. From a source distribution, it is possible to build a {term}`binary distribution`.
:::

Er... this is a bit technical. The most important bit is very easy to miss:

:::{important}
:label: important:distribution-note

- Binary distributions are installed by _copying files_.
- Source distributions are installed by _building binary distributions_, and then installing them.
  :::

:::{exercise} Install a source distribution
:label: ex:install-source
Most packages you install with `pip` these days are binary distribution.

I've created a simple demo package and uploaded a source distribution, go ahead and install it. Let me know if you have any problems — we'll need this for later on in the talk.

1. Create a virtual environment
   ```shell
   python -m venv .venv
   ```
2. Activate the virtual environment
   ```shell
   source .venv/bin/activate
   ```
3. Install the package
   ```shell
   pip install demo-setup-exec
   ```

:::

Source distributions are known as "sdists". Binary distributions are known as "wheels", hence the `.whl` extension. If you want to know _why_ the name "wheel", it's Monty Python. It's _always_ Monty Python with Python! We'll use the words "wheel" and "binary distribution" interchangeably from now on.

:::{important} Copying files is easy!
Binary distributions are very easy to install — it's just copying files. This means that all the hard work (things that can go wrong) is done by the package _author_.
:::

Some people in the room might be wondering — "how can you author a single package that can run on anyone's computer?". After all, if installing a wheel is as simple as copying files, then there's no way to customise the installation. Good question. Recall the tags that we saw in a previous section:

![](#cell:numpy-zip-ls)

Here, these `-XXX` parts have special meaning:

:::{div}
:label: def:wheel-tags
`-cp311`
: "CPython 3.11", the version of Python this wheel was built for.

`-manylinux_2_28_x86_64`
: The kind of operating system that the wheel is designed to run on.
:::

You might be seeing where this is going; the wheel _installation_ is not customisable, but we _can_ build a unique wheel for the particular Python version and operating system we are interested in. This is advanced detail, that we won't cover more on for now.

::::{important} Conclusion
:label: important:conclusion-kinds-of
We've learned that:

- There are {term}`source distributions (sdists)<source distribution>` and {term}`binary distributions (wheels)<binary distribution>`.
- Binary distributions are easier to install.
- Binary distributions are specialised to the target.
  ::::
