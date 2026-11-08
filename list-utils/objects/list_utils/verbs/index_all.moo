@verb list_utils:index_all this none this rxd
@program list_utils:index_all
// $list_utils:index_all(list, key) => LIST
// Every 1-based index where list[i] == key.
{lst, key} = args;
return all_members(key, lst);
.
