#let hline = {
  line(start: (20%, 0%), end: (80%, 0%))
}

#let title-page(
  title: none,
  type: none,
  author: none,
  email: none,
  matric: none,
  lang: none,
  advisor: none,
) = {
  // Create the title page
  set page(
    margin: (top: 3.5cm, rest: 5cm),
    numbering: none,
  )
  image("Logo_Universität_Münster.svg")
  line(start: (0%, 0%), end: (8.5in, 0%), stroke: (thickness: 2pt))
  align(horizon + left)[#{
    set text(size: 14pt) // Font size for the title page
    text(size: 24pt, title)
    linebreak()
    v(1em)
    text(type)
    v(2em)
    text(emph(author))
    linebreak()
    if email != none {
      text(emph(link("mailto:" + email)))
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


#let document_setup(
  draw-title-page: false,
  draw-outline: false,
  draw-header: false,
  title: [Title \ optionally multi-rowed],
  type: "Document",
  author: "Magges Mustermensch",
  email: none,
  matric: none,
  advisor: none,
  lang: "en",
  abstract: none,
  doc,
) = {
  // Initial document settings
  let margin-main = 3cm //(left: 4cm, rest: 2cm)

  set page(
    paper: "a4",
    margin: margin-main,
  )

  set heading(numbering: none)

  // Grey line in between the numbering and the heading
  show heading: it => [
    #set text(
      font: "New Computer Modern Sans",
      weight: "black",
      size: 1.5em,
    )
    #if (
      counter(heading).get().at(0) > 0 and it.body != [Bibliography]
    ) {
      counter(heading).display()
      if (it.depth == 1) [
        #text(silver)[ | ]
      ]
      // [
      //   #h(0.5em)
      //   #box(
      //     fill: luma(70%),
      //     width: 1.2pt,
      //     height: 1.5em,
      //     // place(span: "parent"),
      //   )
      //   #h(0.5em)
      // ]
    }
    #text(it.body)
  ]

  show heading.where(level: 1): it => {
    // If we’re not at the top of a page, break
    pagebreak(weak: true)
    it
  }

  set text(
    font: "New Computer Modern",
    lang: lang,
    size: 12pt,
  )

  if draw-title-page {
    title-page(
      title: title,
      type: type,
      author: author,
      email: email,
      matric: matric,
      lang: lang,
      advisor: advisor,
    )
  }

  // Document settings
  set page(
    margin: margin-main,
    numbering: "I",
    header: if draw-header {
      // Header
      align(
        horizon,
        text(.5em)[#title #h(1fr) #author],
      )
    } else { none },
  )

  // Double spacing paragraphs
  set par(
    justify: true,
    // leading: .65em,  // standard; 1.5em seems too much
  )

  // Add space after headings
  show heading: set block(
    below: 1em,
  )

  // Display the abstract if one is given
  if abstract != none {
    set page(numbering: none)
    show: abstract
    pagebreak()
  }

  set heading(numbering: "1.1.1")

  // Grey bar left of quotes
  set quote(block: true)
  show quote.where(block: true): block.with(
    inset: (top: .5em, bottom: .5em),
    stroke: (left: 2pt + silver, rest: none),
  )

  if draw-outline {
    // Outline
    set page(numbering: "I")
    outline(indent: auto)
    pagebreak()
  }

  // Start regular page counter with content
  set page(numbering: "1")
  counter(page).update(1)

  doc
}
