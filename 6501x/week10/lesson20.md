# Monetization
- How to combine data to generate value?
- Dataset 1: Alumni magazine data
  - Financial net work
  - Personal Interests
- Dataset 2: Nonprofit data
  - Charitable donations
- Dataset 3: Credit bureau data
  - Default history
- By finding same person (high money and interest in historical societies) could be targeted by tour companies
- How to use only internal data, and how to combine with other datasets

# Sample Models
- Browing Pattern Data
  - Design of experiments approach in real time
    - Multi-armed bandit approach of pictures of products
    - Tradeoff exploration and exploitation
  - In background - second model could look at clustering / learning from the model
    - what about an image makes it attractive or unattractive to a customer?
    - Is it color? Style? Pose?
  - Repeated shipment patterns
    - Child products can track child age, so can guess child's age over time
    - Once-a-year purchases for different address (presents)
- Combining datasets
  - Credit offers
  - Use hobbies/interests from alumni magazine data to target ads, use credit data to decide price level of products to show
  - Use real-time updates based on customer behavior

# Matching across data sets
- Have to match across several fields
  - Some might change over time - marriage, property ownership, etc.
- Factor-based approaches
  - Quality of match (single factor)
    - 1 for match, 0 for not
    - But what about close / fuzzy matches? Could have continuous (probability)
  - Name matching
    - If name matches, and it's a rare name, then it should be more important than something like Smith
- Solution-based
  - Determine value of a set of full/partial matches
    - Deep Learning
    - Bayesian
  - Can classify them as match or not, or get a probability of match and feed that in down the line
    
