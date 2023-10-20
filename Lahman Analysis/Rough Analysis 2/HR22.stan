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
  int<lower=0> z;
  array[N] int<lower=1> Year;
  array[N] int<lower=1> Age;
  array[N] int<lower=1, upper=2> LG;
  array[N] int<lower=0> AB;
  array[N] int<lower=0> HR;
  array[N] int<lower=0> SB;
}

parameters {
  vector[2] a;
  vector[z] b;
  vector[z] c;
}

model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], a[LG[n]] + b[Year[n]] + c[Age[n]]);
  }
  a[1] ~ normal(-3.5, 0.1);
  a[2] ~ normal(-3.5, 0.1);
  for (n in 1:z){
    b[n] ~ normal(0, 0.1);
    c[n] ~ normal(0, 0.5);
  }

}





