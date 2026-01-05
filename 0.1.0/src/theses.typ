#import "common.typ": document_setup

#let bachelor(
  draw-title-page: true,
  draw-outline: true,
  draw-header: false,
  title: [Title \ optionally multi-rowed],
  type: [#smallcaps[Bachelor's Thesis] \ in partial fulfilment of the requirements for the degree of \ #smallcaps[Bachelor of Science]],
  author: "Magges Mustermensch",
  email: none,
  matric: none,
  advisor: none,
  lang: "en",
  abstract: none,
  doc,
) = {
  show: document_setup.with(
    draw-title-page: draw-title-page,
    draw-outline: draw-outline,
    draw-header: draw-header,
    title: title,
    type: type,
    author: author,
    email: email,
    matric: matric,
    advisor: advisor,
    lang: lang,
    abstract: abstract,
  )

  doc
}

#let master(
  draw-title-page: true,
  draw-outline: true,
  draw-header: false,
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
    draw-header: draw-header,
    title: title,
    type: type,
    author: author,
    email: email,
    matric: matric,
    advisor: advisor,
    lang: lang,
  )

  doc
}
