#import "@preview/outrageous:0.4.1"
#import "styles.typ": *
#import "title.typ": title-page

// QOL function to create a simple divider line
#let hline = {
  line(start: (20%, 0%), end: (80%, 0%))
}

// Creates the current date
#let location-date = [
  Münster, #datetime.today().display("[month repr:long] [day], [year]")
]

/// Creates a partial display of the given image.
/// 
/// Zoom into the image by modifying the image width parameter.
///
/// - img-content (image): The image to display from.
/// - width (): Width of the cut-out.
/// - height (): Height of the cut-out.
/// - offset (): `dx` and `dy` offsets of the image.
/// -> box (partial image)
#let cut-out(
  img-content,
  width: 100%,
  height: 20%,
  zoom: 100%,
  offset: (:),
  border: false,
  ) = {
    // handle optional offsets
    let dx = offset.at("dx", default: 0pt)
    let dy = offset.at("dy", default: 0pt)

    box(
      width: width,
      height: height,
      clip: true,
      stroke: if border {.5pt} else {none},
    )[
      #place(dx: dx, dy: dy)[
        #scale(zoom)[#img-content]
      ]
    ]
  }
)


/// Creates a nice headerboy to encase a listing.
///
/// - title (str): The title to be displayed. Usually a filename.
/// -> box
#let code-header(title) = {
  block(
    width: 100%,
    fill: silver,
    inset: .5em,
    spacing: .5em,
    radius: (top: .5em),
    raw(title.text),
  )
}

/// Here all parts and styles get combined as well as infused with the given parameters
#let document-setup(
  draw-title-page: false,
  draw-outline: false,
  draw-header: false,
  title: none,
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
    leading: 1em, // .65em is standard, so this should be onehalf
    spacing: 2em,
  )

  // Bullet lists
  set list(
    tight: false,
    indent: 1.5em,
    spacing: 1.8em,
  )
  // This fixes some weird collapsing of space
  // above lists between it and preceeding par
  show list: it => block(above: 2.5em, below: 2.5em, it)

  // Apply styles
  show: fancy-headings
  show: openright
  show: fancy-figures
  show: fancy-quotes

  // show chapter on equation numbering
  // https://forum.typst.app/t/figure-and-table-captions-with-chapter-number/1520/7
  set math.equation(numbering: (..num) =>
    numbering("(1.1)", counter(heading).get().first(), num.pos().first())
  )

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
  if draw-header { fancy-header }

  // Display the abstract if one is given
  if abstract != none {
    align(horizon)[#show: abstract]
    pagebreak()
  }

  // Outline
  if draw-outline {
    show outline.entry: outrageous.show-entry.with(
      vspace: (2em, 1em),
      gap: (1em,),
      page-transform: (level, page) => {
        [#text(font: "FreeMono", page)]
      },
    )
    outline(depth: 2)
    pagebreak(to: "odd")
  }

  //// Main part ////

  // Start regular page counter with content
  set heading(numbering: (..levels) => {
    if levels.pos().len() <= 2 {
      numbering("1.1", ..levels)
    }
  })
  set page(numbering: "1")
  counter(page).update(1)

  doc
}
