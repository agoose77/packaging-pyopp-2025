---
site:
  hide_toc: true
  hide_outline: true
---

# How Do I Build a Dynamic README (ctd)?

Next, configure the `fancy-pypi-readme` tool:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-fancy-tool
[tool.hatch.metadata.hooks.fancy-pypi-readme]
content-type = "text/markdown"
```

Finally, define your readme `fragments`:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-fancy-tool-frag
[[tool.hatch.metadata.hooks.fancy-pypi-readme.fragments]]
path = "README.md"
start-after = "<!-- BEGIN README 1 -->"
end-before = "<!-- END README 1 -->"

[[tool.hatch.metadata.hooks.fancy-pypi-readme.fragments]]
text = "This is a readme\n"

[[tool.hatch.metadata.hooks.fancy-pypi-readme.fragments]]
path = "README.md"
start-after = "<!-- BEGIN README 2 -->"
end-before = "<!-- END README 2 -->"
```
