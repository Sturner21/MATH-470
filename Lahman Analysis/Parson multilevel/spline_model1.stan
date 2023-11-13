data {
  int<lower=0> N;
  int<lower=0> n_basis;
  array[N] int<lower=0> AB;
  array[N] int<lower=0> HR;
  matrix[N, n_basis] B;
}

parameters {
  real a;
  vector[n_basis] weight;
}

model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], a + B[n] * weight);
  }
  
  a ~ normal(-3.5, 0.1);
  
  for (n in 1:n_basis){
    weight[n] ~ normal(0, 1);
  }

}

