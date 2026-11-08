@verb list_utils:includes contains this none this rxd
@program list_utils:includes contains
// $list_utils:includes/contains(list, value) => INT
// Index of value in list, or 0.
{l, x} = args;
return x in l;
.
