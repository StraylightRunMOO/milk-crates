@verb time_tests:test_time_sub this none none rxd
@program time_tests:test_time_sub
if ($time_utils:time_sub("") != "")
  return "empty";
endif
if ($time_utils:time_sub("$$") != "$")
  return "$$";
endif
if ($time_utils:time_sub("end$") != "end")
  return "trailing $";
endif
if ($time_utils:time_sub("$Qfoo") != "foo")
  return "unknown $Q";
endif
t = time();
c = ctime(t);
if ($time_utils:time_sub("$H:$M:$S", t) != c[12..19])
  return "HMS => " + $time_utils:time_sub("$H:$M:$S", t);
endif
if ($time_utils:time_sub("$h", t) != $string_utils:trim(tostr(toint(c[12..13]))))
  return "h unpadded";
endif
if ($time_utils:time_sub("$d", t) != c[1..3])
  return "short day";
endif
if ($time_utils:time_sub("$D", t) != $time_utils:day(t))
  return "long day";
endif
if ($time_utils:time_sub("$n", t) != c[5..7])
  return "short month";
endif
if ($time_utils:time_sub("$N", t) != $time_utils:month(t))
  return "long month";
endif
if ($time_utils:time_sub("$Y", t) != c[21..24])
  return "year";
endif
if ($time_utils:time_sub("$y", t) != c[23..24])
  return "short year";
endif
if ($time_utils:time_sub("$Z", t) != c[26..$])
  return "zone";
endif
if ($time_utils:time_sub("$T", t) != c[9..10])
  return "date T";
endif
if ($time_utils:time_sub("$t", t) != $string_utils:trim(c[9..10]))
  return "date t";
endif
if ($time_utils:time_sub("$3", t) != $string_utils:subst(c[9..10], {{" ", "0"}}))
  return "date 3";
endif
hour = toint(c[12..13]);
oh = (hour + 11) % 12 + 1;
if ($time_utils:time_sub("$o", t) != tostr(oh))
  return "o 12h";
endif
if ($time_utils:time_sub("$O", t) != $string_utils:right(tostr(oh), 2, "0"))
  return "O 12h";
endif
if ($time_utils:time_sub("$p", t) != (hour >= 12 ? "pm" | "am"))
  return "p ampm";
endif
if ($time_utils:time_sub("$P", t) != (hour >= 12 ? "PM" | "AM"))
  return "P ampm";
endif
mon = $string_utils:explode(c)[2] in $time_utils.monthabbrs;
if ($time_utils:time_sub("$2", t) != tostr(mon))
  return "month num";
endif
if ($time_utils:time_sub("$1", t) != $string_utils:right(tostr(mon), 2, "0"))
  return "month num pad";
endif
if ($time_utils:time_sub("x$Hy", t) != "x" + c[12..13] + "y")
  return "surround";
endif
bad = `$time_utils:time_sub(0, 0) ! ANY => 0';
if (bad != 0)
  return "bad args => " + toliteral(bad);
endif
return 1;
.
