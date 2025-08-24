#let report(
  draw-title-page: false,
  draw-outline: false,
  title: [Title \ optionally multi-rowed],
  type: "Report",
  author: "Magges Mustermensch",
  email: none,
  matric: none,
  advisor: none,
  lang: "en",
  doc
) = {
  // initial document settings
  set page(
    paper: "a4",
    margin: (left: 4cm, rest: 2cm),
  )
  
  set heading(numbering: "1.1.1")
  
  // grey line in between the numbering and the heading
  show heading: it => [
    #if (counter(heading).get().at(0) > 0) {
      counter(heading).display()
      text(silver)[ | ]
    }
    #text(it.body)
  ]
  
  set text(
    font: "New Computer Modern",
    lang: lang,
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
    align(horizon + left)[#{
      set text(size: 14pt)  // font size for the title page
      text(size: 24pt, title)
      linebreak()
      v(1em)
      text(type)
      v(2em)
      text(emph(author))
      linebreak()
      if email != none {
        text(emph(link(email)))
        linebreak()
      }
      if matric != none {
        text([
          #if (lang == "de") {
            "Matrikelnummer:"
          } else {
            "Student ID:"  
          }
          #emph(matric)
        ])
        linebreak()
      }
      if advisor != none {
        text([
          #if (lang == "de") {
            "Betreuer:in:"
          } else {
            "Supervisor:"  
          }
          #emph(advisor)
        ])
      }
    }]
    align(bottom + left)[#datetime.today().display()]
    pagebreak()   
  }

  // document settings
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
    // leading: .65em,  // standard; 1.5em seems too much
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

  counter(page).update(1)

  doc
}

#let hline = {
  line(start: (20%, 0%), end: (80%, 0%))
}
