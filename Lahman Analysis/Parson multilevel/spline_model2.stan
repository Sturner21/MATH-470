data {
  int<lower=0> N;
  int<lower=0> n_player;
  int<lower=0> n_basis;
  array[N] int<lower=0> AB;
  array[N] int<lower=0> HR;
  array[N] int<lower=0> Player;
  matrix[N, n_basis] B;
}

parameters {
  vector[n_player] a;
  array[n_player] vector[n_basis] weight;
  real mu;
  real<lower=0> sigma;
  vector[n_basis] nu;
  vector<lower=0>[n_basis] tau;
}

model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], a[Player[n]] + B[n] * weight[Player[n]]);
  }
  
  for (k in 1: n_player){
    a[k] ~ normal(mu, sigma);
    for (n in 1:n_basis){
      weight[k][n] ~ normal(nu[n], tau[n]);
      }
  }
  
  mu ~ normal(-3.5, 0.1);
  sigma ~ exponential(10);
  for (k in 1:n_basis){
    nu[k] ~ normal(0, 1);
    tau[k] ~ exponential(10);
  }


}

