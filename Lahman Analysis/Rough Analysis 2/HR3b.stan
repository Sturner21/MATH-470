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
  vector[N] cAgeSq;
  vector[N] cAgeCb;
  vector[N] cAgeQa;
  array[N] int<lower=0> Park;

}


// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  vector[n_player] beta0;
  vector[n_player] beta1;
  vector[n_player] beta2;
  vector[n_player] beta3;
  vector[n_player] beta4;
  
  real mu0;
  real<lower=0> sigma0;
  real mu1;
  real<lower=0> sigma1;
  real mu2;
  real<lower=0> sigma2;
  real mu3;
  real<lower=0> sigma3;
  real mu4;
  real<lower=0> sigma4;
  
  vector[n_player] beta5;
  real mu5;
  real sigma5;
  
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], beta0[Player[n]] + beta1[Player[n]]*cAge[n] + beta2[Player[n]]*cAgeSq[n] + beta3[Player[n]]*cAgeCb[n] + beta4[Player[n]]*cAgeQa[n] + beta5[Player[n]]*Park[n]);
  }
  
  for (n in 1:n_player){
    beta0[n] ~ normal(mu0, sigma0);
    beta1[n] ~ normal(mu1, sigma1);
    beta2[n] ~ normal(mu2, sigma2);
    beta3[n] ~ normal(mu3, sigma3);
    beta4[n] ~ normal(mu4, sigma4);
    
    
    // I could be convinced otherwise, but I believe there is sufficient theory to suggest that using a multilevel model for park effects makese sense
    // Bad idea. Just do a single park effect per park, not per player becuase you didn't implement it correctly.
    beta5[n] ~ normal(mu5, sigma5);
  }
  
  mu0 ~ normal(-3.5, 0.1);
  sigma0 ~ exponential(1);
  mu1 ~ normal(0, 0.1);
  sigma1 ~ exponential(10);
  mu2 ~ normal(0, 0.01);
  sigma2 ~ exponential(100);
  mu3 ~ normal(0, 0.01);
  sigma3 ~ exponential(100);
  mu4 ~ normal(0, 0.01);
  sigma4 ~ exponential(100);
  
  
  mu5 ~ normal(0,0.1);
  sigma5 ~ exponential(10);

}




