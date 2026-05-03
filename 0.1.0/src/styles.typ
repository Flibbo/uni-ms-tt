//// Fonts ////

// For accessibility reasons we used the open font "New Computer Modern[ Sans]" included in typst for this document as fallback.

// To be more in line with the official CI of the University of Münster the fonts could be changed to "FF Meta" for headlines and "Adobe Garamond" for text blocks. See: https://www.jura.uni-muenster.de/de/fakultaet/iv-versorgungseinheit/it-services-und-beratung/kommunikationsvorlagen/
// Free alternatives to those are "Fira Sans" and "EB Garamond"

/// Collection of fonts for headers\
/// Bold parts on title page use `text-fonts`
#let header-fonts = (
  // "Fira Sans",
  "Source Sans 3",  // Used in AIS Template
  "New Computer Modern Sans"
)

/// Collection of fonts for text blocks\
/// Applied also on bold parts of title page
/// 
/// [XCharter](https://ctan.org/pkg/xcharter)
#let text-fonts = (
  // "EB Garamond",
  "XCharter",  // Used in AIS Template
  "New Computer Modern"
)

//// Text elements ////

/// Sets quotes to a block with a grey bar on the left side
/// and a light grey background
///
/// - doc (content): Document content
/// -> content
#let fancy-quotes(doc) = {
  // TODO: Force block should probably be removed at some point
  set quote(block: true)
  show quote.where(block: true): block.with(
    inset: (y: 1em),
    spacing: auto,
    stroke: (left: 2pt + silver),
    fill: luma(240),
  )
  doc
}

//// Header and Footer ////

/// TODO
#let fancy-header = {
  // set page(
  //   header: align(
  //     horizon,
  //     text(.5em)[#title #h(1fr) #author],
  //   )
  // )
  // TODO
}

/// Footer with 50% grey page numbers on the outside of pages with content
#let fancy-footer = {
  context {
    let (num,) = counter(page).get()
    let align_side = if calc.even(num) { left } else { right }
    let pattern = here().page-numbering()

    if pattern != none {
      align(align_side)[
        #text(
          font: "FreeMono",
          fill: luma(75%),
          counter(page).display(pattern)
        )
      ]
    }

  }
}

/// Sets page numbers to hexadecimal
#let hexa-counter(hex, doc) = {
  if hex {
    set page(numbering: n => {
      // Convert the decimal number 'n' to a hexadecimal string
      let hex_str = str(n, base: 16)
      if hex_str.len() == 1 {
        hex_str = "0" + hex_str
      }
      // Convert to uppercase for standard reading
      "0x" + upper(hex_str)
    })
    doc
  } else {
    doc
  }
}

//// Headings ////

/// Heading scaling to simulate size relations like LaTeX chapters and sections
///
/// - doc (content): Document content
/// -> content
#let set-heading-scale(doc) = {
  // show heading.where(level: 1): set text(size: 1.85em)
  // show heading.where(level: 2): set text(size: 1.57em)
  show heading.where(level: 1): set text(size: 1.31em)
  show heading.where(level: 2): set text(size: 1.09em)
  doc
}

/// Only start new section on a new page and right hand
/// 
/// Also ommits page numbering on skipped ones
///
/// - doc (content): Document content
/// -> content
#let openright(doc) = {
  show heading.where(level: 1): it => {
    {
      set page(numbering: none)
      pagebreak(weak: true, to: "odd")
    }
    it
  }
  doc
}

/// Sets behaviour and styling of headings
/// 
/// Also sets the grey divider for top level headings
///
/// - doc (content): Document content
/// -> content
#let fancy-headings(doc) = {
  show: set-heading-scale
  // Space between neighbouring elements (number, [bar,] title)
  let gap = .5em
  // The grey divider between number and text of level 1 headings
  let grey-bar = box(
    fill: luma(75%),
    width: 1.5pt,
    height: .6em,
    outset: (y: .4em),
  )

  show heading: it => block(
    sticky: true,
    above: 3.5em,
    below: 2.5em,
  )[#{
    set text(
      font: header-fonts,
      weight: "extrabold",
    )
    // Custom section numbers
    if it.numbering != none {
      // More headspace for chapters
      if (it.level == 1) { v(3.5em) }
      // The number
      counter(heading).display()
      // Grey line in between the numbering and the heading
      if (it.level == 1) {
        h(gap)
        grey-bar
      }
      // No padding for unnumbered headings
      if (it.level < 3) { h(gap) }
    }
    text(it.body)
  }]

  doc
}

//// Figures (Images, Tables, Code) ////

/// Table configurations
/// 
/// - Gives tables a bold first line
/// - Caption is set above
///
/// - doc (content): Document content
/// -> content
#let fancy-tables(doc) = {
  // Table cations above
  show figure.where(
    kind: table
  ): set figure.caption(position: top)
  // Table presets
  show figure: set table(
    stroke: (_, y) => (
      top: if y > 1 {.5pt} else {1pt},
      bottom: 1pt,
    ),
    inset: .6em,
  )
  // // Bold first line
  // show table.cell.where(y: 0): strong
  doc
}

/// Sets styles for figures
/// 
/// - numbering by chapter, then by figure
/// - caption as
///   - title on the left
///   - left-aligned text block on the right
///
/// - doc (content): Document content
/// -> content
#let fancy-figures(doc) = {
  // Numbering
  show figure: set figure(numbering: (..nums) => {
    let chp = counter(heading).get().at(0)
    let fig = counter(figure).get().at(0)
    // Display as chapter.figure
    str(chp) + "." + str(fig)
  })
  // Add figure number reset to top level heading
  show heading.where(level: 1): it => {
    counter(figure).update(0)
    it
  }
  // Caption styling
  show figure.caption: it => context {
    set text(size: .9em)
    if it.numbering == none {
      box(width: 100%, align(left, it.body))
    } else {
      grid(
        columns: (auto, 1fr),
        [*#it.supplement~#it.counter.display()#it.separator*],
        align(left, box(it.body))
      )
    }
  }
  // Automatic placement
  let space = 2em
  show figure: set figure(placement: auto)
  show figure: set place(clearance: space)
  // If in-flow (placement: none) ensure distance
  show figure: set block(spacing: space)
  show: fancy-tables
  doc
}

