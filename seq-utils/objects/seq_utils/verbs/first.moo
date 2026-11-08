@verb seq_utils:first this none this rxd
@program seq_utils:first
// $seq_utils:first(seq) => INT|ERR
// First integer in seq, or E_NONE if empty.
return (seq = args[1]) ? seq[1] | E_NONE;
.
