# First case - Power Company
- Some customers don't pay bills (could pay but don't)
- Want to turn their power off
  - But only want to target those who will never pay, period
  - NOT those who just forgot or fell behind but want to dig out
- Logistical problems - have more people to shut off each month than people available
  - Need to do a manual shut off
  - Workers must go to location, takes time
  - More work than the company can handle
- Which shutoffs should be done each month, given capacity constraints?
- Some of the capacity (worker's time) is used by travel. Schedule accordingly (close together)
- Some shutoffs shouldn't be done at all - how do you identify those?
- How should you prioritize shutoffs?
- Think about data you need, models to use
  - Different approaches
  - Use output of one into input of another
  - Can't tell whether it works, unless tested on real data (don't worry about that)
  
  
# Models for Customer Identification
- Customer info
  - Credit score, income, past hpayment history, zipcode, time in home, family status, demographic
  - But can't use age, race, sex, gender, or other variables that correlate strongly with those
  - So instead rely on payment history, credit score, other factors
- Models
  - Classification (SVM or KNN)
    - customers who will pay
    - those who can but don't
    - Those who will never be able to pay
  - Clustering
  - Probability of payment (Logistic)
    - Could use single model, or tree-based approach
    - Allows you to use expected values (probability of good turnoff), depending on cost
    
# Cost Estimation
- Riskier to wait an extra month on a high-usage account
- Also cost associated with turning power back on if they turn off incorrectly
- Use exponential smoothing or ARIMA to estimate power usage in upcoming months
- For customers w/ shorter history, could use regression to estimate usage
- Time series - need a long chain of data
- Regression - better when less specific customer data, need to account for seasonality

# Choosing Shutoffs
- Model how long it takes to travel between points
- Need time to shut off power, estimate of future usage
- Optimize
  - highest value set of customers for power shutoffs
  - binary variable - customer's power shut off or not?
  - constraints are hard to write
- Clustering
  - cluster physical locations, modify optimization model
- Simulation
  - Variability in drive times, shutoff times, power usage
  - Distribution fitting
  - Allows for tweaking input model
- Allow for determining whether or not to hire new workers
