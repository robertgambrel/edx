# Retailer case
## Shelf Space Optimization
- Hypotheses:
  - More shelf space leads to more sales
  - More sales lead to more complementary product sales
  - Larger effect if complementary products are adjacent
- Optimize shelf space
  - How much for each product type?
  - Constraints:
    - min and max amounts per product
    - total space in store
- Ignore product promotions, payments for space
- How to measure the effects (get baseline?)
- How to determine whether the effect exists at all?
- Are hypotheses true?
- What data is needed?

# Hypothesis Testing
- Regression can test hypotheses
- Using point-of-sales data can show which products are sold together (complementary effect)
  - Can estimate magnitude of complemetnary effects
- Need to also know product locations for adjacency effect
- More shelf space -> more sales?
  - Could vary shelf space day by day, A/B testing
  - Could do change detection after you increase shelf space
  - Problems: seasonality, trends, other external factors
  - If you have several years of data, could smoothing to account for effects and predict
    - then check baseline against future sales with changes
- Or could instead look at correlation - differences between stores instead of within stores
  - Control for as much as possible (demographics, geography, etc.)
  - But did shelf space cause higher sales? Or did manager see higher sales and stock it more?

# New Data Source
- Tracking cameras follow customers through the store, match customers with purchases
- But hard to track individuals across cameras
- And can get too intrusive - ethical issues

# Making recommendations
- If assume hypothesis is true
  - Start with clustering - distance b/w pairs of products is inversely related to shared sales
  - Cluster them or do community finding or do optimization
- Optimize
  - Given cluster groups and effect of shelf space on sales, maximize expected sales overall
- Could add an additional layer - store layout - to make most desirable products in the back, force you to walk by a lot of impulse purchases
