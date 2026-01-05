#import "@local/uni-ms-thesis:0.1.0": bachelor
#import "chapters/abstract.typ": abstract

#show: bachelor.with(
  title: "Quite important and even more so important sounding while being oddly specific title",
  author: "My Name",
  email: "myemail@uni-muenster.de",
  matric: "123456",
  advisor: "Prof. Dr. Brofeseur Doggtur",
  abstract: abstract,
)

// This file just contains configurations for the thesis and collects the chapters. Don't miss the abstract up there at the imports.
// The preview has to be launched from this file for everything to display properly.

#include "chapters/introduction.typ"
#include "chapters/background.typ"
#include "chapters/methodology.typ"
#include "chapters/results.typ"
#include "chapters/discussion.typ"
#include "chapters/conclusion.typ"

// #include "chapters/declaration.typ"

#bibliography("liography.bib")
