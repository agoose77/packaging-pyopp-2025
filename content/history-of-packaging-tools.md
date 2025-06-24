---
title: A Short History of Python Packaging
short_title: History of Packaging
---

:::{tip} Objective
:label: tip:objective-history-of
We're going to learn about the basic history of Python packaging, and how to navigate the present landscape of tools and standards.
:::

## The (near) past

:::{danger} Don't look out the windows
:label: danger:look-windows
Packaging in Python has a bad reputation, especially on Internet forums.

> I agree, Python packaging/installation has way too many alternatives with no clear guidance from the community.
>
> --- [Sabuncu, May 2, 2012](https://stackoverflow.com/q/6344076/1215241)

Python was designed before modern languages and their ecosystems (like Rust) existed, and sometimes people compare the two unfairly! You've been warned!
:::

At one point in time, there was no such thing as `pip` or PyPI. To share packages, people would structure their code in a particular way using the `distutils` library (with a `setup.py` file), and manually (by-hand) distribute the result to their colleagues.

Then, the Python Package Index (PyPI) was created, and `distutils` learned how to upload to PyPI. Packages stored on PyPI could be manually downloaded and installed.

`setuptools` was subsequently invented, which created a new binary distribution format (eggs), an automatic installation tool (`easy_install`), and other features. With `setuptools`, you could install packages to your computer from PyPI.

Skipping over some details, the wheel format and `pip` were invented and `setuptools` was _the way_ to author a Python package, and `pip` was the preferred way to install it from PyPI.

## The (old) future

:::{pull-quote}
:label: pull:distutils-problems
While distutils / setuptools have taken us a long way, they suffer from [...] serious problems

--- https://peps.python.org/pep-0517/
:::

Now we're closer to the present. In 2015 a PEP was accepted that set Python on a new trajectory. Instead of a "single" tool that was used to build _every_ Python package, now _anyone_ could create a "build backend" that takes a Python project and builds a {term}`source distribution` and {term}`binary distribution`. This was [PEP 517](https://peps.python.org/pep-0517/#abstract).

This made it possible to get rid of the imperative `setup.py` and replace it with something that was nicer to read and write (for both humans and machines!). But, every build-backend had its own configuration format — this was not necessarily an improvement! Another PEP, [PEP 621](https://peps.python.org/pep-0621/#abstract) introduced a way to author "core project metadata" like the project description in a standardised file `pyproject.toml`. There have been a few more PEPs since.

This introduces a lot of new terms:

:::{glossary}
:label: glossary:build-systems
Build backend
: A tool for use by machines that creates (builds) {term}`source distributions<source distribution>` and {term}`binary distributions<binary distribution>`.

Build front end
: A user-friendly tool that invokes the appropriate {term}`build backend` for a given directory containing a Python source tree.

Package installer
: A tool that can install Python packages from e.g PyPI.
:::

Which can help us to understand the status quo:

:::{note} The status quo of Python packaging

- Package _authors_ can pick from a range of {term}`build backends<build backend>` (e.g. `setuptools`).
- Package _authors_ can (mostly) use the same `pyproject.toml` across {term}`build backends<build backend>`.
- Package _authors_ can pick from a range of {term}`build front ends<build front end>` (like `build`, or `pip`).
- Package _users_ can pick from a range of {term}`package installers<package installer>` (e.g. `uv`).
  :::

::::{important} Conclusion
:label: important:conclusion-history-of
We've learned that:

- Packaging has a complex history.
- That complex history has not become any simpler 😓.
- There are a lot of tools that can create and install Python packages.
- There is a standardised way to define project metadata (`pyproject.toml`)
  ::::
