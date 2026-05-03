#import "@preview/ouset:0.2.0": underset
#import "@preview/algorithmic:1.0.6"
#import algorithmic: style-algorithm, algorithm-figure

= Methods

The Methodology chapter of your thesis  involves a detailed description of your general approach and how it functions. The individual parts of the system and the processing in the system are introduced. First, on an individual level which modules are used and these are described in detail. Secondly, how these interact. In AI systems this includes an overview of the overall system architecture (ideally as an illustration). And there should be a description of how modules interact and exchange what kind of data. When learning is involved the whole machine learning pipeline should be reflected (preprocessing, data handling, model training, evaluation).

Overall, the methods section should detail how your chosen design and research methodologies are ideally suited to answering your research questions. It should provide sufficient details on your approach to make it reproducible for other researchers. This includes mathematical equations or pseudo-code when necessary to explain processing.

== Experimental Design and Procedure

You should also explain how you access your proposed methodology: What did you measure and how? And how does this answer or relate to your research questions? This should lead to SMART results (Specific Measurable Achievable Reasonable Time-bound). Overall you should detail 

- the procedure / the experiment: the setup, repetitions, etc. with a description that includes the environment and conditions;
- the data collection process: how is something measured and how further processed.

Ideally, you aim for quantitative data that allows you to address your research question. In many cases, this can be complemented with qualitative data or examples in the results that will help illustrate certain points or provides additional insights.

#figure(
  caption: [
    Comparison of Research Methodologies, following #cite(<paperpile2023methods>, form: "author").
  ],
)[
  #table(
    columns: (2.5cm, 4.5cm, 4.5cm),
    align: (left,),
    table.header(
      [*Data Type*], [*Description*], [*Methodology*]
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
  )<tab:research-methods>
]

== Figures / Illustrations

#figure(
  image(width: 50%, "../figures/4-Legs Architectures.pdf"),
  caption: [
    Example from #cite(<schilling2021>, style: "chicago-author-date") -- Overview control architectures used for the four-legged simulated robot. As a first differentiation, we distinguish concurrency for which the spectrum of different architectures is shown in a). In the centralized case (left), a single controller relying on all available information learns how to control all eight joints. Training is driven by one combined reward (shown is in all cases a simplified reward, not included are the external forces). Control can be split into multiple concurrent instances, e.g. one for each side (shown in the middle) or one for each leg (shown on the right, fully decentralized case). As a consequence, reward information can be more granular, e.g., only using costs associated with the joint movements of that particular leg. For a decentralized architecture, we can further distinguish the scope of information used as input to the controller (shown in b). In the fully decentralized case, the single leg controller only uses information from that particular leg and some global information (left). This scope can be broadened to include information from another leg as well (middle, there are further variations for which additional leg is providing information, not shown) or from both neighboring legs (right, called local information). Colors correspond to colors used in result sections for different types of architectures.
  ],
) <fig:control-arch>

#figure(
  image(width: 100%, "../figures/fig4_hrl.pdf"),
  caption: [Example from #cite(<schilling2023>, style: "chicago-author-date") -- Conceptual view of hierarchical reinforcement learning: In panel a, the standard view of interaction with the environment in reinforcement learning is shown extended to a hierarchical perspective. For higher level control (shown in light green), this is in agreement with motor control in mammals about descending path- ways and modulation of lower level control centers. In panel b, temporal abstraction is illustrated as a process over time operating on two different levels of a hierarchy. The higher level (light green) only operates at a slow timescale being only operated every couple of time steps. The higher level aims for a sparse environmental reward. The lower level is operating on a detailed timescale each control step and providing detailed actions. It is conditioned on the higher level output which provides a form of goal context.]
) <fig:method-example>

Example images can be included to help visualize methods or results. Use the ```typst #figure() ``` environment to insert an image. You should ideally use vector graphics (e.g., pdf) for schematics or result plots.

== Mathematical Notations

Mathematical formulas can be set using the ```typst $``` environment. The Bellman equation for a policy $pi$ is a fundamental concept in Reinforcement Learning and can be represented as follows:

$
V^pi (s) = sum_(a) pi(a | s) ( R(s,a) + gamma sum_(s') P(s' | s,a) V^pi (s') )
$

== Algorithm

Algorithms are best described using pseudo-code and the #link("https://typst.app/universe/package/algorithmic/")[`algorithmic`] package. Below is an example of an $epsilon$-greedy algorithm, commonly used in Reinforcement Learning:

#show: style-algorithm
#algorithm-figure(
  "Epsilon-Greedy Algorithm",
  vstroke: .5pt + luma(200),
  line-numbers: false,
  inset: .35em,
  {
    import algorithmic: *
    let actions = math.italic("Actions")
    Procedure(
      "Epsilon-Greedy",
      ($Q(s,a)$, $epsilon$, actions),
      {
        Comment[Initialize]
        Assign[$r$][random number]
        LineBreak
        IfElseChain(
          $r < epsilon$,
          {
            Assign($a$, [random action from $#actions$])
          },
          {
            Assign($a$, $arg max_a Q(s,a)$)
          },
        )
        LineBreak
        Return[a]
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


#quote(
  attribution: link("https://paperpile.com/g/thesis-structure/#num-4-methods", "paperpile")
)[
  *Methods*

  The methodology chapter outlines which methods you choose to gather data, how the data is analyzed and justifies why you chose that #link("https://paperpile.com/g/what-is-research-methodology/")[methodology]. It shows how your choice of design and research methods is suited to answering your research question.

  Make sure to also explain what the pitfalls of your approach are and how you have tried to mitigate them. Discussing where your study might come up short can give you more credibility, since it shows the reader that you are aware of its limitations.
]
