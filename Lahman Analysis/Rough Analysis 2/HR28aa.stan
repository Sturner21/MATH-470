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
  int<lower=0> n_player;
  array[N] int<lower=0> HR;
  array[N] int<lower=0> AB;
  array[N] int Player;
  vector[N] cAge;

}


// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  vector[n_player] beta0;
  vector[n_player] beta1;
  
  real mu;
  real sigma;
  real nu;
  real tau;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], beta0[Player[n]] + beta1[Player[n]]*cAge[n]);
  }
  
  for (n in 1:n_player){
    beta0[n] ~ normal(mu, sigma);
    beta1[n] ~ normal(nu, tau);
  }
  
  mu ~ normal(-3.5, 0.1);
  sigma ~ exponential(1);
  mu ~ normal(0, 0.1);
  tau ~ exponential(10);

}

