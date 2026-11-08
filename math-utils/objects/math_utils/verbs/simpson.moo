@verb math_utils:simpson this none this rxd
@program math_utils:simpson
// $math_utils:simpson({a,b}, {f(a),f(mid),f(b)} [, retfloat]) => FLOAT|{INT,INT}
// Simpson's-rule integral. INT inputs return {integer, fraction} unless retfloat.
{point, fcn, ?retfloat = 0} = args;
if (!retfloat && typeof(point[1]) == INT)
  numer = (point[2] - point[1]) * (fcn[1] + 4 * fcn[2] + fcn[3]);
  return this:parts(numer, 6);
else
  numer = tofloat(point[2] - point[1]) * (tofloat(fcn[1]) + 4.0 * tofloat(fcn[2]) + tofloat(fcn[3]));
  return numer / 6.0;
endif
.
