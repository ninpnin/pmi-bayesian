# PMI Bayesian

The pointwise mutual information between two words is a good indicator of their relatedness.

At the same time, the standard maximum likelihood estimates for it have too much variance, and are sometimes even undefined due to zero divisions. This is especially true when the data is divided into smaller subsets, decreasing the effective sample size.

In this repo, Bayesian estimation of PMI values is implemented

- [x] Simple PMI estimation of just p(x | y) and p(x)
- [ ] Temporal models with random walk priors
- [ ] Hierarchical models where information between words is shared

## Simple PMI estimation of just p(x | y) and p(x)

We start by estimating the frequency of the word $x$

$$
p(x) = \pi_x
$$

as well as the frequency of the word $x$ given that the word $y$ is the context window

$$
p(x \mid y) = \pi_{xy}
$$

Additionally, we want to add a prior that pushes $\pi_{xy}$ close to $\pi_{x}$ if there is little data. This can be achieved by formulating an additional ratio variable $\lambda \in \mathbb R_+$

$$
\pi_{xy} = \lambda \pi_x
$$

We'll then add a prior on $\lambda$ that is logit-symmetrically distributed around $1$

$$
\frac{\lambda}{\lambda +1} \sim \text{Beta}(\alpha, \alpha)
$$

where eg. $\alpha=2$ is the strength of this prior. The full model is then

$$
\begin{aligned}
\pi_x &\sim \text{Beta}(1, 1) \\
\frac{\lambda}{\lambda +1} &\sim \text{Beta}(\alpha, \alpha) \\
\pi_{xy} &= \lambda \pi_x \\
N_x &\sim \text{Bin}(N, \pi_x) \\
N_{x \mid y} &\sim \text{Bin}(N_y, \pi_{xy})
\end{aligned}
$$

where $N_{x}$ and $N_{x \mid y}$ are the counts of the word $x$ in total and given that $y$ occurs in the context window, respectively.

The model is implemented in pmi.stan.