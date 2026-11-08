@verb math_utils:arccos acos this none this rxd
@program math_utils:arccos acos
// $math_utils:arccos/acos(x) => FLOAT|{INT,INT}|ERR
// Inverse cosine. FLOAT radians via acos(); INT scaled 0..10000 => {degrees, minutes}.
given = args[1];
// Copied from Trig_Utils (#25800):arccos by Obvious (#54879) Fri Nov 17 06:08:08 1995 PST
if (typeof(given) == FLOAT)
  return acos(given);
endif
arcsin = this:arcsin(given);
degrees = 89 - arcsin[1];
minutes = 60 - arcsin[2];
// Changed (minutes > 60) to (minutes >= 60) following bug report by Loufah (#116455).  2000-03-24 23:00 CST  Gary (#110811).
if (minutes >= 60)
  minutes = minutes - 60;
  degrees = degrees + 1;
endif
return {degrees, minutes};
.
