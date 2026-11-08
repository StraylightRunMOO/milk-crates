@verb perm_utils:caller this none this rxd
@program perm_utils:caller
// $perm_utils:caller([include line numbers]) => LIST
// -- returns the first caller in the callers() stack distinct from `this'
{?lineno = 0} = args;
c = callers(lineno);
{stage, lc, nono} = {1, length(c), {c[1][1], `$nothing ! ANY => #-1'}};
while ((stage = stage + 1) <= lc && c[stage][1] in nono)
endwhile
return c[stage];
.
