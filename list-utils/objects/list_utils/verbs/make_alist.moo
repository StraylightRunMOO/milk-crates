@verb list_utils:make_alist this none this rxd
@program list_utils:make_alist
// $list_utils:make_alist(lists[, pad]) => LIST
// Transpose parallel lists into tuples. Short rows padded with pad (default 0).
alist = {};
pad = length(args) > 1 ? args[2] | 0;
for i in [1..$list_utils:max_length(args[1])]
  tuple = {};
  for l in (args[1])
    tuple = {@tuple, i > length(l) ? pad | l[i]};
  endfor
  alist = {@alist, tuple};
endfor
return alist;
.
