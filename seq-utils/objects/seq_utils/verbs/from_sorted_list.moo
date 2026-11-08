@verb seq_utils:from_sorted_list this none this rxd
@program seq_utils:from_sorted_list
// $seq_utils:from_sorted_list(sorted_list) => LIST
// Sequence for a sorted list of integers.
minint = `$minint ! ANY => -2147483647';
if (!(lst = args[1]))
  return {};
else
  seq = {i = lst[1]};
  next = i + 1;
  for i in (listdelete(lst, 1))
    if (i != next)
      seq = {@seq, next, i};
    endif
    next = i + 1;
  endfor
  return next == minint ? seq | {@seq, next};
endif
.
