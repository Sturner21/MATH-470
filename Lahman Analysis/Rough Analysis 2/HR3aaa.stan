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
  int<lower=0> n_park;
  array[N] int<lower=0> HR;
  array[N] int<lower=0> AB;
  array[N] int Player;
  vector[N] cAge;
  vector[N] cAgeSq;
  array[N] int<lower=0> Park;

}


// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  vector[n_player] beta0;
  vector[n_player] beta1;
  vector[n_player] beta2;
  
  real mu0;
  real<lower=0> sigma0;
  real mu1;
  real<lower=0> sigma1;
  real mu2;
  real<lower=0> sigma2;
  
  vector[n_park] beta5;
  real mu5;
  real<lower=0> sigma5;
  
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], beta0[Player[n]] + beta1[Player[n]]*cAge[n] + beta2[Player[n]]*cAgeSq[n] + beta5[Park[n]]);
  }
  
  for (n in 1:n_player){
    beta0[n] ~ normal(mu0, sigma0);
    beta1[n] ~ normal(mu1, sigma1);
    beta2[n] ~ normal(mu2, sigma2);
    }
  
  mu0 ~ normal(-3.5, 0.1);
  sigma0 ~ exponential(1);
  mu1 ~ normal(0, 0.1);
  sigma1 ~ exponential(10);
  mu2 ~ normal(0, 0.01);
  sigma2 ~ exponential(100);
  
  for (n in 1:n_park){
      beta5[n] ~ normal(mu5, sigma5);
  }

  mu5 ~ normal(0,0.01);
  sigma5 ~ exponential(10);
}




