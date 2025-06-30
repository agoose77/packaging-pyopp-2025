---
title: Pick Your Files
subtitle: Learn about the configuration required to tweak your package
---

:::{tip} Objective
:label: important:objective-file-selection

- To learn how `hatchling` chooses what to include in your package.
- To learn about what goes into a {term}`source distribution` and a {term}`binary distribution`.
  :::

# Distribution file selection

{term}`Source distributions<source distribution>` should include _all_ of the important files that comprise your project. This includes things that do not make their way into the {term}`binary distribution`:

:::{div}
:label: div:sdist-include

- tests
- docs
- code
- data files
  :::

They do not need to include GitHub Actions configuration or other Git files:

:::{div}
:label: div:sdist-remove

- ignore `.github/`
- ignore `.git/`
  :::

Meanwhile, {term}`binary distributions<binary distribution>` should _only_ include what is required to install your project, i.e.:

:::{div}
:label: div:binary-include

- code
- data files
  :::

# Default file selection

`hatchling` has [sensible defaults for file inclusion](https://hatch.pypa.io/1.13/config/build/#file-selection) for each kind of distribution. This makes it easy to get started packging a simple project:

:::{div}
:label: dl:default-files
SDists
: All files _not_ ignored by Git.

Wheels
: `src/<PROJECT NAME>/`, respecting your `.gitignore`.
:::

Despite this, you should ensure that you actually _look_ at both the {term}`source distribution` and {term}`binary distribution` to confirm that their contents match your expectations.

# Controlling Included Files

You can specify _exactly_ which files should appear in your distribution by using the `include` and `exclude` entries for each target, e.g. for the {term}`source distribution`:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-file-sdist-inc
:linenos:
[tool.hatch.build.targets.sdist]
include = [
  "src/arrow_to_knee/*.py",
  "/tests",
]
exclude = [
  "*.json",
  "src/arrow_to_knee/some-random-file.py",
]
```

The `exclude` takes precedence over `include`. The use of `/` is similar to the behaviour of `/` in `.gitignore` files — it refers to the project root. You can use exactly the same configuration for your {term}`binary distribution`, i.e. for the `wheel` target. In general, it's better to specify as little as possible where the default rules like `.gitignore` make e.g. explicit exclusion unnecessary.

# Including generated files

Some tools can generate files which should be ignored by Git, but included in the {term}`binary distribution`. An example might be a generated version file, or a compiled shared library. You can include these with the `artifacts` parameter:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-file-wheel-inc
:linenos:
[tool.hatch.build.targets.wheel]
artifacts = [
  # Include generated JSON
  "*.json"
  # Ignore this specific JSON file, though
  "!particular-data.json"
]
```

Included `artifacts` are _not_ affected by `exclude`; there's an exclusion operator `!` that you can use to ignore certain artifact patterns.

# Rewriting paths

`hatchling` can move files around in your {term}`distribution package`, so that they have a different location once installed than they do in your {term}`source distribution`. For example, to move `a-folder` from the root of your Git repository to the `arrow_to_kneee/renamed_folder` location[^move], the following configuration may be used:

```{code} toml
:filename: pyproject.toml
:label: code:pyproject-file-rewrite
:linenos:
[tool.hatch.build.targets.wheel]
include = ["src/arrow_to_knee", "a-folder"]

[tool.hatch.build.targets.wheel.sources]
"src/arrow_to_knee" = "arrow_to_knee"
"a-folder" = "arrow_to_knee/renamed_folder"
```

:::{warning} Don't rely on default file inclusion
:label: warning:default-inclusion
Once you start changing the inclusion rules, you should make sure to specify the `include` and `exclude` fields.
:::

This looks a bit more complicated than our previous configuration, and whilst it's likely obvious what

```toml
"a-folder" = "arrow_to_knee/renamed_folder"
```

is doing, what about

```toml
"src/arrow_to_knee" = "arrow_to_knee"
```

By default, `hatchling` is rather smart, and understands that `src/arrow_to_knee` is where the `arrow_to_knee` import package lives. As such, it will include these files under `/arrow_to_knee` in the built wheel. Once we start needing to move things around, this automatic configuration no longer applies[^sources], and we need to handle the `src/` rewriting ourselves.

:::{important} Conclusion
:label: important:conclusion-file-selection
We have learned that:

- `hatchling` can `include` and `exclude` files for a {term}`source distribution` and a {term}`binary distribution`.
- It can re-write paths in the final wheel.
- It can include generated assets.
  :::

  [^move]: So that it may be imported as `arrow_to_knee.renamed_folder`, if it contains an `__init__.py`.

  [^sources]: Technically the default configuration uses `sources`, which we're overwriting.
