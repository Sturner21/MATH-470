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
  int<lower=0> n_year;
  array[N] int<lower=1> Year;
  vector[N] Age;
  array[N] int<lower=0> AB;
  vector[N] SB;
}

generated quantities {
  array[n_year] real b;
  for (n in 1:n_year){
    b[n] = normal_rng(-3.5, 0.1);
  }
  
  real beta1 = normal_rng(0, 1);
  real c = normal_rng(0, 1);
  array[N] real HR;
  for (n in 1:N){
    HR[n] = binomial_rng(AB[n], inv_logit(b[Year[n]] + beta1 * Age[n] + c * SB[n]));
  }
}