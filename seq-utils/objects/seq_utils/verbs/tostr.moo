@verb seq_utils:tostr this none this rxd
@program seq_utils:tostr
// $seq_utils:tostr(seq[, delimiter]) => STR
// Sequence as a string. Ranges use delimiter (default ..). Empty seq => "empty".
minint = `$minint ! ANY => -2147483647';
{seq, ?separator = ".."} = args;
if (!seq)
  return "empty";
endif
e = tostr(seq[1] == minint ? "" | seq[1]);
len = length(seq);
for i in [2..len]
  e = e + (i % 2 ? tostr(", ", seq[i]) | (seq[i] == seq[i - 1] + 1 ? "" | tostr(separator, seq[i] - 1)));
endfor
return e + (len % 2 ? separator | "");
.
