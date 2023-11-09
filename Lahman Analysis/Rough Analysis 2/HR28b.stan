data {
  int<lower=0> N;
  int<lower=0> n_player;
  int<lower=0> n_year;
  int<lower=0> n_park;
  array[N] int<lower=0> AB;
  array[N] int<lower=0> HR;
  array[N] int Player;
  array[N] int<lower=1> Year;
  array[N] int<lower=0> park;
  vector[N] cAge;
  vector[N] cAgeSq;
  vector[N] cAgeCb;
}

parameters {
  
  vector[n_player] a;
  real bar_a;
  real<lower=0> sigma_a;
  
  vector[n_year] b;
  
  vector[n_park] c;
  
  real beta1;
  real beta2;
  real beta3;
  
}

model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], a[Player[n]] + b[Year[n]] + c[park[n]] + beta1*cAge[n] + beta2*cAgeSq[n] + beta3*cAgeCb[n]);
  }
    
    // want to make it like the year instead (this will make it an additive constant)
    for (n in 1:n_player){
      a[n] ~ normal(bar_a, sigma_a);
    }
    
    for (n in 1:n_year){
      b[n] ~ normal(0,.1);
    }
    
    for (n in 1:n_park){
      c[n] ~ normal(0, .1);
    }
    
    bar_a ~ normal(-3.5, 1);
    sigma_a ~ exponential(10);
    
    beta1 ~ normal(0, 0.05);
    beta2 ~ normal(0, 0.05);
    beta3 ~ normal(0, 0.05);

}





