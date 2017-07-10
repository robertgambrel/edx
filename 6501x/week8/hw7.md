# Targetting Unlikely Payers

First, we'd need to train a model on the likelihood that a customer resumes payment after missing a month. So, using prior customer data, we could model the likelihood that, if a customer misses a payment in a given month, does she resume payment sometime down the line? The 'no' response would be either customers who are still active and not paying, as well as those that were shut off and never paid. The 'yeses' would be those that eventually resumed payments on their own as well as those that were cut off but then resumed payments. Input factors would include prior payment history (time as a customer, previous incidents of missing a month, total months without payment in the current spell), as well as any demographic or credit information obtained at the time of activation. Customer age, employment status, time in residence, and rental vs. ownership status would all be useful. Since we are trying to classify customers, a SVM, logistic regression, or KNN model would be useful.

Each month, we could take customers who missed their latest payment and use the model to predict whether they fall into the 'never will pay' group. We could keep all those above 50% likelihood and further use the likelihood to weight how confident we are that this is a good prediction and will not have to be reversed. 

Given payment history (, credit history, 
