@verb math_utils:div this none this rxd
@program math_utils:div
// $math_utils:div(n, d) => INT
// Quotient q from :divmod such that n = d*q + r with r in [0, d) (or (d, 0] if d<0).
return this:divmod(@args)[1];
.
