@verb seq_utils:contains this none this rxd
@program seq_utils:contains
// $seq_utils:contains(seq, elt) => 0|1
// True iff elt is in seq.
return ($list_utils:find_insert(@args) + 1) % 2;
.
