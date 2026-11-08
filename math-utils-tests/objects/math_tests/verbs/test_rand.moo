@verb math_tests:test_rand this none none rxd
@program math_tests:test_rand
r = `$math_utils:random(5) ! ANY => -99';
if (typeof(r) != INT || r < 0 || r > 5)
  return "random 5 => " + toliteral(r);
endif
rr = `$math_utils:random_range(4) ! ANY => -99';
if (typeof(rr) != INT || rr < -4 || rr > 4)
  return "random_range 4 => " + toliteral(rr);
endif
b = `$math_utils:rand_bernoulli() ! ANY => -1';
if (!(b in {0, 1}))
  return "rand_bernoulli => " + toliteral(b);
endif
u = `$math_utils:rand_uniform() ! ANY => -1';
if (typeof(u) != FLOAT || u < 0.0 || u > 1.0)
  return "rand_uniform => " + toliteral(u);
endif
n = `$math_utils:rand_normal() ! ANY => 0';
if (typeof(n) != FLOAT)
  return "rand_normal => " + toliteral(n);
endif
g = `$math_utils:rand_gamma() ! ANY => 0';
if (typeof(g) != FLOAT)
  return "rand_gamma => " + toliteral(g);
endif
be = `$math_utils:rand_beta() ! ANY => 0';
if (typeof(be) != FLOAT || be < 0.0 || be > 1.0)
  return "rand_beta => " + toliteral(be);
endif
c = `$math_utils:rand_cauchy() ! ANY => 0';
if (typeof(c) != FLOAT)
  return "rand_cauchy => " + toliteral(c);
endif
ch = `$math_utils:rand_chisquared() ! ANY => 0';
if (typeof(ch) != FLOAT)
  return "rand_chisquared => " + toliteral(ch);
endif
ex = `$math_utils:rand_exponential() ! ANY => 0';
if (typeof(ex) != FLOAT)
  return "rand_exponential => " + toliteral(ex);
endif
f = `$math_utils:rand_f() ! ANY => 0';
if (typeof(f) != FLOAT)
  return "rand_f => " + toliteral(f);
endif
ig = `$math_utils:rand_invgamma() ! ANY => 0';
if (typeof(ig) != FLOAT)
  return "rand_invgamma => " + toliteral(ig);
endif
iv = `$math_utils:rand_invgauss() ! ANY => 0';
if (typeof(iv) != FLOAT)
  return "rand_invgauss => " + toliteral(iv);
endif
bi = `$math_utils:rand_binomial() ! ANY => -1';
if (typeof(bi) != INT || bi < 0 || bi > 10)
  return "rand_binomial => " + toliteral(bi);
endif
mt = `$math_utils:rand_mt19937() ! ANY => 0';
if (typeof(mt) != INT)
  return "rand_mt19937 => " + toliteral(mt);
endif
xo = `$math_utils:rand_xoshiro256ss() ! ANY => 0';
if (typeof(xo) != INT)
  return "rand_xoshiro256ss => " + toliteral(xo);
endif
sm = `$math_utils:rand_splitmix64() ! ANY => 0';
if (typeof(sm) != INT)
  return "rand_splitmix64 => " + toliteral(sm);
endif
return 1;
.
