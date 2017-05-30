# Linear regression
- How do systems work?
- What will happen in the future?
- Simple linear regression: one predictor
  - best fit line between 2 continuous variables
  - Minimize sum of squared errors
  
# Goodness of fit
- How to measure data's fit
- Whichever set or parameters give the maximum likelihood of good model predictions is the best fit
- Can get more complex - more assumptions about the error, different estimator formulas
- AIC (Akaike information criterion)
  - L*: maximum likelihood value
  - k: number of parameters being estimated
  - AIC = 2k - 2ln(L*)
  - The 2k penalizes complex models
  - Want smaller AIC values: fewer k, higher likelihood
  - Great if there are infinite data points
- AIC_c = AIC + (2k * (k + 1)) / (n - k -1) = 2k - 2ln(L*) + (2k * (k + 1)) / (n - k -1)
  - Corrected AIC
- Relative likelihood:
  - e^((AIC_1 - AIC_2) / 2)
  - AIC_1 = 75
  - AIC_2 = 80
  - e^((75 - 80) / 2) = 0.082
  - Model 2 is 8.2% as likely as model 1 to be better
- BIC (Bayesian Information Criterion)
  - BIC = k * ln(k) - 2ln(l*)
  - Greater penalization for k - encourages simpler models
  - Only use BIC when there are more data points than paramters
  - Rules of thumb:
    - |BIC_1 - BIC_2| > 10 : smaller-BIC model 'very likely' better
    - 6 < |BIC_1 - BIC_2| < 10: smaller-BIC model 'likely' better
    - 2 < |BIC_1 - BIC_2| < 6: smaller-BIC model 'somewhat likely' better
    - 0 < |BIC_1 - BIC_2| < 2: smaller-BIG model 'slightly likely' better
 
# Using Regression
- To determine importance of different factors in predicting outcomes
- To predict Y values for new data

# Causation vs Correlation
- Hard to rule out all external mutual causes

# Data transformations
- Adjust the data to make the fit linear - quadratic, sinusoidal, logarithms
- Box-Cox transformations can be automated
- Variable interactions


    
  
  
