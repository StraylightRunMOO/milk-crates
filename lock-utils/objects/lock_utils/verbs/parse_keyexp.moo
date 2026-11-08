@verb lock_utils:parse_keyexp this none this rxd
@program lock_utils:parse_keyexp
// $lock_utils:parse_keyexp(STRING keyexpression, OBJ player) => LIST | OBJ | STR
// Coded key, or a string error message if the attempt failed.
// 
// Grammar for key expressions:
// 
// E ::= A
// |  E || A
// |  E && A
// A ::= ( E )
// |  ! A
// |  object
// |  ? object
this:init_scanner(args[1]);
this.player = args[2];
return this:parse_E();
.
