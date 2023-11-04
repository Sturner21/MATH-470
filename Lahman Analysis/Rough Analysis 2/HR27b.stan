data {
  int<lower=0> N;
  int<lower=0> n_player;
  int<lower=0> n_year;
  array[N] int<lower=0> AB;
  array[N] int<lower=0> HR;
  array[N] int Player;
  array[N] int<lower=1> Year;
}

parameters {
  
  vector[n_player] a;
  real bar_a;
  real sigma_a;
  
  vector[n_year] b;
  
}

model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], a[Player[n]] + b[Year[n]]);
  }
    
    // want to make it like the year instead (this will make it an additive constant)
    for (n in 1:n_player){
      a[n] ~ normal(bar_a, sigma_a);
    }
    
    for (n in 1:n_year){
      b[n] ~ normal(0,.1);
    }
    
    bar_a ~ normal(-3.5, 1);
    sigma_a ~ exponential(10);

}





