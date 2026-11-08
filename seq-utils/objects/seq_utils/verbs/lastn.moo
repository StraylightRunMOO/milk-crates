@verb seq_utils:lastn this none this rxd
@program seq_utils:lastn
// $seq_utils:lastn(seq, n) => LIST
// Last n elements of seq as a sequence.
minint = `$minint ! ANY => -2147483647';
n = args[2];
if ((l = length(seq = args[1])) % 2)
  return {minint - n};
else
  s = l;
  while (s)
    n = seq[s] - n;
    if (n >= seq[s - 1])
      return {n, @seq[s..l]};
    endif
    n = seq[s - 1] - n;
    s = s - 2;
  endwhile
  return seq;
endif
.
