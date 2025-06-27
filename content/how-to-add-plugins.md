---
title: How to Define Plugins
subtitle: Make your application extensible!
kernelspec:
  name: python3
  display_name: Python 3
---

:::{tip} Objective
:label: important:objective-entry-points

- To discover the _entry point_ mechanism.
- To learn about dependency inversion.
  :::
  % End up in entry-points.txt, including scripts!

## The Problem

When you're developing an application, your might want to make it easy for users to add new features. For example, a new fitting routine for your GUI application. You want this to be something that users can do without _your_ intervention; we are all bottlenecks on our own projects, and we don't want to get in the way of our users!

This means that we can't import users code in our application, i.e. we can't do:

```{code} python
import some_users_module

def my_cool_application():
    some_users_module.do_something()
```

as we do not know where the user addition(s) comes from when writing our package.

:::{figure} ../media/wat.gif
:label: img:wat

How you might be feeling at this point.
:::

How do we solve this problem? There's an established pattern for this kind of task, called {term}`dependency injection`.

:::{figure} ../media/dependency-injection.webp
:label: img:dep-inj

Watch out, I know several different ways to inject plugins into your code.
:::

## What is Dependency Injection?

:::{glossary}
:label: glossary:di
Dependency injection
: Receiving dependencies (functions, classes, etc.) as inputs instead of importing them directly.

:::

:::{important} Dependency injection is simple!
:label: important:dep-inj-simple
The change in @code:dep-inj is _just_ passing in a plugin as an argument.

Dependency injection is _just_ argument passing!
:::

In simple terms, this _can be_ as simple as passing in a function as a functional argument, transforming from this:

```{code} python
:linenos:
:label: code:no-dep-inj
import plugin

def application():
    plugin.compute()
```

to this:

```{code} python
:emphasize-lines: 1
:linenos:
:label: code:dep-inj

def application(plugin):
    plugin.compute()
```

## Uses for Plugins

As indicated above, the _main_ reason to create a plugin is to allow users to _define_ new features that you can _request_ ahead of time:

:::{div}
:label: div:uses-plugins

- Adding new features to a framework or app.
  - Jupyter server extensions
  - GlueViz fitting routines
    % Jupyter Server
- Changing the implementation of a framework or app.
  :::
  % link: https://amir.rachum.com/python-entry-points/

## How to Create a Plugin

Your plugin implementation can do very little...

:::{literalinclude} ../../arrow-to-knee/src/arrow_to_knee/plugin.py
:label: code:plugin-impl
:linenos:
:lineno-match:
:filename: src/arrow_to_knee/plugin.py
:::

And the `pyproject.toml` entry is also small:

:::{literalinclude} ../../arrow-to-knee/pyproject.toml
:label: code:plugin-meta
:filename: pyproject.toml
:lines: 41-43
:linenos:
:lineno-match:
:::

This is _all_ that is required to define a plugin and expose it from your package. Once your package has been installed, other packages in the same Python environment can request the plugin as part of the plugin _group_.

## Loading a Plugin

To _load_ plugins as a _consumer_, you can use the `importlib.metadata` package. Since Python 3.10 this is no-longer provisional, and ships with Python.

To load all plugins, it's as simple as:

```{code-cell} python3
:label: cell:load-ep
import importlib.metadata

entry_points = importlib.metadata.entry_points()
```

We can filter this result to select only our plugin group of interest. To select only the `history_of_war` group:

```{code-cell} python3
:label: cell:select-ep
plugins = entry_points.select(group="history_of_war")
```

The corresponding `list` of plugins contains plugin _information_ objects. These contain details about where the plugin came from, and how to load it. We can load the `plugin` from the entry point object using `load()`, and then call the plugin-

```{code-cell} python3
:label: cell:call-ep
for plugin in plugins:
    impl = plugin.load()
    impl()
```

:::{important} Conclusion
:label: important:conclusion-entry-points

We’ve learned that:

- Python has the ability to perform cross-package DI.
- You can share _any Python object_ with other packages.
- It is easy to [declare a plugin with `pyproject.toml`](#code:plugin-meta)
  :::
  % End up in entry-points.txt, including scripts!
