@verb code_tests:test_commentify this none none rxd
@program code_tests:test_commentify
expect = {toliteral("hello") + ";", toliteral("world") + ";"};
c = `$code_utils:commentify({"hello", "world"}) ! ANY => 0';
if (c != expect)
  return "commentify => " + toliteral(c);
endif
u = `$code_utils:uncommentify(c) ! ANY => 0';
if (typeof(u) == LIST && u != {"hello", "world"})
  return "uncommentify => " + toliteral(u);
endif
return 1;
.
