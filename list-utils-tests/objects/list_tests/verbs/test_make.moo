@verb list_tests:test_make this none none rxd
@program list_tests:test_make
if ($list_utils:make(3, "z") != {"z", "z", "z"})
  return "make 3 z";
endif
if ($list_utils:make(2) != {0, 0})
  return "make default elt";
endif
if ($list_utils:make(0, "z") != {})
  return "make 0";
endif
if ($list_utils:make(-1) != E_INVARG)
  return "make neg";
endif
return 1;
.
