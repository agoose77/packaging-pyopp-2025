---
site:
  hide_toc: true
  hide_outline: true
---

+++ { "class": "slide" }

# What is Dependency Injection?

Instead of

```{code} python
:linenos:
import plugin

def application():
    plugin.compute()
```

we have

```{code} python
:emphasize-lines: 1
:linenosc

def application(plugin):
    plugin.compute()
```
