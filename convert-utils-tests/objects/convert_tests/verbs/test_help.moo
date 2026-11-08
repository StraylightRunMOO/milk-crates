@verb convert_tests:test_help this none none rxd
@program convert_tests:test_help
code = `verb_code($convert_utils, "C_to_F") ! ANY => 0';
if (typeof(code) != LIST || !code)
  return "no verb_code";
endif
if (length(code[1]) < 2 || code[1][1..2] != "//" || !index(code[1], "$convert_utils:C_to_F"))
  return "C_to_F help => " + toliteral(code[1]);
endif
if (!index(code[1], "degC_to_degF") && (length(code) < 2 || !index(code[2], "degC_to_degF")))
  return "C_to_F alias help => " + toliteral(code[1]);
endif
cv = `verb_code($convert_utils, "convert") ! ANY => 0';
if (typeof(cv) != LIST || !cv || cv[1][1..2] != "//" || !index(cv[1], "$convert_utils:convert"))
  return "convert help => " + toliteral(typeof(cv) == LIST && cv ? cv[1] | cv);
endif
for v in ({"_do_convert", "_do_value", "_format_units", "_try_metric_prefix"})
  priv = `verb_code($convert_utils, v) ! ANY => 0';
  if (typeof(priv) != LIST || !priv || length(priv[1]) < 2 || priv[1][1..2] != "//" || !index(priv[1], "$convert_utils:" + v))
    return v + " help => " + toliteral(typeof(priv) == LIST && priv ? priv[1] | priv);
  endif
endfor
return 1;
.
