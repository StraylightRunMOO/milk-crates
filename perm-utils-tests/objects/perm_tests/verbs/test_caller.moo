@verb perm_tests:test_caller this none none rxd
@program perm_tests:test_caller
got = `$perm_utils:caller() ! ANY => 0';
if (typeof(got) == LIST)
  if (!got || typeof(got[1]) != OBJ)
    return "caller list => " + toliteral(got);
  endif
elseif (typeof(got) != OBJ)
  return "caller => " + toliteral(got);
endif
ln = `$perm_utils:caller(1) ! ANY => 0';
if (typeof(ln) != LIST && typeof(ln) != OBJ)
  return "caller lineno => " + toliteral(ln);
endif
return 1;
.
