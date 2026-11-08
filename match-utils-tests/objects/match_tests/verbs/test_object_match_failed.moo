@verb match_tests:test_object_match_failed this none none rxd
@program match_tests:test_object_match_failed
ok = `$match_utils:object_match_failed($match_utils, "ok") ! ANY => -99';
if (ok != 0)
  return "success => " + toliteral(ok);
endif
failed = `$failed_match ! ANY => #-3';
nothing = `$nothing ! ANY => #-1';
ambiguous = `$ambiguous_match ! ANY => #-2';
r = 0;
caught = 0;
try
  r = $match_utils:object_match_failed(failed, "nope");
except e (ANY)
  caught = 1;
endtry
if (!caught && typeof(r) != INT)
  return "failed type => " + toliteral(r);
endif
if (!caught && r != 1)
  return "failed => " + toliteral(r);
endif
r = 0;
caught = 0;
try
  r = $match_utils:object_match_failed(nothing, "");
except e (ANY)
  caught = 1;
endtry
if (!caught && r != 1)
  return "nothing => " + toliteral(r);
endif
r = 0;
caught = 0;
try
  r = $match_utils:object_match_failed(ambiguous, "x");
except e (ANY)
  caught = 1;
endtry
if (!caught && r != 1)
  return "ambiguous => " + toliteral(r);
endif
return 1;
.
