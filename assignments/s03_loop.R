for(month in month.abb){
  greedy = select_covariates(approach = "greedy", mon = month)
  conservative = select_covariates(approach = "conservative", mon = month)
}
