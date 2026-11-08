@verb lock_utils:init_scanner this none this rxd
@program lock_utils:init_scanner
// $lock_utils:init_scanner(string) => NONE
// Reset the key-expression scanner on this.input_*.
this.input_string = args[1];
this.input_length = length(args[1]);
this.input_index = 1;
this.index_incremented = 0;
.
