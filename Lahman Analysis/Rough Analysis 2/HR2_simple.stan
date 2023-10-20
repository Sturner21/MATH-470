//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> N;
  vector[N] Age;
  array[N] int<lower=0> AB;
  array[N] int<lower=0> HR;
}

parameters {
  real beta0;
  real beta1;
}

model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], beta0 + beta1*Age[n]);
  }

  beta0 ~ normal(-3.5, 0.1);
  beta1 ~ normal(0, 1);
}
