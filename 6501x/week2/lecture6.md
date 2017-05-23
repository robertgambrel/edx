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
- `X_t` is periodic observation, with over-time mean `mu`
- `S_t` = `max{0, S_(t-1) + (x_t - mu - C)}
    - is S_t >= T, the threshhold amount?
    - S_t can never drop below 0 - don't want all the random downward fluctuations cancelling up the later upward trends
    - `mu` is average among all observations
    - Use the C dampener to make it less sensitive - takes more consistent upswing to observe a change
    - Set C and T to tune the model
        - Choose values based on cost - is it more costly to take too long to observe a change, or to raise too many false positives?
    - 
