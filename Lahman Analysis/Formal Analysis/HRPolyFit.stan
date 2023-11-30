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
  int<lower=0> n_year;
  array[N] int<lower=0> HR;
  array[N] int<lower=0> AB;
  array[N] int Player;
  vector[N] cAge;
  vector[N] cAgeSq;
  array[N] int<lower=0> Park;
  array[N] int<lower=0> Year;

}


// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  vector[n_player] alpha;
  vector[n_player] beta;
  vector[n_player] eta;
  
  real mu0;
  real<lower=0> sigma0;
  real mu1;
  real<lower=0> sigma1;
  real mu2;
  real<lower=0> sigma2;
  
  vector[n_park] delta;
  real mu5;
  real<lower=0> sigma5;
  
  vector[n_year] xi;
  real mu6;
  real<lower=0> sigma6;
  
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], alpha[Player[n]] + beta[Player[n]]*cAge[n] + eta[Player[n]]*cAgeSq[n] + delta[Park[n]] + xi[Year[n]]);
  }
  
  for (n in 1:n_player){
    alpha[n] ~ normal(mu0, sigma0);
    beta[n] ~ normal(mu1, sigma1);
    eta[n] ~ normal(mu2, sigma2);
    }
  
  mu0 ~ normal(-3.5, 0.1);
  sigma0 ~ exponential(1);
  mu1 ~ normal(0, 0.1);
  sigma1 ~ exponential(10);
  mu2 ~ normal(0, 0.01);
  sigma2 ~ exponential(100);
  
  for (n in 1:n_park){
      delta[n] ~ normal(mu5, sigma5);
  }

  mu5 ~ normal(0,0.01);
  sigma5 ~ exponential(10);
  
  for (n in 1:n_year){
    xi[n] ~ normal(mu6, sigma6);
  }
  
  mu6 ~ normal(0, 0.25);
  sigma6 ~ exponential(10);
  
  
}

