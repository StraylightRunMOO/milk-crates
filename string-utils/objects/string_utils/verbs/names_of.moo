@verb string_utils:names_of this none this rxd
@program string_utils:names_of
// $string_utils:names_of(obj-list) => STR
// "Name(#obj)   ..." for each valid object in the list.
line = "";
for item in (args[1])
  if (typeof(item) == OBJ && valid(item))
    line = line + item.name + "(" + tostr(item) + ")   ";
  endif
endfor
return $string_utils:trimr(line);
.
