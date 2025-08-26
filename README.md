# University of Münster Typst Template

This is an **unofficial** [Typst](https://github.com/typst/typst) template for writing a

- [ ] lecture / presentation
- [ ] report
- [ ] bachelor's thesis
- [ ] master's thesis

at the [University of Münster](https://www.uni-muenster.de/).

I'll try to align it with the *LaTeX template* of the workgroup [Autonomous Intelligent Systems](https://www.uni-muenster.de/AISystems/) in the department of [Computer Science](https://www.uni-muenster.de/Informatik/) at the faculty for [Mathematics and Computer Science](https://www.uni-muenster.de/FB10/).

# Setting up this template

Until I feel confident a first version can be added to the official repo, you can set up the template locally by

```bash
cd ~/.local/share/typst/packages/local/
git clone https://github.com/Flibbo/uni-ms-tt.git
```

# Using the template

For now there is just a preliminary version of the report to work out the major kinks.

## Report

To set up your document to be a **report**, add the following:

```typst
#import "@local/uni-ms-tt:0.1.0": report
```

### Configuration

There are a few fields you can set up to adjust the document to your needs.
All are optional and if not set will fall back to standard values or deactivate the according section.

After the import, add the `show` block:

```typst
#show: report.with(
  draw-title-page: true,
  draw-outline: true,
  // hide-header: true,
  title: "This is the title of your document and will be displayed large",
  author: "This should be you",
  type: [Exposé in the workgroup of \ AIS (Autonomous Intelligent Systems)],
  email: "yourmail@uni-muenster.de",
  matric: "123456",
  advisor: "Prof. Dr. Malte Schilling",
  // lang: "de",
)
```

## Additional Elements

Since I was missing the horizontal bars from _Markdown_ to get a little better overview over the document contents while drafting I added the `#hline` function to replace the `---`.

To use this you'll have to add the function to your import or make an axclusive one.

```typst
#import "@local/uni-ms-tt:0.1.0": hline
```

---
---

# Acknowledgements

This repo is inspired by the [HAW Hamburg Typst Template](https://github.com/LasseRosenow/HAW-Hamburg-Typst-Template) by Lasse Rosenow.
