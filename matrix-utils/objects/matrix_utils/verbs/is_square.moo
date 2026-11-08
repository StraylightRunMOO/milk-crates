@verb matrix_utils:is_square this none this rxd
@program matrix_utils:is_square
// $matrix_utils:is_square(M) => 1 iff dimensions of M are equal to each other.
{m} = args;
return this:is_matrix(m) && this:order(m) == 2 && (dim = this:dimensions(m))[1] == dim[2];
.
