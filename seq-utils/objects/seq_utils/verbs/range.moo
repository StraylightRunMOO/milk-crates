@verb seq_utils:range this none this rxd
@program seq_utils:range
// $seq_utils:range(start, end) => LIST
// Sequence for the inclusive [start..end] range. {} if start > end.
return (start = args[1]) <= (end = args[2]) ? {start, end + 1} | {};
.
