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
  int<lower=0> n_park;
  int<lower=0> n_year;
  array[N] int<lower=0> AB;
  array[N] int<lower=0> HR;
  array[N] int<lower=0> park;
  array[N] int<lower=1> Year;
  vector[N] cAge;
}

// Declare the parameters here so Stan knows what to expect
parameters {
  
  vector[n_park] c;
  vector[n_year] b;
  real beta1; 
}

model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], c[park[n]] + b[Year[n]] + beta1 * cAge[n]);
  }
    
    // want to make it like the year instead (this will make it an additive constant)
    for (n in 1:n_park){
      c[n] ~ normal(-3.5, .1);
    }
    
    for (n in 1:n_year){
      b[n] ~ normal(0,.1);
    }
    
    beta1 ~ normal(0, 0.05);

}





