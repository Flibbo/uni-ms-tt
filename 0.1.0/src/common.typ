#import "@preview/outrageous:0.4.1"

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
  supervisor: none,
  first-assesor: none,
  second-assesor: none,
) = {
  // Create the title page
  set page(
    margin: (top: 3.5cm),
    numbering: none,
  )
  // Font size for the title page
  set text(size: 10pt)

  // Centered block
  align(top + center)[#{
    image("Logo_Universität_Münster.svg")
    v(2cm)
    text(size: 1.73em, weight: "bold", title)
    v(2cm)
    show smallcaps: set text(size: 1.2em)
    text(type)
    v(2cm)
    "Submitted by:"
    v(1em)
    text(size: 1.44em, weight: "bold", author)
    v(1cm)
    if matric != none {
      if (lang == "de") {
        "Matrikelnummer: "
      } else {
        "Student ID: "
      }
      matric
    }
  }]

  // Assessment information
  align(bottom + left)[#{
    if supervisor != none {
      if (lang == "de") {
        "Betreuer:in:"
      } else {
        "Supervisor:"
      }
      linebreak()
      text(size: 1.2em, supervisor)
      v(1em)
    }
    if first-assesor != none {
      if (lang == "de") {
        "Erstprüfer:in:"
      } else {
        "First assessor:"
      }
      linebreak()
      text(size: 1.2em, first-assesor)
      v(1em)
    }

    if second-assesor != none {
        if (lang == "de") {
          "Zweitprüfer:in:"
        } else {
          "Second assessor:"
        }
        linebreak()
        text(size: 1.2em, second-assesor)
      v(1em)
    }
  }
  Münster, #datetime.today().display("[month repr:long] [day], [year]")
  ]
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
  supervisor: none,
  first-assesor: none,
  second-assesor: none,
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
      // size: 1em,
    )
    #v(1.6em)
    // To avoid numbering at abstract, TOC and supplements
    #if (
      counter(heading).get().at(0) > 0
      and it.body not in
      (
        [Bibliography],
        [Overview of Used Tools],
        [Declaration of Academic Integrity]
      )
    ) {
      if numbering != none {
      counter(heading).display()
      if (it.depth == 1) [
        #h(0.3em)
        #box(
          fill: luma(75%),
          width: 1.5pt,
          height: .7em,
          outset: (y: .5em),
        )
        #h(0.3em)
      ]
      }
    }
    #text(it.body)
    #v(1em)
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
      supervisor: supervisor,
      first-assesor: first-assesor,
      second-assesor: second-assesor,
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
    set page(numbering: "I")
    show: abstract
    pagebreak()
  }

  set heading(numbering: "1.1.1")

  // Grey bar left of quotes
  set quote(block: true)
  show quote.where(block: true): block.with(
    inset: (y: .5em),
    stroke: (left: 2pt + silver, rest: none),
  )

  if draw-outline {
    // Outline
    set page(numbering: "I")
    show outline.entry: outrageous.show-entry
    outline()
    pagebreak()
  }

  // Start regular page counter with content
  set page(numbering: "1")
  counter(page).update(1)

  doc
}
