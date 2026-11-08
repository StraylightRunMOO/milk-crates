@verb convert_tests:test_convert this none none rxd
@program convert_tests:test_convert
if ($convert_utils:convert("kilowatt hours", "joules") != 3600000.0)
  return "kwh => " + toliteral($convert_utils:convert("kilowatt hours", "joules"));
endif
if ($convert_utils:convert("kilometer", "meter") != 1000.0)
  return "km => " + toliteral($convert_utils:convert("kilometer", "meter"));
endif
if ($convert_utils:convert("millimeter", "meter") != 1.0 / 1000.0)
  return "mm => " + toliteral($convert_utils:convert("millimeter", "meter"));
endif
if ($convert_utils:convert("dekameter", "meter") != 10.0)
  return "deka => " + toliteral($convert_utils:convert("dekameter", "meter"));
endif
if ($convert_utils:convert("kilodecameter", "meter") != 10000.0)
  return "kilodeca => " + toliteral($convert_utils:convert("kilodecameter", "meter"));
endif
if ($convert_utils:convert("micron", "micron") != 1.0)
  return "micron => " + toliteral($convert_utils:convert("micron", "micron"));
endif
if ($convert_utils:convert("gram", "kg") != 1.0 / 1000.0)
  return "gram => " + toliteral($convert_utils:convert("gram", "kg"));
endif
if ($convert_utils:convert("percent", "1") != 1.0 / 100.0)
  return "percent => " + toliteral($convert_utils:convert("percent", "1"));
endif
if ($convert_utils:convert("m2", "m2") != 1.0)
  return "m2 => " + toliteral($convert_utils:convert("m2", "m2"));
endif
if ($convert_utils:convert("meter", "meter") != 1.0)
  return "identity";
endif
bad = $convert_utils:convert("junk", "meters");
if (bad != {0, "junk"})
  return "junk => " + toliteral(bad);
endif
mm = $convert_utils:convert("furlongs", "mph");
if (typeof(mm) != LIST || !mm || mm[1] != 1)
  return "mismatch => " + toliteral(mm);
endif
if (typeof(mm[2]) != LIST || typeof(mm[3]) != LIST || typeof(mm[2][2]) != STR || typeof(mm[3][2]) != STR)
  return "mismatch shape => " + toliteral(mm);
endif
if (!index(mm[2][2], "m") || !index(mm[3][2], "m") || !index(mm[3][2], "s"))
  return "mismatch units => " + toliteral(mm);
endif
return 1;
.
