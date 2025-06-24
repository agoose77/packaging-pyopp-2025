---
title: How to Define Scripts
subtitle: Make your package do something!
---

::::{tip} Objective
:label: tip:objective-how-to-scripts
We're going to learn how to define scripts in `pyproject.toml` that expose your CLI routines.
::::

Python makes it very easy to create CLI scripts. Let's create a `remove-arrow` command for our `arrow-to-knee` package in `src/arrow_to_knee/cli.py`:

```{literalinclude} ../arrow-to-knee/src/arrow_to_knee/cli.py
:filename: src/arrow_to_knee/cli.py
:label: code:remove-arrow-script
:linenos:

```

We can expose this as a CLI application by adding an entry in the `project.scripts` section:

```{literalinclude} ../arrow-to-knee/pyproject.toml
:filename: pyproject.toml
:label: code:remove-arrow-entry
:linenos:
:lines: 38-39
```

This is defining a CLI application called `remove-arrow` implemented by the `remove_arrow` function defined in the `arrow_to_knee.cli` _module_. Let's test it out:

```{code} shell
:name: code:run-script
$ remove-arrow
It's stuck! Can't remove
```

::::{important} Conclusion
:label: important:conclusion-how-to-scripts
We've learned that:

- You can define define `scripts` that can be run in a shell.
  ::::
