//// Fonts ////

// [XCharter](https://ctan.org/pkg/xcharter)
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
#let text-fonts = (
  // "EB Garamond",
  "XCharter",  // Used in AIS Template
  "New Computer Modern"
)

//// Header and Footer ////

/// TODO
#let fancy-header = {
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
        #text(fill: luma(127), counter(page).display(pattern))
      ]
    }
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
  // show <nonumber>: set heading(numbering: none)
  show: set-heading-scale
  show heading: it => block(
    sticky: true,
    above: 3.5em,
    below: 2.5em,
  )[#{
    set text(
      font: header-fonts,
      weight: "extrabold",
    )
    // To avoid numbering at abstract, TOC and supplements
    if (
      counter(heading).get().at(0) > 0
      and
      it.body not in
      (
        [Bibliography],
        [Overview of Used Tools],
        [Declaration of Academic Integrity],
      )
    ) {
      if numbering != none {
        // More headspace for chapters
        if (it.depth == 1) {
          v(3.5em)
        }
        // The number
        counter(heading).display()
        // Grey line in between the numbering and the heading
        if (it.depth == 1) {
          h(0.6em)
          box(
            fill: luma(75%),
            width: 1.5pt,
            height: .7em,
            outset: (y: .5em),
          )
          h(0.2em)
        }
        h(0.4em)
      }
    }
    text(it.body)
  }]
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
    // Display as chapter.figure
    str(chp) + "." + str(nums.pos().at(0))
  })
  // Figure number reset in each chapter
  show heading: it => {
    // Only reset if it is a level 1 heading (chapter)
    if it.depth == 1 {
      counter(figure).update(0)
    }
    it
  }
  // Caption styling
  show figure.caption: it => context {
    set text(size: .9em)
    grid(
      columns: (auto, 1fr),
      [*#it.supplement~#it.counter.display()#it.separator*],
      align(left, box(it.body))
    )
  }
  doc
}

/// Sets quotes to a block with a grey bar on the left side
/// and a light grey background
///
/// - doc (content): Document content
/// -> content
#let fancy-quotes(doc) = {
  // Force block should probably be removed at some point
  set quote(block: true)
  show quote.where(block: true): block.with(
    inset: (y: 1em),
    spacing: auto,
    stroke: (left: 2pt + silver),
    fill: luma(240),
  )
  doc
}
