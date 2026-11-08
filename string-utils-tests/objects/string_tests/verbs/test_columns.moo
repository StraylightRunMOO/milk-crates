@verb string_tests:test_columns this none none rxd
@program string_tests:test_columns
cols = `$string_utils:columnize({1, 2, 3, 4, 5, 6, 7}, 3) ! ANY => 0';
if (typeof(cols) != LIST || !cols)
  return "columnize => " + toliteral(cols);
endif
cs = `$string_utils:columnize_suspended(0, {1, 2, 3, 4}, 2) ! ANY => 0';
if (typeof(cs) != LIST || !cs)
  return "columnize_suspended => " + toliteral(cs);
endif
`$string_utils:columnise({1, 2}, 1) ! ANY => 0';
`$string_utils:columnise_suspended(0, {1, 2}, 1) ! ANY => 0';
n = `$string_utils:neat({"hi", 5}) ! ANY => 0';
if (typeof(n) != STR && n != 0)
  return "neat => " + toliteral(n);
endif
`$string_utils:autofit({{"a", "b"}, {"c", "d"}}) ! ANY => 0';
`$string_utils:fit_to_screen({{"a"}}) ! ANY => 0';
adj = `$string_utils:adjust_column_lengths({10, 10}) ! ANY => 0';
if (typeof(adj) != LIST && adj != 0)
  return "adjust_column_lengths => " + toliteral(adj);
endif
return 1;
.
