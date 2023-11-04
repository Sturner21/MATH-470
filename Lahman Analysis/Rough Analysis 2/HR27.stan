data {
  int<lower=0> N;
  int<lower=0> n_player;
  array[N] int<lower=0> AB;
  array[N] int<lower=0> HR;
  array[N] int Player;
}

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





