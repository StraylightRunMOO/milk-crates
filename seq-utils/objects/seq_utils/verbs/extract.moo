@verb seq_utils:extract this none this rxd
@program seq_utils:extract
// $seq_utils:extract(seq, array) => LIST
// Elements of array whose 1-based indices are in seq.
{seq, array} = args;
if (alen = length(array))
  e = $list_utils:find_insert(seq, 1);
  s = $list_utils:find_insert(seq, alen);
  seq = {@e % 2 ? {} | {1}, @seq[e..s - 1], @s % 2 ? {} | {alen + 1}};
  ret = {};
  for i in [1..length(seq) / 2]
    $command_utils:suspend_if_needed(0);
    ret = {@ret, @array[seq[2 * i - 1]..seq[2 * i] - 1]};
  endfor
  return ret;
else
  return {};
endif
.
