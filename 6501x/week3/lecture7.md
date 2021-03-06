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
-
# Trends
- T_t: trend at time t
- S_t = alpha*x_t + (1 - alpha)*(S_(t-1) + T_(t-1))
- T_t is also computed like the baseline:
  - T_t = beta*(S_t - S_(t-1)) + (1 - beta)*T_(t-1)
- Initial condition: T_1 = 0
-
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
-
# Exponential smoothing - meaning
- since it's recursive, have (1-alpha) ^ N multiplying up to infinite past terms
- So don't think that it's only single prior baseline estimate - all of them are, but are weighted downwards exponentially
-
-
# Forecasting
- Can do simple forecasting with exponential smoothing
- To predict, best estimate of x_(t+t) is S_t, so your forecast is constant
- If you add a trend, then best estimate of next baseline is current baseline, similar for trend
  - F_(t+1) = S_t + T_t
- For multiplicative seasonality:
  - Best estimate of C_(t+1) is the latest estimate for that same cycle: C_(t - L + 1)
  - F_(t+1) = (S_t + T_t) * C_(t - L + 1)
- 
# How to find best values of alpha, beta, gamma?
- Optimize to minimize (F_t - x_t)^2
- Time series methods
  
# ARIMA
- 3 key parts:
  - Differences
    - The baseline exponential smoothing function works best with stationary data
    - If data isn't stationary, the differences might be
    - Might need D differences
  - Autoregression
    - Predicting current values based on prior values
    - Smoothing equation is AR - uses all prior values
    - But could also use only a few models (p-periods)
  - Moving Average
    - Previous errors as predictors (order q)
  - Software can optimize p, d, q
- Can also add seasonality
  - ARIMA(0,0,0) is white noise
  - ARIMA(0, 1, 0) is random walk
  - ARIMA(p, 0, 0) is AR model
  - ARIMA(0, 0, q) is MA model
  - ARIMA(0, 1, 1) is basic exponential smoothing model
- Better for forecasting than exponential smoothing when data is more stable
  - Need at least 40+ obs
- How to forecase variance of future obs?
-
# GARCH
- Generalized Autoregressive Conditional Heteroskedasticity
- Estimate or forecast the variance
  - Estimated amount of error
- Similar format to ARIMA equation
  - Except deals only with variances / squared errors, not actual observation
  - Only addresses raw variances, not differences
