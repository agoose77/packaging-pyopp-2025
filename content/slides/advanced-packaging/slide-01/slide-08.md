---
site:
  hide_toc: true
  hide_outline: true
---

# How to Create a Plugin

Your plugin implementation can do very little...

:::{literalinclude} ../../../../arrow-to-knee/src/arrow_to_knee/plugin.py
:label: code:plugin-impl
:linenos:
:lineno-match:
:filename: src/arrow_to_knee/plugin.py
:::

And the `pyproject.toml` entry is also small:

:::{literalinclude} ../../../../arrow-to-knee/pyproject.toml
:label: code:plugin-meta
:filename: pyproject.toml
:lines: 41-43
:linenos:
:lineno-match:
:::
