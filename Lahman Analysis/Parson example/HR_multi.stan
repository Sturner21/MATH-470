data {
  int<lower=0> N;
  int<lower=0> z;
  array[N] int<lower=1, upper=2> league;
  array[N] int<lower=0> AB;
  array[N] int<lower=0> HR;
  array[N] int<lower=1> year;
}

parameters {
  vector[2] a;
  
  real mu;
  real<lower = 0> sigma;
  
  vector[z] b;
}

model {
  for (n in 1:N){
    HR[n] ~ binomial_logit(AB[n], a[league[n]] + b[year[n]]);
  }
  a[1] ~ normal(-3.5, 0.1);
  a[2] ~ normal(-3.5, 0.1);
  for (n in 1:z){
    b[n] ~ normal(mu, sigma);
  }
  mu ~ normal(0, 0.1);
  sigma ~ exponential(10);
}

// We set this up so that the a's are the principal effects.
// Those priors are a bit silly. We know that the HR rates are low, less than 5%.
// Note that logit(0.05) is about -3.
// A reasonable prior for the principal effect might be normal(-3, 1) or normal(-3.5, 1).
//
// Recall meaning of a difference on the logit scale: difference of x corresponds to
// change in odds ratio of exp(x). If x is small, that is roughly 100x% change.
// If the odds of the event are small, then odds are roughly the probability.
// A small adjustment by x on the logit scale thus corresponds roughly to a 100x%
// change on the probability scale.
// Seen this way, our priors on the b's seem reasonable. We are expecting the
// annual changes in HR rates to be on the order of 10 percent and mostly smaller than 20 percent.
// With standard deviation in prior on b's at 0.5, the model does not converge in 5000 steps.
// With standard deviation at 0.1, it does converge--and the sampling finds good values for the b's.
