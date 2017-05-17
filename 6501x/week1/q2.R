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

pacman::p_unload()

if (Sys.info()[[1]] == "Windows") {
  setwd("E:/GoogleDrive/edx/6501x/week1")
} 

pacman::p_load(dplyr, tidyr, magrittr, kernlab, readr)

cc <- read_tsv("credit_card_data-headers.txt")

cc_matrix <- cc %>% as.matrix()

for (c_val in c(.0001, .001, 0.01, 0.1, 1, 10, 100, 1000)) {
  model <- ksvm(x = cc_matrix[, 1:10], y = as.factor(cc_matrix[, 11]), type = "C-svc",
                kernel = "vanilladot", C = c_val, scaled = T)
  
  a <- colSums(cc_matrix[model@SVindex, 1:10] * model@coef[[1]])
  a0 <- sum(a * cc_matrix[1, 1:10]) - model@b
  pred <- predict(model, cc_matrix[, 1:10])
  correct = sum(pred == cc_matrix[, 11]) / nrow(cc_matrix)
  
  print(paste0("C val: ", c_val, ". Proportion correct: ", correct))
  
}

