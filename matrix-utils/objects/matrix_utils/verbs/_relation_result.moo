@verb matrix_utils:_relation_result this none this rxd
@program matrix_utils:_relation_result
// $matrix_utils:_relation_result(good, bad, flag) -- Common code for is_reflexive, is_symmetric, and is_transitive.
{good, bad, flag} = args;
if (good && !bad)
  result = 1;
elseif (!good && bad)
  result = -1;
else
  result = 0;
endif
return flag ? -result | result;
.
