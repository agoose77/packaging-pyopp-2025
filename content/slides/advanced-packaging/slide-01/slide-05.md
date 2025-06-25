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
:linenos:

def application(plugin):
    plugin.compute()
```
