---
site:
  hide_toc: true
  hide_outline: true
---

# Want to Set Version in Python?

Some people prefer to define their version in a `__version__` global.

```{code} python
:label: code:version-py
__version__ = "1.0.0"
```

This lets you use the version number in your code:

```{code} python
:label: code:use-version-py
def show_package_info():
    print(f"This package has version {__version__}")
```

It's possible to get the _installed_ version another way:

```{code} python
:label: code:use-version-py-imp
import importlib.metadata
importlib.metadata.version("arrow-to-knee")
```

But this can be "slow" for some applications.
