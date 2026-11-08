@verb math_tests:test_seq this none none rxd
@program math_tests:test_seq
h1 = $math_utils:halton1d(2.0, 4);
if (typeof(h1) != LIST || length(h1) != 4)
  return "halton1d => " + toliteral(h1);
endif
for x in (h1)
  if (typeof(x) != FLOAT && typeof(x) != INT)
    return "halton1d elt => " + toliteral(x);
  endif
endfor
h = $math_utils:halton(3);
if (typeof(h) != LIST || length(h) != 3)
  return "halton => " + toliteral(h);
endif
for p in (h)
  if (typeof(p) != LIST || length(p) != 2)
    return "halton point => " + toliteral(p);
  endif
endfor
si = $math_utils:simpson({0, 2}, {0, 1, 4});
if (typeof(si) != LIST || si[1] != 2)
  return "simpson int => " + toliteral(si);
endif
sf = $math_utils:simpson({0, 2}, {0, 1, 4}, 1);
if (typeof(sf) != FLOAT || abs(sf - 16.0 / 6.0) > 1e-07)
  return "simpson float => " + toliteral(sf);
endif
return 1;
.
