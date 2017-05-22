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
