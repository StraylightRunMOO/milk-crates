@verb matrix_utils:is_identity this none this rxd
@program matrix_utils:is_identity
// $matrix_utils:is_identity(M) => 1 iff M is I.
m = length(mat = args[1]);
if (!this:is_square(mat))
  return 0;
endif
for i in [1..m]
  for j in [1..m]
    if (i == j ? mat[i][j] != 1 | mat[i][j] != 0)
      return 0;
    endif
  endfor
endfor
return 1;
.
