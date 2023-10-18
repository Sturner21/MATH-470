data {
  array[24] int al_ab;
  array[24] int nl_ab;
  array[24] int al_hr;
  array[24] int nl_hr;
}

parameters {
  vector<lower = 0, upper = 1>[24] p_al;
  vector<lower = 0, upper = 1>[24] p_nl;
}

model {
  for (n in 1:24){
    al_hr[n] ~ binomial(al_ab[n], p_al[n]);
    nl_hr[n] ~ binomial(nl_ab[n], p_nl[n]);
  }
}
