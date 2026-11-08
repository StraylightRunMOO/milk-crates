@verb seq_utils:tolist this none this rxd
@program seq_utils:tolist
// $seq_utils:tolist(seq) => LIST
// Integers in seq as a flat list. Odd-length seqs are closed at $minint.
seq = args[1];
if (!seq)
  return {};
elseif (length(seq) % 2)
  seq = {@seq, `$minint ! ANY => -2147483647'};
endif
l = {};
for i in [1..length(seq) / 2]
  for j in [seq[2 * i - 1]..seq[2 * i] - 1]
    l = {@l, j};
  endfor
endfor
return l;
.
