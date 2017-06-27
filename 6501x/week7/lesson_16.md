# Non-Paremetric Methods
- Basic stat tests assume we know the underlying distribution
- For unknown distribution, need other methods
- McNemar's test:
  - Compare results on pairs of responses
  - ie Virus treatment: try 100 samples of 2 treatments
  - if A works 61/100 times, and B works 68/100 times, is B better?
  - if B works on every case that A did, plus 7 more, then probably better
  - If they don't overlap, can't say that B is better, might recommend both
  - McNemar: throw out all cases where they're the same, and see how frequent the distribution is under a binomial dist
- Wilcoxon Signed Rank Test for Medians
  - Assumption: distribution is continuous and symmetric
  - Question: is median of the distribution different from m?
    - given responses, rank them smallest to largest
    - Sum all the ranks of points higher than the proposed median
    - Sum should follow a normal distribution - expect 1/2 to be higher
    - Actual test: W = sum(rank(y_i - m)). P-value test on W
  - Can also do for paired samples - sum(abs(y_i - z_i)) for all y_i, z_i, see if ranks indicate the 2 sets are different
  - Kind of like McNemar: 
    - Numeric data: Wilcoxon
    - Yes/no: McNemar
- Mann-Whitney test
  - 2 datasets, but not paired samples
  - All observations are independent
  - Rank all observations among both samples into one big set (so y_i and z_j will be intermixed but sorted)
  - Then, U = min{U_y, U_z}: 
    - U_y = sum(rank(y_i)) - (n(n+1)/2)
    - U_z = sum(rank(z_j)) - (m(m+1)/2)
  - U follows a special distribution - need table
  
# Bayesian Models
- p(A|B) = p(B|A)*p(A) / p(B)
- Empirical Bayes
- Need priors, but can allow your parameters to have priors as well, all be updated w/ data
  
# Community Graphs
- Want to find highly-intereconnected subpopulations
- Community: a set of nodes that highly connected within itself
  - Lines: arcs/edges
  - Clique: a set of nodes that all have edges between each other
- Louvain algorithm: decompose a graph into communities
  - Set each node as its own community
  - For each node, if it modes to another community, how much does modularity increase?
  - Does for every node, assigns on to the biggest jump
  - Repeat until communities are set
  - NOW, each community is treated as a supernode, with weights equaling all arcs between the supernodes
  - Repeat the process to find supercommunities
  - Is a heuristic
    - Not guaranteed to find global best
    - But works quickly
    
# Neural Networks
- Reacts to patterns that we don't understand well and can't describe mathematically
- Recognize speech and language, images, etc.
- Modeled after neurons in brain:
  - Input
    - Each takes 1 piece of invo
  - Hidden (middle processing)
    - Receive values from multiple inputs
    - Combines them via some set of weights
    - Gives its output to next layer of hidden, which repeats
  - Output
    - Gets some info from the last set of hidden, outputs a result (usually highest predicted result)
- When output is scored (feedback), all the weights/functions internally are updated
  - Might do basic gradient descent and ultimately settle on one value
  - In practice, need too much data to train well
  - Hard to tune the learning algorithm
    - Either learn too slowly
    - Or too quickly and jump all over
- Deep Learning
  - Similar to neural networks
  - Many layers (deep)
  - Tends to have better success than neural networks
    - NLP
    - Speech processing
    - Image processing
    
# Competitive models
- What if the system reacts to our action?
  - We need to use analytics to consider all sides of the system and act accordingly
  - IE build a price model, but then competitors react to your choice
- Game Theory
- Cooperative Game Theory - involves both competition and coordination
  - Make best decision based on partner's actions
- Pure strategy and mixed strategy
- Perfect vs imperfect information
- There are optimization modesl to find best strategy
