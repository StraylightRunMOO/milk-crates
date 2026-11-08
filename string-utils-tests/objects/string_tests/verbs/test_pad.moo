@verb string_tests:test_pad this none none rxd
@program string_tests:test_pad
if ($string_utils:space(3, ".") != "...")
  return "space";
endif
if ($string_utils:repeat("ab", 3) != "ababab")
  return "repeat";
endif
if ($string_utils:left("hi", 5) != "hi   ")
  return "left";
endif
got = $string_utils:right("hi", 5);
if (got != "   hi")
  return "right => " + toliteral(got);
endif
c = $string_utils:centre("hi", 5);
if (length(c) != 5 || index(c, "hi") < 1)
  return "centre => " + toliteral(c);
endif
if ($string_utils:center("hi", 4) != $string_utils:centre("hi", 4))
  return "center alias";
endif
ln = `$string_utils:("left(noansi)")("hi", 5) ! ANY => 0';
if (ln != "hi   ")
  return "left(noansi) => " + toliteral(ln);
endif
rn = `$string_utils:("right(noansi)")("hi", 5) ! ANY => 0';
if (rn != "   hi")
  return "right(noansi) => " + toliteral(rn);
endif
sn = `$string_utils:("space(noansi)")(3, ".") ! ANY => 0';
if (sn != "...")
  return "space(noansi) => " + toliteral(sn);
endif
return 1;
.
