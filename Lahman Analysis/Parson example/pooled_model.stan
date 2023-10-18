data {
  array[2] int AB;
  array[2] int HR;
}

parameters {
  vector<lower = 0, upper = 1>[2] p;
}

model {
  for (n in 1:2){
    HR[n] ~ binomial(AB[n], p[n]);
  }
}
