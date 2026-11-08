@verb ansi_utils:add_code this none this rxd
@program ansi_utils:add_code
// $ansi_utils:add_code (STR code, NUM/STR sequence, STR group)
// Adds a new code, <code> and adds it to group <group>.
// If <sequence> is a string, it is used as the ANSI sequence, otherwise
// it uses 'e[<sequence>m'.  'e' is replaced with the escape character, and
// 'b' is replaced with the beep character in <sequence>
if (!this:trusts(caller_perms()))
  return E_PERM;
elseif (length(args) < 3)
  return E_ARGS;
else
  if (!(args[1] && typeof(args[1]) == STR && !$object_utils:has_property(this, cn = tostr("code_", args[1])) && (group = args[3]) in {@this.groups, E_NONE}))
    return E_INVARG;
  else
    code = args[2];
    if (typeof(code) == NUM)
      code = tostr("e[", code, "m");
    endif
    arg = {this, cn, code, {$code_utils:verb_perms(), "r"}};
    if ($object_utils:has_verb(#0, "add_property"))
      $add_property(@arg);
    else
      add_property(@arg);
    endif
    if (args[3] == E_NONE)
      this.extra_codes = setadd(this.extra_codes, args[1]);
    else
      this.("group_" + args[3]) = setadd(this.("group_" + args[3]), args[1]);
    endif
    this:update_all();
    return 1;
  endif
endif
.
