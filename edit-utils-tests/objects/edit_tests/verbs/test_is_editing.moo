@verb edit_tests:test_is_editing this none none rxd
@program edit_tests:test_is_editing
got = `$edit_utils:is_editing(player) ! ANY => 1';
if (got)
  return "is_editing => " + toliteral(got);
endif
return 1;
.
