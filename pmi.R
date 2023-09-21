library(rjson)
library(rstan)
library(lubridate)

setwd("~/Work/pmi-bayesian/")

train_dat <- list(y=5, n=1000000, y_mid_x=1, n_mid_x=10)
train_dat
fit1 <- stan(file = "pmi.stan", data=train_dat, chains=16)
fit1
