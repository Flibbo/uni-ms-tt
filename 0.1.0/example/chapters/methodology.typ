#import "@preview/ouset:0.2.0": underset
#import "@local/uni-ms-thesis:0.1.0": hline

= Methods

The Methodology chapter of your thesis  involves a detailed description of your general approach and how it functions. The individual parts of the system and the processing in the system are introduced. First, on an individual level which modules are used and these are described in detail. Secondly, how these interact. In AI systems this includes an overview of the overall system architecture (ideally as an illustration). And there should be a description of how modules interact and exchange what kind of data. When learning is involved the whole machine learning pipeline should be reflected (preprocessing, data handling, model training, evaluation).

Overall, the methods section should detail how your chosen design and research methodologies are ideally suited to answering your research questions. It should provide sufficient details on your approach to make it reproducible for other researchers. This includes mathematical equations or pseudo-code when necessary to explain processing.

== Experimental Design and Procedure

You should also explain how you access your proposed methodology: What did you measure and how? And how does this answer or relate to your research questions? This should lead to SMART results (Specific Measurable Achievable Reasonable Time-bound). Overall you should detail 

- the procedure / the experiment: the setup, repetitions, etc. with a description that includes the environment and conditions;
- the data collection process: how is something measured and how further processed.

Ideally, you aim for quantitative data that allows you to address your research question. In many cases, this can be complemented with qualitative data or examples in the results that will help illustrate certain points or provides additional insights.

#align(center)[
#table(
  columns: (2.5cm, 4.5cm, 4.5cm),
  align: (left, left, left),
  //caption: [Comparison of Research Methodologies, following @paperpile2023methods.],
  //label: <research_methods>,
  table.header(
    [Data Type], [*Description*], [*Methodology*]
  ),
  [Quantitative],
  [Focuses on quantifying data and applying statistical methods to validate hypotheses. \ In Machine Learning: for model evaluation through metrics such as accuracy, loss, and precision.],
  [Employs statistical tests, computational simulations, and performance evaluations often using large datasets or predefined data splits (training, validation, test).],
  
  [Qualitative],
  [Qualitative research in general helps to understand an agent's behavior: These might be user interactions with a system, but as well more descriptive results demonstrating an intelligent system's behavior.],
  [Techniques include demonstration runs, usability tests, structured interviews or reports.],
  
  [Mixed-method],
  [Combines quantitative and qualitative techniques to gain comprehensive insights into both numerical performance and user-centered evaluation of systems.],
  [Often used in developing new approaches or systems where an early prototype is assessed by researchers and is integrated with quantitative performance metrics to guide iterative design improvements.]
)
]

== Figures / Illustrations

// \begin{figure}[tb]
// \centering
// \includegraphics[width=0.5\columnwidth]{img/4-Legs Architectures.pdf}%
// \caption{Example from \citep{schilling2021} -- Overview control architectures used for the four-legged simulated robot. As a first differentiation, we distinguish concurrency for which the spectrum of different architectures is shown in a). In the centralized case (left), a single controller relying on all available information learns how to control all eight joints. Training is driven by one combined reward (shown is in all cases a simplified reward, not included are the external forces). Control can be split into multiple concurrent instances, e.g. one for each side (shown in the middle) or one for each leg (shown on the right, fully decentralized case). As a consequence, reward information can be more granular, e.g., only using costs associated with the joint movements of that particular leg. For a decentralized architecture, we can further distinguish the scope of information used as input to the controller (shown in b). In the fully decentralized case, the single leg controller only uses information from that particular leg and some global information (left). This scope can be broadened to include information from another leg as well (middle, there are further variations for which additional leg is providing information, not shown) or from both neighboring legs (right, called local information). Colors correspond to colors used in result sections for different types of architectures.}
// \label{fig_control_arch}
// \end{figure}

// \begin{figure}[tb]
// \centering
// \includegraphics[width=\textwidth]{img/fig4_hrl}
// \caption{Example from \citep{schilling2023} -- Conceptual view of hierarchical reinforcement learning: In panel a, the standard view of interaction with the environment in reinforcement learning is shown extended to a hierarchical perspective. For higher level control (shown in light green), this is in agreement with motor control in mammals about descending path- ways and modulation of lower level control centers. In panel b, temporal abstraction is illustrated as a process over time operating on two different levels of a hierarchy. The higher level (light green) only operates at a slow timescale being only operated every couple of time steps. The higher level aims for a sparse environmental reward. The lower level is operating on a detailed timescale each control step and providing detailed actions. It is conditioned on the higher level output which provides a form of goal context.}
// \label{fig:method_example}
// \end{figure}

// #figure(
//   image("molecular.jpg", width: 80%),
//   caption: [
//     A step in the molecular testing
//     pipeline of our lab.
//   ],
// )

Example images can be included to help visualize methods or results. Use the ```typst #figure() ``` environment to insert an image. You should ideally use vector graphics (e.g., pdf) for schematics or result plots.

== Mathematical Notations

Mathematical formulas can be set using the ```typst $``` environment. The Bellman equation for a policy $pi$ is a fundamental concept in Reinforcement Learning and can be represented as follows:

https://forum.typst.app/t/figure-and-table-captions-with-chapter-number/1520/7

// show chapter on equation numbering
#set math.equation(numbering: (..num) =>
  numbering("(1.1)", counter(heading).get().first(), num.pos().first())
)

$
V^pi (s) = sum_(a) pi(a | s) ( R(s,a) + gamma sum_(s') P(s' | s,a) V^pi (s') )
$

== Algorithm

Algorithms are best described using pseudo-code and the #link("https://typst.app/universe/package/algorithmic/")[`algorithmic`] package. Below is an example of an $epsilon$-greedy algorithm, commonly used in Reinforcement Learning:

#import "@preview/algorithmic:1.0.6"
#import algorithmic: style-algorithm, algorithm-figure
#show: style-algorithm
#algorithm-figure(
  "Binary Search",
  vstroke: .5pt + luma(200),
  {
    import algorithmic: *
    Procedure(
      "Binary-Search",
      ("A", "n", "v"),
      {
        Comment[Initialize the search range]
        Assign[$l$][$1$]
        Assign[$r$][$n$]
        LineBreak
        While(
          $l <= r$,
          {
            Assign([mid], FnInline[floor][$(l + r) / 2$])
            IfElseChain(
              $A ["mid"] < v$,
              {
                Assign[$l$][$"mid" + 1$]
              },
              [$A ["mid"] > v$],
              {
                Assign[$r$][$"mid" - 1$]
              },
              Return[mid],
            )
          },
        )
        Return[*null*]
      },
    )
  }
)

#pagebreak(weak:true)

== Tips for the Method Section

- Ensure that all mathematical notation is clear and consistent throughout your thesis.
- Describe your approach in sufficient detail to allow for replication.
- Use figures and tables to clarify complex concepts or results.
- In particular, start with an overview illustration for your architecture and consider how processes could be visualized.
- Provide justifications for the choices of specific methodologies or techniques.
- Keep the description concise but informative, focusing on why and how specific methods are chosen.

#hline

*4. Methods*

The methodology chapter outlines which methods you choose to gather data, how the data is analyzed and justifies why you chose that #link("https://paperpile.com/g/what-is-research-methodology/")[methodology]. It shows how your choice of design and research methods is suited to answering your research question.

Make sure to also explain what the pitfalls of your approach are and how you have tried to mitigate them. Discussing where your study might come up short can give you more credibility, since it shows the reader that you are aware of its limitations.



= ED Notes

$1/m sum_(i=1)^m (f_(w,b) (x_i)) - y_i) x_i$

== Structural Prior

Man kann die Sensordaten in mehreren Ebenen betrachten, beginnend mit der simplesten, um einen anschaulichen Einstieg zu erlangen.
Hier konstruieren wir ein "Netz" mit einem Eingangssignal, einem Knoten in der versteckten Ebene und dem Ausgang zur Klassifikation. Dies entspricht dann einfach einem Schwellenwert (intersect only). (TODO: Abbildung X: Signal mit horizontaler Linie)

Das bedeutet damit, dass dieser hier eben der einzige Parameter ist, also:
$theta = (theta_1)$ 
für $cal(H) = {f_theta}$, wobei $f$ unser Netz ist.

Um später exakt im Sinne der _explainable AI_ die betrachten Signale extrahieren zu können, benötigen wir eine bijektive Beziehung zwische Hypotesenraum $cal(H)$ und Parameterraum $Theta$.\
TODO: look up inference

Wir suchen zunächst aber den _Inducer_ $cal(I)$, der aus den gegebenen Daten kombiniert mit Hyperparametern unseren Hypothesenraum erzeugt, beziehungsweise unsere Parameter bzw. Gewichte im Netz.

$cal(I) = DD times Lambda -> Theta$

Weiterhin benötigen wir noch ein Loss-Function. Da es sich um eine Klassifikation handelt, bietet sich _logistic regression_ an, also _binary cross-entropy (log loss)_ als Fehlerfunktion. Die logistische Funktion wird dabei wahrscheinlich Sigmoid sein.

=== gradient descent

Aus dieser können wir dann die zu reduzierende Risiko-Funktion $cal(R)_"emp" (theta)$ (empirical risk) berechnen, welche wir dann zum Optimieren in der Intensität der Schrittgröße bzw. Lernrate $alpha$ einbringen.

$theta^[t+1] = theta^[t] - alpha (d cal(R)_"emp")/(d theta) (theta^[t])$

Newton-Raphson unter einbeziehung einer Hessematrix ist hier wahrscheinlich weder angebracht noch nötig (TODO: check), sondern GD mit ADAM ist hier ausreichend.\
TODO: macht SGD (stochastic gradient descent) Sinn?

=== Learner

Nochmal zusammenfassend -- hier benötigen wir:

+ Hypothesenraum\
    Welches Modell $f$ können wir aus den Daten lernen?
+ Risiko\
    Quantifizierung für die Performance einzelner Modelle, um Ranglisten erstellen zu können.
    (Vereinfaht: Summe der Losses)
+ Optimierung\
    Wie suchen wir das beste Modell? zB geringstes Risiko.

#hline

=== Supervised Learning: Zusammenfassung

Ein *Lerner* (oder *Induzierer*) $cal(I)$ ist ein _Programm_ oder _Algorithmus_ der
- *Trainingsdaten* $cal(D) in DD$ erhält und
- für einen gegebenen *Hypothesenraum* $cal(H)$ aus *Modellen* $f: cal(X) -> RR^g$,\
    ($cal(X)$ ist der Merkmalsraum und $g = 2$, da `boolean` Kontakt)
- verwendet eine *Risiko*-Funktion $cal(R)_"emp" (f)$, um $f in  cal(H)$ auf $cal(D)$ zu bewerten;\
    oder wir nutzen $cal(R)_"emp" (theta)$, um $f$'s Parametrisierung $theta$ auf $cal(D)$ zu bewerten
- nutzt einen *Optimierung*\svorgang, um\
    $hat(f) = underset(arg min, f in cal(H)) cal(R)_"emp" (f)$ #h(1cm) oder #h(1cm) $hat(theta) = underset(arg min, theta in cal(H)) cal(R)_"emp" (theta)$\
    zu finden

Damit ist die Abbildung des Induktors (inklusive der Hyperparameter $lambda in Lambda$):

$cal(I): DD times Lambda -> cal(H)$

Wir können dieses Konzept auch anpassen, um $hat(theta)$ für parametrische Modelle zu finden:

$cal(I): DD times Lambda -> cal(Theta)$

Für die Klassifikation bietet sich als Fehlerfunktion der Bernoulli bzw. $log$-Loss an.

QDA (Quadratic Discriminant Analysis), da verhältnismäßig wenig Dimensionen. (bzw Features)

=== Wahl der Fehlerfunktion fürs Preprocessing

Wir gehen von einer Gausschen Normalverteilung beim Signal-Noise aus, weshalb hier die quadratische Fehlerfunktion $L_2$ am meisten Sinn macht.

#hline

== Data Generation

Bei der Generierung der Trainingsdaten über Aufzeichnung bzw. zunächst synthetische Generierung, müssen wir darauf achten, dass diese Daten nicht nur in ausreichender Zahl vorhanden sind, sondern auch von guter Qualität sind und zu erwartende Situationen in entsprechender Vielfalt wiederspiegeln.
