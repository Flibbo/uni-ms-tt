#let report(
  draw-title-page: false,
  draw-outline: false,
  title: none,
  type: "Ausarbeitung",
  author: none,
  email: none,
  matric: none,
  advisor: none,
  doc
) = {
  // Document settings
  set page(
    paper: "a4",
    margin: (left: 4cm, rest: 2cm),
  )
  
  set heading(numbering: "1.1.1")
  
  set text(
    font: "New Computer Modern",
    lang: "de",
    size: 12pt,
  )

  if draw-title-page {
    // Create the title page
    set page(
      margin: (top: 3.5cm, rest: 5cm),
      numbering: none,
    )
    image("Logo_Universität_Münster.svg")
    line(start: (0%, 0%), end: (8.5in, 0%), stroke: (thickness: 2pt))
    align(horizon + left)[
      #text(size: 24pt, title)\
      #v(1em)
      #text(size: 14pt, type)
      #v(2em)
      #text(size: 14pt, [#author])\
      #text(size: 14pt, [#link(email)])\
      #text(size: 14pt, [Matrikelnummer: #matric])\
      #if not advisor == none {
        text(size: 14pt, [Betreuer:in: #advisor])
      }
    ]
    align(bottom + left)[#datetime.today().display()]
    pagebreak()   
  }

  // Document settings
  set page(
    margin: (left: 4cm, rest: 2cm),
    header: align(
      horizon,
      text(.5em)[#title #h(1fr) #author]
    ),
    numbering: "1",
  )

  // double spacing paragraphs
  set par(
    justify: true,
    // leading: 1.5em,
  )

  // add space after headings
  show heading: set block(
    below: 1em,
  )

  if draw-outline {
    // Outline
    set page(numbering: "I",)
    outline(indent: auto)
    pagebreak()
    set page(numbering: "1",)
  }

  doc
}

#let hline = {
  line(start: (20%, 0%), end: (80%, 0%))
}
