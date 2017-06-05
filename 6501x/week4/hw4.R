pacman::p_load(dplyr, readr, purrr, outliers, ggplot2, lubridate, tidyr, stats, smooth, tibble, magrittr)


crime <- read_tsv("http://www.statsci.org/data/general/uscrime.txt")

crime_scaled <- as.data.frame(scale(crime))

pca <- prcomp(~M + So + Ed + Po1 + Po2 + LF + M.F + Pop +
			  NW + U1 + U2 + Wealth + Ineq + Prob + Time,
	data = crime_scaled, scale. = T)

newvars <- as.data.frame(pca$x[, 1:4])

crime2 <- cbind(Crime = crime_scaled$Crime, newvars)

model <- lm(Crime ~ PC1 + PC2 + PC3 + PC4,
		data = crime2)

summary(model)

coefs <- model$coefficients[2:5]

eigenvectors <- pca$rotation[, 1:4]

eigenvectors %*% coefs
