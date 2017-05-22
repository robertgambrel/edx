library(dplyr)
library(stats)
data(iris)
head(iris)
n_distinct(iris$Species)
iris$Species %>% unique()

kplot <- function(i) {
  means <- kmeans(iris[, 1:4], centers = i, nstart = 50)
  plot(iris[, 1:4], col = means$cluster)
  }
  
walk(1:5, kplot)

means <- kmeans(iris[, 1:4], centers = 3, nstart = 50)
fitted.means <- fitted(means, method = "classes")

fitted_df <- as.data.frame(fitted.means)
fitted_df$class <- NA_character_
head(fitted_df)
fitted_df <- fitted_df %>%
    mutate(
        class = ifelse(fitted.means == 3, 'setosa', 
                          ifelse(fitted.means == 2, 'versicolor', 'virginica')))
                          
sum(fitted_df$class == iris$Species) / nrow(fitted_df)


pacman::p_load(dplyr, readr, purrr, outliers, ggplot2, lubridate)

crime <- read_tsv("http://www.statsci.org/data/general/uscrime.txt")

outliers::grubbs.test(crime$Crime, 10)
outliers::grubbs.test(crime$Crime, 10, opposite = T)
outliers::grubbs.test(crime$Crime, 11)

# Question 1


# Question 5
temps <- read_csv('T:\\Clients\\WIP\\EJGH\\Data Science Team\\RG\\trainings\\temps.csv')

temps <- temps %>%
	arrange(Year, Month, Day) %>%
	mutate(
		date = ymd(paste0(Year, '-', Month, '-', Day))
		) %>%
	group_by(Year) %>%
	mutate(
		rn = 1:n()
	)


ggplot(data = temps) +
	geom_line(aes(x = rn, y = high_temp, col = as.factor(Year), group = Year)) +
	geom_smooth(aes(x = rn, y = high_temp), method = 'loess') +
	scale_color_discrete(name = "Year")
