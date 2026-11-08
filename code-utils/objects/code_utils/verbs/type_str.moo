@verb code_utils:type_str this none this rxd
@program code_utils:type_str
// $code_utils:type_str(value) => STR
// Returns a string describing the type of args[1] (INT/FLOAT/STR/OBJ/ERR/LIST/MAP/NONE).
x = args[1];
type_data = {1, 3.14, "", #0, E_NONE, {}, []};
type_strs = {"INT", "FLOAT", "STR", "OBJ", "ERR", "LIST", "MAP"};
for i in [1..length(type_data)]
  if (typeof(type_data[i]) == typeof(x))
    return type_strs[i];
  endif
endfor
return "NONE";
.
