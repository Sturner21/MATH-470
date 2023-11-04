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
  int<lower=0> n_player;
  vector[N] int<lower=0> AB;
  vector[N] int<lower=0> HR;
  vector[N] Player;
}

// Declare the parameters here so Stan knows what to expect
parameters {
  
  vector[n_player] a;
  real bar_a;
  real sigma_a;
  
}

model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], a[Player[n]]);
  }
    
    // want to make it like the year instead (this will make it an additive constant)
    for (n in 1:n_player){
      a[n] ~ normal(bar_a, sigma_a);
    }
    
    bar_a ~ normal(-3.5, 1);
    sigma_a ~ exponential(1);

}





