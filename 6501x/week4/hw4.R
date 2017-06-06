pacman::p_load(dplyr, readr, purrr, outliers, ggplot2, lubridate, 
			tidyr, stats, smooth, tibble, magrittr, tree,
			randomForest)

set.seed(2)

crime <- read_tsv("http://www.statsci.org/data/general/uscrime.txt")

crime_scaled <- as.data.frame(scale(crime))

pca <- prcomp(~M + So + Ed + Po1 + Po2 + LF + M.F + Pop +
			  NW + U1 + U2 + Wealth + Ineq + Prob + Time,
	data = crime_scaled, scale. = T)

pca$sd

newvars <- as.data.frame(pca$x[, 1:4])

crime2 <- cbind(Crime = crime_scaled$Crime, newvars)

model <- lm(Crime ~ PC1 + PC2 + PC3 + PC4,
		data = crime2)
plot(model)

model2 <- lm(Crime ~M + So + Ed + Po1 + Po2 + LF + M.F + Pop +
			  NW + U1 + U2 + Wealth + Ineq + Prob + Time,
			data = crime_scaled)

summary(model)
summary(model2)
AIC(model)
AIC(model2)
BIC(model)
BIC(model2)

# This model does not do as good a job at fitting the outcome variable as my previous model using all 15 variables separately. Even though the AIC and BIC penalize using additional variables, these measures still favor the original model due to the much improved R-squared value. Many of the components 5-15 appear to capture a decent proportion of remaining variance, even though they are not as large as the first 4.

# Here are the calculated coefficients for each of the scaled original variables:
coefs <- model$coefficients[2:5]

eigenvectors <- pca$rotation[, 1:4]

eigenvectors %*% coefs



# Q2
model <- tree(Crime ~., data = crime_scaled)
summary(model)
model$frame
model$where
plot(model)
text(model)

cv.tree(model, , prune.tree)
plot(prune.tree(model))

# The tree chooses 7 nodes, as this is the point at which overall deviance is minimized without making any node too small. The most important factor is Po1, or per-capita expenditure. It is actually used at two nodes. Population is also an important factor and works at multiple nodes as well. 

model2 <- randomForest(Crime ~ ., data = crime_scaled, ntree = 1000,
				importance = T)
model2$importance
mean(model2$rsq)
plot(model2)

tuned <- tuneRF(crime[, 1:15], crime[[16]], doBest = T, ntreeTry = 600,
			importance = T)
tuned$importance

hist(treesize(tuned))
# The forest identifies Po1, Po2, NW, and Prob as key drivers in predicting crime rates. Wealth is also important. Unlike the tree, LF is of lower importance (though still of moderate amount), along with U2 and Ed. The random forest model also tends to use many more nodes per tree - a median around 15, as compared to the single-tree model which used 7. This is to be expected, as the most optimal variable to split on at any given node has a good chance of being excluded from the list of choices.

# Q3

My boss likes to work from home a couple days a week. He doesn't always tell us when those days will be, but we could develop a model to predict whether or not he will be in the office. Predictors would include whether a given day is a school holiday or a Monday/Friday (to stretch out the weekend). Morning traffic and weather reports would also help, as he has a relatively long road commute. I would also include the portion of the day he has scheduled for conference calls with other offices - if he's booked all day in meetings he can participate in from anywhere, I've noticed he tends to just make the calls from home.


# Q4
credit <- read.table('http://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.data',
			header = F)

names(credit) <- c('check_acct_status', 'duration', 'credit_history',
				  'purpose', 'credit_amt', 'savings', 'employment',
				  'install_rate', 'personal_status', 'other_guarantors',
				  'time_in_residence', 'property', 'age', 'other_debts',
				  'housing', 'credit_cards', 'job', 'dependents',
				  'phone', 'foreign', 'approve')

# recode credit - 2 = bad
credit %<>%
	mutate(
		approve = 2 - approve
	)


model <- glm(approve ~ ., family = binomial(link = 'logit'),
			data = credit)

model$fitted.values

scoring <- data.frame(actual = credit$approve, estimate = model$fitted.values, score = 0)

threshold = 0.1

score_fn <- function(threshold) {
	total_costs <- scoring %>%
		#rowwise() %>%
		mutate(
			score = ifelse(estimate < threshold & actual == 1, 1,
					ifelse(estimate > threshold & actual == 0, 5, 0))
		) %>%
		select(score) %>%
		sum()

	return(total_costs)
} 

results <- data.frame(threshold = seq(0.1, .99, by = 0.001), score = 0)

for (i in 1:nrow(results)) {
	results$score[i] <- score_fn(results$threshold[i])
}

ggplot(data = results) +
	geom_line(aes(x = threshold, y = score))

results[results$score == min(results$score),]

# Using the 5:1 cost function, it appears that a rather conservative threshold is necessary: 0.87. The risks of entering into a bad investment greatly outweigh the costs of passing on a safe one.

