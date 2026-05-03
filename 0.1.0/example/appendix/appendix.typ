#import "@local/uni-ms-thesis:0.1.0": hexa-counter
#import "declaration.typ": declaration

#let appendix(
  thesis-title,
  hex: false,
  doc,
) = {
  show: hexa-counter.with(hex)

  declaration(thesis-title)
  include "used-tools-hints.typ"
  include "used-tools.typ"
  doc
}
