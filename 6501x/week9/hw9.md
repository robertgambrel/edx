# Hypothesis checking

If a retailer has saved its sales history and shelf space history, then it should be able to run a simple regression analysis instead of doing a complex A/B type test to determine whether shelf space increases sales. It could regress weekly sales for each product on its shelf space, including a time trend and seasonality dummies to de-trend the data. It could also control for location within store (close to front vs. in the back) and price. In order to make comparisons more meaningful, the regressions could be run separately by product type (i.e. one for canned goods, one for fresh produce, one for deli products, etc.) or these could be dummied out and the main regression variables could be interacted with the dummies. 

To determine whether 
