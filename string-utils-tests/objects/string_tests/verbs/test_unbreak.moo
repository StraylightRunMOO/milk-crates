@verb string_tests:test_unbreak this none none rxd
@program string_tests:test_unbreak
if ($string_utils:unbreak("plain") != "plain")
  return "unbreak non-list";
endif
u = $string_utils:unbreak({"hello", " world"});
if (typeof(u) != LIST || !u)
  return "unbreak => " + toliteral(u);
endif
return 1;
.
