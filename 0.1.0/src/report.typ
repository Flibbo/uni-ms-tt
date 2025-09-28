#import "common.typ": document_setup

#let report(
  draw-title-page: false,
  draw-outline: false,
  hide-header: false,
  title: [Title \ optionally multi-rowed],
  type: "Report",
  author: "Magges Mustermensch",
  email: none,
  matric: none,
  advisor: none,
  lang: "en",
  doc,
) = {
  show: document_setup.with(
    draw-title-page: draw-title-page,
    draw-outline: draw-outline,
    hide-header: hide-header,
    title: title,
    type: type,
    author: author,
    email: email,
    matric: matric,
    advisor: advisor,
    lang: lang,
    doc,
  )

  doc
}
