# Advanced Probability Distributions
- Predicting when a season ticket holder won't show up
  - At what point in the game can the ticket be sold?
  - Sooner: upgrader happier, but owner might show up
  - Later: reduces value for fan, but less risk of being bumped afterwards
- Might not need to know all these external factors
  - If you have regular attendees that tend to show up after 60% of others arrive, then just need to track the daily arrivals and figure out when that threshold has been met
  - Allows for simple probability distribution to determine when to sell open seats

# Distributions
- Binomial
  - 2 outcomes, probability p
  - probability that X = x: nCx * (p^x) * (1-p)^(n-x)
  - With large samples, converges to the normal distribution
- Geometric distribution
  - Probability of having x Bernouli failures until first success
    - (1-p)^x * p
  - assumes each trial is iid - independent and identically distributed
  - Graph data against a geometric distribution to see if it's IID
    - if it's not, then trials aren't independent
    - ie security screens - are they more common if it's been a while since the last one? Then not iid
- Poisson
  - f(x) = lambda^x * e^-lambda / x!
  - lambda: average number of arrivals per time period
  - x: probability that x people do arrive, given lambda
- Exponential - complementary to poisson
  - f(x) = lambda * e^(-lambda * x)
  - if arrivals are Poisson, the time between successive arrivals are exponentially distributed
  - So instead of counting arrivals per unit time, find inter-arrival time and then can back-out the poisson distribution
- Weibull
  - Model time between failures
  - Geometric: how many tries it takes
  - Weibull: how much time
  - f(x) = (k / lambda) * (x / lambda) ^ (k-1) * e^(-(x / lambda)^k)
  - K is shape parameter
    - k < 1: modeling where failure rate decreases over time
      - worst things fail first (parts with defects)
    - k > 1: failure rate increases over time
      - 'things that wear out' (car tires)
    - k = 1: failure rate constant over time
      - reduces to an exponential disribution
  - Kind of similar to geometric distribution
- Data fitting
  - A lot of software will fit data to many distributions, see what best parameters are
  - But be mindful - if it's Weibull with k = 1.001, probably just better to do simple exponential
- QQ Plots
  - Helps compare distribution between multiple sets of data
  - Axes are range of values in the datasets
  - plot values: x = first dataset's 25% percentile value, y = percentile in the 2nd dataset at which the value = the x value
  - Want a 45 degree line
  - If you have a U or an S pattern, know they're not the same
    - A u will fail a stat test
    - An S might pass a test, since they cancel out, but need to know they're off in the tails
  - Can also compare to a theoretical percentile from a perfect distribution
  
