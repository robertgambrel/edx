# Exponential Smoothing
- Used for time series data
- It will have trends - might be increasing or decreasing
- Could have cyclical trends (seasonal temps)
- But there's also randomness
  - Random fluctuations that don't show a trend or real pattern
- S_t: expected baseline response at time period t
- x_t: observed response
- If you think observed indicator is very good, could say S_t = x_t
- If you don't trsut the observation, would say S_t = S_(t-1) (current baseline = prior baseline)
- Exponential smoothing:
  - S_t = alpha*x_t + (1 - alpha)*S_(t-1)
  - alpha = 0: a lot of randomness, don't trust observations
  - alpha near 1: not much randomness in the system, so trust the observation
- How to start: S_1 = x_1
- Does not deal with trends or cyclical variations (yet)

# Trends
- T_t: trend at time t
- S_t = alpha*x_t + (1 - alpha)*(S_(t-1) + T_(t-1))
- T_t is also computed like the baseline:
  - T_t = beta*(S_t - S_(t-1)) + (1 - beta)*T_(t-1)
- Initial condition: T_1 = 0

# Cyclic patterns
- Seasonalities: are multiplicatives
  - L: length of cycle
  - C_t: multiplicative seasonality factor for time t
- New baseline formula:
  - S_t = alpha*x_t / C_(t-L) + (1 - alpha)*(S_(t-1) + T_(t-1))
- Update seasonal factor in the same way
  - C_t = gamma(x_t / S_t) + (1 - gamma)*C_(t-L)
  - No initial cyclic effect - all set to 1
- C = 1.1: expect 10% higher value at time t just because of the cycle it's on

# Exponential smoothing - meaning
- since it's recursive, have (1-alpha) ^ N multiplying up to infinite past terms
- So don't think that it's only single prior baseline estimate - all of them are, but are weighted downwards exponentially


# Forecasting
- 

