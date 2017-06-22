# Missing Data
- Are there patterns in missing data?
  - Is response value related to likelihood of missing?
    - ie if wealthy people prefer not to report income on survey, get biased distribution

# Methods that don't need imputation
- 3 options for handling missing data:
  - Throw away the observation
    - pros: won't impute errors, easy to do
    - cons: lose data points and might have biased missing data
  - Use categorical variables to indicate missing
    - Can't do with continuous data (ie set all missing heights to 0 will skew results)
      - Could instead assign 0, then interact the continuous variable with a dummy marking whether it's imputed
      - If you interact the dummy with all variables, you are essentially running concurrent models, one for the full data, one for the data w/ height missing
  - Estimate (impute) missing values
  
# Imputation
- Simplest approach: use mean/median/modal value for all missing
  - Advantage:
    - hedge against being wrong
    - easy to compute
  - Disadvantage:
    - biased imputation if missingness is related to avtual value
- Regression approach: want to predict missing values, hope to reduce bias
  - Disadvantage: more complex, have to build, fit, validate, test the immputation
    - Also uses the data twice (once for imputation, once for the model)
    - Doesn't capture all the variability in the imputed value, since you just use the mean
    - Could perturb each estimate (randomly add some noise to it)
      - Adding perturbations gives better estimate of overall spread of it
- Rule of thumb: should only impute of missingness is less than 5%
- Now have multiple sources of error:
  - Imputation error (error from the imputation regression) + perturbation error + model error (final model estimated)
  - but even complete data is probably wrongly coded in some places
  
