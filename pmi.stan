// The input data is a vector 'y' of length 'N'.
data {
  int y;
  int y_mid_x;
  int n;
  int n_mid_x;
}

parameters {
  real<lower=0.0, upper=1.0> lambda;
  real<lower=0.0, upper=1.0> theta;
}

transformed parameters {
  real<lower=0.0> tau = lambda / (1.0 - lambda);
  real<lower=0.0, upper=1.0> theta_mid_x = theta * tau;
  
  real log_theta = log(theta);
  real log_theta_mid_x = log(theta_mid_x);
  real PMI = log_theta_mid_x - log_theta;
}

model {
  lambda ~ beta(2,2);
  y ~ binomial(n, theta);
  y_mid_x ~ binomial(n_mid_x, theta_mid_x);
}

