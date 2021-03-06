# May 17, 2017
# Question 2:
# The files credit_card_data.txt (without headers) and credit_card_data-headers.txt (with headers)
# contain a dataset with 654 data points, 6 continuous and 4 binary predictor variables. It has
# anonymized credit card applications with a binary response variable (last column) indicating if the
# application was positive or negative. The dataset is the “Credit Approval Data Set” from the UCI Machine
# Learning Repository (https://archive.ics.uci.edu/ml/datasets/Credit+Approval) without the categorial
# variables and without data points that have missing values.
# 1. Using the support vector machine function ksvm contained in the R package kernlab, find a
# good classifier for this data. Show the equation of your classifier, and how well it classifies the
# data points in the full data set. (Don’t worry about test/validation data yet; we’ll cover that
#                                    topic soon.)
# Notes on ksvm
# • You can use scaled=TRUE to get ksvm to scale the data as part of calculating a
# classifier.
# • The term λ we used in the SVM lesson to trade off the two components of correctness
# and margin is called C in ksvm. One of the challenges of this homework is to find a
# value of C that works well; for many values of C, almost all predictions will be “yes” or
# almost all predictions will be “no”.
# • ksvm does not directly return the coefficients a0 and a1…am. Instead, you need to do
# the last step of the calculation yourself. Here’s an example of the steps to take
# (assuming your data is stored in a matrix called data):

rm(list = ls())

if (Sys.info()[[1]] == "Windows") {
  setwd("E:/GoogleDrive/edx/6501x/week1")
} 

pacman::p_load(dplyr, tidyr, magrittr, kernlab, kknn, readr, purrr)

cc <- read_tsv("credit_card_data-headers.txt")

cc_matrix <- cc %>% as.matrix()

best_combo <- ''
best_val <- 0
best_params <- c()

sv <- function(c_val, kern) {
  model <- ksvm(x = cc_matrix[, 1:10], y = as.factor(cc_matrix[, 11]), type = "C-svc",
                kernel = kern, C = c_val, scaled = T)
  
  a <- colSums(cc_matrix[model@SVindex, 1:10] * model@coef[[1]])
  a0 <- sum(a * cc_matrix[1, 1:10]) - model@b
  pred <- predict(model, cc_matrix[, 1:10])
  correct = sum(pred == cc_matrix[, 11]) / nrow(cc_matrix)
  
  print(paste0("C val: ", c_val, ". Kern: ", kern, ". Proportion correct: ", correct))
  
  if (correct > best_val) {
    best_val <<- correct
    best_combo <<- paste(c_val, kern, sep = ', ')
    best_params <<- c(a, a0)
  }
}

cross2(
  c(.0001, .001, 0.01, 0.1, 1, 10, 100),
  c("vanilladot", "splinedot", "rbfdot", "anovadot")
) %>%
    map(lift(sv))

# testing K choices
for (k_choice in 2:10){

    knn <- kknn(R1~., cc[1:500, ], cc[500:654, ], k = k_choice, scale = T)
    pred <- round(fitted(knn))
  
  correct = sum(pred == cc[500:654, 11]) / 155
  print(paste0("k = ", k_choice, ": ", correct))
}


trained <- train.kknn(R1 ~ ., cc, kmax = 20,
                      kernel = c("rectangular", "triangular", "epanechnikov",
                                 "gaussian", "rank", "optimal"),
                      distance = 2)
trained$best.parameters
plot(trained)
# looks like gaussian, k = 6 is best compromise

pred <- vector("integer", nrow(cc))

for (i in 1:nrow(cc)) {
  knn <- kknn(R1~., cc[-i, ], cc[i, ], k = 6, scale = T, kernel = 'gaussian')
  pred[i] <- round(fitted(knn))
}
correct = sum(pred == cc[, 11]) / nrow(cc_matrix)
print(paste0("k = ", k_choice, ": ", correct))


index <- 1:654
train <- sample(index, size = round(654*.6)) %>% sort()
val <- sample(index[-train], size = round(654 * .2)) %>% sort()
test <- index[-c(train, val)]

best_combo <- ''
best_val <- 0
best_params <- c()

sv_val <- function(c_val, kern) {
  model <- ksvm(x = cc_matrix[train, 1:10], y = as.factor(cc_matrix[train, 11]), type = "C-svc",
                kernel = kern, C = c_val, scaled = T)
  
  a <- colSums(cc_matrix[model@SVindex, 1:10] * model@coef[[1]])
  a0 <- sum(a * cc_matrix[1, 1:10]) - model@b
  pred <- predict(model, cc_matrix[val, 1:10])
  correct = sum(pred == cc_matrix[val , 11]) / nrow(cc_matrix[val, ])
  
  print(paste0("C val: ", c_val, ". Kern: ", kern, ". Proportion correct: ", correct))
  
  if (correct > best_val) {
    best_val <<- correct
    best_combo <<- paste(c_val, kern, sep = ', ')
    best_params <<- c(a, a0)
  }
}

cross2(
  c(.0001, .001, 0.01, 0.1, 1, 10, 100),
  c("vanilladot", "rbfdot", "anovadot")
) %>%
  map(lift(safely(sv_val)))

# best params were C = 10, anovadot

knn <- kknn(R1~., cc[train, ], cc[val, ], k = 6, scale = T)
pred <- round(fitted(knn))

model <- ksvm(x = cc_matrix[train, 1:10], y = as.factor(cc_matrix[train, 11]), type = "C-svc",
              kernel = 'anovadot', C = 10, scaled = T)

a <- colSums(cc_matrix[model@SVindex, 1:10] * model@coef[[1]])
a0 <- sum(a * cc_matrix[1, 1:10]) - model@b
pred <- predict(model, cc_matrix[test, 1:10])
correct = sum(pred == cc_matrix[test , 11]) / nrow(cc_matrix[test, ])
print(correct)


