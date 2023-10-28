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

// Input the data here
// Should ask why we use some as "int," others as "arrays," and some as "vectors"
data {
  int<lower=0> N;
  int<lower=0> n_year;
  array[N] int<lower=1> Year;
  vector[N] Age;
  array[N] int<lower=0> AB;
  array[N] int<lower=0> HR;
  vector[N] SB;
}

// Declare the parameters here so Stan knows what to expect
parameters {
  // We use this name "n_year" to show how "b" will can be iterated over for each year
  vector[n_year] b;
  // 
  real beta1;
  real c;
}

model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], b[Year[n]] + beta1 * Age[n] + c * SB[n]);
  }
  // This for-loop sets explicit priors for each "b" we estimate for every year
  for (n in 1:n_year){
    b[n] ~ normal(-3.5, 0.1);

  }
  
  // In contrast, this sets our prior for "beta1" to just be a constant across the model
    beta1 ~ normal(0, 1);
    
    c ~ normal(0, 1);

}

generated quantities {
  array[N] int HR_rep;
  for (n in 1:N){
    HR_rep[n] = binomial_rng(AB[n], inv_logit(b[Year[n]] + beta1 * Age[n] + c * SB[n]));
  }
}



