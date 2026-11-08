@verb seq_utils:intersection this none this rxd
@program seq_utils:intersection
// $seq_utils:intersection(seq1, seq2, ...) => LIST
// Intersection of all sequences. Universe {$minint} if no args.
minint = `$minint ! ANY => -2147483647';
if ((U = {minint}) in args)
  args = $list_utils:setremove_all(args, U);
endif
if (length(args) <= 1)
  return args ? args[1] | U;
endif
return this:complement(this:_union(@$list_utils:map_arg(this, "complement", args)));
.
