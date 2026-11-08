@verb seq_utils:complement this none this rxd
@program seq_utils:complement
// $seq_utils:complement(seq[, lower[, upper]]) => LIST
// Integers not in seq. If lower/upper given, restrict to that range.
// Bad things happen if seq is not a subset of [lower..upper].
minint = `$minint ! ANY => -2147483647';
nothing = `$nothing ! ANY => #-1';
{seq, ?lower = minint, ?upper = nothing} = args;
if (upper != nothing)
  if (seq[$] >= (upper = upper + 1))
    seq[$..$] = {};
  else
    seq[$ + 1..$] = {upper};
  endif
endif
if (seq && seq[1] <= lower)
  return listdelete(seq, 1);
else
  return {lower, @seq};
endif
.
