#import "@local/uni-ms-thesis:0.1.0": location-date

#let todo(content) = box(
  width: 100%,
  stroke: 1pt,
  fill: orange,
  radius: .5em,
  inset: 1em,
  content
)

#let warning = todo[
  There is a specific content requirement from the examination office for the declaration of academic integrity. Therefore, it is essential to check whether the text above is up to date!
]

// 
#let drawing-field(purpose: none, palign: left) = [
  #box(
    stroke: (top: .5pt),
    width: 45%,
    inset: (y: .5em),
  )[
    #align(palign)[
    #set text(size: .7em)
    #purpose
  ]]
]

#let margin-above = 2cm
#let margin-below = 0.4cm

#let signature-field = {
  box(height: margin-above)[#align(bottom, location-date)]
  linebreak()
  drawing-field(purpose: "(Place, Date)")
  h(1fr)
  drawing-field(purpose: "(Signature)", palign: right)
  v(margin-below)
}

// The content to be typeset
#let declaration(title) = {[
  #heading(level: 1, numbering: none, outlined: true)[Declaration of Academic Integrity] <sec:doai>
  
  #set text(size: .9em)  // To fit everything on one page

  I hereby confirm that this thesis, entitled _#(title.replace("\n", " "))_, is solely my own work and that I have used no sources or aids other than the ones stated.

  All passages in my thesis for which other sources, including electronic media, have been used, be it direct quotes or content references, have been acknowledged as such and the sources cited. 

  I am aware that plagiarism is considered an act of deception which can result in sanction in accordance with the examination regulations.

  #signature-field

  I confirm that I am aware that my work may be cross-checked with other texts to identify possible similarities and that it may be stored in a database for this purpose.

  I confirm that I have not submitted the following thesis in part or whole as an examination paper before.

  #signature-field

  Additionally, I declare that I have used AI/IT-supported writing tools in the creation of this work. These tools have been listed in the section #link(<sec:used-tools>)[_Overview of Used Tools_] along with their product names, sources, and details of their usage. I have always worked independently and under my own control when using these tools. The responsibility for the content of the work lies entirely with me.

  #signature-field

  #pagebreak()
  #warning
]}
