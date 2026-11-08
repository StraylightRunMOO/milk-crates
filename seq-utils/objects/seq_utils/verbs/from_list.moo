@verb seq_utils:from_list this none this rxd
@program seq_utils:from_list
// $seq_utils:from_list(list) => LIST
// Sequence for the integers in list (sorted first).
return this:from_sorted_list($list_utils:sort(args[1]));
.
