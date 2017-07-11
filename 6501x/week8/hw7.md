# Targetting Unlikely Payers

First, we'd need to train a model on the likelihood that a customer resumes payment after missing a month. So, using prior customer data, we could model the likelihood that, if a customer misses a payment in a given month, she resumes payment sometime down the line. The 'no' response would be customers who are still active and not paying as well as those that were shut off and never paid. The 'yeses' would be those that eventually resumed payments on their own as well as those that were cut off but then resumed payments. Input factors would include prior payment history (time as a customer, previous incidents of missing a month, total months without payment in the current spell), as well as any demographic or credit information obtained at the time of activation. Customer age, employment status, time in residence, and rental vs. ownership status would all be useful. Since we are trying to classify customers, a SVM, logistic regression, or KNN model would be useful.

Each month, we could take customers who missed their latest payment and use the model to predict whether they fall into the 'never will pay' group. 

# Calculating Shutoff Value
We could keep all those above 50% likelihood and further use the likelihood to weight how confident we are that this is a good prediction and will not have to be reversed. To estimate the cost of continuing to supply power to non-payers, the customer's power usage could be modeled using an ARIMA or smoothing model with seasonality included. The customer's predicted power usage for the coming months determines the potential lost revenue the company faces.

To determine the value of any given shutoff, I would multiply the likelihood that the customer is a 'never will pay' customer by the customer's expected costs over the coming months. Thus, between two customers who are equally unlikely to never pay, we would want to discontinue the more expensive one first. We could then run an optimization problem - maximize value achieved across all possible cutoffs, subject to the constraint that we do not exceed worker time when cutting off service.

# Optimizing Cutoffs under Time Constraints
This constraint would have several elements. Each customer's cutoff time required has several components - drive time from headquarters, time to disconnect service, and time to drive back to headquarters. If we assume that the workers disconnect one customer at a time and return to headquarters between each one, then at the maximum, the time it takes to run all the individual trips cannot exceed total worker time.

However, this constraint is binding only in the extremely inefficient case. Some of the drive time can be lessened by disconnecting nearby customers during the same trip. We should add a dummy to our model to indicate 1 if customer i is disconnected. Then, we could cluster customers into geographic regions (neighborhoods? city blocks?), within which the travel time is negligible. A constraint would thus be that drive time to a neighborhood, plus each customer's disconnect time, plus drive time back, must not fail the constraint. 

Initial: c_i = 1 if customer cut off
sum over i 2*c_i * drive_i + c_i * cutoff_time < max_time

More advanced: c_j = 1 if any customer inside that area is cutoff
sum over j 2*c_j + sum over i c_i * cutoff_time

This model would thus maximize expected savings, subject to the requirments that travel time must be minimized and can be planned stragegically.
