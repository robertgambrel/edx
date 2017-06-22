# Optimization intro
- Very useful for prescriptive analytics (what inputs in a model should you adjust to get best results?)
- Software is good at solving problems, but building the model is up to the user
- Gartner Studies
  - Prescriptive analytics are very rare
  - Need trained people

# Elements of an optimization problem
- 3 main components:
  - Variables
    - Decisions the software will get the best value for
  - Constraints
    - Restrictions on values of the variables
  - Objective function
    - Measure of quality of solution
    - Form and weight often requires inputs from other analytic models (regressions)
- Solution: a set of values for each variable
- Feasible solution: set of values that satisfy all constraints
- Optimal solution: feasible solution w/ the best objective value

# Examples
- Diet Model
- Worker model - optimize how many *start* on a given day, not how many are actually there on the day

# Modeling w/ binary variables
- Adding binary can allow you to factor in transaction fees
