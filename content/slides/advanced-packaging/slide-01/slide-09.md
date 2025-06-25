---
kernelspec:
  name: python3
  display_name: Python 3
site:
  hide_toc: true
  hide_outline: true
---



# Loading a Plugin

Loading all plugins (entry points)

```{code-cell} python3
:label: cell:load-ep
import importlib.metadata

entry_points = importlib.metadata.entry_points()
```

Selecting only the `history_of_war` group

```{code-cell} python3
:label: cell:select-ep
plugins = entry_points.select(group="history_of_war")
```

Load the entrypoint and call the plugin

```{code-cell} python3
:label: cell: call-ep
for plugin in plugins:
    impl = plugin.load()
    impl()
```
