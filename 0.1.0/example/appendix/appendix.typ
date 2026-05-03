#import "@local/uni-ms-thesis:0.1.0": hexa-counter
#import "declaration.typ": declaration

#let appendix(
  thesis-title,
  hex: false,
  doc,
) = {
  show: hexa-counter.with(hex)
  set heading(numbering: none, outlined: true)
  // So figures can get their own chapter number
  counter(heading).step()

  // Appendix content
  declaration(thesis-title)
  include "used-tools-hints.typ"
  include "used-tools.typ"
  doc
}
