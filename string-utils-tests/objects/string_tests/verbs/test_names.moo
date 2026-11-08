@verb string_tests:test_names this none none rxd
@program string_tests:test_names
if ($string_utils:names_of({}) != "")
  return "names_of empty";
endif
nn = `$string_utils:names_of({$string_utils}) ! ANY => 0';
if (typeof(nn) == STR && !index(nn, $string_utils.name))
  return "names_of => " + toliteral(nn);
endif
got = $string_utils:name_and_number($nothing);
if (typeof(got) != STR || !index(got, "("))
  return "name_and_number => " + toliteral(got);
endif
if (typeof($string_utils:nn($nothing)) != STR)
  return "nn alias";
endif
if (typeof($string_utils:nn_list({$nothing})) != STR)
  return "nn_list alias";
endif
return 1;
.
