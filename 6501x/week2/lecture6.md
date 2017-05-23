# Change detection
- Determine whether something has changed (usually w/ time series data)
    - Do we need to take action to correct course?
    - Did past action change how things went?
- Have to balance false positives vs under-counting changes
    - using traditional hypothesis tests might require so much data that by the time you have enough, it's too late to re-adjust the change
    - But also don't want to give too much credence to random fluctuations
    - Must balance more sensitive change detection with inevitability of false positives

# CUSUM
- Cumulative Sum
    - Has the mean of a distribution changed?
- $X_t$ is periodic observation, with over-time mean $mu$
