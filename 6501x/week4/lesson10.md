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
- Introduce some randomness to generate different trees
- Average of all the trees is better than a single tree
- Each tree gets slightly different data points - sample N with replacement
- for each branch, randomly choose a small number of factors (X), then choose the best factor from X to branch on
- Don't prune the tree
- Usually get 500-1000 trees in the forest
- Use average (or modal) predicted response among the whole forest
- Benefits
  - Better overall estimates
  - Averaging neutralizes overfitting in some trees
- Drawbacks
  - Harder to explain the results
  - Can't give us specific regression or classification model from the data
- Is a good first-cut black box model

# Logistic Regression
- Estimate probability (binary outcome)
- Can do many of the same things linear regression does:
  - Transformations of input data
  - Interactions
  - Variable selection
  - Regression trees
- Differences
  - Longer to calculate
  - No closed-form solution
  - Different goodness-of-fit
- Pseudo R-squared
  - Not really measuring fraction of explained variance
- Classification
  - treat as 'yes' if greater than some threshold, 0 otherwise
  - Use a ROC curve - compare sensitivity and specificity
  - AUC - area under the curve, range 0.5 to 1.0 (want higher)
  - Doesn't differentiate b/w cost of false positives and false negatives
  
# Confusion matrices
- 
