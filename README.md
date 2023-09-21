# PMI Bayesian

The pointwise mutual information between two words is a good indicator of their relatedness.

At the same time, the standard maximum likelihood estimates for it have too much variance, and are sometimes even undefined due to zero divisions. This is especially true when the data is divided into smaller subsets, decreasing the effective sample size.

In this repo, Bayesian estimation of PMI values is implemented

- [x] Simple PMI estimation of just p(x | y) and p(x)
- [ ] Temporal models with random walk priors
- [ ] Hierarchical models where information between words is shared
