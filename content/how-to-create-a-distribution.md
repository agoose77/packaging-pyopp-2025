---
title: How to Create a Package
short_title: Define a Package
---

:::{tip} Objective
:label: tip:objective-how-to-create
We're going to learn how to create a distribution by using modern packaging standards and tools.
:::

Now that we know about the two different kinds of {term}`distribution package`, we should learn how to create them! We have already discussed that the main feature of a {term}`distribution package` is the _additional metadata_ like the author's contact details, and description. We will need to define this metadata so that it can be used to build the distribution. At this point, it is necessary to start talking about _packaging tools and standards_.

## Create your first package with Hatch

:::{note}
:label: note:one-way
If you're looking for _the way_ to build a package in Python, it doesn't exist. The landscape is always changing, and new tools come and go. In this workshop, I'm going to recommend "a way", and emphasise that ultimately it doesn't matter — a tool is a tool.
:::

All of this history is quite confusing. Understandably, people have built tools that hide all of this complexity, and provide additional features like environment management, tool support, etc. Ultimately, it's not worth worrying about. Pick one, and try it! See the <xref:ppug#tutorials/packaging-projects> for more detail. We're going to use [Hatch](https://hatch.pypa.io/latest/).

## Upgrade your project with Hatch

If you already have a Python package that was designed to use `setuptools`, hatch comes with an easy-to-use upgrade tool. After installing hatch, simply run

```{code} shell
:label: code:hatch-init
hatch new --init
```

and it will guide you through the process!

:::{tip} Ask for help!
:label: tip:ask-help
This is a fragile operation, and might not succeed. Feel free to ask for help
:::

::::{important} Conclusion
:label: important:conclusion-how-to-create
We've learned that:

- .
  ::::
