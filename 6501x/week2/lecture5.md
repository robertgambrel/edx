# Data Preparation
- Data scale is important - need to make everything equitable to show proportional effects
- Extraneous information - too many variables make solution overly complicated
- Outliers
    - Might have ones that have extreme data
    - Or might have contextual outliers: data not extreme, but timing of it is
        - ie snow in July
    - Ouutliers by omission (collective outlier):
        - missed heartbeat
        - know that some observation in an interval is wrong, but unsure which one is
    - identification
        - Box plots
        - Fit model, find points with high errors b/w estimated and actual
- Dealing w/ outliers
    - If they're just bad data (bad input, failed sensor), could drop it
        - Or impute its value
    - If it's real, need to account for it
        - Where did it come from? how was it compiled? was it a unique but real situation?
        - If it's a large dataset, expect that there's some randomness that gives very rare values
            - If you drop them all, then dropping them makes model too optimistic
        

