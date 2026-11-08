@verb seq_utils:last this none this rxd
@program seq_utils:last
// $seq_utils:last(seq) => INT|ERR
// Last integer in seq, or E_NONE if empty. Odd-length (unbounded) uses $minint-1.
return (seq = args[1]) ? length(seq) % 2 ? `$minint ! ANY => -2147483647' - 1 | seq[$] - 1 | E_NONE;
.
