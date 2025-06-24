import pathlib

base_indent = "       "
for slide in sorted(pathlib.Path("content/slides/").glob("*")):
    print(f"{base_indent}- title: {slide.name}\n{base_indent}  children:")
    slide_indent = f"{base_indent}   "
    for file in sorted(slide.glob("*.md")):
        print(f"{slide_indent}- file: {file}")
