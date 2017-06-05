# Intro to CART
- Classification and Regression Trees
- Allows for interactions / different effects at different levels of IV's
- Leaves: the end of the branch
  - Fit a regression at each
- Can classify data, make decisions, etc.

# Branching
- How to branch:
  1. Which factors should be part of the branching decision
  2. How should we split the data?
- In theory, any factor could be used to branch
- Common practice: branch on one at a time
- Run a regression on all data at the node, calculate variance
  - Then, split on each factor, and find the biggest variance decrease
  - Make a split for the biggest possible decrease
  - Repeat until variance decrease isn't more than a threshold cutoff
- Then prune: at each branch point, calculate estimation error with and without branching
  - If branching increases error, remove it
- To avoid overfitting, a rule of thumb is that each leaf contains at least 5% of original data

# Random forests
