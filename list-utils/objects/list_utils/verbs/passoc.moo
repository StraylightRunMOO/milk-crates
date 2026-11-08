@verb list_utils:passoc this none this rx
@program list_utils:passoc
// $list_utils:passoc(key, list1, list2) => LIST
// {key, list2[i]} where i is key's index in list1. {} if key is not in list1.
indx = args[1] in args[2];
if (indx)
  return {args[1], args[3][indx]};
else
  return {};
endif
.
