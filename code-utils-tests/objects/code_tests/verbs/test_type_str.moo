@verb code_tests:test_type_str this none none rxd
@program code_tests:test_type_str
if (`$code_utils:type_str(1) ! ANY => 0' != "INT")
  return "INT";
endif
if (`$code_utils:type_str(3.14) ! ANY => 0' != "FLOAT")
  return "FLOAT";
endif
if (`$code_utils:type_str("x") ! ANY => 0' != "STR")
  return "STR";
endif
if (`$code_utils:type_str(#0) ! ANY => 0' != "OBJ")
  return "OBJ";
endif
if (`$code_utils:type_str(E_NONE) ! ANY => 0' != "ERR")
  return "ERR";
endif
if (`$code_utils:type_str({}) ! ANY => 0' != "LIST")
  return "LIST";
endif
if (`$code_utils:type_str([]) ! ANY => 0' != "MAP")
  return "MAP";
endif
return 1;
.
