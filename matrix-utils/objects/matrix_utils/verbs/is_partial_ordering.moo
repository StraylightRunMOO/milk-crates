@verb matrix_utils:is_partial_ordering this none this rxd
@program matrix_utils:is_partial_ordering
// $matrix_utils:is_partial_ordering(M) => 1 iff M is a reflexive, asymmetric, transitive relation.
{mat} = args;
return this:is_asymmetric(mat) == this:is_reflexive(mat) == this:is_transitive(mat) == 1;
.
