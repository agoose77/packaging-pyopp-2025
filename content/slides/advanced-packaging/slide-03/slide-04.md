---
site:
  hide_toc: true
  hide_outline: true
---

# Want to Set the Version in Python?

Some people prefer to define their version in a `__version__` global.

:::{embed} #code:version-py
:::

This lets you use the version number in your code:

:::{embed} #code:use-version-py
:::

It's possible to get the _installed_ version another way:

:::{embed} #code:use-version-py-imp
:::

But this can be "slow" for some applications.
