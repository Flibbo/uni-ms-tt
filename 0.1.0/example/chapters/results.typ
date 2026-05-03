= Results

In the results chapter, you present your findings and experimental results: Briefly reintroduce the research questions or hypotheses and explain the structure of the results section. State how the data were analyzed without going into the depth of the methodology.

It is important to focus on the presentation: Include tables, figures, or graphs --- but describe the results as well in the text and help the reader understand what is shown in the figure and what is noteworthy (see example @fig:res-learning-curves and the text description is moved to the caption). It is often necessary to select which figures to show. It is usually best to start with a general overview of the results for that experiments (e.g., showing a learning curve), before highlighting a specific finding and presenting more detailed data supporting this result.

In the following, I just give briefly examples for results (all taken from ):  // TODO: where from? no source in latex template

- A result figure, showing a learning curve: @fig:res-learning-curves;
- An example for a table comparing evaluation results for different learning architectures in @tab:res-characteristics;

#figure(
  image("../figures/07_LearningCurves.pdf", width: 70%),
  caption: [
    Learning curves for different controller architectures over learning time: Individual learning curves for centralized (blue) and fully decentralized (orange) controller architecture over learning time, given in simulation steps on the x-axis (interactions with the environment) and shown is the return per episode on the y-axis. Explanation in text: While all approaches were able to learn walking behavior, learning progressed quite differently for the different architectures (see learning curves in @fig:res-learning-curves). The centralized approach shows worse learning characteristics. First, return is increasing much slower compared to the decentralized architectures. Second, variance becomes very large for a considerable time of training.
  ],
) <fig:res-learning-curves>

#figure(
  caption: [
    Evaluation of different control architectures. Each architecture was trained $10$ times and each of these seeds was evaluated for $100$ episodes on multiple different terrains (flat terrain; uneven terrain, smoothness $0.8$; bumpy terrain, smoothness $0.6$). Given is the mean return, mean velocity, and cost of transport over all episodes per architecture for a specific terrain type. Shown are the different control architectures.
  ],
  box(width: 125%)[
    // Remove rightmost padding // TODO: does not do that
    #show table.cell.where(x: 12): set table.cell(inset: (right: 0pt))
    #table(
      columns: (2.8cm, 0.8cm, ..(auto,) * 11),
      align: (left + horizon, ..(center + horizon,) * 12),
      stroke: none,
      
      // Top border
      table.hline(),
      
      // Header rows
      table.header(
        table.cell(colspan: 2)[Configuration], table.cell(colspan: 3)[Flat terrain], [], table.cell(colspan: 3)[Uneven terrain (0.8)], [], table.cell(colspan: 3)[Bumpy terrain (0.6)],
        table.hline(start: 2, end: 5, stroke: 0.5pt),
        table.hline(start: 6, end: 9, stroke: 0.5pt),
        table.hline(start: 10, end: 13, stroke: 0.5pt),
        [], [], [Return], [Vel.], [CoT], [], [Return], [Vel.], [CoT], [], [Return], [Vel.], [CoT],
      ),
      
      table.hline(stroke: 0.5pt),
      
      // Data Rows
      [Fully Decentr.\ (4 controller)], image("../figures/Controller_Config_1.pdf", width: 0.8cm),
      [2673.0], [3.33], [6.283], [],
      [974.0], [2.15], [7.424], [],
      [-137.5], [0.64], [14.099],
      table.hline(stroke: 0.1pt),
      
      [Decentr. local\ inf., both n.], image("../figures/Controller_Config_3.pdf", width: 0.8cm),
      [2943.4], [3.54], [6.169], [],
      [1447.0], [2.55], [7.283], [],
      [276.4], [1.20], [11.357],
      table.hline(stroke: 0.1pt),
      
      [Centralized\ single contr.], image("../figures/Controller_Config_4.pdf", width: 0.8cm),
      [2605.9], [3.57], [8.224], [],
      [1110.5], [2.55], [9.324], [],
      [201.5], [1.36], [12.641],
      
      // Bottom border
      table.hline(),
    )
  ]
) <tab:res-characteristics>

#pagebreak()

== Tips for Presenting Results Effectively

- *Stay Objective:* Report what the data shows without adding personal interpretation or bias. Leave analysis for the discussion section.
- *Use Visuals Wisely:* Employ graphs, charts, and tables to illustrate your results clearly. Make sure each visual is relevant, properly labeled, and mentioned in the text.
- *Be Clear and Concise:* Avoid cluttering the section with unnecessary details. Focus on presenting the results that directly pertain to your research questions.
- *Consistent Formatting:* Use a consistent format for presenting data. This includes similar styles and scales for graphs, consistent decimal places for numbers, and uniform units of measure.
- *Highlight Significant Results:* Clearly point out the most important findings of your research. Emphasize results that are statistically significant or particularly relevant to your research questions.
- *Explain Variability:* If there are anomalies or a high degree of variability in your data, provide a brief explanation or note that this will be discussed further in the discussion section.

#quote(attribution: link("https://paperpile.com/g/thesis-structure/#num-5-results", "paperpile"))[
  *Results*

  #block(stroke: green, inset: 1em, width: 100%)[*Tip:* Use graphs and tables, where appropriate, to visualize your results.]

  The results chapter outlines what you found out in relation to your research questions or hypotheses. It generally contains the facts of your research and does not include a lot of analysis, because that happens mostly in the discussion chapter.

  Clearly visualize your results, using tables and graphs, especially when summarizing, and be consistent in your way of reporting. This means sticking to one format to help the reader evaluate and compare the data.
]
