# Box-Cox Transformation
- Many models make a normality assumption
- Heteroskedasticity - unequal variances across the distribution
- Box-Cox: logarithmic transformation
  - Stretches out the smaller range, shrinks the larger range
  - Check whether you need to do it - Q-Q plot

# De-trending
- Removing price inflation, etc.
- Want to do it for response, predictors
- Could use an inflation deflator
- Could also do a one-dimensional regression (trend_price = a0 + b1*T)
  - Then do Actual_price - trend_price
- Helps you do cross-time comparisons in regression models (not as useful in exponential smoothing-type models)

# Principal Component Analysis
- Helps you select which features to use
- Some predictors might be highly correlated - similar factors move together
- Transforms data
  - Removes correlation w/in the data
  - Ranks coordinates by importance
- By concentrating on first N principal components:
  1. Reduce effect of randomness
  2. Earlier components are likely to have a higher signal-to-noise ratio
- Whichever factor has more spread (range), it will score higher
- In practice:
  - Scale/center each factor variable
  - Find all eigenvectors / eigenvalues of X-transpose-X
  - PCA's: First component is XV_1, where V_1 is largest eigenvector, second component is XV_2, etc.
- If you want to just eliminate correrlation, use all components
- If you want to simplify model, use only first N components
- Can also use non-linear functions (kernels) to transform the data
  - Similar to SVM modeling
- But you can also back-out the coefficient for each original variable, as opposed to their combos that go into factors

# Eigenvalues and Eigenvectors
- A: square matrix
- v: vector such that: A*v = lambda*v
  - v: eigenvector of A
  - lambda: eigenvalue of A
  - det(A - lambda*I) = 0
- Given lambda, solve A*v = lambda*v to find corresponding eienvector v
- Basically, A*v is a vector that points in the same direction of V, just longer or shorter (lambda)
