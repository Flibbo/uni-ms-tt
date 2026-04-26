/// Creates the title page
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
  location-date: none,
) = {
  // No page number on title
  set page(
    numbering: none,
    margin: 3cm
  )

  // Centered block
  align(top + center)[#{
    v(.5cm)
    image("Logo_Universität_Münster.svg", width: 6cm)
    v(6em)
    text(
      size: 1.73em,  // LARGE
      weight: "bold",
      stretch: 50%,
      title
    )
    v(4em)
    show smallcaps: set text(size: 1.2em)  // large
    text(type)
    v(5em)
    "Submitted by:"
    // linebreak()
    v(.2em)
    text(
      size: 1.44em,  // Large
      weight: "bold",
      author
    )
    v(1.4em)
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
    let assessor(name) = {
      linebreak()
      text(
        size: 1.2em,
        style: "italic",
        name
      )
      v(.5em)
    }
    if supervisor != none {
      if (lang == "de") {
        "Betreuer:in:"
      } else {
        "Supervisor:"
      }
      assessor(supervisor)
    }
    if first-assesor != none {
      if (lang == "de") {
        "Erstprüfer:in:"
      } else {
        "First assessor:"
      }
      assessor(first-assesor)
    }
    if second-assesor != none {
      if (lang == "de") {
        "Zweitprüfer:in:"
      } else {
        "Second assessor:"
      }
      assessor(second-assesor)
    }
  }
  #location-date
  ]
  pagebreak()
  // Reactivate page numbers
  set page(numbering: "I")
}
