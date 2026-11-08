@verb math_utils:arctan atan this none this rxd
@program math_utils:arctan atan
// $math_utils:arctan/atan(x) => FLOAT|{INT,INT}
// Inverse tangent. FLOAT radians via atan(); INT scaled uses the degree table via arccos.
given = args[1];
// Copied from Trig_Utils (#25800):arctan by Obvious (#54879) Fri Nov 17 06:08:18 1995 PST
if (typeof(given) == FLOAT)
  return atan(given);
endif
reciprocal = given * given / 10000 + 10000;
reciprocal = sqrt(reciprocal * 10000);
cosine = 100000000 / reciprocal;
return this:arccos(cosine);
.
