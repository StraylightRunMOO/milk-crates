@verb seq_utils:size this none this rxd
@program seq_utils:size
// $seq_utils:size(seq) => INT
// Number of elements in seq.
// For sequences consisting of more than half of the 4294967298 available integers, this returns a negative number, which can either be interpreted as (cardinality - 4294967298) or -(size of complement sequence).
minint = `$minint ! ANY => -2147483647';
n = 0;
for i in (seq = args[1])
  n = i - n;
endfor
return length(seq) % 2 ? minint - n | n;
.
