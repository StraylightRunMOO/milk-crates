@verb string_tests:test_misc this none none rxd
@program string_tests:test_misc
ch = `$string_utils:connection_hostname("x from example.com") ! ANY => 0';
if (ch != "example.com")
  return "connection_hostname => " + toliteral(ch);
endif
`$string_utils:connection_hostname_bsd(#-1) ! ANY => 0';
pc = `$string_utils:parse_command("") ! ANY => 0';
if (pc != {})
  return "parse_command empty => " + toliteral(pc);
endif
`$string_utils:parse_command("look") ! ANY => 0';
tl = `$string_utils:title_listc({}) ! ANY => 0';
if (tl != "Nothing" && tl != 0)
  return "title_listc empty => " + toliteral(tl);
endif
`$string_utils:title_list({}) ! ANY => 0';
`$string_utils:list_titlec({}) ! ANY => 0';
`$string_utils:redirect_ansi() ! ANY => 0';
return 1;
.
