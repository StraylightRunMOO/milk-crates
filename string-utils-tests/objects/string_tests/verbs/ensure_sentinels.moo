@verb string_tests:ensure_sentinels this none none rxd
@program string_tests:ensure_sentinels
// Define LambdaMOO #0 sentinels if missing. Wizard-only; no-op if present.
// Objects are falsy, so existence is E_PROPNF rather than !#0.nothing.
pairs = {{"nothing", #-1}, {"ambiguous_match", #-2}, {"failed_match", #-3}, {"maxint", 2147483647}, {"minint", -2147483647}};
for p in (pairs)
  {name, val} = p;
  if (`#0.(name) ! ANY => E_PROPNF' == E_PROPNF)
    `add_property(#0, name, val, {player, "r"}) ! ANY => 0';
  endif
endfor
if (`$no_one ! ANY => E_PROPNF' == E_PROPNF)
  `add_property(#0, "no_one", player, {player, "r"}) ! ANY => 0';
endif
return 1;
.
