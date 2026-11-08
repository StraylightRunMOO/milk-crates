@verb lock_utils:parse_E this none this rxd
@program lock_utils:parse_E
// $lock_utils:parse_E() => LIST | OBJ | STR
// Parse E ::= A | E || A | E && A. String on error.
exp = this:parse_A();
if (typeof(exp) != STR)
  while ((token = this:scan_token()) in {"&&", "||"})
    rhs = this:parse_A();
    if (typeof(rhs) == STR)
      return rhs;
    endif
    exp = {token, exp, rhs};
  endwhile
  // The while loop above always eats a token. Reset it back so the iteration can find it again. Always losing `)'. Ho_Yan 3/9/95
  this.input_index = this.input_index - this.index_incremented;
endif
return exp;
.
