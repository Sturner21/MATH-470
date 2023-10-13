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
  int<lower=1> z;
  array[N] int<lower=1> YEAR;
  array[N] int<lower=0> AB;
  array[N] int<lower=0> HR;
  array[N] int<lower=1, upper=2> LG;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  vector[2] a;
  vector[z] b;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], a[LG[n]] + b[YEAR[n]]);
  }
}

