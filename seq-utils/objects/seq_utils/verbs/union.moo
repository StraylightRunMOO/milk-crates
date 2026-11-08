@verb seq_utils:union this none this rxd
@program seq_utils:union
// $seq_utils:union(seq1, seq2, ...) => LIST
// Union of all sequences. {} if no args.
if ({} in args)
  args = $list_utils:setremove_all(args, {});
endif
if (length(args) <= 1)
  return args ? args[1] | {};
endif
return this:_union(@args);
.
