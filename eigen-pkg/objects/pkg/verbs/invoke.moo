@verb pkg:invoke this none none rxd
@program pkg:invoke
// $pkg:invoke(spec [, args]) => MAP or verb result
// spec is "obj:verb" or "$obj:verb". Missing colon means :run.
spec = tostr(args[1]);
vargs = length(args) >= 2 && typeof(args[2]) == LIST ? args[2] | {};
if (spec && spec[1] == "$")
  spec = spec[2..$];
endif
verb = "run";
colon = index(spec, ":");
if (colon)
  verb = spec[colon + 1..$];
  spec = spec[1..colon - 1];
endif
if (!spec || !verb)
  return ["ok" -> 0, "errors" -> {"bad verb ref"}];
endif
obj = `#0.(spec) ! ANY => #-1';
if (!valid(obj))
  return ["ok" -> 0, "errors" -> {"unknown object: $" + spec}];
endif
try
  r = obj:(verb)(@vargs);
except e (ANY)
  return ["ok" -> 0, "errors" -> {tostr(e[1]) + " " + tostr(e[2])}];
endtry
if (typeof(r) == MAP)
  return r;
endif
return ["ok" -> r ? 1 | 0, "result" -> r];
.
