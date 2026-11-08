@verb convert_utils:convert this none this rxd
@program convert_utils:convert
// $convert_utils:convert(from_units, to_units) => FLOAT | LIST
// Conversion factor when units match. Else {1, {have_val, have_units}, {want_val, want_units}} or {0, bad_input}.
// Optional leading value, then multiplicative units, optional trailing power digit: "100 kg m/sec2", "35 joules".
// convert("kilowatt hours", "joules") => 3600000.0
// convert("2000 furlongs/fortnight", "mph") => 0.744047619047619
// convert("junk", "meters") => {0, "junk"}
{havestr, wantstr} = args;
{havenum, havestr} = $string_utils:first_word(havestr);
havestr = $string_utils:trimr(tostr(havenum, " ", strsub(havestr, " ", "")));
wantstr = strsub(wantstr, " ", "");
have = this:_do_convert(havestr);
want = this:_do_convert(wantstr);
if (have && want && have[2] == want[2])
  return have[1] / want[1];
elseif (have && want)
  return {1, {have[1], this:_format_units(@have[2])}, {want[1], this:_format_units(@want[2])}};
else
  return {0, have ? wantstr | havestr};
endif
.
