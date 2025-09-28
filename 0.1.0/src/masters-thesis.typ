#import "common.typ": document_setup

#let masters-thesis(
  draw-title-page: true,
  draw-outline: true,
  hide-header: true,
  title: [Title \ optionally multi-rowed],
  type: [#smallcaps[Master's Thesis] \ in partial fulfilment of the requirements for the degree of \ #smallcaps[Master of Science]],
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
