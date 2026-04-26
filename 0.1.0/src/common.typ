#import "@preview/outrageous:0.4.1"
#import "styles.typ": *
#import "title.typ": title-page

/// QOL function to create a simple divider line
#let hline = {
  line(start: (20%, 0%), end: (80%, 0%))
}

#let location-date = [
  Münster, #datetime.today().display("[month repr:long] [day], [year]")
]

/// Here all parts and styles get combined as well as infused with the given parameters
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
  //// Initial configuration ////
  set page(
    paper: "a4",
    margin: (bottom: 4cm, rest: 3cm),
    numbering: "I",  // For preamble - changed at main section
    footer: fancy-footer
  )

  set text(
    top-edge: "x-height",
    font: text-fonts,
    lang: lang,
    size: 11pt,
  )

  // Double spacing paragraphs
  set par(
    justify: true,
    leading: 1em // .65em is standard, so this should be onehalf
  )

  // Apply styles
  show: fancy-headings
  show: openright
  show: fancy-figures
  show: fancy-quotes

  //// Front matter ////
  set heading(numbering: none)

  // Title page
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
      location-date: location-date,
    )
  }

  // Document settings // TODO: create fancy headers
  // set page(
  //   header: if draw-header {
  //     // Header
  //     align(
  //       horizon,
  //       text(.5em)[#title #h(1fr) #author],
  //     )
  //   } else { none },
  // )

  // Display the abstract if one is given
  if abstract != none {
    align(horizon)[#show: abstract]
    pagebreak()
  }

  // Outline
  if draw-outline {
    show outline.entry: outrageous.show-entry.with(
      vspace: (2em,1em),
      gap: (1em,),
      page-transform: (level, page) => {
        [#text(font: "FreeMono", page)]
      },
    )
    outline()
    pagebreak()
  }

  //// Main part ////

  // Start regular page counter with content
  set heading(numbering: "1.1.1")
  set page(numbering: "1")
  counter(page).update(1)

  doc
}
